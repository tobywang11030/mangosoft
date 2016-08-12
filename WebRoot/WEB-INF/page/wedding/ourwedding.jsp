<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- saved from url=(0042)http://wedlaa.com/v-U7022328F6AE?eqrcode=1 -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/resources/wedding_js/discuz.css" rel="stylesheet" id="lhgdialoglink">
		<meta charset="utf-8">
		
		<meta id="metaDescription" name="description" content="心心相印">
		<meta name="keywords" content="微请柬,HTML5,互动大师,免费的H5工具,免费的HTML5工具,HTML5编辑器,HTML5制作,H5,H5页面制作工具,专业HTML5制作工具,免费海量HTML5模板,免费H5模板,微网站,wedlaa,smallapp,微信请柬,结婚请柬,手机请柬,H5小游戏制作">
		<meta http-equiv="pragma" content="no-cache"> 
		<meta http-equiv="Cache-Control" content="no-store, must-revalidate"> 
		<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT"> 
		<meta http-equiv="expires" content="0">
		<meta id="eqMobileViewport" name="viewport" content="width=320, initial-scale=1.125, maximum-scale=1.125, user-scalable=no" servergenerated="true">
		<title>心心相印</title>

<style type="text/css">
.rotate {
	position:absolute;
	left:10px;
	top:10px;
	width:30px;
	height:30px;
	background-size:100% 100%;
	background-image:url(<%=request.getContextPath()%>/resources/wedding_img/music_off.png);
	-webkit-animation:rotating 1.2s linear infinite;
	-moz-animation:rotating 1.2s linear infinite;
	-o-animation:rotating 1.2s linear infinite;
	animation:rotating 1.2s linear infinite
}

@-webkit-keyframes rotating {
	from {
	-webkit-transform:rotate(0deg)
}
to {
	-webkit-transform:rotate(360deg)
}
}@keyframes rotating {
	from {
	transform:rotate(0deg)
}
to {
	transform:rotate(360deg)
}
}@-moz-keyframes rotating {
	from {
	-moz-transform:rotate(0deg)
}
to {
	-moz-transform:rotate(360deg)
}
}.off {
		background-image:url(<%=request.getContextPath()%>/resources/wedding_img/music_off.png);
	background-size:30px 30px;
	background-repeat:no-repeat;
	background-position:center center
}

</style>
 
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/wedding_js/eqShow-4.8.2.css">
	
	</head>
	<body>
	<div class="" style="left: 0px; top: 0px; visibility: hidden; position: absolute;">
	<table class="ui_border">
		<tbody>
			<tr>
				<td class="ui_lt">
				</td>
				<td class="ui_t">
				</td>
				<td class="ui_rt">
				</td>
			</tr>
			<tr>
				<td class="ui_l">
				</td>
				<td class="ui_c">
					<div class="ui_inner">
						<table class="ui_dialog">
							<tbody>
								<tr>
									<td colspan="2">
										<div class="ui_title_bar">
											<div class="ui_title" unselectable="on" style="cursor: move;">
											</div>
											<div class="ui_title_buttons">
												<a class="ui_min" href="javascript:void(0);" title="最小化" style="display: inline-block;">
													<b class="ui_min_b">
													</b>
												</a>
												<a class="ui_max" href="javascript:void(0);" title="最大化" style="display: inline-block;">
													<b class="ui_max_b">
													</b>
												</a>
												<a class="ui_res" href="javascript:void(0);" title="还原">
													<b class="ui_res_b">
													</b>
													<b class="ui_res_t">
													</b>
												</a>
												<a class="ui_close" href="javascript:void(0);" title="关闭(esc键)" style="display: inline-block;">
													×
												</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="ui_icon" style="display: none;">
									</td>
									<td class="ui_main" style="width: auto; height: auto;">
										<div class="ui_content" style="padding: 10px;">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="ui_buttons" style="display: none;">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</td>
				<td class="ui_r">
				</td>
			</tr>
			<tr>
				<td class="ui_lb">
				</td>
				<td class="ui_b">
				</td>
				<td class="ui_rb" style="cursor: se-resize;">
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div id="ppitest" style="width:1in;visible:hidden;padding:0px"></div>
<div class="p-index main phoneBox" id="con" style="">
    <div class="top"></div>
    <div class="phone_menubar"></div>
    <div class="scene_title_baner" style="display: none">
        <div class="scene_title">心心相印</div>
    </div>
    <div class="nr" id="nr" style="width: 100%; height: 100%;">
        <div id="audio_btn" class="video_exist" style="display: block;">
            <div id="yinfu" class="rotate"></div>
            <audio loop="" src="http://cc.stream.qqmusic.qq.com/C100001AL45O06AXLi.m4a?fromtag=52" id="media" autoplay="" preload=""></audio>
        </div>
       <div id="loading" class="loading" style="opacity: 0.9; display: none;">
			<div class="loadbox">
				<div class="loadlogo" style="background-image: url(<%=request.getContextPath()%>/resources/wedding_res/ourwedding/5655c19a8ca00.png);">
				<img src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/5655c19a8ca00.png" style="display:none;"></div>
				<div class="loadbg"></div>
		    </div>
            <div class="loadtext" style="display:block;position:absolute;width:100%;height:auto;color:#FFF;text-align:center;bottom:40px;font-size:80%;">wedlaa.com</div>
		</div>
           <section class="main-page z-current" id = "mp1">
	<div class="m-img" id="page1">
		<section class="u-arrow-bottom">
			<img src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/btn01_arrow.png">
		</section>
		<div class="edit_wrapper" data-scene-id="272007">
			<div id="wrapper-background209792" style="width: 100%; height: 100%; background-image: url(<%=request.getContextPath()%>/resources/wedding_res/ourwedding/5655354e62a9d_small.jpg); background-size: cover; background-position: 50% 50%;">
			</div>
			<ul eqx-edit-destroy="" id="edit_area209792" comp-droppable="" paste-element=""
			class="edit_area weebly-content-area weebly-area-active" style="overflow: hidden; margin-top: 41.4444px;">
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_9017411715" num="1" ctype="4" comp-resize="" style="width: 320px; height: 51px; left: 0px; top: 0px; z-index: 2;">
					<div class="element-box" element-anim="" style="top: 0px; left: 0px; z-index: 2; width: 100%; height: 100%; transform: none; animation: fadeInDown 2s ease 0.5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="9017411715" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553572ebfe1.png" style="width: 320px; height: 52px; margin-top: -0.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_4105429058" num="1" ctype="4" comp-resize="" style="width: 320px; height: 248px; left: 0px; top: 140px; z-index: 3;">
					<div class="element-box" element-anim="" style="top: 140px; left: 0px; z-index: 3; width: 100%; height: 100%; transform: none; animation: fadeInDown 2s ease 3s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="4105429058" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553572a3836.png" style="width: 320px; height: 248px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_4783988824" num="1" ctype="4" comp-resize="" style="width: 238px; height: 200px; left: 41px; top: 133px; z-index: 4;">
					<div class="element-box" element-anim="" style="top: 133px; left: 41px; z-index: 4; width: 100%; height: 100%; transform: none; animation: flip 2.5s ease 0.5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="4783988824" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565535736e1b8.png" style="width: 238px; height: 200px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_964656000" num="1" ctype="4" comp-resize="" style="width: 80px; height: 42px; left: 79px; top: 77px; z-index: 5;">
					<div class="element-box" element-anim="" style="top: 77px; left: 79px; z-index: 5; width: 100%; height: 100%; transform: none; animation: fadeInLeft 2s ease 2s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="964656000" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565535733c843.png" style="width: 80px; height: 42px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_8583020494" num="1" ctype="4" comp-resize="" style="width: 80px; height: 48px; left: 157px; top: 77px; z-index: 6;">
					<div class="element-box" element-anim="" style="top: 77px; left: 157px; z-index: 6; width: 100%; height: 100%; transform: none; animation: fadeInRight 2s ease 2s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="8583020494" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565535731a2f2.png" style="width: 80px; height: 48px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_7700592028" num="1" ctype="4" comp-resize="" style="width: 320px; height: 73px; left: 0px; top: 413px; z-index: 7;">
					<div class="element-box" element-anim="" style="top: 413px; left: 0px; z-index: 7; width: 100%; height: 100%; transform: none; animation: zoomIn 2s ease 0.5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="7700592028" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553573a3836.png" style="width: 324px; height: 73px; margin-top: 0px; margin-left: -2px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_916804360" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 333px; z-index: 8;">
					<div class="element-box" element-anim="" style="top: 333px; left: 0px; z-index: 8; width: 100%; height: 100%; line-height: 1; transform: none; animation: bounceIn 1s ease 3.5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="916804360" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="line-height: inherit; color: rgb(211, 65, 65);">
										征 &nbsp;婚 &nbsp;卡
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>
<section class="main-page" id="mp2">
	<div class="m-img" id="page2">
		<section class="u-arrow-bottom">
			<img src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/btn01_arrow.png">
		</section>
		<div class="edit_wrapper" data-scene-id="272007">
			<div id="wrapper-background209791" style="width: 100%; height: 100%; background-image: url(&quot;http://uploads.wedlaa.com//pic/34/201511/5655354eba66c_small.jpg&quot;); background-size: cover; background-position: 50% 50%;">
			</div>
			<ul eqx-edit-destroy="" id="edit_area209791" comp-droppable="" paste-element=""
			class="edit_area weebly-content-area weebly-area-active" style="overflow: hidden; margin-top: 41.4444px;">
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_2859739550" num="1" ctype="4" comp-resize="" style="width: 320px; height: 248px; left: 0px; top: 136px; z-index: 2;">
					<div class="element-box" element-anim="" style="top: 136px; left: 0px; z-index: 2; width: 100%; height: 100%; transform: none; animation: fadeInDown 1s ease 2s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="2859739550" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553572a3836.png" style="width: 320px; height: 248px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_2221184804" num="1" ctype="4" comp-resize="" style="width: 179px; height: 54px; left: 70px; top: 399px; z-index: 3;">
					<div class="element-box" style="top: 399px; left: 70px; z-index: 3; width: 100%; height: 100%; transform: none;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="2221184804" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/5655376175bca.png" style="width: 179px; height: 54px; margin-top: 0px; margin-left: -0.5px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_7680365993" num="1" ctype="4" comp-resize="" style="width: 134px; height: 52px; left: 93px; top: 76px; z-index: 4;">
					<div class="element-box" style="top: 76px; left: 93px; z-index: 4; width: 100%; height: 100%; transform: none;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="7680365993" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553761a753f.png" style="width: 134px; height: 52px; margin-top: 0px; margin-left: -0.5px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_6317415881" num="1" ctype="4" comp-resize="" style="width: 134px; height: 52px; left: 93px; top: 356px; z-index: 5;">
					<div class="element-box" style="top: 356px; left: 93px; z-index: 5; width: 100%; height: 100%; transform: none;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="6317415881" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553762071c5.png" style="width: 134px; height: 52px; margin-top: 0px; margin-left: -0.5px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_304438025" num="1" ctype="4" comp-resize="" style="width: 115px; height: 59px; left: 101px; top: 302px; z-index: 6;">
					<div class="element-box" element-anim="" style="top: 302px; left: 101px; z-index: 6; width: 100%; height: 100%; transform: none; animation: flip 2s ease 2.8s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="304438025" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553761c9a90.png" style="width: 115px; height: 59px; margin-top: 0px; margin-left: -0.5px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_6967436942" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 128px; z-index: 7;">
					<div class="element-box" element-anim="" style="top: 128px; left: 0px; z-index: 7; width: 100%; height: 100%; line-height: 1; transform: none; animation: fadeInLeft 1s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="6967436942" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 16px; line-height: inherit;">
										相识相知，幸福悄然绽放
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_9758459023" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 160px; z-index: 8;">
					<div class="element-box" element-anim="" style="top: 160px; left: 0px; z-index: 8; width: 100%; height: 100%; line-height: 1; transform: none; animation: fadeInRight 1s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="9758459023" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 16px; line-height: inherit;">
										今天，我们愿永结连理，携手白发
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_3618575163" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 194px; z-index: 9;">
					<div class="element-box" element-anim="" style="top: 194px; left: 0px; z-index: 9; width: 100%; height: 100%; line-height: 1; transform: none; animation: zoomIn 1s ease 2s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="3618575163" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); line-height: inherit; font-size: 24px;">
										在此，诚挚邀请您
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_4932942985" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 225px; z-index: 10;">
					<div class="element-box" element-anim="" style="top: 225px; left: 0px; z-index: 10; width: 100%; height: 100%; line-height: 1; transform: none; animation: fadeInLeft 1s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="4932942985" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 16px; line-height: 16px;">
										与我们共享这份甜蜜的喜悦
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_5931334328" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 258px; z-index: 11;">
					<div class="element-box" element-anim="" style="top: 258px; left: 0px; z-index: 11; width: 100%; height: 100%; line-height: 1; transform: none; animation: fadeInRight 1s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="5931334328" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 16px; line-height: inherit;">
										见证我们不变的爱情誓言
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>
<section class="main-page" id="mp3">
	<div class="m-img" id="page3">
		<section class="u-arrow-bottom">
			<img src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/btn01_arrow.png">
		</section>
		<div class="edit_wrapper" data-scene-id="272007">
			<div id="wrapper-background209793" style="width: 100%; height: 100%; background-image: url(&quot;http://uploads.wedlaa.com//pic/34/201511/5655354e62a9d_small.jpg&quot;); background-size: cover; background-position: 50% 50%;">
			</div>
			<ul eqx-edit-destroy="" id="edit_area209793" comp-droppable="" paste-element=""
			class="edit_area weebly-content-area weebly-area-active" style="overflow: hidden; margin-top: 41.4444px;">
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_4724607198" num="1" ctype="2" comp-resize="" style="width: 320px; height: 35px; left: 0px; top: 403px; z-index: 2;">
					<div class="element-box" element-anim="" style="top: 403px; left: 0px; z-index: 2; width: 100%; height: 100%; line-height: 1; transform: none; animation: bounceInLeft 1s ease 3.2s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="4724607198" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 35px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 18px; line-height: inherit;">
										他，不是最优秀的
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_1055690107" num="1" ctype="2" comp-resize="" style="width: 320px; height: 36px; left: 0px; top: 436px; z-index: 3;">
					<div class="element-box" element-anim="" style="top: 436px; left: 0px; z-index: 3; width: 100%; height: 100%; line-height: 1; transform: none; animation: bounceInRight 1s ease 3.6s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="1055690107" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 36px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 18px; line-height: inherit;">
										却是最爱我的
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_561013567" num="1" ctype="4" comp-resize="" style="width: 93px; height: 80px; left: 161px; top: 5px; z-index: 4;">
					<div class="element-box" element-anim="" style="top: 5px; left: 161px; z-index: 4; width: 100%; height: 100%; transform: none; animation: zoomIn 1s ease 2.5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="561013567" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565546f1165e9.png" style="width: 93px; height: 80px; margin-top: -0.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_7420869959" num="1" ctype="4" comp-resize="" style="width: 276px; height: 351px; left: 10.6917px; top: 59.3786px; z-index: 5; transform: rotateZ(356.419deg);">
					<div class="element-box" element-anim="" style="top: 59.3786px; left: 10.6917px; z-index: 5; width: 100%; height: 100%; transform: none; animation: rollIn 1s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="7420869959" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56554a9fe82d8.png" style="width: 276px; height: 351px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_2455435605" num="1" ctype="4" comp-resize="" style="width: 320px; height: 248px; left: 0px; top: 59px; z-index: 6;">
					<div class="element-box" element-anim="" style="top: 59px; left: 0px; z-index: 6; width: 100%; height: 100%; transform: none; animation: fadeInDown 2s ease 3s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="2455435605" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553572a3836.png" style="width: 320px; height: 248px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_510627297" num="1" ctype="4" comp-resize="" style="width: 199px; height: 249px; left: 55px; top: 125px; z-index: 7; transform: rotateZ(0deg);">
					<div class="element-box" element-anim="" style="top: 125px; left: 55px; z-index: 7; width: 100%; height: 100%; opacity: 1; color: rgb(103, 103, 103); border: 1px solid rgba(0, 0, 0, 0); padding-bottom: 0px; padding-top: 0px; line-height: 1; border-radius: 6px; transform: none; box-shadow: rgba(0, 0, 0, 0.498039) 0px 0px 0px; animation: zoomIn 1s ease 1.8s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="510627297" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/5630513f77722.jpg" style="width: 197px; height: 268px; margin-top: -10.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_729610888" num="1" ctype="4" comp-resize="" style="width: 82px; height: 121px; left: 237.141px; top: 51px; z-index: 8;">
					<div class="element-box" element-anim="" style="top: 51px; left: 237.141px; z-index: 8; width: 100%; height: 100%; transform: none; animation: fadeInRight 2s ease 2.5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="729610888" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565546f0d51ab.png" style="width: 82px; height: 122px; margin-top: -0.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_8696909107" num="1" ctype="2" comp-resize="" style="width: 163px; height: 38px; left: 0px; top: 25px; z-index: 9;">
					<div class="element-box" element-anim="" style="top: 25px; left: 0px; z-index: 9; width: 100%; height: 100%; line-height: 1; transform: none; animation: bounceInLeft 1s ease 5s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="8696909107" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 163px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(211, 65, 65); font-size: 18px; line-height: inherit;">
										新郎 李明明
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>
<section class="main-page" id="mp4">
	<div class="m-img" id="page4">
		<section class="u-arrow-bottom">
			<img src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/btn01_arrow.png">
		</section>
		<div class="edit_wrapper" data-scene-id="272007">
			<div id="wrapper-background209795" style="width: 100%; height: 100%; background-image: url(&quot;http://uploads.wedlaa.com//pic/34/201511/5655354f0aece.jpg&quot;); background-size: cover; background-position: 50% 50%;">
			</div>
			<ul eqx-edit-destroy="" id="edit_area209795" comp-droppable="" paste-element=""
			class="edit_area weebly-content-area weebly-area-active" style="overflow: hidden; margin-top: 41.4444px;">
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_3003748896" num="undefined" ctype="4" comp-resize="" style="width: 288px; height: 117px; left: 16px; top: 352px; z-index: 1;">
					<div class="element-box" element-anim="" style="border-radius: 0px; border: 1px solid rgb(255, 255, 255); z-index: 1; padding-top: 0px; height: 100%; width: 100%; left: 16px; padding-bottom: 0px; top: 352px; transform: none; animation: fadeInUp 0.8s ease 0.8s both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="3003748896" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565ac096bc3b8.jpg" style="width: 288px; height: 190px; margin-top: -36.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_7102858390" num="undefined" ctype="4" comp-resize="" style="width: 79px; height: 118px; left: 15px; top: 222px; z-index: 2;">
					<div class="element-box" element-anim="" style="border-radius: 0px; border: 1px solid rgb(255, 255, 255); z-index: 2; padding-top: 0px; height: 100%; width: 100%; left: 15px; padding-bottom: 0px; top: 222px; transform: none; animation: fadeInLeft 0.6s ease 0.6s both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="7102858390" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565ac09560ae0.jpg" style="width: 87px; height: 118px; margin-top: 0px; margin-left: -4px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_1370283547" num="undefined" ctype="4" comp-resize="" style="width: 196px; height: 120px; left: 108px; top: 222px; z-index: 3;">
					<div class="element-box" element-anim="" style="border-radius: 0px; border: 1px solid rgb(255, 255, 255); z-index: 3; padding-top: 0px; height: 100%; width: 100%; left: 108px; padding-bottom: 0px; top: 222px; transform: none; animation: fadeInRight 1s ease 1s 1 both; background-color: rgba(0, 0, 0, 0);">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="1370283547" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565ac09849caa.jpg" style="width: 196px; height: 129px; margin-top: -4.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_6877084000" num="1" ctype="4" comp-resize="" style="width: 312px; height: 157px; left: 0px; top: 15px; z-index: 4;">
					<div class="element-box" element-anim="" style="top: 15px; left: 0px; z-index: 4; width: 100%; height: 100%; transform: none; animation: fadeIn 3s ease 1s 3 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="6877084000" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/yq0KA1U1nDKAK7mUAAN98w4JP74103.png" style="width: 312px; height: 169px; margin-top: -6px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_9201205241" num="undefined" ctype="4" comp-resize="" style="width: 289px; height: 192px; left: 15px; top: 15px; z-index: 5;">
					<div class="element-box" element-anim="" style="border-radius: 0px; border: 1px solid rgb(255, 255, 255); z-index: 5; padding-top: 0px; height: 100%; width: 100%; left: 15px; padding-bottom: 0px; top: 15px; transform: none; animation: fadeInRight 1s ease 0.2s 1 both; background-color: rgba(0, 0, 0, 0);">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="9201205241" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565ac098e631b.jpg" style="width: 295px; height: 192px; margin-top: 0px; margin-left: -3px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_2179409229" num="1" ctype="4" comp-resize="" style="width: 80px; height: 55px; left: 3px; top: 16px; z-index: 6;">
					<div class="element-box" element-anim="" style="top: 16px; left: 3px; z-index: 6; width: 100%; height: 100%; transform: none; animation: flip 2s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="2179409229" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/563af4f940d99.png" style="width: 80px; height: 55px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_6362183323" num="1" ctype="4" comp-resize="" style="width: 189px; height: 78px; left: 122.5px; top: 401px; z-index: 7;">
					<div class="element-box" style="top: 401px; left: 122.5px; z-index: 7; width: 100%; height: 100%; transform: none;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="6362183323" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/564aaa5f34eae.gif" style="width: 189px; height: 87px; margin-top: -4.5px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_2936392392" num="1" ctype="4" comp-resize="" style="width: 140px; height: 91px; left: 180px; top: 281.5px; z-index: 8;">
					<div class="element-box" element-anim="" style="top: 281.5px; left: 180px; z-index: 8; width: 100%; height: 100%; transform: none; animation: fadeInRight 2s ease 0s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="2936392392" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/565556f9e08c6.png" style="width: 140px; height: 91px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>
<section class="main-page" id="mp5">
	<div class="m-img" id="page5">
		<section class="u-arrow-bottom">
			<img src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/btn01_arrow.png">
		</section>
		<div class="edit_wrapper" data-scene-id="272007">
			<div id="wrapper-background209797" style="width: 100%; height: 100%; background-image: url(&quot;http://uploads.wedlaa.com//pic/34/201511/5655354f0aece.jpg&quot;); background-size: cover; background-position: 50% 50%;">
			</div>
			<ul eqx-edit-destroy="" id="edit_area209797" comp-droppable="" paste-element=""
			class="edit_area weebly-content-area weebly-area-active" style="overflow: hidden; margin-top: 41.4444px;">
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_5716996640" num="1" ctype="4" comp-resize="" style="width: 121px; height: 89px; left: 35.5px; top: 33px; z-index: 1;">
					<div class="element-box" element-anim="" style="top: 33px; left: 35.5px; z-index: 1; width: 100%; height: 100%; transform: none; animation: fadeInLeft 2s ease 0s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="5716996640" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/5655c06a71ec1.png" style="width: 121px; height: 89px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_9912859172" num="1" ctype="4" comp-resize="" style="width: 177px; height: 73px; left: 143px; top: 402px; z-index: 2;">
					<div class="element-box" element-anim="" style="top: 402px; left: 143px; z-index: 2; width: 100%; height: 100%; transform: none; animation: fadeIn 3s ease 0s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="9912859172" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/563b478a6acfc.png" style="width: 177px; height: 73px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_9154041471" num="1" ctype="4" comp-resize="" style="width: 143px; height: 127px; left: 0px; top: -0.5px; z-index: 3;">
					<div class="element-box" element-anim="" style="top: -0.5px; left: 0px; z-index: 3; width: 100%; height: 100%; transform: none; animation: fadeInDown 2s ease 1s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="9154041471" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56553572a3836.png" style="width: 149px; height: 127px; margin-top: 0px; margin-left: -3px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_17296544" num="1" ctype="4" comp-resize="" style="width: 258px; height: 126px; left: 61.5313px; top: -0.5px; z-index: 4;">
					<div class="element-box" style="top: -0.5px; left: 61.5313px; z-index: 4; width: 100%; height: 100%; transform: none;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="17296544" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/564aaa5f34eae.gif" style="width: 258px; height: 126px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-image"
				id="inside_738730557" num="1" ctype="4" comp-resize="" style="width: 177px; height: 177px; left: 78.4688px; top: 137px; z-index: 5;">
					<div class="element-box" element-anim="" style="top: 137px; left: 78.4688px; z-index: 5; width: 100%; height: 100%; transform: none; animation: wobble 2s ease 0s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<img id="738730557" ctype="4" class="element comp_image editable-image"
							src="<%=request.getContextPath()%>/resources/wedding_res/ourwedding/56cbc58b8583b.jpg" style="width: 177px; height: 177px; margin-top: 0px; margin-left: 0px;">
						</div>
					</div>
				</li>
				<li comp-drag="" comp-rotate="" class="comp-resize comp-rotate inside wsite-text"
				id="inside_377602629" num="1" ctype="2" comp-resize="" style="width: 320px; height: 38px; left: 0px; top: 328px; z-index: 6;">
					<div class="element-box" element-anim="" style="top: 328px; left: 0px; z-index: 6; width: 100%; height: 100%; line-height: 1; transform: none; animation: tada 2s ease 0s 1 both;">
						<div class="element-box-contents" style="width: 100%; height: 100%;">
							<div id="377602629" ctype="2" class="element comp_paragraph editable-text"
							style="cursor: default; width: 320px; height: 38px;">
								<div style="text-align: center;">
									<span style="color: rgb(255, 84, 0); line-height: inherit; background-color: initial;">
										微信扫描关注
									</span>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</section>
</div>
<div class="bottom">
</div>
</div>
	  
	

	
    <script src="<%=request.getContextPath()%>/resources/wedding_js/jquery.min.js"></script>

     
<script>
var np = 1;
var zs = 5;
     
		$(document).ready(function(){
		$("#audio_btn").click(function(){
		 
		  if (document.getElementById("media").paused) { 
		
           document.getElementById("media").play(); 
		    $("#yinfu").removeClass().addClass("rotate"); 
			 $("#audio_btn").removeClass().addClass("video_exist"); 
			
           }else{
		   document.getElementById("media").pause();
		    $("#yinfu").removeClass(); 
			 $("#audio_btn").removeClass().addClass("video_exist off"); 
		   }
		});
		
		
  $(".main-page").mousedown(function(e){
   if(np==1){
    $("#mp"+zs).removeClass().addClass("main-page"); 
   }
  $("#mp"+np).removeClass().addClass("main-page"); 
  $("#mp"+(np+1)).removeClass().addClass("main-page z-current"); 
 
  if((np+1)==zs){
  
  np=1;
  }else{
   np++;
  }
  
 });
});
	
</script>




     
     


		

     





     
     
        <div style="opacity:0; "></div>
</body></html>