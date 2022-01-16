package news.dao;

import java.util.List;

import news.dto.NewsDTO;
import news.mybatis.NewsMapper;


public class NewsDAOImpl implements NewsDAO {

	@Override
	public List<NewsDTO> newsList(int startRow, int endRow) {
		return NewsMapper.newsList(startRow, endRow);
	}

	@Override
	public NewsDTO getNews(String news_no, String mode) {
		if (mode.equals("content")) {
			System.out.println(mode);
			NewsMapper.getNewsContent(news_no);
		}
		return NewsMapper.getNews(news_no);
	}
	
	@Override
	public List<NewsDTO> getMainNews()
	{
		return NewsMapper.getMainNews();
	}

	@Override
	public int insertNews(NewsDTO dto) {
		return NewsMapper.insertNews(dto);
	}

	@Override
	public int deleteNews(String news_no) {
		return NewsMapper.deleteNews(news_no);
	}

	@Override
	public int updateNews(NewsDTO dto, String chk) {
		return NewsMapper.updateNews(dto, chk);
	}

	@Override
	public List<NewsDTO> findNews(String searchMode, String word) {
		return NewsMapper.findNews(searchMode, word);
	}

	@Override
	public int getCount() {
		return NewsMapper.getCount();
	}

	
	

	
}
