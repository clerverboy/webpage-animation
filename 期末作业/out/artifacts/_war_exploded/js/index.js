window.onload = function(){
  var nav = document.getElementById("nav");
  navTop = nav.offsetTop;
}

window.onscroll = function(){
  var backTop = document.documentElement.scrollTop

  console.log(backTop);
  if(backTop >= navTop){
    nav.style.position = "fixed";
    nav.style.top = "0";
    nav.style.left = "0";
    nav.style.zIndex = "100";
  } else {
    nav.style.position = "";
  }
}



function playAndPause(){
  var music = document.getElementById("bgm");
  var navLiImg = document.getElementById("navLiImg");
  if(music.paused){
    music.play();
    navLiImg.classList.add("navMusic");
  }else{
    music.pause();
    navLiImg.classList.remove("navMusic");
  }
}