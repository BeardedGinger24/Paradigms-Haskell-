function makeCounter(){
	var counter = 0;
	return function(){
		return counter++;
	};
};

var advanceCounter = makeCounter();

for(var i = 0; i < 5; i++){
	console.log(advanceCounter());
}




// var gong_show = function(act){
// 	console.log(act + " was gonged!");
// }

// gong_show("Henry and the Hermits");
//Gian's grades 14	11	21