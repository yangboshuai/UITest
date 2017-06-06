package com.cssca.automation.uitest.entity;

public class Step {
	
	private Integer id;
	private Integer stepNo;
	private String keyword;
	private String parameter;
	private Integer caseNo;
	
	public Integer getId(){
		return id;
	}
	
	public void setId(Integer id){
		this.id=id;
	}
	
	public Integer getStepNo(){
		return stepNo;
	}
	
	public void setStepNo(Integer stepNo){
		this.stepNo=stepNo;
	}
	
	public String getKeyword(){
		return keyword;
	}
	
	public void setKeyword(String keyword){
		this.keyword=keyword;
	}
	
	public String getParameter(){
		return parameter;
	}
	
	public void setParameter(String parameter){
		this.parameter=parameter;
	}
	
	public Integer getCaseNo(){
		return caseNo;
	}
	
	public void setCaseNo(Integer caseNo){
		this.caseNo=caseNo;
	}
	
	@Override  
    public String toString() {  
        return "Step [id=" + id + ", stepNo=" + stepNo + ", keyword=" + keyword+", parameter="+ 
        		parameter +", caseNo="+caseNo+"]";
    }
}
