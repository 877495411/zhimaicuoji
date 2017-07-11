package com.yuguo.net.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 读取编辑器的<img>标签并返回src的数组
 * @author zhangliang
 *
 */
public class ImageUtil {
	public static String[] getImgs(String content) {
		String[]  images=null;
		String tempImages ="";
		Pattern p = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");//<img[^<>]*src=[\'\"]([0-9A-Za-z.\\/]*)[\'\"].(.*?)>");
        Matcher m = p.matcher(content);
        
        while(m.find()){
            tempImages+=m.group(1)+",";
        }
    	images=tempImages.replace("/attached", "").split(",");
 
    	return images;
	}
	/**
	 * 提取<a>标签的href值 
	 * @param textValue
	 * @return
	 */
	public static String getHrefs(String textValue) {
		String hrefs ="";  
		Pattern p = Pattern.compile("<a[^>]+href\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");  
		Matcher m = p.matcher(textValue);
        while(m.find()){
        	hrefs+=m.group(1)+";";
        }
       
    	return hrefs;
	}
	/**
	 * 读取编辑器的<img>标签并返回src的字符串
	 * @param content
	 * @return
	 */
	public static String getImgsToString(String content) {
		String  images="";
		Pattern p = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");//<img[^<>]*src=[\'\"]([0-9A-Za-z.\\/]*)[\'\"].(.*?)>");
        Matcher m = p.matcher(content);
        
        while(m.find()){
        	images+=m.group(1).replace("/attached/", "/attached/")+";";
        }
 
    	return images;
	}
	
	/*public static void main(String[] args) {
		String content="<a href=\"#\" target=\"_blank\"><img src=\"/yuguoAdmin/attached/image/20160120/20160120152024_92.png\" alt=\"\" /></a>" +
				"<a href=\"#\" target=\"_blank\"><img src=\"/yuguoAdmin/attached/image/20160120/20160120152025_446.png\" alt=\"\" /></a>" +
						"<a href=\"#\" target=\"_blank\"><img src=\"/yuguoAdmin/attached/image/20160120/20160120152025_666.png\" alt=\"\" /></a>" +
				"</a><a href=\"#\" target=\"_blank\"><img src=\"/yuguoAdmin/attached/image/20160120/20160120152025_891.png\" alt=\"\" /></a>";
		Pattern p = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");//<img[^<>]*src=[\'\"]([0-9A-Za-z.\\/]*)[\'\"].(.*?)>");
        Matcher m = p.matcher(content);
        
        while(m.find()){
        	System.out.println(m.group(1).replace("/yuguoAdmin/", ""));
        }
 
	}*/
	
}
