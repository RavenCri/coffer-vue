package Management.CoffeeShop.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 管理员类
 * @author nbtarena
 *
 */
public class User extends BaseEntity implements Serializable{ 
	/**
	 * 实现序列化,将对象状态转换为可保持或可传输的格式的过程.
	 * 可以更快地传输和存储数据(标识接口)
	 * UID是用来辅助序列化和反序列化.
	 */
	private static final long serialVersionUID = 6312655978905262702L;

	private Integer uid; //编号
	private String uname; //用户名
	private String pwd; //密码
	private String salt; //盐值,用来加密
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", pwd=" + pwd + ", salt=" + salt + ", toString()="
				+ super.toString() + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((uid == null) ? 0 : uid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (uid == null) {
			if (other.uid != null)
				return false;
		} else if (!uid.equals(other.uid))
			return false;
		return true;
	}
	
}
