// function makeCounter(){
// 	var counter = 0;
// 	return function(){
// 		return counter++;
// 	};
// };

function addX(x){
	return function(y){
		return x + y;
	};
};

// function addXandY(x, y){
// 	return x + y;
// };

var add10 = addX(10);
console.log(add10(3));

// var advanceCounter = makeCounter();

for(var i = 0; i < 5; i++){
	console.log(add10(i));
}




// var gong_show = function(act){
// 	console.log(act + " was gonged!");
// }

// gong_show("Henry and the Hermits");
//Gian's grades 14	11	21