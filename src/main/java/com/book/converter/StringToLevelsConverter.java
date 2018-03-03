/**
 * 此代码归版权人所有，抄袭者追究版权
 */
package com.book.converter;

import org.springframework.core.convert.converter.Converter;

import com.book.entity.user.Gender;

/**
* @ClassName: StringToLevelsConverter
* @Description: 是为了把我们的前台传过来的数据转换成枚举类型的，需要进行写一个转换器
* @author zhongwang
* @date 2018年1月25日 下午6:07:39
*
*/
public class StringToLevelsConverter implements Converter<String, Gender> {

	@Override
	public Gender convert(String levels) {
		
		return Gender.valueOf(Gender.class, levels);
	}

}
