package com.plaync.nshop.core.common.jackson;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * @FileName : CustomObjectMapper.java
 * @Project : NShop-Core
 * @Date : 2014. 3. 13.
 * @작성자 : nklee
 * @프로그램설명 :
 */
public class CustomObjectMapper extends ObjectMapper {

	/**
	 * Instantiates a new custom object mapper.
	 */
	public CustomObjectMapper() {
		// json -> object 변환 시
		configure(org.codehaus.jackson.map.DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//		configure(org.codehaus.jackson.map.SerializationConfig.Feature.INDENT_OUTPUT, true);
	}
}

