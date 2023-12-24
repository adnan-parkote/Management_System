window.onload = function() {
	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceurl = base_url + '/getChartDetails';
	
	$.ajax({
		type: 'POST',
		url: serviceurl,
		dataType: 'JSON',
		success: function(response) {
			// Data retrieved from https://netmarketshare.com
			Highcharts.chart('container', {
				chart : {
					plotBackgroundColor : null,
					plotBorderWidth : null,
					plotShadow : false,
					type : 'pie'
				},
				title : {
					text : 'Administrator shares in May, 2023',
					align : 'left'
				},
				tooltip : {
					pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
				accessibility : {
					point : {
						valueSuffix : '%'
					}
				},
				plotOptions : {
					pie : {
						allowPointSelect : true,
						cursor : 'pointer',
						dataLabels : {
							enabled : true,
							format : '<b>{point.name}</b>: {point.percentage:.1f} %'
						}
					}
				},
				series : [ {
					name : 'Shares',
					colorByPoint : true,
					data : response
				} ]
			});
		}
	});
}


