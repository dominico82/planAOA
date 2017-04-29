package nfit.coin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import nfit.member.model.MemberDTO;

public class CoinDAOImple implements CoinDAO {
		
	private SqlSessionTemplate sqlMap;
	
	public CoinDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}

	public MemberDTO getCoinInfo(String userid) {
		MemberDTO dto=sqlMap.selectOne("getCoinInfo", userid);
		return dto;
	}

	public int setCoinInfo(String userid, int coin) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_id", userid);
		map.put("member_coin", coin);
		int count=sqlMap.update("setCoinInfo", map);
		return count;
	}
	
	public int setPayInfo(int member_idx, String pmethod, int coin, int price, String pclass) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		map.put("pay_method", pmethod);
		map.put("pay_coin", coin);
		map.put("pay_price", price);
		map.put("pay_class", pclass);
		int result=sqlMap.insert("setPayInfo", map);
		return result;
	}

	@Override
	public int setCenterBooking(String member_id, int member_coin, int co_idx, String co_name, int coin_price, String use_date) {
		HashMap<String, Object> bookingMap=new HashMap<String, Object>();
		bookingMap.put("member_id", member_id);
		bookingMap.put("co_idx", co_idx);
		bookingMap.put("co_name", co_name);
		bookingMap.put("usemember_coin", coin_price);
		bookingMap.put("use_date", use_date);

		HashMap<String, Object> useCoinMap=new HashMap<String, Object>();
		int totalCoin=member_coin-coin_price;
		useCoinMap.put("member_coin", totalCoin);
		useCoinMap.put("member_id", member_id);
		
		int bookingResult=sqlMap.insert("setCenterBooking", bookingMap);
		int useCoinResult=sqlMap.update("setUseMemberCoin", useCoinMap);
		int result=bookingResult==useCoinResult?1:0;
		return result;
	}
	
	public String getCenterBooking(String co_name, String use_date) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("co_name", co_name);
		map.put("use_date", use_date);
		String date=sqlMap.selectOne("getCenterBooking", map);
				
		return date;
	}
		
	public int bookingDel(String member_id, int co_idx, String use_date, int usemember_coin) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("co_idx", co_idx);
		map.put("use_date", use_date);
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("member_id", member_id);
		map2.put("member_coin", usemember_coin);
		int delResult=sqlMap.delete("bookingDel", map);
		int refundResult=sqlMap.update("refundCoin", map2);		
		int result=delResult==1&&refundResult==1?1:0;
		return result;
	}
	
}
















