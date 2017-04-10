package nfit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.coin.model.CoinDAO;
import nfit.coin.model.CoinDTO;
import nfit.member.model.MemberDTO;

@Controller
public class CoinController {
	
	@Autowired 
	private CoinDAO coinDAO;
	
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
	
	@RequestMapping(value="getCoin.do")
	public ModelAndView getCoin(@RequestParam(value="coin")int coin,
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
		mav.setViewName("coin/getCoin");
		return mav;
	}
	

}
