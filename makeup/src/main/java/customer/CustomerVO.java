package customer;

public class CustomerVO {
	//customer
	private int no;
	private String id, password, name, birthday, gender, phone[], email, address, hobby, graduate_h, schoolname_h, location_h,
			graduate_u, schoolname_u, location_u, graduate_m, schoolname_m, location_m;
	
	private String organization, period_edu, context_edu;	//education
	private String company_ca, period_ca, department, position_ca, task_ca;		//career
	private String project, client, company_sk, position_sk, part, task_sk, os, language, dbms, tool, communication, etc;	//skill
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
	public void setPhone(String[] phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public String getAddress() {
		return address;
	}
	public String getHobby() {
		return hobby;
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
	public String getCompany_ca() {
		return company_ca;
	}
	public String getPeriod_ca() {
		return period_ca;
	}
	public String getDepartment() {
		return department;
	}
	public String getPosition_ca() {
		return position_ca;
	}
	public String getTask_ca() {
		return task_ca;
	}
	public String getProject() {
		return project;
	}
	public String getClient() {
		return client;
	}
	public String getCompany_sk() {
		return company_sk;
	}
	public String getPosition_sk() {
		return position_sk;
	}
	public String getPart() {
		return part;
	}
	public String getTask_sk() {
		return task_sk;
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
	public void setEmail(String email) {
		this.email = email;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
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
	public void setCompany_ca(String company_ca) {
		this.company_ca = company_ca;
	}
	public void setPeriod_ca(String period_ca) {
		this.period_ca = period_ca;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public void setPosition_ca(String position_ca) {
		this.position_ca = position_ca;
	}
	public void setTask_ca(String task_ca) {
		this.task_ca = task_ca;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public void setCompany_sk(String company_sk) {
		this.company_sk = company_sk;
	}
	public void setPosition_sk(String position_sk) {
		this.position_sk = position_sk;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public void setTask_sk(String task_sk) {
		this.task_sk = task_sk;
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
