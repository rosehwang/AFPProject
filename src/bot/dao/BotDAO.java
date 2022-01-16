package bot.dao;

import java.util.List;

import bot.dto.BotDTO;

public interface BotDAO {
	public List<BotDTO> botAnswerList();
	public BotDTO getAnswerBot(String bot_no);
	public int insertAnswerBot(BotDTO dto);
	public int deleteAnswerBot(String bot_no);
	public int updateAnswerBot(BotDTO dto);
	public boolean checkAnswerBot(String bot_no);
}
