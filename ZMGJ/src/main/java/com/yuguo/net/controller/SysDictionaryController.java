package com.yuguo.net.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yuguo.net.model.MallGoodsClass;
import com.yuguo.net.model.SysDictionary;
import com.yuguo.net.model.SysDictionaryExample;
import com.yuguo.net.model.SysMerchantInfo;
import com.yuguo.net.model.SysMerchantInfoExample;
import com.yuguo.net.model.TSysAdvertise;
import com.yuguo.net.model.TSysAdvertiseExample;
import com.yuguo.net.service.ISysAdvertiseService;
import com.yuguo.net.service.ISysDictionaryService;
import com.yuguo.net.service.ISysMerchantInfoService;
import com.yuguo.net.service.MallGoodsService;
import com.yuguo.net.vo.ComboTreeModel;
/**
 * 
 * <p>
 * 字典
 * <p>
 * 创建日期：2015-08-26
 * @author xuxinhui
 */
@Controller
@Scope("request")
@RequestMapping("/system/dictionary")
@Transactional(propagation=Propagation.REQUIRED,rollbackFor={RuntimeException.class, Exception.class})
public class SysDictionaryController {
	@Resource
	private ISysDictionaryService sysDictionaryService;
	@Resource
	private ISysAdvertiseService ISysAdvertiseService;
	@Resource
	private ISysMerchantInfoService sysMerchantInfoService;
	@Resource
	private MallGoodsService mallGoodsService;
	
	/**
	 * 广告数量与信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getDictionaryInfo.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getDictionaryInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		
		SysDictionaryExample  example = new SysDictionaryExample();
		SysDictionaryExample.Criteria criteria = example.createCriteria();
		criteria.andDicTypeEqualTo("ad");
		example.setOrderByClause(" convert(sysDictionary.dic_index,DECIMAL) ASC");
		List<SysDictionary> dictionaryInfo = sysDictionaryService.selectByExample(example);
		if(dictionaryInfo.size()>0&&dictionaryInfo!=null){
			List<String> adCount = new ArrayList<String>();
			map.put("treeDic",getTreeDicionary(dictionaryInfo));
			List<Long> childList = new ArrayList<Long>();
			for(int i=0;i<dictionaryInfo.size();i++){
				adCount.add(getAdCount(dictionaryInfo.get(i).getDicIndex())+"");
				childList.add(Long.parseLong(dictionaryInfo.get(i).getRemark()));
			}
			criteria.andIdNotIn(childList);
			List<SysDictionary> dAllInfo = sysDictionaryService.selectByExample(example);
			map.put("adCount",adCount);
			map.put("dAllInfo",dAllInfo);
			map.put("result", Boolean.TRUE);
		}else{
			map.put("result", "暂无数据！");
		}
		return map;
	}
	
	public List<SysDictionary> getTreeDicionary(List<SysDictionary> dictionaryInfo){
		List<SysDictionary> dictionaryInfoList = new ArrayList<SysDictionary>();
		for(int i = 0;i<dictionaryInfo.size();i++){//一级
			SysDictionary sd = dictionaryInfo.get(i);
			List<SysDictionary> fristList = new ArrayList<SysDictionary>();
			if("0".equals(sd.getRemark())){
				for(int j = 0;j<dictionaryInfo.size();j++){//二级
					List<SysDictionary> twoList = new ArrayList<SysDictionary>();
					if((dictionaryInfo.get(j).getRemark()).equals(sd.getId()+"")){
						for(int k = 0;k<dictionaryInfo.size();k++){//三级
							if((dictionaryInfo.get(k).getRemark()).equals(dictionaryInfo.get(j).getId()+"")){
								twoList.add(dictionaryInfo.get(k));
							}
						}
						dictionaryInfo.get(j).setChildList(twoList);
						fristList.add(dictionaryInfo.get(j));
					}
				}
				sd.setChildList(fristList);
				dictionaryInfoList.add(sd);
			}
		}
		return dictionaryInfoList;
	}
	/**
	 * 广告类型
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getDictionaryName.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getDictionaryName(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		
		SysDictionaryExample  example = new SysDictionaryExample();
		SysDictionaryExample.Criteria criteria = example.createCriteria();
		Long lId = Long.parseLong(request.getParameter("id"));
		criteria.andIdEqualTo(lId);
		criteria.andDicTypeEqualTo("ad");
		example.setOrderByClause("  convert(sysDictionary.dic_index,DECIMAL) ASC");
		List<SysDictionary> dictionaryName = sysDictionaryService.selectByExample(example);
		if(dictionaryName.size()>0&&dictionaryName!=null){
			map.put("dName",dictionaryName.get(0).getDicName());
			map.put("result", Boolean.TRUE);
		}else{
			map.put("result", "暂无数据！");
		}
		return map;
	}
	
	/**
	 * 查看广告数量
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public int getAdCount(String type) throws Exception {
		int adCount =0 ;
		TSysAdvertiseExample  example1 = new TSysAdvertiseExample();
		TSysAdvertiseExample.Criteria criteria = example1.createCriteria();
		criteria.andAdTypeEqualTo(type);
		List<TSysAdvertise> adList = ISysAdvertiseService.selectByExample(example1);
		if(adList!=null&&adList.size()>0){
			adCount = adList.size();
		}
		return adCount;
	}

	
	/**
	 * 获取所有选项卡
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getIndexTabs.do", method = { RequestMethod.GET,RequestMethod.POST })
	public void getIndexTabs(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String operateClass = null;
	        String merchantType = null;
	        String merchantId =  request.getSession().getAttribute("merchantId")+"";
	        SysMerchantInfoExample merchantExample = new SysMerchantInfoExample();
	        SysMerchantInfoExample.Criteria merchantCriteria = merchantExample.createCriteria();
	        merchantCriteria.andMerchantIdEqualTo(merchantId);
	        List<SysMerchantInfo> merchantInfoList = sysMerchantInfoService.selectByExample(merchantExample);
	        if(merchantInfoList!=null && merchantInfoList.size()>0){
	        	operateClass = merchantInfoList.get(0).getOperateClass();
	        	merchantType = merchantInfoList.get(0).getMearchantType();
	        }
	    	List<ComboTreeModel> list=new ArrayList<ComboTreeModel>();  
	        response.setCharacterEncoding("UTF-8"); 
	        if(operateClass!=null && merchantType.equals("THIRD_PARTY")){   //第三方
	        	MallGoodsClass mgC = mallGoodsService.selectClassById(operateClass);
		        SysDictionaryExample  example = new SysDictionaryExample();
				SysDictionaryExample.Criteria criteria = example.createCriteria();
				criteria.andDicTypeEqualTo("tab");
				criteria.andRemarkEqualTo(operateClass);
				List<SysDictionary> dictionaryList = sysDictionaryService.selectByExample(example);
				ComboTreeModel one = new ComboTreeModel();  
				one.setText(mgC.getClassName()); 
				List<ComboTreeModel> children1 = new ArrayList<ComboTreeModel>();  
				for(SysDictionary sd:dictionaryList){
					ComboTreeModel comboTreeModel = new ComboTreeModel();  
	    			comboTreeModel.setId(sd.getDicKey());  
	    			comboTreeModel.setText(sd.getDicName());
	    			children1.add(comboTreeModel);  
    				one.setChildren(children1);  
				}
				list.add(one);
	        }else{
		        SysDictionaryExample  example = new SysDictionaryExample();
				SysDictionaryExample.Criteria criteria = example.createCriteria();
				criteria.andDicTypeEqualTo("tab");
				List<SysDictionary> dictionaryList = sysDictionaryService.selectByExample(example);
				
				ComboTreeModel one = new ComboTreeModel();  
				one.setText("手机数码");
				one.setId("one"); 
	    		
	    		ComboTreeModel two = new ComboTreeModel();  
	    		two.setText("电脑办公"); 
	    		two.setId("two"); 
	    		
	    		ComboTreeModel three = new ComboTreeModel();  
	    		three.setText("美妆个护"); 
	    		three.setId("three");
	    		
	    		ComboTreeModel four = new ComboTreeModel();  
	    		four.setText("服装鞋帽"); 
	    		four.setId("four");
	    		
	    		ComboTreeModel five = new ComboTreeModel();  
	    		five.setText("母婴玩具"); 
	    		five.setId("five");
	    		
	    		ComboTreeModel six = new ComboTreeModel();  
	    		six.setText("网络设备"); 
	    		six.setId("six");
	    		
	    		ComboTreeModel seven = new ComboTreeModel();  
	    		seven.setText("DIY外设"); 
	    		seven.setId("seven");
	    		
	    		ComboTreeModel eight = new ComboTreeModel();  
	    		eight.setText("百货美食"); 
	    		eight.setId("eight");
	    		
	    		ComboTreeModel nine = new ComboTreeModel();  
	    		nine.setText("家具电器"); 
	    		nine.setId("nine");
	    		
	    		ComboTreeModel ten = new ComboTreeModel();  
	    		ten.setText("网咖专区"); 
	    		ten.setId("ten");
	    		
	    		ComboTreeModel eleven = new ComboTreeModel();  
	    		eleven.setText("积分商城");
	    		eleven.setId("eleven");
	    		
	    		ComboTreeModel twelve = new ComboTreeModel();  
	    		twelve.setText("其它区");
	    		twelve.setId("twelve");
	    		
	    		List<ComboTreeModel> children1 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children2 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children3 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children4 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children5 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children6 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children7 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children8 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children9 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children10 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children11 = new ArrayList<ComboTreeModel>();  
	    		List<ComboTreeModel> children12 = new ArrayList<ComboTreeModel>();
	    		
	    		for(int i=0;i<dictionaryList.size();i++){
	    			ComboTreeModel comboTreeModel = new ComboTreeModel();  
	    			comboTreeModel.setId(dictionaryList.get(i).getDicKey());  
	    			comboTreeModel.setText(dictionaryList.get(i).getDicName()); 
	    			if("1".equals(dictionaryList.get(i).getDicIndex())){
	    				children1.add(comboTreeModel);  
	    				one.setChildren(children1);  
	    			}else if("2".equals(dictionaryList.get(i).getDicIndex())){
	    				children2.add(comboTreeModel);  
	    				two.setChildren(children2);  
	    			}else if("3".equals(dictionaryList.get(i).getDicIndex())){
	    				children3.add(comboTreeModel);  
	    				three.setChildren(children3);  
	    			}else if("4".equals(dictionaryList.get(i).getDicIndex())){
	    				children4.add(comboTreeModel);  
	    				four.setChildren(children4);  
	    			}else if("5".equals(dictionaryList.get(i).getDicIndex())){
	    				children5.add(comboTreeModel);  
	    				five.setChildren(children5);  
	    			}else if("6".equals(dictionaryList.get(i).getDicIndex())){
	    				children6.add(comboTreeModel);  
	    				six.setChildren(children6);  
	    			}else if("7".equals(dictionaryList.get(i).getDicIndex())){
	    				children7.add(comboTreeModel);  
	    				seven.setChildren(children7);  
	    			}else if("8".equals(dictionaryList.get(i).getDicIndex())){
	    				children8.add(comboTreeModel);  
	    				eight.setChildren(children8);  
	    			}else if("9".equals(dictionaryList.get(i).getDicIndex())){
	    				children9.add(comboTreeModel);  
	    				nine.setChildren(children9);  
	    			}else if("10".equals(dictionaryList.get(i).getDicIndex())){
	    				children10.add(comboTreeModel);  
	    				ten.setChildren(children10);  
	    			}else if("11".equals(dictionaryList.get(i).getDicIndex())){
	    				children11.add(comboTreeModel);  
	    				eleven.setChildren(children11);  
	    			}else if("12".equals(dictionaryList.get(i).getDicIndex())){
	    				children12.add(comboTreeModel);  
	    				twelve.setChildren(children12);  
	    			}
	    		}
	    		list.add(one);
	    		list.add(two);
	    		list.add(three);
	    		list.add(four);
	    		list.add(five);
	    		list.add(six);
	    		list.add(seven);
	    		list.add(eight);
	    		list.add(nine);
	    		list.add(ten);
	    		list.add(eleven);
	    		list.add(twelve);
	        }
	        
	        String json = JSONArray.fromObject(list).toString();  
	        response.getWriter().print(json);  
	}
	/**
	 * 获得页面，广告位置
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getAdPageAndAdPosition.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getAdPageInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		String strKey = request.getParameter("key");
		if(strKey==null || "".equals(strKey)){
			strKey = "1";
		}
		List<SysDictionary> adPageList = this.getDictionaryDataByType("adPage", strKey);
		List<SysDictionary> adPositionList = this.getDictionaryDataByType("adPosition", strKey);
		if(adPageList!=null && adPositionList!=null){
			map.put("adPageList", adPageList);
			map.put("adPositionList", adPositionList);
			map.put("Count", adPositionList.size()-1);
			map.put("success",Boolean.TRUE);
		}else{
			map.put("success",Boolean.FALSE);
		}
		return map;
	}
	/**
	 * 获得类信息 
	 * @param type
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public List<SysDictionary> getDictionaryDataByType(String type,String key) throws Exception{
		SysDictionaryExample  example = new SysDictionaryExample();
		SysDictionaryExample.Criteria criteria = example.createCriteria();
		criteria.andDicTypeEqualTo(type);
		if(key!=null && !"".equals(key)){
			criteria.andDicKeyEqualTo(key);
		}
		example.setOrderByClause("  convert(sysDictionary.dic_index,DECIMAL) ASC");
		List<SysDictionary> dictionaryName = sysDictionaryService.selectByExample(example);
		if(dictionaryName!=null && dictionaryName.size()>0){
			return dictionaryName;
		}else{
			return null;
		}
	}
	
	/**
	 * 获得楼层信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getFloorNum.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getFloorNum(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		String strKey = "F";
		List<SysDictionary> FloorNum = this.getDictionaryDataByType("Floor", strKey);
		if(FloorNum!=null && FloorNum!=null){
			map.put("FloorNum", FloorNum);
			map.put("success",Boolean.TRUE);
		}else{
			map.put("success",Boolean.FALSE);
		}
		return map;
	}
	
	/**
	 * 进入字典页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toDictionary.do", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView  toDictionary(HttpServletRequest request,HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SysDictionaryExample  example = new SysDictionaryExample();
		int pageTotal = this.getDictionaryTotal(example, 16);
		
		example.setFromNumber(0);
		example.setToNumber(16);
		example.setOrderByClause(" convert(sysDictionary.dic_index,DECIMAL) ASC");
		List<SysDictionary>  sdList =  sysDictionaryService.selectByExample(example);
		if(sdList!=null && sdList.size()>0){
			map.put("sdList", sdList);
		}else{
			map.put("sdList", null);
		}
		map.put("pageTotal", pageTotal);
		ModelAndView modelAndView = new ModelAndView("/builder/dictionary",map);
		return modelAndView;
	}
	
	/**
	 * 字典数据信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getDictionaryData.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String, Object>  getDictionaryData(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		int page = 1;
		int record = 16;
		String defaultPage = request.getParameter("defaultPage");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String key = request.getParameter("key");
		String indexNum = request.getParameter("indexNum");
		String remarkCont = request.getParameter("remarkCont");
		if(defaultPage!=null && !"".equals(defaultPage)){
			page = Integer.parseInt(defaultPage);
		}	
		SysDictionaryExample  example = new SysDictionaryExample();
		SysDictionaryExample.Criteria criteria = example.createCriteria();
		if(name!=null && !"".equals(name)){
			criteria.andDicNameLike("%"+name+"%");
		}
		if(type!=null && !"".equals(type)){
			criteria.andDicTypeEqualTo(type);
		}
		if(key!=null && !"".equals(key)){
			criteria.andDicKeyEqualTo(key);
		}
		if(indexNum!=null && !"".equals(indexNum)){
			criteria.andDicIndexEqualTo(indexNum);
		}
		if(remarkCont!=null && !"".equals(remarkCont)){
			criteria.andRemarkLike("%"+remarkCont+"%");
		}
		int pageTotal = this.getDictionaryTotal(example, record);
		
		example.setFromNumber(record*(page-1));
		example.setToNumber(record);
		example.setOrderByClause(" convert(sysDictionary.dic_index,DECIMAL) ASC");
		List<SysDictionary>  sdList =  sysDictionaryService.selectByExample(example);
		if(sdList!=null && sdList.size()>0){
			map.put("sdList", sdList);
			map.put("success", Boolean.TRUE);
		}else{
			map.put("success", Boolean.FALSE);
			map.put("sdList", null);
		}
		map.put("pageTotal", pageTotal);
		return map;
	}
	
	/**
	 * 获得分页总页数
	 * @param sdExample
	 * @param record
	 * @return
	 */
	public int getDictionaryTotal(SysDictionaryExample sdExample,int record){
		int ctCount=sysDictionaryService.countByExample(sdExample);
		
		if(ctCount>0){
			return ctCount/record + (ctCount%record==0?0:1);
		}else{
			return 0;
		}
	}
	
	/**
	 * 新增字典信息
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addDictionData.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String, Object>  addDictionData(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String key = request.getParameter("key");
		String indexNum = request.getParameter("indexNum");
		String remarkCont = request.getParameter("remarkCont");
		if(name!=null && !"".equals(name) && type!=null && !"".equals(type)){
			SysDictionary sDictionary = new SysDictionary();
			sDictionary.setDicName(name);
			sDictionary.setDicType(type);
			if(key!=null && !"".equals(key)){
				sDictionary.setDicKey(key);
			}
			if(indexNum!=null && !"".equals(indexNum)){
				sDictionary.setDicIndex(indexNum);
			}
			if(remarkCont!=null && !"".equals(remarkCont)){
				sDictionary.setRemark(remarkCont);
			}
			sDictionary.setCreateTime(new Date());
			sysDictionaryService.insertSelective(sDictionary);
			map.put("success", Boolean.TRUE);
		}else{
			map.put("reuslt_err", "缺少参数");
			map.put("success", Boolean.FALSE);
		}
		return map;
	}
	
	/**
	 * 更新字典数据
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateDictionData.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String, Object>  updateDictionData(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		String sdId = request.getParameter("sdId");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String key = request.getParameter("key");
		String indexNum = request.getParameter("indexNum");
		String remarkCont = request.getParameter("remarkCont");
		if(sdId!=null && !"".equals(sdId) && name!=null && !"".equals(name) && type!=null && !"".equals(type)){
			SysDictionaryExample  example = new SysDictionaryExample();
			SysDictionaryExample.Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(Long.parseLong(sdId));
			List<SysDictionary>  sdList =  sysDictionaryService.selectByExample(example);
			if(sdList!=null && sdList.size()==1){
				SysDictionary sDictionary = sdList.get(0);
				sDictionary.setDicName(name);
				sDictionary.setDicType(type);
				if(key!=null && !"".equals(key)){
					sDictionary.setDicKey(key);
				}
				if(indexNum!=null && !"".equals(indexNum)){
					sDictionary.setDicIndex(indexNum);
				}
				if(remarkCont!=null && !"".equals(remarkCont)){
					sDictionary.setRemark(remarkCont);
				}
				sDictionary.setCreateTime(new Date());
				sDictionary.setIsUpload("0");
				sysDictionaryService.updateByPrimaryKeySelective(sDictionary);
				map.put("success", Boolean.TRUE);
			}else{
				map.put("success", Boolean.FALSE);
			}
		}else{
			map.put("reuslt_err", "缺少参数");
			map.put("success", Boolean.FALSE);
		}
		return map;
	}
	
	/**
	 * 获取运费模板的发货时间
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getShipmentsTime.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getShipmentsTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		
		SysDictionaryExample  example = new SysDictionaryExample();
		SysDictionaryExample.Criteria criteria = example.createCriteria();
		criteria.andDicTypeEqualTo("sendTime");
		example.setOrderByClause(" convert(sysDictionary.dic_index,DECIMAL) ASC");
		List<SysDictionary> sendTimeList = sysDictionaryService.selectByExample(example);
		
		if(sendTimeList!=null && sendTimeList.size()>0){
			map.put("sendTimeList",sendTimeList);
			map.put("success", Boolean.TRUE);
		}else{
			map.put("success", Boolean.FALSE);
		}
		
		return map;
	}
	
	
	/**
	 * 根据id查看字典数据
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getDictionaryInfoById.do", method = { RequestMethod.GET,RequestMethod.POST })
	public @ResponseBody Map<String,Object> getDictionaryInfoById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();  
		String sdId = request.getParameter("sdId");
		if(sdId!=null && !"".equals(sdId)){
			SysDictionaryExample sdExmaple = new SysDictionaryExample();
			SysDictionaryExample.Criteria sdCriteria = sdExmaple.createCriteria();
			sdCriteria.andIdEqualTo(Long.parseLong(sdId));
			List<SysDictionary> sdList = sysDictionaryService.selectByExample(sdExmaple);
			if(sdList!=null && sdList.size()==1){
				map.put("sdInfo", sdList.get(0));
				map.put("success", Boolean.TRUE);
				map.put("reuslt_err", null);
			}else{
				map.put("success", Boolean.FALSE);
				map.put("reuslt_err", "没有查看相关数据");
			}
		}else{
			map.put("success", Boolean.FALSE);
			map.put("reuslt_err", "缺少参数");
		}
		
		return map;
	}
	
	/**
	 * 根据字典类型查询字典数据
	 * @param 字典类型type
	 * @return 字典集合sdList
	 * */
	private List<SysDictionary> getDictionaryByExample(String type) {
		List<SysDictionary> sdList = null;
		SysDictionaryExample.Criteria sdCriteria = null;
		SysDictionaryExample sdExmaple = null;
		sdExmaple = new SysDictionaryExample();
		sdCriteria = sdExmaple.createCriteria();
		sdCriteria.andDicTypeEqualTo(type);
		try {
			sdList = sysDictionaryService.selectByExample(sdExmaple);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sdList;
	}

	/**
	 * 根据字典类型查询扩展信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 * */
	@RequestMapping(value = "/loadExtendInfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	Map<String, Object> getDictionaryInfos(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		List<SysDictionary> sdList = new ArrayList<SysDictionary>();
		String extendInfoNames = request.getParameter("extendInfoNames");
		String[] extendInfoName = extendInfoNames.split(",");
		boolean flag = true;
		for (int i = 0; i < extendInfoName.length; i++) {
			sdList = getDictionaryByExample(extendInfoName[i]);
			flag = sdList != null;
			map.put(extendInfoName[i], sdList);
		}
		map.put("success", flag);
		return map;
	}


}