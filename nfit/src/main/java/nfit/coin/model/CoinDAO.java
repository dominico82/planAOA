package nfit.coin.model;

import nfit.member.model.MemberDTO;

public interface CoinDAO {
	public MemberDTO getCoinInfo(String userid);
	public int setCoinInfo(String userid, int coin);
	public int setPayInfo(int member_idx, String pmethod, int coin, int price, String pclass);
	public int setCenterBooking(String member_id, int member_coin, int co_idx, String co_name, int coin_price, String use_date);
}
