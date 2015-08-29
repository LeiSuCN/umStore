<#import "common/APP.ftl" as APP>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>优管家 - 门店管理系统</title>
		
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="icon" type="image/jpeg" href="${APP.ROOT}/style/images/u.jpg">
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${APP.ROOT}/style/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${APP.ROOT}/style/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="${APP.ROOT}/style/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${APP.ROOT}/style/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${APP.ROOT}/style/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="${APP.ROOT}/style/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${APP.ROOT}/style/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${APP.ROOT}/style/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="${APP.ROOT}/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${APP.ROOT}/js/html5shiv.js"></script>
		<script src="${APP.ROOT}/js/respond.min.js"></script>
		<![endif]-->
		
		<!-- 加载jQuery -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${APP.ROOT}/js/jquery.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
 			window.jQuery || document.write("<script src='${APP.ROOT}/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${APP.ROOT}/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							优管家
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${APP.ROOT}/style/images/u.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									Jason
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="profile.html">
										<i class="ace-icon fa fa-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#">
										<i class="ace-icon fa fa-power-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
                   
                    <!-- 菜单：订单管理 START -->
                    <li class=""  id="menu_1_0">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-barcode"></i>
                            <span class="menu-text"> 订单管理 </span>

                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>

                        <ul class="submenu" id="menu_1_1">

                            <li class="">
                                <a href="${APP.ROOT}/orders">
                                    <i class="menu-icon fa fa-caret-right"></i>订单查询
                                </a>
                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>
                    <!-- 菜单：订单管理 END -->


                    <!-- 菜单：门店管理 START -->
                    <li class="">
                        <a href="${APP.ROOT}/information">
                            <i class="menu-icon fa fa-gavel"></i>
                            <span class="menu-text">门店信息 </span>
                        </a>
                    </li>
                    <!-- 菜单：门店管理 END -->
				</ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					</script>

					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="#">首页</a>
						</li>
					</ul><!-- /.breadcrumb -->
				</div>

				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
<#include content>
							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		
		<!-- 加载bootstrap & ace -->
		<script src="${APP.ROOT}/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<!-- ace scripts -->
		<script src="${APP.ROOT}/js/ace-elements.min.js"></script>
		<script src="${APP.ROOT}/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<link rel="stylesheet" href="${APP.ROOT}/style/css/ace.onpage-help.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
        <!-- ugj scripts -->
        <script type="text/javascript">
        	function currentBreadcrumb( menuArr ){
        		
        		if( !menuArr )
        			return;
        		
        		var len = menuArr.length;
        		
        		if( len <= 0 )
        			return;
        		
        		var breadcrumb = $('.breadcrumb');
        		
        		for( var i = 0 ; i < len ; i++ ){
        			var menu = menuArr[i];
        			var breadcrumbMenu = false;
        			
        			if( i == (len-1) ){
        				breadcrumbMenu = $('<li class="active">' + menu.name + '</li>');
        			} else{
        				breadcrumbMenu = $('<li><a href="' + menu.href + '">' + menu.name + '</a></li>');
        			}
        			
        			if( breadcrumbMenu )
        				breadcrumb.append(breadcrumbMenu);
        		}
        		
        	}
        	
        	$(document).ready(function() {
        		
        		var welcomeContent = "<small>欢迎</small> ${Session.STORE_INFO.phonenumber}";
        		
        		$('.user-info').html(welcomeContent);
        	});
        </script> 
	</body>
</html>
