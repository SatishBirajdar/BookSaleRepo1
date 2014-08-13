aImages = ["images/slideshow1.jpg", "images/slideshow2.jpg", "images/slideshow3.jpg", "images/slideshow4.jpg", "images/slideshow5.jpg"];

var iCounter = 0;
var iImgLength = aImages.length - 1;
var delay = 3000;
var lock = true;
var run = setInterval("chgImg(1)",delay);

function chgImg(direction)
{
	if(document.images)
	{
		iCounter = iCounter + direction;
		if(iCounter > iImgLength){iCounter = 0;}
		if(iCounter < 0){iCounter = iImgLength;}
		document.slideshow.src = aImages[iCounter];
	}
}

function auto()
{
	if(lock == true)
	{
		lock = false;
		window.clearInterval(run);
	}
	
	else if (lock == false)
	{
		lock = true;
		run = setInterval("chgImg(1)",delay);
	}
}