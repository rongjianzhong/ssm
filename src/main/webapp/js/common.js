function formatterDate(date) {
	var oDate = new Date(date), oYear = oDate.getFullYear(), oMonth = oDate
			.getMonth() + 1, oDay = oDate.getDate(), oHour = oDate.getHours(), oMin = oDate
			.getMinutes(), oSen = oDate.getSeconds(), oTime = oYear + '-'
			+ getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':'
			+ getzf(oMin) + ':' + getzf(oSen);// 最后拼接时间
	return oTime;
};
/*没有时分秒*/
function formatterDatea(date) {
	var oDate = new Date(date), oYear = oDate.getFullYear(), oMonth = oDate
			.getMonth() + 1, oDay = oDate.getDate(),oMin = oDate
			.getMinutes(), oSen = oDate.getSeconds(), oTime = oYear + '-'
			+ getzf(oMonth) + '-' + getzf(oDay)// 最后拼接时间
	return oTime;
};
// 补0操作
function getzf(num) {
	if (parseInt(num) < 10) {
		num = '0' + num;
	}
	return num;
}