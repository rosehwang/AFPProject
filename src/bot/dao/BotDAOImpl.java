package bot.dao;

import java.util.List;

import bot.dto.BotDTO;
import bot.mybatis.BotMapper;


public class BotDAOImpl implements BotDAO {
	
	@Override
	public List<BotDTO> botAnswerList() {
		return BotMapper.botAnswerList();
	}

	@Override
	public BotDTO getAnswerBot(String bot_no) {
		return BotMapper.getAnswerBot(bot_no);
	}

	@Override
	public int insertAnswerBot(BotDTO dto) {
		return BotMapper.insertAnswerBot(dto);
	}

	@Override
	public int deleteAnswerBot(String bot_no) {
		return BotMapper.deleteAnswerBot(bot_no);
	}

	@Override
	public int updateAnswerBot(BotDTO dto) {
		return BotMapper.updateAnswerBot(dto);
	}

	@Override
	public boolean checkAnswerBot(String bot_no) {
		return BotMapper.checkAnswerBot(bot_no);
	}

	
}
