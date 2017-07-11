package com.yuguo.net.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yuguo.net.model.SysDictionary;
import com.yuguo.net.model.SysDictionaryExample;
import com.yuguo.net.model.SysUserAuthority;
import com.yuguo.net.model.SysUserAuthorityExample;
import com.yuguo.net.service.ISysDictionaryService;
import com.yuguo.net.service.ISysMerchantInfoService;
import com.yuguo.net.service.ISysUserAuthorityService;

/**
 * 
 * <p>
 * 用户登录
 * </p>
 * <p>
 * 创建日期：2015-06-01
 * </p>
 * 
 * @author 张亮
 */
@Scope("request")
@RequestMapping("/system/login")
@Component
public class LoginController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private ISysMerchantInfoService sysMerchantInfoService;
	@Resource
	private ISysUserAuthorityService sysUserAuthorityService;
	@Resource
	private ISysDictionaryService sysDictionaryService;

	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("success", Boolean.FALSE);
		if (userName == null || "".equals(userName) || pwd == null || "".equals(pwd)) {
			return jsonResult;
		}

		SysDictionaryExample sde = new SysDictionaryExample();
		SysDictionaryExample.Criteria sdec = sde.createCriteria();
		sdec.andDicNameEqualTo(userName);
		sdec.andDicKeyEqualTo(pwd);
		sdec.andDicTypeEqualTo("login");
		List<SysDictionary> infoList = sysDictionaryService.selectByExample(sde);

		if (infoList != null && infoList.size() > 0) {
			jsonResult.put("success", Boolean.TRUE);
			request.getSession().setAttribute("userName", userName);
			request.getSession().setAttribute("userId", infoList.get(0).getId());
		}
		return jsonResult;
	}

	@RequestMapping(value = "/tohome.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView toHome(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userName = request.getSession().getAttribute("userName") + "";

		ModelAndView modelAndView = null;
		if (userName == null || "null".equals(userName) || "".equals(userName)) {
			modelAndView = new ModelAndView("/builder/backLogin");
		} else {
			modelAndView = new ModelAndView("/builder/adManage");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/exit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> exit(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("userName");
		request.getSession().removeAttribute("merchantId");
		request.getSession().invalidate();
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("success", Boolean.TRUE);
		return jsonResult;

	}

	/**
	 * 加载某商家的角色权限信息
	 * 
	 * @param request
	 * @return
	 */

	public Map<String, Object> loadAuthorityByMerchantId(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SysUserAuthority authority = null;
		String merchantId = request.getSession().getAttribute("merchantId") + "";
		SysUserAuthorityExample example = new SysUserAuthorityExample();
		SysUserAuthorityExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(merchantId);
		List<SysUserAuthority> authorities = sysUserAuthorityService.selectByExample(example);

		if (authorities != null && authorities.size() > 0) {
			authority = authorities.get(0);
		}

		map.put("authority", authority);
		return map;
	}

	/**
	 * 判断用户是否登陆
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/checkLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getUserIsLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String merchantId = request.getSession().getAttribute("merchantId") + "";
		if (merchantId == null || "".equals(merchantId) || "null".equals(merchantId)) {
			map.put("success", Boolean.FALSE);
		} else {
			map.put("success", Boolean.TRUE);
		}
		return map;
	}

}
