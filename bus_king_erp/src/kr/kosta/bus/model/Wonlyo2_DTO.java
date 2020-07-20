package kr.kosta.bus.model;

public class Wonlyo2_DTO {

	private String wo2_iptype,wo2_date,wo2_type,wo2_no;
	private int  wo2_number;
	
	public String getWo2_iptype() {
		return wo2_iptype;
	}
	public void setWo2_iptype(String wo2_iptype) {
		this.wo2_iptype = wo2_iptype;
	}
	public String getWo2_date() {
		return wo2_date;
	}
	public void setWo2_date(String wo2_date) {
		this.wo2_date = wo2_date;
	}
	public String getWo2_type() {
		return wo2_type;
	}
	public void setWo2_type(String wo2_type) {
		this.wo2_type = wo2_type;
	}

	public String getWo2_no() {
		return wo2_no;
	}
	public void setWo2_no(String wo2_no) {
		this.wo2_no = wo2_no;

	}
	public int getWo2_number() {
		return wo2_number;
	}
	public void setWo2_number(int wo2_number) {
		this.wo2_number = wo2_number;
	}
	@Override
	public String toString() {
		return "Wonlyo2_DTO [wo2_iptype=" + wo2_iptype + ", wo2_date=" + wo2_date + ", wo2_type=" + wo2_type
				+ ", wo2_no=" + wo2_no + ", wo2_number=" + wo2_number + "]";
	}
	
	
}
