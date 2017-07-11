package com.yuguo.net.utils;

import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

public class GrnerateUUID {
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
    
	/**
	 * 随机生成N位随机字符
	 * @param length 生成随机字符串长度
	 * @return
	 */
	public static String getRandomString(int length) { //length表示生成字符串的长度  
	    String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 }
	
	private static AtomicInteger counter = new AtomicInteger(0);

	/**
	 * 生成十位纯数字ID
	 * @return
	 */
    public static long getAtomicCounter() {
        if (counter.get() > 999999) {
            counter.set(1);
        }
        long time = Long.parseLong((new Date().getTime()+"").subSequence(5, 13).toString());
        long returnValue = time * 100 + counter.incrementAndGet();
        return returnValue;
    }

    private static long incrementAndGet() {
        return counter.incrementAndGet();
    }
}
