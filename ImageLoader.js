function createImages()
{
 var files = ["/images/images/angle_regulation.png","/images/images/angle_regulation_CH.png","/images/images/bolser.png"]
 for (var i=0; i<files.length; i++){
 createImage(files[i]);
 }
}

function createImage(name) {
 innerModel.append({"url": name});
}
