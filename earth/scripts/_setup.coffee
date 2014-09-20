hasVR = !!navigator.getVRDevices

camera = null
updateFunctions = []
window.onUpdate = (f) ->
  updateFunctions.push(f)
onLoad ->
  WIDTH = window.innerWidth
  HEIGHT = window.innerHeight
  VIEW_ANGLE = 45
  ASPECT = WIDTH / HEIGHT
  NEAR = 0.01
  FAR = 1000

  $container = $("#container")
  renderer = new THREE.WebGLRenderer(antialias: true)
  renderer.autoClear = true
  renderer.setClearColor 0x000000, 0
  camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR)
  scene = new THREE.Scene
  scene.add(camera)
  camera.position.z = 1.5
  renderer.setSize(WIDTH, HEIGHT)
  $container.append(renderer.domElement)

  render = (t) ->
    for f in updateFunctions
      f(t)
    requestAnimationFrame(render)
    if !hasVR
      renderer.render(scene, camera)
  render()
  window.scene = scene
  window.camera = camera
  window.renderer = renderer

  


