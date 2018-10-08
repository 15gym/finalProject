/**
 * 
 */

$(function() {
	$("ul.menu > li > .sub").hide();
	$(".store_title").click(function() {
		$(this).find(".sub").toggle(100);
	});
});

function panTo(x, y) {
    var moveLatLon = new daum.maps.LatLng(x, y);
    map.panTo(moveLatLon);            
}      

$(".admin").click(function() {
	window.open('addCategory.jsp','카테고리추가','width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
});
