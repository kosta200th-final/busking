package kr.kosta.bus.model;

import java.sql.Date;

public class AllocationDTO {

	private String a_b_no, a_r_no, a_e_no, a_time;

	public String getA_b_no() {
		return a_b_no;
	}

	public void setA_b_no(String a_b_no) {
		this.a_b_no = a_b_no;
	}

	public String getA_r_no() {
		return a_r_no;
	}

	public void setA_r_no(String a_r_no) {
		this.a_r_no = a_r_no;
	}

	public String getA_e_no() {
		return a_e_no;
	}

	public void setA_e_no(String a_e_no) {
		this.a_e_no = a_e_no;
	}

	public String getA_time() {
		return a_time;
	}

	public void setA_time(String a_time) {
		this.a_time = a_time;
	}

	@Override
	public String toString() {
		return "AllocationDTO [a_b_no=" + a_b_no + ", a_r_no=" + a_r_no + ", a_e_no=" + a_e_no + ", a_time=" + a_time
				+ "]";
	}
	
	
}
