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
var game_name = document.getElementById('game-name').value;
var game_slug = document.getElementById('game-slug').value;
swfobject.embedSWF(
    "/games/" + game_slug + ".swf",
    "alt-content", "800px", "600px", "10.0.0",
    "/flash/expressInstall.swf",
    flashvars, params, attributes);
