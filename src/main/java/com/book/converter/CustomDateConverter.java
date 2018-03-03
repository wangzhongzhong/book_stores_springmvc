/**
 * 此代码归版权人所有，抄袭者追究版权
 */
package com.book.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
* @ClassName: test
* @Description: TODO
* @author zhongwang
* @date 2018年1月25日 下午11:00:37
*
*/
public class CustomDateConverter implements Converter<String, Date> {
	@Override
	public Date convert(String source) {
		//将字符串日期格式转成日期类型(yyyy-MM-dd HH:mm:ss)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			return sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//如果转换失败,返回null
		return null;
	}
}
