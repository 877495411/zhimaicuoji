package com.yuguo.net.common.config.ibatis;

/**
 * <p>
 * 类功能详细描�?..
 * </p>
 * <p>
 * 创建日期�?015-05-21 下午03:57:57
 * </p>
 * 
 * @author chenjunan
 */
public abstract class AbstractExample {

	public static final Integer DEFAULT_SKIP_RESULTS = 0;

	public static final Integer DEFAULT_MAX_RESULTS = 15;

	// 数据库�?择范围的�?���?
	private Integer fromNumber;

	// 数据库�?择范围的结束�?
	private Integer toNumber;

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @return �?���?
	 */
	public final Integer getFromNumber() {
		return fromNumber;
	}

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @param fromNumber
	 *            �?���?
	 * @return AbstractExample
	 */
	public final AbstractExample setFromNumber(Integer fromNumber) {
		if (fromNumber == null || fromNumber.intValue() < 0) {
			throw new IllegalStateException("数据库查询范围的�?��数不能为负数");
		}
		this.fromNumber = fromNumber;
		return this;
	}

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @return 结束�?
	 */
	public final Integer getToNumber() {
		return toNumber;
	}

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @param toNumber
	 *            结束�?
	 * @return AbstractExample
	 */
	public final AbstractExample setToNumber(Integer toNumber) {
		if (toNumber == null || toNumber.intValue() < 1) {
			throw new IllegalStateException("数据库查询范围的结束数不能小于零");
		}
		this.toNumber = toNumber;
		return this;
	}

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 */
	public abstract void clear();

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @return 排序字段
	 */
	public abstract String getOrderByClause();

	/**
	 * <p>
	 * 功能的简单描述，参数、返回�?及异常必须注明�?
	 * </p>
	 * 
	 * @param orderByClause
	 *            排序字段
	 */
	public abstract void setOrderByClause(String orderByClause);
}
