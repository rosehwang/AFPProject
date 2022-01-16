package account.dao;

import java.util.List;

import account.dto.AccountDTO;
import account.dto.CoconutDTO;
import account.dto.MyAccountDTO;
import account.dto.ThirdDTO;
import product.mybatis.CoconutMapper;

public class AccountDAOImpl implements AccountDAO {

	@Override
	public AccountDTO getPass1(AccountDTO dto) {
		return CoconutMapper.getPass1(dto);
	}

	@Override
	public AccountDTO getPass2(AccountDTO dto) {
		return CoconutMapper.getPass2(dto);
	}

	@Override
	public ThirdDTO getPass3(ThirdDTO dto) {
		return CoconutMapper.getPass3(dto);
	}
	@Override
	public int insertCoco(String id) {
		return CoconutMapper.insertCoco(id);
	}

	@Override
	public CoconutDTO getId(String id) {
		return CoconutMapper.getId(id);
	}

	@Override
	public int deleteCoconut(String id) {
		return CoconutMapper.DeleteCoconut(id);
	}

	@Override
	public List<CoconutDTO> coconutList() {
		return CoconutMapper.listCoconut();
	}

	@Override
	public int insertNewAccount(MyAccountDTO dto) {
		return CoconutMapper.insertNewAccount(dto);
	}

	@Override
	public List<MyAccountDTO> myAccountList(String id) {
		return CoconutMapper.listMyAccount(id);
	}
	
	@Override
	public int isMyAccount(AccountDTO dto) {
		return CoconutMapper.isMyAccount(dto);
	}
	
	@Override
	public MyAccountDTO myAccountContent(MyAccountDTO dto) {
		return CoconutMapper.myAccountContent(dto);
	}
	
	@Override
	public int checkAccountNum(String accountNum) {
		return CoconutMapper.checkAccountNum(accountNum);
	}
}






