package customer;

public class CustomerVO {
	//customer
	private int no;
	private String id, password, name, birthday, gender, phone[], email, postcode, roadAddress, detailAddress,
			graduate_h, schoolname_h, location_h, graduate_u, schoolname_u, location_u, graduate_m, schoolname_m, location_m;
	
	private String organization, period_edu, context_edu;	//education
	private String company_c, hiredate_c, resigndate_c, position_c, task_c;		//career
	private String project, hiredate_s, resigndate_s, client, company_s, position_s, task_s, os, language, dbms, tool, communication, etc;	//skill
	private String certification, acquisition, context_ce;	//certificate 
	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getGender() {
		return gender;
	}
	public String[] getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getPostcode() {
		return postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public String getGraduate_h() {
		return graduate_h;
	}
	public String getSchoolname_h() {
		return schoolname_h;
	}
	public String getLocation_h() {
		return location_h;
	}
	public String getGraduate_u() {
		return graduate_u;
	}
	public String getSchoolname_u() {
		return schoolname_u;
	}
	public String getLocation_u() {
		return location_u;
	}
	public String getGraduate_m() {
		return graduate_m;
	}
	public String getSchoolname_m() {
		return schoolname_m;
	}
	public String getLocation_m() {
		return location_m;
	}
	public String getOrganization() {
		return organization;
	}
	public String getPeriod_edu() {
		return period_edu;
	}
	public String getContext_edu() {
		return context_edu;
	}
	public String getCompany_c() {
		return company_c;
	}
	public String getHiredate_c() {
		return hiredate_c;
	}
	public String getResigndate_c() {
		return resigndate_c;
	}
	public String getPosition_c() {
		return position_c;
	}
	public String getTask_c() {
		return task_c;
	}
	public String getProject() {
		return project;
	}
	public String getHiredate_s() {
		return hiredate_s;
	}
	public String getResigndate_s() {
		return resigndate_s;
	}
	public String getClient() {
		return client;
	}
	public String getCompany_s() {
		return company_s;
	}
	public String getPosition_s() {
		return position_s;
	}
	public String getTask_s() {
		return task_s;
	}
	public String getOs() {
		return os;
	}
	public String getLanguage() {
		return language;
	}
	public String getDbms() {
		return dbms;
	}
	public String getTool() {
		return tool;
	}
	public String getCommunication() {
		return communication;
	}
	public String getEtc() {
		return etc;
	}
	public String getCertification() {
		return certification;
	}
	public String getAcquisition() {
		return acquisition;
	}
	public String getContext_ce() {
		return context_ce;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setPhone(String[] phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public void setGraduate_h(String graduate_h) {
		this.graduate_h = graduate_h;
	}
	public void setSchoolname_h(String schoolname_h) {
		this.schoolname_h = schoolname_h;
	}
	public void setLocation_h(String location_h) {
		this.location_h = location_h;
	}
	public void setGraduate_u(String graduate_u) {
		this.graduate_u = graduate_u;
	}
	public void setSchoolname_u(String schoolname_u) {
		this.schoolname_u = schoolname_u;
	}
	public void setLocation_u(String location_u) {
		this.location_u = location_u;
	}
	public void setGraduate_m(String graduate_m) {
		this.graduate_m = graduate_m;
	}
	public void setSchoolname_m(String schoolname_m) {
		this.schoolname_m = schoolname_m;
	}
	public void setLocation_m(String location_m) {
		this.location_m = location_m;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public void setPeriod_edu(String period_edu) {
		this.period_edu = period_edu;
	}
	public void setContext_edu(String context_edu) {
		this.context_edu = context_edu;
	}
	public void setCompany_c(String company_c) {
		this.company_c = company_c;
	}
	public void setHiredate_c(String hiredate_c) {
		this.hiredate_c = hiredate_c;
	}
	public void setResigndate_c(String resigndate_c) {
		this.resigndate_c = resigndate_c;
	}
	public void setPosition_c(String position_c) {
		this.position_c = position_c;
	}
	public void setTask_c(String task_c) {
		this.task_c = task_c;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public void setHiredate_s(String hiredate_s) {
		this.hiredate_s = hiredate_s;
	}
	public void setResigndate_s(String resigndate_s) {
		this.resigndate_s = resigndate_s;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public void setCompany_s(String company_s) {
		this.company_s = company_s;
	}
	public void setPosition_s(String position_s) {
		this.position_s = position_s;
	}
	public void setTask_s(String task_s) {
		this.task_s = task_s;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public void setDbms(String dbms) {
		this.dbms = dbms;
	}
	public void setTool(String tool) {
		this.tool = tool;
	}
	public void setCommunication(String communication) {
		this.communication = communication;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public void setCertification(String certification) {
		this.certification = certification;
	}
	public void setAcquisition(String acquisition) {
		this.acquisition = acquisition;
	}
	public void setContext_ce(String context_ce) {
		this.context_ce = context_ce;
	}
	
	
	
}
