var flashvars = {
};
var params = {
  menu: "false",
  scale: "noScale",
  allowFullscreen: "true",
  allowScriptAccess: "always",
  bgcolor: "",
  wmode: "direct" // can cause issues with FP settings & webcam
};
var attributes = {
  id:"Monastery"
};
var game_name   = document.getElementById('game-name').value;
var game_slug   = document.getElementById('game-slug').value;
var game_width  = document.getElementById('game-width').value;
var game_height = document.getElementById('game-height').value;
swfobject.embedSWF(
    "/games/" + game_slug + ".swf",
    "alt-content", game_width, game_height, "10.0.0",
    "/flash/expressInstall.swf",
    flashvars, params, attributes);
