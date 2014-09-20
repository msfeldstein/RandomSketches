var functions = []
window.onLoad = function(f) {
  functions.push(f)
}
window.addEventListener('load', function() {
  for(var i = 0; i < functions.length; ++i) {
    functions[i]()
  }
});
