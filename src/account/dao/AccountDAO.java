package account.dao;

import java.util.List;

import account.dto.AccountDTO;
import account.dto.CoconutDTO;
import account.dto.MyAccountDTO;
import account.dto.ThirdDTO;

public interface AccountDAO {
	public AccountDTO getPass1(AccountDTO dto);
	public AccountDTO getPass2(AccountDTO dto);
	public ThirdDTO getPass3(ThirdDTO dto);
	public int insertCoco(String id);
	public CoconutDTO getId(String id);
	public int deleteCoconut(String id);
	public List<CoconutDTO> coconutList();
	public int insertNewAccount(MyAccountDTO dto);
	public List<MyAccountDTO> myAccountList(String id);
	public int isMyAccount(AccountDTO dto);
	public MyAccountDTO myAccountContent(MyAccountDTO dto);
	public int checkAccountNum(String accountNum);
}
