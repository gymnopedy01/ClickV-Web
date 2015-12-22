package com.plaync.nshop.core.common.jackson;

import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.MapperConfig;
import org.codehaus.jackson.map.PropertyNamingStrategy;
import org.codehaus.jackson.map.introspect.AnnotatedField;
import org.codehaus.jackson.map.introspect.AnnotatedMethod;
import org.springframework.util.StringUtils;

/**
 * JsonProperty Json Convert Name
 * @FileName : CustomPropertyNamingStrategy.java
 * @Project : NShop-Core
 * @Date : 2014. 3. 6. 
 * @작성자 : chunppo
 * @프로그램설명 :
 */
public class CustomPropertyNamingStrategy extends PropertyNamingStrategy {
	
	@Override
    public String nameForField(MapperConfig<?> config, AnnotatedField field,
            String defaultName) {
		 return preCapitalize(field.getName());
    }
	
	@Override
    public String nameForGetterMethod(MapperConfig<?> config, AnnotatedMethod method,
            String defaultName) {
		
		return preCapitalize(defaultName);
    }
	
	@Override
    public String nameForSetterMethod(MapperConfig<?> config, AnnotatedMethod method,
            String defaultName) {
		
        return preCapitalize(defaultName);
    }
	
	private String preCapitalize(String name) {
		String[] arr = name.split("_");
		for (int i = 1; i < arr.length; i++) {
			arr[i] = StringUtils.capitalize(arr[i]);
		}
		
		String rStr = StringUtils.arrayToDelimitedString(arr, "");
		return rStr;
	}
}
