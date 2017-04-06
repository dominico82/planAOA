<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" name="viewport">
  <title>로그인 - TLX Pass</title>

  <link rel="apple-touch-icon" sizes="57x57" href="/images/favicon/apple-touch-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="/images/favicon/apple-touch-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="/images/favicon/apple-touch-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="/images/favicon/apple-touch-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="/images/favicon/apple-touch-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="/images/favicon/apple-touch-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="/images/favicon/apple-touch-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="/images/favicon/apple-touch-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="/images/favicon/apple-touch-icon-180x180.png">
  <link rel="icon" type="image/png" href="/images/favicon/favicon-32x32.png" sizes="32x32">
  <link rel="icon" type="image/png" href="/images/favicon/android-chrome-192x192.png" sizes="192x192">
  <link rel="icon" type="image/png" href="/images/favicon/favicon-96x96.png" sizes="96x96">
  <link rel="icon" type="image/png" href="/images/favicon/favicon-16x16.png" sizes="16x16">
  <link rel="manifest" href="/images/favicon/manifest.json">
  <link rel="mask-icon" href="/images/favicon/safari-pinned-tab.svg" color="#5bbad5">
  <meta name="msapplication-TileColor" content="#da532c">
  <meta name="msapplication-TileImage" content="/images/favicon/mstile-144x144.png">
  <meta name="theme-color" content="#ffffff">
<meta name="description" content="TLX PASS는 전국 800여 제휴 스포츠센터에서 헬스, 골프, 수영, 요가, 사우나, 찜질방 등의 다양한 종목을 하나의 멤버십으로, 합리적인 가격에 이용할수 있는 피트니스 프리패스 서비스입니다.">
<meta name="keywords" lang="ko" content="티엘엑스,티엘엑스 패스,휘트니스,피트니스,운동,다이어트,건강,헬스,골프,수영,요가,사우나,찜질방,스포츠센터,피트니스 프리패스,인밸류넷">
<meta name="keywords" lang="en" content="TLX,TLX PASS,FITNESS,SPORTS,EXERCISE,ACTIVITY,DIET,HEALTH,GOLF,SWIM,YOHA,SAUNA,GYM,ENVALUENET">
<meta name="author" content="Envaluenet">
<meta property="og:type" content="website">
<meta property="og:title" content="TLX Pass - 합리적인 가격으로 원하는 운동을 원하는 곳에서!">
<meta property="og:site_name" content="대한민국 1등 피트니스 멤버십 TLX Pass">
<meta property="og:image" content="http://tlx.co.kr/images/marketing/facebook_470_246_1@2x.png">
<meta property="og:url" content="http://tlx.co.kr/">
<meta property="og:description" content="TLX PASS는 전국 800여 제휴 스포츠센터에서 헬스, 골프, 수영, 요가, 사우나, 찜질방 등의 다양한 종목을 하나의 멤버십으로, 합리적인 가격에 이용할수 있는 피트니스 프리패스 서비스입니다.">
<meta property="og:locale" content="ko_KR">
<meta property="fb:admins" content="616970332">
<meta property="fb:app_id" content="963964150337922">
<meta name="twitter:description" content="TLX PASS는 전국 800여 제휴 스포츠센터에서 헬스, 골프, 수영, 요가, 사우나, 찜질방 등의 다양한 종목을 하나의 멤버십으로, 합리적인 가격에 이용할수 있는 피트니스 프리패스 서비스입니다.">
<meta property="twitter:image" content="http://tlx.co.kr/images/marketing/facebook_470_246_1@2x.png">
<meta name="twitter:card" content="summary_large_image">
<meta name="google-site-verification" content="H5-alsMO1ZJoXTHe_fj48Vuf7VhUvKXHBdsUTNC42xo">
<meta name="naver-site-verification" content="f5bc67cf92eec6e43a254fa364fbd12593689106">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/Login.css">


  <script async="" charset="utf-8" src="//v2.zopim.com/?3WtcEvZwGJ2Pg5hpf8s6yDbdzgy1XpuP" type="text/javascript"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script async="" src="//connect.facebook.net/en_US/fbevents.js"></script><script src="/js/jquery.1.11.3.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/floatlabels.js"></script>
  <script src="/js/bootstrap-show-password.min.js"></script>
  <script src="/js/tlx_front.js?v=20160812"></script>
  <script src="/js/common.js"></script>
<!--[if lt IE 8]>
 <script src="/js/json2.js" type="text/javascript">
 </script>
<![endif]-->

  <!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');

fbq('init', '794117134066834');
fbq('track', "PageView");</script>
<noscript>&lt;img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=794117134066834&amp;ev=PageView&amp;noscript=1"
/&gt;</noscript>
<!-- End Facebook Pixel Code -->


<style media="print" class="jx_ui_StyleSheet" __jx__id="___$_2" type="text/css">.zopim { display: none !important }</style></head>
<body class="login"><div class="zopim" __jx__id="___$_154 ___$_154" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; border: 0px; background: transparent; overflow: hidden; position: fixed; z-index: 16000002; width: 180px; height: 30px; right: 10px; bottom: 0px; display: none;"><iframe frameborder="0" src="about:blank" style="background-color: transparent; vertical-align: text-bottom; position: relative; width: 100%; height: 100%; min-width: 100%; min-height: 100%; max-width: 100%; max-height: 100%; margin: 0px; overflow: hidden; display: block;"></iframe></div><div class="zopim" __jx__id="___$_4 ___$_4" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; border: 0px; background: transparent; overflow: hidden; position: fixed; z-index: 16000001; right: 10px; bottom: 0px; border-top-left-radius: 5px; border-top-right-radius: 5px; display: none; width: 350px; height: 450px; box-shadow: rgba(0, 0, 0, 0.0980392) 0px 0px 3px 2px;"><iframe frameborder="0" src="about:blank" style="background-color: transparent; vertical-align: text-bottom; position: relative; width: 100%; height: 100%; min-width: 100%; min-height: 100%; max-width: 100%; max-height: 100%; margin: 0px; overflow: hidden; display: block;"></iframe></div>

<div class="subWrap">

  <header class="subHeader">
    <%@include file="../header.jsp"%>
  </header>

<div class="container">
    <div class="memberWrap">
      <div class="row">

        <div class="col-lg-offset-2 col-lg-8 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 memberBox loginBox">
          <h2>
            <span><b>로그인</b></span>
            <small>다시 돌아와 주셔서 기뻐요!</small>
          </h2>


          <form class="memberForm" action="/member/login" method="post">
            <input type="hidden" name="next" value="/">
            <input type="hidden" name="from" value="">

            <div class="row">
              <div class="memberBox_left col-sm-6">
                <div class="register_type_select">
                  <a href="/member/login_fb/?next=%2F" onclick="check_frame('fb');return false;" class="via_facebook"><img class="ico" src="/images/ico_facebook_square_w@2x.png" alt=""> <b>페이스북</b>으로 로그인</a>
                  <a href="/member/login_kakao/?next=%2F" onclick="loginWithKakao();return false;" class="via_kakaotalk"><img class="ico" src="/images/ico_kakaotalk@2x.png" alt=""> <b>카카오톡</b>으로 로그인</a>
                  <a href="/member/login_naver/?next=%2F" onclick="check_frame('naver');return false;" class="via_naver"><img class="ico" src="/images/ico_naver_w@2x.png" alt=""> &nbsp;&nbsp;<b>네이버</b>로 로그인&nbsp;&nbsp;</a>
                  <div class="divLine">
                    <span>또는,</span>
                  </div>
                </div>
                <p class="loginGreeting">
                  <strong class="aq">TLX PASS</strong> 와 함께 하는
                  <em>건강한 하루</em>
                </p>
              </div><!-- /.memberBox_left -->


              <div class="memberBox_right col-sm-6">

                <div class="form-group form-group-lg">
                  <label for="id" class="sr-only">아이디</label>
                  <div class="floatlabel-wrapper" style="position:relative"><label for="user_id" class="label-floatlabel  " style="position: absolute; top: 0px; left: 0px; display: block; opacity: 1; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">아이디</label><input type="text" class="form-control floatlabel active-floatlabel" id="user_id" value="" name="user_id" placeholder="아이디" autocorrect="off" autocapitalize="none" style="padding-top: 12px; transition: all 0.1s ease-in-out;"></div>
                </div>

                <div class="form-group form-group-lg">
                  <label for="password" class="sr-only">비밀번호</label>
                  <div class="floatlabel-wrapper" style="position:relative"><label for="password" class="label-floatlabel  " style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">비밀번호</label><input type="password" name="password" class="form-control floatlabel" id="password" placeholder="비밀번호" autocorrect="off" autocapitalize="none" style="padding-top: 0px; transition: all 0.1s ease-in-out;"></div>
                </div>
                <div class="form-group submitLine">
                  <label>
                    <input type="checkbox" name="remember_login" value="1"> 나를 기억해 주세요.
                  </label>
                  <button type="submit" class="btn btn-block btn-signup">로그인</button>
                </div>
                <div class="notYetMember">
                  아직 계정이 없으신가요?&nbsp;&nbsp;&nbsp;&nbsp;<a href="/member/register/?next=/">회원가입하기</a>
                </div>
                <div class="forgot">
                  아이디, 비밀번호가 생각나지 않으세요?<br>
                  <a href="/member/find_id/">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="/member/reset_pw/?user_id=">비밀번호 찾기</a>
                </div>
              </div><!-- ./memberBox_right -->
            </div><!-- /.row -->
          </form>
        </div>
      </div><!-- /.row -->
      <div class="mb_footDeco">
        <img class="tlx_symbol" src="/images/tlx_pass_symbol_alt.svg" alt="">
      </div>
    </div><!-- /.memberWrap -->
  </div><!-- /container -->


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.init('8e8fc02082dba0e733393db6ab373a45');
      Kakao.Auth.login({
        success: function(authObj) {
            location.href = "/member/confirm_token/kakao/?next=%2F&token=" + authObj.access_token;
        },
        fail: function(err) {
            alert("인증에 실패 하였습니다.");
        }
      });
    };


    function check_frame(platform) {
        if (window.self !== window.top) {
            window.open( "/member/login_" + platform + "/?in_frame=1&next=%2F", "chk_plugin", "width=820, height=600" );
        } else {
            location.href = "/member/login_" + platform + "/?&next=%2F";
        }
    }

  //]]>
</script>


  <footer>
   <%@include file="../footer.jsp"%>
  </footer>

</div> <!-- /.wrap -->

<div class="spinnerWrap" id="spinner" style="display:none;">
  <div class="loader">Loading...</div>
</div>

<!-- IE8 / no SVG support browser -->
<script src="/js/svgeezy.min.js"></script>
<script>
    svgeezy.init(false, 'png');

    $('.memberForm input.form-control').floatlabel();
</script>


<script>
<!-- Google Analytics -->
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-44449439-2', 'auto');
ga('send', 'pageview');
<!-- Naver Analytics & Webmaster -->
</script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
<!-- Naver Analytics -->
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "4404647a913530";
wcs_do();
</script>


<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
$.src="//v2.zopim.com/?3WtcEvZwGJ2Pg5hpf8s6yDbdzgy1XpuP";z.t=+new Date;$.
type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
</script>
<!--End of Zopim Live Chat Script-->


<script>
    $zopim(function(){
        $zopim.livechat.setName('이은석');
        $zopim.livechat.setEmail('morden4120@naver.com');
        $zopim.livechat.setPhone('010-4755-8174');
        $zopim.livechat.addTags ('');
        $zopim.livechat.setNotes("아이디: morden4120\n사업장: ");
        var ua = navigator.userAgent.toLowerCase(),
        platform = navigator.platform.toLowerCase();
        platformName = ua.match(/ip(?:ad|od|hone)/) ? 'ios' : (ua.match(/(?:webos|android)/) || platform.match(/mac|win|linux/) || ['other'])[0],
        isMobile = /ios|android|webos/.test(platformName);
        $zopim.livechat.addTags ('로그인회원');
        $zopim.livechat.addTags (platformName);
        $zopim.livechat.badge.setLayout('image_only');
        $zopim.livechat.badge.setImage('/images/tlx_zopim_image.png');
        $zopim.livechat.badge.setColor('#00bff0');
        $zopim.livechat.button.setColor('#00bff0');
        if (isMobile) {    $zopim.livechat.addTags ('모바일접속'); }
        else { $zopim.livechat.addTags ('PC접속'); };
        $zopim.livechat.hideAll();

    });
</script>






</body></html>