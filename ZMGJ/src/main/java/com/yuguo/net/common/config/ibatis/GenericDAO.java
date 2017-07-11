package com.yuguo.net.common.config.ibatis;

import java.lang.reflect.ParameterizedType;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.yuguo.net.utils.Pager;
import com.ibatis.sqlmap.engine.impl.SqlMapClientImpl;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.ibatis.sqlmap.engine.mapping.statement.MappedStatement;
import com.ibatis.sqlmap.engine.scope.SessionScope;
import com.ibatis.sqlmap.engine.scope.StatementScope;

/**
 * <p>
 * 大多数的DAO方法是类似的，就是称为CRUD的操作，当然有一些ORM工具已经有解决方案避免代码重复，
 * ibatis里加上一些代码味道，利用约束也能避免�?��代码的重复，但这种方法的缺点是损失了类型安全�?
 * </p>
 * <p>
 * 该项目的解决方案必须有一个预先条件，实体类的短名称必须与sqlmap的namespace值要�?���?
 * </p>
 * <p>
 * 创建日期�?0150521
 * 
 * @author chenjunan
 * @version 1
 * @param <ENTITY>
 * @param <EXAMPLE>
 */
public abstract class GenericDAO<ENTITY, EXAMPLE extends AbstractExample> extends SqlMapClientDaoSupport {

	protected Log logger = LogFactory.getLog(this.getClass());

	private Class<ENTITY> entityClass;

	/**
	 * 构�?函数
	 */
	@SuppressWarnings("unchecked")
	public GenericDAO() {
		super();
		ParameterizedType pt = (ParameterizedType) getClass().getGenericSuperclass();
		entityClass = (Class<ENTITY>) pt.getActualTypeArguments()[0];
	}

	/**
	 * <p>
	 * 獲取完整執行的SQL�?
	 * 
	 * @param sqlId
	 *            SQL模板编码
	 * @param example
	 *            动�?条件
	 * @return 完整SQL
	 */
	public String getExecSql(String sqlId, EXAMPLE example) {
		SqlMapClientImpl sqlMapClient = (SqlMapClientImpl) this.getSqlMapClient();
		String sqlString = "";
		try {
			MappedStatement stmt = sqlMapClient.getMappedStatement(sqlId);
			if (stmt != null) {
				Sql sql = stmt.getSql();
				SessionScope sessionScope = new SessionScope();
				// sessionScope.setSqlMapClient(sqlMapClient);
				sessionScope.incrementRequestStackDepth();
				StatementScope statementScope = new StatementScope(sessionScope);
				stmt.initRequest(statementScope);
				stmt.getCacheKey(statementScope, example);
				sqlString = sql.getSql(statementScope, example);
				Object[] parameters = sql.getParameterMap(statementScope, example).getParameterObjectValues(statementScope, example);
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for (Object parameter : parameters) {
					if ("java.lang.String".equals(parameter.getClass().getName()))
						sqlString = sqlString.replaceFirst("\\?", "'" + parameter.toString() + "'");
					else if ("java.util.Date".equals(parameter.getClass().getName()))
						sqlString = sqlString.replaceFirst("\\?", "to_date('" + sdf.format(parameter) + "','yyyy-mm-dd hh24:mi:ss')");
					else
						sqlString = sqlString.replaceFirst("\\?", parameter.toString());
				}
			}
		} catch (Exception e) {
			logger.error("getExecSql:" + e.getMessage());
		}
		return sqlString;
	}

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @param example
	 *            动�?条件
	 * @return 数据库记录的总数
	 */
	public int countByExample(EXAMPLE example) {
		Integer count = (Integer) getSqlMapClientTemplate().queryForObject(entityClass.getSimpleName() + ".countByExample", example);
		return count;
	}

	/**
	 * <p>
	 * 根据动�?条件删除数据库记录�?
	 * </p>
	 * 
	 * @param example
	 *            动�?条件
	 * @return 数据库删除记录的数量
	 */
	public int deleteByExample(EXAMPLE example) {
		int rows = getSqlMapClientTemplate().delete(entityClass.getSimpleName() + ".deleteByExample", example);
		return rows;
	}

	/**
	 * <p>
	 * 根据主键删除数据库记录�?
	 * </p>
	 * 
	 * @param entity
	 *            主键
	 * @return 数据库存在该主键的记录时返回1，否则返�?�?
	 */
	public int deleteByPrimaryKey(ENTITY entity) {
		int rows = getSqlMapClientTemplate().delete(entityClass.getSimpleName() + ".deleteByPrimaryKey", entity);
		return rows;
	}

	/**
	 * <p>
	 * �?��据库里插入一条记录�?
	 * </p>
	 * 
	 * @param entity
	 *            实体
	 */
	public void insert(ENTITY entity) {
		getSqlMapClientTemplate().insert(entityClass.getSimpleName() + ".insert", entity);
	}

	/**
	 * <p>
	 * �?��据库插入�?��记录�?
	 * </p>
	 * 
	 * @param entity
	 *            实体
	 */
	public void insertSelective(ENTITY entity) {
		getSqlMapClientTemplate().insert(entityClass.getSimpleName() + ".insertSelective", entity);
	}

	/**
	 * <p>
	 * 根据动�?条件查询数据库�?
	 * </p>
	 * 
	 * @param example
	 *            动�?条件
	 * @return 查询结果
	 */
	@SuppressWarnings("unchecked")
	public List<ENTITY> selectByExample(EXAMPLE example) {
		List<ENTITY> list = getSqlMapClientTemplate().queryForList(entityClass.getSimpleName() + ".selectByExample", example);
		return list;
	}

	/*
	 * @SuppressWarnings("unchecked") public Pager<ENTITY>
	 * selectPageByExample(EXAMPLE example) { int skipResults =
	 * example.getSkipResults(); int maxResults = example.getMaxResults(); int
	 * totalRecords = countByExample(example); if (skipResults > totalRecords) {
	 * skipResults = totalRecords - example.getMaxResults(); } List<ENTITY>
	 * result =
	 * getSqlMapClientTemplate().queryForList(entityClass.getSimpleName() +
	 * ".selectByExample", example, skipResults, maxResults); return new
	 * Pager<ENTITY>(skipResults, maxResults, result, totalRecords); }
	 */

	/**
	 * <p>
	 * 根据动�?条件，分页查询数据库记录�?
	 * </p>
	 * 
	 * @param example
	 *            动�?条件
	 * @return 分页数据
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Pager<ENTITY> pagingByExample(EXAMPLE example) {
		int totalRows = countByExample(example);
		if (totalRows == 0) {
			return new Pager<ENTITY>(totalRows, new ArrayList());
		}
		if (example.getFromNumber() == null) {
			example.setFromNumber(AbstractExample.DEFAULT_SKIP_RESULTS);
		}
		int startRow = example.getFromNumber();
		if (example.getToNumber() == null) {
			example.setToNumber(startRow + AbstractExample.DEFAULT_MAX_RESULTS);
		}
		int maxResults = example.getFromNumber() - example.getToNumber();
		if (maxResults >= 0) {
			throw new IllegalStateException("数据库查询范围的结束数必须大于开始数");
		}
		List<ENTITY> result = getSqlMapClientTemplate().queryForList(entityClass.getSimpleName() + ".selectByExample", example);
		return new Pager<ENTITY>(totalRows, result);
	}

	/**
	 * <p>
	 * 根据主键查询数据库记录�?
	 * </p>
	 * 
	 * @param entity
	 *            主键
	 * @return 实体对象
	 */
	@SuppressWarnings("unchecked")
	public ENTITY selectByPrimaryKey(ENTITY entity) {
		ENTITY record = (ENTITY) getSqlMapClientTemplate().queryForObject(entityClass.getSimpleName() + ".selectByPrimaryKey", entity);
		return record;
	}

	/**
	 * <p>
	 * 根据主键更新数据库记录�?
	 * </p>
	 * 
	 * @param entity
	 *            实体对象
	 * @return 数据库更新行�?
	 */
	public int updateByPrimaryKeySelective(ENTITY entity) {
		int rows = getSqlMapClientTemplate().update(entityClass.getSimpleName() + ".updateByPrimaryKeySelective", entity);
		return rows;
	}

	/**
	 * <p>
	 * 根据主键更新数据库记录�?
	 * </p>
	 * 
	 * @param entity
	 *            实体
	 * @return 数据库有更新内容返回1，否则返�?�?
	 */
	public int updateByPrimaryKey(ENTITY entity) {
		int rows = getSqlMapClientTemplate().update(entityClass.getSimpleName() + ".updateByPrimaryKey", entity);
		return rows;
	}

	/**
	 * <p>
	 * 根据动�?条件更新数据库记录，如果实体的属性为null时忽略更新�?
	 * </p>
	 * 
	 * @param entity
	 *            实体内容
	 * @param example
	 *            动�?条件
	 * @return 数据库记录更新的数量
	 */
	public abstract int updateByExampleSelective(ENTITY entity, EXAMPLE example);

	/**
	 * <p>
	 * 根据动�?条件更新数据库记录�?
	 * </p>
	 * 
	 * @param entity
	 *            实体内容
	 * @param example
	 *            动�?条件
	 * @return 数据库记录更新的数量
	 */
	public abstract int updateByExample(ENTITY entity, EXAMPLE example);
}
