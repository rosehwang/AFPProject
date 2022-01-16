package news.dao;

import java.util.List;

import news.dto.NewsDTO;

public interface NewsDAO {
	public List<NewsDTO> newsList(int startRow, int endRow);
	public NewsDTO getNews(String news_no, String mode);
	public int insertNews(NewsDTO dto);
	public int deleteNews(String news_no);
	public int updateNews(NewsDTO dto, String check);
	public List<NewsDTO> findNews(String searchMode, String word);
	public int getCount();
	public List<NewsDTO> getMainNews();
}
