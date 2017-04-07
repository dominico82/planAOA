package nfit.coin.model;

import nfit.member.model.MemberDTO;

public interface CoinDAO {
	public MemberDTO getPayInfo(String userid);
	public int setPayInfo(String userid, int coin);
}
