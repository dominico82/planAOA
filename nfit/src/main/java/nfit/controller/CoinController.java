package nfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.coin.model.CoinDAO;
import nfit.member.model.MemberDTO;

@Controller
public class CoinController {
	
	@Autowired 
	private CoinDAO coinDAO;
	
	@RequestMapping(value="coin.do")
	public ModelAndView coin(){
		
		MemberDTO dto=coinDAO.getPayInfo("test2");
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("coin/coin");
		return mav;
	}
	
	@RequestMapping(value="getCoin.do")
	public ModelAndView getCoin(@RequestParam(value="userId")String userid, @RequestParam(value="coin")int coin, @RequestParam(value="userCoin", defaultValue="0")int userCoin){
		int totalCoin=coin+userCoin;
		ModelAndView mav=new ModelAndView();
		int count=coinDAO.setPayInfo(userid, totalCoin);
		mav.setViewName("coin/getCoin");
		return mav;
	}
	

}
