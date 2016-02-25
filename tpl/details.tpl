<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr" xmlns:og="http://ogp.me/ns#">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
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
		{if $view->isPreview}
			{css href="/css/uq-preview/common.css"}
			{css href="/css/uq-preview/flickity.css"}
			{if $view->params.plugin_url|mb_strpos:'info' !== FALSE}
				{css href="/css/uq-preview/info.css"}
			{else}
				{css href="/css/uq-preview/qa.css"}
			{/if}
		{else}
			{css href="/css/uq/common.css"}
			{css href="/css/uq/flickity.css"}
			{if $view->params.plugin_url|mb_strpos:'info' !== FALSE}
				{css href="/css/uq/info.css"}
			{else}
				{css href="/css/uq/qa.css"}
			{/if}
		{/if}
		{script src="/js/uq/jquery-1.11.3.min.js"}{/script}
		{script src="/js/uq/all.js"}{/script}
		{script src="/js/uq/jquery.vticker.js"}{/script}
		{script src="/js/uq/tile.js"}{/script}
		{$scripts_for_layout|NOESCAPE}
		<script src="http://typesquare.com/accessor/apiscript/typesquare.js?Bh6KwcXf0GA%3D" type="text/javascript" charset="UTF-8"></script>
		<script type="text/javascript">{literal}
			$(function() {
				setTimeout(function(){
					$('.experience_ticker').vTicker();
				},1000);
				$(".explanation").tile();
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
			{if $view->params.plugin_url|mb_strpos:'wimax' !== FALSE}
				<a href="{base_url}/wimax/">
					<h1><img src="{base_url}/img/uq/uq_logo.png" />のクチコミ</h1>
					<p>お客様の生のクチコミをまとめてお届け！</p>
				</a>
			{elseif $view->params.plugin_url == 'index_about'}
				<a href="{base_url}/wimax/">
					<h1><img src="{base_url}/img/uq/uq_logo.png" />のクチコミ</h1>
					<p>お客様の生のクチコミをまとめてお届け！</p>
				</a>
			{else}
				<a href="{base_url}/mobile/">
					<h1><img src="{base_url}/img/uq/uqm_headerlogo.png" />のクチコミ</h1>
					<p>お客様の生のクチコミをまとめてお届け！</p>
				</a>
			{/if}
		</header>

		{literal}<div class="gallery js-flickity _flickity_tmp_before_parent" data-flickity-options='{ "freeScroll": true, "wrapAround": true, "autoPlay": 5000,"resizeBound": true }'>{/literal}
				<div class="gallery-cell _flickity_tmp_before"><a href="http://www.uqwimax.jp/" target="_blank"><img src="{base_url}/img/uq/img_banner1.png"></a></div>
				<div class="gallery-cell _flickity_tmp_before"><a href="http://www.uqwimax.jp/lp/newlife/" target="_blank"><img src="{base_url}/img/uq/img_banner2.png"></a></div>
				<div class="gallery-cell _flickity_tmp_before"><a href="http://www.uqwimax.jp/lp/lineup/index02.html" target="_blank"><img src="{base_url}/img/uq/img_banner3.jpg"></a></div>
		</div>

		<!-- navi -->
		<div id="{if $view->params.plugin_url|mb_strpos:'wimax' !== FALSE}wimax_page{elseif $view->params.plugin_url == 'index_about'}wimax_page{elseif index_about}mobile_page{/if}">
			<ul class="page_switch clearfix">
				<li class="wimax_switch"><a href="{base_url}/wimax/"><span>のクチコミ</span></a></li>
				<li class="mobile_switch"><a href="{base_url}/mobile/"><span>のクチコミ</span></a></li>
			</ul>

			<nav id="g-nav">
				<ul class="flipsnap">
					{if $view->params.plugin_url|mb_strpos:'wimax' !== FALSE}
						<li id="n_01" class="item"><a href="{base_url}/wimax"{if $view->params.plugin_url == 'wimax'} class="current"{/if}>全て</a></li>
						<li id="n_02" class="item"><a href="{base_url}/wimax_speed/"{if $view->params.plugin_url|mb_strpos:'wimax_speed' !== FALSE} class="current"{/if}><span>速度</span></a></li>
						<li id="n_03" class="item"><a href="{base_url}/wimax_price"{if $view->params.plugin_url|mb_strpos:'wimax_price' !== FALSE} class="current"{/if}><span>料金</span></a></li>
						<li id="n_04" class="item"><a href="{base_url}/wimax_product"{if $view->params.plugin_url|mb_strpos:'wimax_product' !== FALSE} class="current"{/if}><span>製品</span></a></li>
						<li id="n_05" class="item"><a href="{base_url}/wimax_area"{if $view->params.plugin_url|mb_strpos:'wimax_area' !== FALSE} class="current"{/if}><span>エリア</span></a></li>
					{elseif $view->params.plugin_url|mb_strpos:'index_about' !== FALSE}
						<li id="n_01" class="item"><a href="{base_url}/wimax"{if $view->params.plugin_url == 'wimax'} class="current"{/if}>全て</a></li>
						<li id="n_02" class="item"><a href="{base_url}/wimax_speed/"{if $view->params.plugin_url|mb_strpos:'wimax_speed' !== FALSE} class="current"{/if}><span>速度</span></a></li>
						<li id="n_03" class="item"><a href="{base_url}/wimax_price"{if $view->params.plugin_url|mb_strpos:'wimax_price' !== FALSE} class="current"{/if}><span>料金</span></a></li>
						<li id="n_04" class="item"><a href="{base_url}/wimax_product"{if $view->params.plugin_url|mb_strpos:'wimax_product' !== FALSE} class="current"{/if}><span>製品</span></a></li>
						<li id="n_05" class="item"><a href="{base_url}/wimax_area"{if $view->params.plugin_url|mb_strpos:'wimax_area' !== FALSE} class="current"{/if}><span>エリア</span></a></li>
					{else}
						<li id="n_01" class="item"><a href="{base_url}/mobile"{if $view->params.plugin_url == 'mobile'} class="current"{/if}>全て</a></li>
						<li id="n_02" class="item"><a href="{base_url}/mobile_speed/"{if $view->params.plugin_url|mb_strpos:'mobile_speed' !== FALSE} class="current"{/if}><span>速度/安定さ</span></a></li>
						<li id="n_03" class="item"><a href="{base_url}/mobile_price"{if $view->params.plugin_url|mb_strpos:'mobile_price' !== FALSE} class="current"{/if}><span>料金</span></a></li>
						<li id="n_04" class="item"><a href="{base_url}/mobile_product"{if $view->params.plugin_url|mb_strpos:'mobile_product' !== FALSE} class="current"{/if}><span>製品</span></a></li>
						<li id="n_05" class="item"><a href="{base_url}/mobile_area"{if $view->params.plugin_url|mb_strpos:'mobile_area' !== FALSE} class="current"{/if}><span>エリア</span></a></li>
					{/if}
				</ul>
			</nav>

			<div id="contents">
				<section class="sp_site">
					<div class="sp_kuchikomi">
						<ul class="clearfix">
							<!--li><span class="twitter">Twitterの<br />クチコミ</span></li-->
							<!--li><span class="blog">ブログ・<br />ニュース記事</span></li-->
							<!--li><span class="uq_info">UQから<br />お知らせ</span></li-->
						</ul>
					</div>
				</section><!-- /sp_site -->


				<!-- pc_site -->
				<section class="pc_site clearfix">
					<div class="pc_contents">
					<!-- socialBtn -->
						<div class="sub clearfix">
							<div class="socialBtn">
								<ul>
									<li class="facebook"><iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwimaxvoice.jp%2F&send=false&layout=button_count&width=120&show_faces=false&action=like&colorscheme=light&font&height=21&locale=ja_JP" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:103px; height:21px;" allowTransparency="true"></iframe></li>
									<li class="twitter"><a href="http://twitter.com/share" class="twitter-share-button" data-url="http://wimaxvoice.jp/" data-text="WiMAXのクチコミ｜" data-count="horizontal" data-related="UQ_WiMAX:UQコミュニケーションズ" data-lang="ja">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script></li>
									<li class="hatena"><a href="http://b.hatena.ne.jp/entry/http://wimaxvoice.jp/" class="hatena-bookmark-button" data-hatena-bookmark-title="WiMAXのクチコミ" data-hatena-bookmark-layout="standard" title="このエントリーをはてなブックマークに追加"><img src="http://b.st-hatena.com/images/entry-button/button-only.gif" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" /></a><script type="text/javascript" src="http://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script></li>
								</ul>
							</div>

						<div class="officialBtn">
								<ul>
									<li class="wimax"><a href="http://www.uqwimax.jp/" target="_blank"><span>UQ&nbsp;WiMAX&nbsp;公式サイト</span></a></li>
									<li class="mobile"><a href="http://www.uqmobile.jp/" target="_blank"><span>UQ&nbsp;mobile&nbsp;公式サイト</span></a></li>
								</ul>
							</div>
						</div><!-- /sub -->
					</div><!-- /pc_contents -->
				</section><!-- /pc_site -->

				<section class="{if $view->params.plugin_url|mb_strpos:'qa' !== FALSE}qa{else}info{/if}">
					{$content_for_layout|NOESCAPE}
					<div class="relation clearfix">
						<p class="title">関連コンテンツ</p>
							<ul>
								{if $view->params.plugin_url|mb_strpos:'wimax' !== FALSE}
									{if $view->params.plugin_url|mb_strpos:'area_qa' !== FALSE}
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_info_01" class="explanation">
												<h3><span>ここで使える！地下鉄・地下駅</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_info_02" class="explanation">
												<h3><span>ここで使える！屋内スポット</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/wimax_speed_qa#s_qa3" class="explanation">
												<h3><span>WiMAXの通信速度ってどのくらい速いの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'area_info_01' !== FALSE}
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_info_02" class="explanation">
												<h3><span>ここで使える！屋内スポット</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_qa" class="explanation">
												<h3><span>WiMAXって地下でも使えるの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/wimax_speed_qa#s_qa3" class="explanation">
												<h3><span>WiMAXの通信速度ってどのくらい速いの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'area_info_02' !== FALSE}
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_info_01" class="explanation">
												<h3><span>ここで使える！地下鉄・地下駅</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_qa" class="explanation">
												<h3><span>WiMAXって地下でも使えるの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/wimax_speed_qa#s_qa3" class="explanation">
												<h3><span>WiMAXの通信速度ってどのくらい速いの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'product_qa' !== FALSE}
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_info_01" class="explanation">
												<h3><span>WX02のバッテリーを長く持たせたい</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_info_02" class="explanation">
												<h3><span>W01のバッテリーを長く持たせたい</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/wimax_speed_qa#s_qa1" class="explanation">
												<h3><span>WX02でWi-Fiがよく切れる、通信速度が出ない時の対処法はありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'product_info_01' !== FALSE}
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_info_02" class="explanation">
												<h3><span>W01のバッテリーを長く持たせたい</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_qa#pro_qa1" class="explanation">
												<h3><span>WX02でWi-Fiがよく切れる、通信速度が出ない時の対処法はありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_qa#pro_qa3" class="explanation">
												<h3><span>WiMAXが使えるWi-Fiルーターはどんな機種がありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'product_info_02' !== FALSE}
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_info_01" class="explanation">
												<h3><span>WX02のバッテリーを長く持たせたい</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_qa/#pro_qa2" class="explanation">
												<h3><span>WX01でWi-Fiがよく切れる、通信速度が出ない時の対処法はありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_qa#pro_qa3" class="explanation">
												<h3><span>WiMAXが使えるWi-Fiルーターはどんな機種がありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'price_qa' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_info_02" class="explanation">
												<h3><span>公衆無線LANを便利に活用</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_info_01" class="explanation">
												<h3><span>WiMAXならたっぷり使える</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section area">
											<a href="{base_url}/wimax_area_info_02" class="explanation">
												<h3><span>ここで使える！屋内スポット</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'price_info_01' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_info_02" class="explanation">
												<h3><span>公衆無線LANを便利に活用</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_qa#pr_qa2" class="explanation">
												<h3><span>料金プラン変更はできますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_qa#pr_qa1" class="explanation">
												<h3><span>3GBってどれくらい使えるの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'price_info_02' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_info_01" class="explanation">
												<h3><span>WiMAXならたっぷり使える</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_qa#pr_qa2" class="explanation">
												<h3><span>料金プラン変更はできますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_qa#pr_qa1" class="explanation">
												<h3><span>3GBってどれくらい使えるの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{elseif $view->params.plugin_url|mb_strpos:'speed_qa' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/wimax_price_qa#pr_qa1" class="explanation">
												<h3><span>3GBってどれくらい使えるの？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_qa#pro_qa1" class="explanation">
												<h3><span>WX02でWi-Fiがよく切れる、通信速度が出ない時の対処法はありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/wimax_product_qa#pro_qa2" class="explanation">
												<h3><span>W01でWi-Fiがよく切れる、通信速度が出ない時の対処法はありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
									{/if}
								{else}
									{if $view->params.plugin_url|mb_strpos:'area_qa' !== FALSE}
										<li class="contents_section speed">
											<a href="{base_url}/mobile_speed_qa#s_qa1" class="explanation">
												<h3><span>ネットは快適につかえますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/mobile_speed_info_01" class="explanation">
												<h3><span>下り最大150Mbpsの高速通信に対応！</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/mobile_product_qa#pro_qa1" class="explanation">
												<h3><span>UQ mobileが使える機種はどこで確認できますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'product_info' !== FALSE}
										<li class="contents_section product">
											<a href="{base_url}/mobile_product_qa#pro_qa1" class="explanation">
												<h3><span>UQ mobileが使える機種はどこで確認できますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section product">
											<a href="{base_url}/mobile_product_qa#pro_qa2" class="explanation">
												<h3><span>スマホをセットで購入することはできますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_01" class="explanation">
												<h3><span>全部コミコミの新料金プラン「ぴったりプラン」登場</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'product_qa' !== FALSE}
										<li class="contents_section product">
											<a href="{base_url}/mobile_product_info" class="explanation">
												<h3><span>約5.0インチの大画面。電池も余裕の3日持ちのarrows M02登場</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_01" class="explanation">
												<h3><span>全部コミコミの新料金プラン「ぴったりプラン」登場</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_03" class="explanation">
												<h3><span>【安心・便利】ぴったりアプリパック</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'price_qa' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_02" class="explanation">
												<h3><span>データ容量を節約できる！ターボ機能</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_03" class="explanation">
												<h3><span>【安心・便利】ぴったりアプリパック</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_01" class="explanation">
												<h3><span>全部コミコミの新料金プラン「ぴったりプラン」登場</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'price_info_01' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_02" class="explanation">
												<h3><span>データ容量を節約できる！ターボ機能</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_03" class="explanation">
												<h3><span>【安心・便利】ぴったりアプリパック</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_qa#pr_com" class="explanation">
												<h3><span>通信費は安くなりますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'price_info_02' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_01" class="explanation">
												<h3><span>全部コミコミの新料金プラン「ぴったりプラン」登場</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_03" class="explanation">
												<h3><span>【安心・便利】ぴったりアプリパック</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_qa#pr_com" class="explanation">
												<h3><span>通信費は安くなりますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'price_info_03' !== FALSE}
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_01" class="explanation">
												<h3><span>全部コミコミの新料金プラン「ぴったりプラン」登場</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_info_03" class="explanation">
												<h3><span>【安心・便利】ぴったりアプリパック</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section price">
											<a href="{base_url}/mobile_price_qa#pr_com" class="explanation">
												<h3><span>通信費は安くなりますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'speed_qa' !== FALSE}
										<li class="contents_section speed">
											<a href="{base_url}/mobile_speed_info/" class="explanation">
												<h3><span>下り最大150Mbpsの高速通信に対応！</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/mobile_area_qa/" class="explanation">
												<h3><span>サービスエリアは確認できますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/mobile_price_info_02/" class="explanation">
												<h3><span>データ容量を消費せず節約する方法はありますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{elseif $view->params.plugin_url|mb_strpos:'speed_info' !== FALSE}
										<li class="contents_section speed">
											<a href="{base_url}/mobile_speed_qa#s_qa1" class="explanation">
												<h3><span>ネットは快適につかえますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/mobile_speed_qa#s_qa2" class="explanation">
												<h3><span>無料通話はできますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>
										<li class="contents_section speed">
											<a href="{base_url}/mobile_speed_qa#s_qa3" class="explanation">
												<h3><span>LINEは使えますか？</span></h3>
												<p class="view_btn"><span>view</span></p>
											</a>
										</li>

									{/if}
								{/if}
							</ul>
						</div><!-- /.relation -->

					</div><!-- /contents -->
				</section>

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
					<li class="footer_twitter_sp"><a href="https://twitter.com/UQ_WiMAX" target="_blank"><img src="{base_url}/img/uq/twitter_official_sp.png" /></a></li>
					<li class="footer_facebook_sp"><a href="http://www.facebook.com/uqwimax/" target="_blank"><img src="{base_url}/img/uq/fb_official_sp.png" /></a></li>
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
					<li><a href="{base_url}/wimax/" class="webfont_w3">全て</a></li>
					<li><a href="{base_url}/wimax_speed/" class="webfont_w3">速度</a></li>
					<li><a href="{base_url}/wimax_price/" class="webfont_w3">料金</a></li>
					<li><a href="{base_url}/wimax_product/" class="webfont_w3">製品</a></li>
					<li><a href="{base_url}/wimax_area/" class="webfont_w3">エリア</a></li>
				</ul>
			</div>

			<div class="footer_mobile">
				<p><span>のクチコミ</span></p>
				<ul class="clearfix wimaxlink_kuchikomi">
					<li><a href="{base_url}/mobile/">全て</a></li>
					<li><a href="{base_url}/mobile_speed/">速度</a></li>
					<li><a href="{base_url}/mobile_price/">料金</a></li>
					<li><a href="{base_url}/mobile_product/">製品</a></li>
					<li><a href="{base_url}/mobile_area/">エリア</a></li>
				</ul>
			</div>

			<div class="footer_wimax">
				<p><span>のクチコミ</span></p>
				<ul>
					<li><a href="http://www.uqwimax.jp/" target="_blank">UQコミュニケーションズサイトトップ</a></li>
					<li><a href="http://www.uqwimax.jp/signup/trywimax/" target="_blank">WiMAXの15日無料お試し申込み</a></li>
					<li><a href="http://www.uqwimax.jp/shop/" target="_blank">WiMAXのお申し込み</a></li>
				</ul>
			</div>

			<div class="footer_mobile clearfix">
				<p><span>のクチコミ</span></p>
				<ul>
					<li><a href="http://www.uqmobile.jp/" target="_blank">UQmobileサイトトップ</a></li>
					<li><a href="http://www.uqmobile.jp/flow/" target="_blank">UQmobileのお申し込み</a></li>
				</ul>
			</div>

				<ul class="menuList clearfix">
					<li><a href="{base_url}/index_about/">当サイトについて</a></li>
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
