<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr" xmlns:og="http://ogp.me/ns#">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>{if $view->isPreview}[Preview] {/if}{$title_for_layout|default:$view->site.title|escape:"html":"UTF-8"}</title>
		<link rel="shortcut icon" href="{base_url}/favicon.ico" />
		{if $view->site.keyword}
		<meta name="keywords" content="{$view->site.keyword|replace:"\n":","}" />
		{/if}
		{if $view->site.description}
		<meta name="description" content="{$view->site.description|replace:"\n":" "}" />
		{/if}

		<meta property="og:title" content="WiMAXのクチコミ">
		<meta property="og:description" content="高速モバイルインターネット「WiMAX」の利用者の声、便利な使い方、様々なクチコミ・レビュー情報が掲載されたブログを集めました。">
		<meta property="og:type" content="article">
		<meta property="og:url" content="http://wimaxvoice.jp/">
		<meta property="og:image" content="http://wimaxvoice.jp/img/index.jpg">
		<meta property="og:site_name" content="WiMAXのクチコミ">
		{css href="/css/uq/qa.css"}
		{css href="/css/uq/common.css"}
		{css href="/css/uq/flickity.css"}
		{script src="/js/uq/jquery-1.11.3.min.js"}{/script}
		{script src="/js/uq/all.js"}{/script}
		{script src="/js/uq/jquery.vticker.js"}{/script}
		{$scripts_for_layout|NOESCAPE}
		<script src="http://typesquare.com/accessor/apiscript/typesquare.js?Bh6KwcXf0GA%3D" type="text/javascript" charset="UTF-8"></script>
		<script type="text/javascript">{literal}
			$(function() {
				$('.experience_ticker').vTicker();
			});
		{/literal}</script>

	{literal}
	<style type="text/css">
	#page_index header,#page_index nav,#page_index .online_regist,#page_index footer {
		display: none!important;
	}

	._flickity_tmp_before {
		position: absolute;
		left: 0%;
	}
	._flickity_tmp_before_parent {
		height: 320px;
	}
	div#tweet_list_sp {
		height: 900px !important;
	}

	</style>
	{/literal}

	</head>
	<body{if isset($body_for_layout)}{$body_for_layout|NOESCAPE}{/if}>
		<header>
			<a href="{base_url}/wimax/">
			<h1><img src="{base_url}/img/uq/uq_logo.png" />のクチコミ</h1>
			<p>お客様の生のクチコミをまとめてお届け！</p>
			<ul class="clearfix">
				<li class="header_wimax"><span>新生活のモバイルネット</span><img src="{base_url}/img/uq/uq_footerlogo.png"></li>
				<li class="header_mobile"><span>あなたにぴったりくるスマホ</span><img src="{base_url}/img/uq/mobile_logo.png"></li>
			</ul>
			</a>
		</header>

		{literal}<div class="gallery js-flickity _flickity_tmp_before_parent" data-flickity-options='{ "freeScroll": true, "wrapAround": true, "autoPlay": 5000,"resizeBound": true }'>{/literal}
				<div class="gallery-cell _flickity_tmp_before"><a href="http://www.uqwimax.jp/" target="_blank"><img src="{base_url}/img/uq/img_banner1.png"></a></div>
				<div class="gallery-cell _flickity_tmp_before"><a href="http://www.uqwimax.jp/lp/newlife/" target="_blank"><img src="{base_url}/img/uq/img_banner2.png"></a></div>
				<div class="gallery-cell _flickity_tmp_before"><a href="http://www.uqwimax.jp/lp/life/01/" target="_blank"><img src="{base_url}/img/uq/img_banner3.png"></a></div>
		</div>

		<!-- navi -->
		<div id="{if $view->params.plugin_url|mb_strpos:'wimax' !== FALSE}wimax_page{else}mobile_page{/if}">
			<ul class="page_switch clearfix">
				<li class="wimax_switch"><a href="{base_url}/wimax/"><span>のクチコミ</span></a></li>
				<li class="mobile_switch"><a href="{base_url}/mobile/"><span>のクチコミ</span></a></li>
			</ul>

			<nav id="g-nav">
				<ul class="flipsnap">
					{if $view->params.plugin_url|mb_strpos:'wimax' !== FALSE}
						<li id="n_01" class="item"><a href="{base_url}/"{if $view->params.plugin_url == 'wimax'} class="current"{/if}>全て</a></li>
						<li id="n_02" class="item"><a href="{base_url}/wimax_speed/"{if $view->params.plugin_url == 'wimax_speed'} class="current"{/if}><span>速度</span></a></li>
						<li id="n_03" class="item"><a href="{base_url}/wimax_price"{if $view->params.plugin_url == 'wimax_price'} class="current"{/if}><span>料金</span></a></li>
						<li id="n_04" class="item"><a href="{base_url}/wimax_product"{if $view->params.plugin_url == 'wimax_product'} class="current"{/if}><span>製品</span></a></li>
						<li id="n_05" class="item"><a href="{base_url}/wimax_area"{if $view->params.plugin_url == 'wimax_area'} class="current"{/if}><span>エリア</span></a></li>
					{else}
						<li id="n_01" class="item"><a href="{base_url}/"{if $view->params.plugin_url == 'mobile'} class="current"{/if}>全て</a></li>
						<li id="n_02" class="item"><a href="{base_url}/mobile_speed/"{if $view->params.plugin_url == 'mobile_speed'} class="current"{/if}><span>速度</span></a></li>
						<li id="n_03" class="item"><a href="{base_url}/mobile_price"{if $view->params.plugin_url == 'mobile_price'} class="current"{/if}><span>料金</span></a></li>
						<li id="n_04" class="item"><a href="{base_url}/mobile_product"{if $view->params.plugin_url == 'mobile_product'} class="current"{/if}><span>製品</span></a></li>
						<li id="n_05" class="item"><a href="{base_url}/mobile_area"{if $view->params.plugin_url == 'mobile_area'} class="current"{/if}><span>エリア</span></a></li>
					{/if}
				</ul>
			</nav>

			<div id="contents">
				{$content_for_layout|NOESCAPE}

				<div class="pagetop">
					<p class="webfont_w3"><a href="#">&and;&nbsp;page&nbsp;top</a></p>
				</div>

			</div><!-- /#contents -->
		</div><!-- /wimax_page-->

		<footer>
			<div class="footer_contents">

			<div class="footer_sp">
				<p>UQ WiMAX Officialアカウント</p>
				<ul class="clearfix footer_sp_acc">
					<li class="footer_twitter_sp"><a href=""><img src="{base_url}/img/uq/twitter_official_sp.png" /></a></li>
					<li class="footer_facebook_sp"><a href=""><img src="{base_url}/img/uq/fb_official_sp.png" /></a></li>
				</ul>
			</div>

			<div class="footer_pc clearfix">
				<ul>
					<li class="wimax">
					<p>UQ&nbsp;WiMAX公式Twitter</p>
					<a class="twitter-timeline"  href="https://twitter.com/UQ_WiMAX" data-widget-id="695423907361198081" data-chrome="nofooter noheader transparent">@UQ_WiMAXさんのツイート</a>
					</li>

					<li class="mobile">
						<p>UQ&nbsp;WiMAX公式facebook</p>
						<div class="fb-page" data-href="https://www.facebook.com/uqwimax/" data-tabs="timeline" data-width="485" data-height="460" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/uqwimax/"><a href="https://www.facebook.com/uqwimax/">UQコミュニケーションズ</a></blockquote></div></div>
					</li>
			</div>
			
			<div class="footer_wimax">
				<p><span>のクチコミ</span></p>
				<ul class="clearfix wimaxlink_kuchikomi">
					<li><a href="" class="webfont_w3">全て</a></li>
					<li><a href="" class="webfont_w3">速度</a></li>
					<li><a href="" class="webfont_w3">料金</a></li>
					<li><a href="" class="webfont_w3">製品</a></li>
					<li><a href="" class="webfont_w3">エリア</a></li>
				</ul>
			</div>

			<div class="footer_mobile">
				<p><span>のクチコミ</span></p>
				<ul class="clearfix wimaxlink_kuchikomi">
					<li><a href="">全て</a></li>
					<li><a href="">速度</a></li>
					<li><a href="">料金</a></li>
					<li><a href="">製品</a></li>
					<li><a href="">エリア</a></li>
				</ul>
			</div>

			<div class="footer_wimax">
				<p><span>のクチコミ</span></p>
				<ul>
					<li><a href="">UQコミュニケーションズサイトトップ</a></li>
					<li><a href="">WiMAXの15日無料お試し申込み</a></li>
					<li><a href="">WiMAXのお申し込み</a></li>
				</ul>
			</div>

			<div class="footer_mobile clearfix">
				<p><span>のクチコミ</span></p>
				<ul>
					<li><a href="">UQmobileサイトトップ</a></li>
					<li><a href="">UQmobileのお申し込み</a></li>
				</ul>
			</div>

				<ul class="menuList clearfix">
					<li><a href="../about.html">当サイトについて</a></li>
					<li><a href="http://www.uqwimax.jp/annai/kokai/kojin/" target="_blank">プライバシーポリシー</a></li>
				</ul>

				<div class="copyright">
					<p>Copyright &copy; 2016 UQ Communications Inc. all rights reserved. &copy;2016 FUJITV KIDS</p>
				</div>

				<div class="pagetop_sp">
					<p><a href="#"><img src="{base_url}/img/uq/pagetop_sp.png" /></a></p>
				</div>

			</div><!-- /footer_contents -->

		</footer>

		<!-- TwitterWidjet -->
		<script>{literal}!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs","facebook-jssdk");{/literal}</script>

		<div id="fb-root"></div>
		<script>{literal}(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.5&appId=178827065580476";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));{/literal}</script>

		<!-- twitter_timeline -->

		<script type="text/javascript">
		{literal}
		$(function(){
			var reconstruct = function(articles) {
				var   _group = "tweet_list"
					, tpl = $("#tweet_list_tpl").html()
					, tpl_data = { articles: [] }
					, _articles = articles["tweets"]
					, len_articles = _articles.length
				;

				if ( len_articles > 0 ) {

					for (var i=0; i<len_articles; i++) {
						tpl_data.articles[i] = {}

						tpl = $("#tweet_list_tpl .tweet_item").clone(false);

						tpl.find(".img a").attr("href", "https://twitter.com/intent/user?screen_name=" + _articles[i].screen_name);
						tpl.find(".img a img").attr("src", _articles[i].profile_image_url);

						tpl.find(".texts .date a")
							.attr("href", "https://twitter.com/" + _articles[i].screen_name + "/status/" + _articles[i].tweet_id)
							.html(_articles[i].created_at);

						tpl.find(".texts .name a.user_name")
							.attr("href", "https://twitter.com/intent/user?screen_name=" + _articles[i].screen_name)
							.html(_articles[i].name);

						tpl.find(".texts .name a.screen_name")
							.attr("href", "https://twitter.com/intent/user?screen_name=" + _articles[i].screen_name)
							.html("@" + _articles[i].screen_name);

						tpl.find(".texts .text").html(_articles[i].tweet);

						tpl.find(".texts .tools .reply a").attr("href", "https://twitter.com/intent/tweet?in_reply_to=" + _articles[i].tweet_id);
						tpl.find(".texts .tools .retweet a").attr("href", "https://twitter.com/intent/retweet?tweet_id=" + _articles[i].tweet_id);
						tpl.find(".texts .tools .favorite a").attr("href", "https://twitter.com/intent/favorite?tweet_id=" + _articles[i].tweet_id);

						$("#icon_loading").fadeOut();
						$("#tweet_list ul").append(tpl.clone());
						$("#tweet_list_sp ul").append(tpl.clone());

					}
//					tickerStart();
				}
				else {
					errorMsg("0");
				}
			}

			var errorMsg = function(s) {
				$("#icon_loading").fadeOut();
				if (s == "0") {
					$("#tweet_list").html("<p>つぶやきはありません</p>");
				}
				else {
					$("#tweet_list").html("<p>エラーが起きました</p>");
				}
			}

			var get_url = "//wimaxvoice.jp{/literal}{plugin_admin_url}{literal}".match(/^(.*\/)admin/);
			var data_url = get_url[1] + "api/tweet/tweet_api/tweets?category=price&sort=new&page=1&count=30";
			var data_url = "{/literal}{plugin_base_url}{literal}/../tweet/tweet_api/tweets?category=price&sort=new&page=1&count=30"
			var json_url = "../media/json/price.json";

			$.ajax({
				  type: "GET"
				, url: data_url
				, dataType: "json"
				, success: function(articles){
					reconstruct(articles);
					//フォントを更新
					Ts.reload();
				}
				, error: function(articles){
					errorMsg();
				}
			});

			var _tmp_content = $('<script>');
			_tmp_content.attr('src', '{/literal}{base_url}{literal}/js/uq/flickity.pkgd.js');
			$('div#dummy_for_js').html(_tmp_content);
			setTimeout(function(){
				$('._flickity_tmp_before').removeClass('_flickity_tmp_before');
				$('._flickity_tmp_before_parent').removeClass('_flickity_tmp_before_parent');
			}, 2000);
		});
		{/literal}
		</script>
		<!-- twitter_timeline -->

		<div id="dummy_for_js">
		</div>
	</body>
</html>
