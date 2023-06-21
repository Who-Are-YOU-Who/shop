// "a001".validationID()
String.prototype.validationID = function() {
	return /^[a-zA-Z0-9]{4,15}$/.test(this);
}
String.prototype.validationPWD = function() {
	return /^[a-z0-9]{4,15}$/.test(this);
}
String.prototype.validationNM = function() {
	return /^[가-힣]{2,3}$/.test(this);
}
String.prototype.validationREGNO = function() {
	// this == 111111-1111118
	// 1 1 1 1 1 1 1 1 1 1 1 1	 8
	// * * * * * * * * * * * *
	// 2+3+4+5+6+7+8+9+2+3+4+5 = 값1
	// (11-(값1%11))%10		   = 값2
	// if(값2 == 매직넘버) 유효 return true
	// else 무효 return false
	
	var moto = this.replace('-','');
	var magicNum = this.substr(13,1);
	var sum = 0;
	var checkSum = '234567892345';
	for(var i = 0; i< 12; i++){
		sum += moto.charAt(i) * checkSum.charAt(i);
	}
	var finalVal = (11-(sum%11))%10;
	
	if(finalVal == parseInt(magicNum)){
		return true;
	}else{
		return false;
	}
}
String.prototype.validationBIR = function() {
	// Member Table Mem_Bir DATE
	// 1995-01-27
	// 1995/01/27
	// 19950707
	return /^(19|20)\d{2}[-/](0[1-9]|1[0-2])[-/](0[1-9]|[12][0-9]|3[01])$/.test(this);
}
String.prototype.validationHOMETEL = function() {
	// 02-123-1234
	// 042-1234-1324
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
}
String.prototype.validationCOMTEL = function() {
	return /^0[1-9]{1,2}-\d{3,4}-\d{4}$/.test(this);
}
String.prototype.validationHP = function() {
	return /^01[01679]-\d{3,4}-\d{4}$/.test(this);
}
String.prototype.validationMAIL = function() {
	// test@test.com
	// test@test.co.kr
	return /^[a-zA-Z0-9]+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
}
String.prototype.validationJOB = function() {
	return /^[가-힣]+$/.test(this);
}
String.prototype.validationLIKE = function() {
	return /^[가-힣a-zA-Z]+$/.test(this);
}
String.prototype.validationTITLE = function() {
	return /^[가-힣a-zA-Z0-9][가-힣a-zA-Z0-9 ]+$/.test(this);
}
String.prototype.validationNICKNAME = function() {
	return /^[가-힣a-zA-Z0-9]+$/.test(this);
}





