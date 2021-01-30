package study.spring.bulletinboard.model;

import lombok.Data;

@Data
public class Chart
{
	// 기본 컬럼
	private String visit_date;
	private int visit_direct;
	private int visit_others;
	
}
