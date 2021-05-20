var curindex = 0;
var maxlen = document.getElementById("lunbo").getElementsByTagName("li").length-1
var timer = null

var width = 1280

timer = setInterval(change_auto,3000)

function change_auto(){
  if(curindex<maxlen){
    curindex++
    get_next()
  }else{
    curindex = 0
    get_reset()
  }
}

function get_next(){
  var totalBanner = document.getElementById("lunbo")
  totalBanner.style.marginLeft = "-" + width*curindex + "px"
  totalBanner.style.transition = 1 + "s"
  
}

function get_reset(){
  var totalBanner = document.getElementById("lunbo")
  totalBanner.style.marginLeft = "0px"
  totalBanner.style.transition = "0s"
}
       