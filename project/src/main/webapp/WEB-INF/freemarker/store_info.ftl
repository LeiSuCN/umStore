<#assign p=JspTaglibs["/WEB-INF/u.tld"]>
<style type="text/css">
#map_container{ height: 25em; background-color:gray;}
.profile-info-value a{ cursor: pointer }
.amap-copyright{ display: none; }
</style>
<div>
	<div id="user-profile-1" class="user-profile row">
		<div class="col-xs-12 col-sm-4 center">
			<div>
			
				<div class="space-12"></div>
			
				<!-- #section:pages/profile.picture -->
				<div id="map_container"></div>

				<!-- /section:pages/profile.picture -->
				<div class="space-4"></div>

				<div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
					<div class="inline position-relative">
						<a href="javascript:void(0)" class="user-title-label">
							<i class="ace-icon fa fa-map-marker light-green"></i>
							&nbsp;
							<span class="white">${store.lon?string("0.######") }, ${store.lat?string("0.######") }</span>
						</a>

						<ul class="align-left dropdown-menu dropdown-caret dropdown-lighter">
							<li class="dropdown-header"> Change Status </li>

							<li>
								<a href="#">
									<i class="ace-icon fa fa-circle green"></i>

									<span class="green">Available</span>
								</a>
							</li>

							<li>
								<a href="#">
									<i class="ace-icon fa fa-circle red"></i>

									<span class="red">Busy</span>
								</a>
							</li>

							<li>
								<a href="#">
									<i class="ace-icon fa fa-circle grey"></i>

									<span class="grey">Invisible</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="space-6"></div>

		</div>

		<div class="col-xs-12 col-sm-8">
		
			<div class="space-12"></div>

			<!-- #section:pages/profile.info -->
			<div class="profile-user-info profile-user-info-striped">
				<div class="profile-info-row">
					<div class="profile-info-name">门店编号</div>
					<div class="profile-info-value">
						<span class="editable">${store.id?c }</span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">门店名称</div>
					<div class="profile-info-value">
						<span class="editable">${store.name }</span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">负责人姓名</div>
					<div class="profile-info-value">
						<span class="editable">${store.legalPerson}</span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">负责人电话</div>
					<div class="profile-info-value">
						<span class="editable">${store.phonenumber}</span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">支付宝</div>
					<div class="profile-info-value">
						<span class="editable">${store.alipay }</span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">区域</div>
					<div class="profile-info-value">
						<span class="editable"><@p.getAreaName area=store.area></@p.getAreaName></span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">详细地址</div>
					<div class="profile-info-value">
						<span class="editable">${store.address }</span>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">身份证正面</div>
					<div class="profile-info-value">
						<a href="${APP.ROOT}/store/detail/scanning/idcard_a" target="_blank"><i class="ace-icon glyphicon glyphicon-zoom-in"></i> 查看</a>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">身份证反面</div>
					<div class="profile-info-value">
						<a href="${APP.ROOT}/store/detail/scanning/idcard_b" target="_blank"><i class="ace-icon glyphicon glyphicon-zoom-in"></i> 查看</a>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">店铺外景</div>
					<div class="profile-info-value">
						<a href="${APP.ROOT}/store/detail/scanning/store_a" target="_blank"><i class="ace-icon glyphicon glyphicon-zoom-in"></i> 查看</a>
					</div>
				</div>

				<div class="profile-info-row">
					<div class="profile-info-name">店铺内景</div>
					<div class="profile-info-value">
						<a href="${APP.ROOT}/store/detail/scanning/store_b" target="_blank"><i class="ace-icon glyphicon glyphicon-zoom-in"></i> 查看</a>
					</div>
				</div>
			</div>

			<!-- /section:pages/profile.info -->
			<div class="space-20"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=fb41f5a7451770da0be1e646d4cf9087"></script>
<script type="text/javascript" src="${APP.ROOT}/js/locationPicker.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	
		currentBreadcrumb([ { name:"门店信息", href:"#"} ]);

		var point = {lat:${store.lon?c }, lon: ${store.lat?c }};

		var locationPicker = new LocationPicker('map_container',{
			enableClick: false,
			enableSearch: false,
			mouseCursor:'',
			center: point,
			zoom: 20
		});
		
		locationPicker.pick(new AMap.LngLat(point.lat, point.lon));
	});
</script>