package nfit.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nfit.coin.model.CoinDAO;
import nfit.coin.model.CoinDTO;
import nfit.member.model.MemberDAO;
import nfit.member.model.MemberDTO;
import oracle.sql.DATE;

@Controller
public class CoinController {
	
	@Autowired 
	private CoinDAO coinDAO;
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping(value="coin.do")
	public ModelAndView coin(HttpSession session){
		String userid=(String)session.getAttribute("saveid");
		ModelAndView mav=new ModelAndView();
		if(userid==null || userid.equals("")){
			mav.setViewName("member/memberLoginForm");
		}else{
			MemberDTO dto=coinDAO.getCoinInfo(userid);
			mav.addObject("dto", dto);
			mav.setViewName("coin/coin");
		}
		
		return mav;
	}
	
//	@RequestMapping(value="getCoin.do")
//	public ModelAndView getCoin(@RequestParam(value="coin")int coin,
//								@RequestParam(value="userId")String userid,
//								@RequestParam(value="userCoin", defaultValue="0")int usercoin,
//								@RequestParam(value="member_idx")int idx,
//								@RequestParam(value="pay_method")String pmethod,
//								@RequestParam(value="pay_coin")int mcoin,
//								@RequestParam(value="pay_price")int price,
//								@RequestParam(value="pay_class")String pclass
//								){
//		int totalCoin=coin+usercoin;
//		ModelAndView mav=new ModelAndView();
//		int count=coinDAO.setCoinInfo(userid, totalCoin);
//		int result=coinDAO.setPayInfo(idx, pmethod, mcoin, price, pclass);
//		mav.setViewName("coin/getCoin");
//		return mav;
//	}
	
	//ajax 코인결제
	@RequestMapping(value="getCoin.do", method=RequestMethod.POST)
	@ResponseBody
	public MemberDTO getCoinAjax(@RequestParam(value="coin")int coin,
			@RequestParam(value="userId")String userid,
			@RequestParam(value="userCoin", defaultValue="0")int usercoin,
			@RequestParam(value="member_idx")int idx,
			@RequestParam(value="pay_method")String pmethod,
			@RequestParam(value="pay_coin")int mcoin,
			@RequestParam(value="pay_price")int price,
			@RequestParam(value="pay_class")String pclass
			){
		int totalCoin=coin+usercoin;
		ModelAndView mav=new ModelAndView();
		int count=coinDAO.setCoinInfo(userid, totalCoin);
		int result=coinDAO.setPayInfo(idx, pmethod, mcoin, price, pclass);
		MemberDTO dto=coinDAO.getCoinInfo(userid);
		return dto;
	}
	@RequestMapping(value="centerBooking.do")
	@ResponseBody
	public int centerBooking(String member_id, int co_idx, String co_name, int coin_price, String use_date){
		MemberDTO dto=memberDao.getMemberInfo(member_id);
		Calendar cal=Calendar.getInstance();
		String now=cal.get(cal.YEAR)+"-"+(cal.get(cal.MONTH)+1)+"-"+cal.get(cal.DATE);
		System.out.println("오늘날짜:"+now);
		
		int result=0;
		
		
		String date=coinDAO.getCenterBooking(co_name, use_date);
		if(date==null||date.equals("")){
			int member_coin=dto.getMember_coin();
			result=coinDAO.setCenterBooking(member_id, member_coin, co_idx, co_name, coin_price, use_date);
		}else{
			result=0;
		}
		
		return result;
	}

}

















