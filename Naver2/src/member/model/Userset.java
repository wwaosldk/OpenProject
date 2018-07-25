package member.model;

public class Userset {

	
	private String id;
	private String password;
	private String name;
	private String birth1;
	private String birth2;
	private String birth3;
	private String birth;
	private String gender;
	private String checkemail;
	private String phone;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth1() {
		return birth1;
	}
	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}
	public String getBirth3() {
		return birth3;
	}
	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}
	public String getBirth() {
		birth = birth1+"년"+birth2+"월"+birth3+"일";	//위에 변수 초기화 단계에서 'birth'를 선언하면  null로 받음.
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {			//변수를 (애초에 radio 이름을 )gender1 로 했더니 안됨.. 숫자 포함한 변수를 못읽나 봄 .....왜?!
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCheckemail() {
		return checkemail;
	}
	public void setCheckemail(String checkemail) {
		this.checkemail = checkemail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	
	@Override
	public String toString() {
		return "Userset [id=" + id + ", password=" + password + ", name=" + name + ", birth1=" + birth1 + ", birth2="
				+ birth2 + ", birth3=" + birth3 + ", birth=" + birth + ", gender=" + gender + ", checkemail="
				+ checkemail + ", phone=" + phone + "]";
	}
	//초기화 함수
	public Userset() {
	}
	
	public Userset(String id, String password, String name, String birth, String gender, String checkemail, String phone) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.checkemail = checkemail;
		this.phone = phone;
	}
	
	
}
