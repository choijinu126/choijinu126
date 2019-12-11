package kr.co.domain;

public class spageTO<T> extends pageTO<T>{
	private String searchType;
	private String keyword;
	
	public spageTO() {
	}

	public spageTO(String searchType, String keyword) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "spageTO [searchType=" + searchType + ", keyword=" + keyword + ", toString()=" + super.toString() + "]";
	}
}
