/*
* Flickr-like menu ported from jQuery to Prototype.
* The original is at http://www.candesprojects.com/downloads/flickr-horizontal-menu/
*
* @requires prototype 1.6
*
*/
document.observe("dom:loaded", function() {

$$("#nicemenu img.arrow").invoke("observe", "click", function(e){
headMenu = e.findElement('span.head_menu');
  //div.sub_menu
submenu = e.findElement('li').down(3);

if(submenu.getStyle('display')=='block'){
headMenu.removeClassName("active");
submenu.hide();
this.writeAttribute('src','arrow_hover.png');
} else {
headMenu.addClassName("active");
submenu.setStyle({'display': 'block'});
this.writeAttribute('src','arrow_select.png');
}

$$("div.sub_menu:visible").each(function(e){
if(e!=submenu){
  e.setStyle({'display': 'none'});
}
});

$$("#nicemenu img.arrow").each(function(e) {
if(e != this){
  e.writeAttribute('src','arrow.png');
}
});


$$("#nicemenu span.head_menu").each(function(e) {
if(e != headMenu){
  e.removeClassName('active');
}
});

});

$$("#nicemenu img.arrow").invoke("observe", "mouseover", function(e){
this.writeAttribute('src','arrow_hover.png');
});

$$("#nicemenu img.arrow").invoke("observe", "mouseout", function(e){
submenu = e.findElement('li').down(3);
if(submenu.getStyle('display')!='block'){
 this.writeAttribute('src','arrow.png');
} else {
 this.writeAttribute('src','arrow_select.png');
}
});

$$("#nicemenu span.head_menu").invoke("observe", "mouseover", function(){
this.addClassName('over');
});

$$("#nicemenu span.head_menu").invoke("observe", "mouseout", function(){
this.removeClassName('over');
});

document.observe("click", function(e) {
var elt = e.findElement('#nicemenu');
if (elt == undefined){
 $$("#nicemenu span.head_menu").invoke('removeClassName','active');
 $$("#nicemenu div.sub_menu").invoke('hide');
 $$("#nicemenu img.arrow").invoke('writeAttribute','src','arrow.png');
}});

});