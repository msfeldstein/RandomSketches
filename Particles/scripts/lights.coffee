onLoad ->
  light = new THREE.PointLight(0xFFFFFF)
  light.position.x  = 10
  light.position.y = 50
  light.position.z = 130
  scene.add(light)

  ambient = new THREE.AmbientLight(0x111111)
  scene.add(ambient)