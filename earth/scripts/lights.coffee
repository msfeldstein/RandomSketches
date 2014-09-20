onLoad ->
  light = new THREE.DirectionalLight(0xFFFFFF, 1)
  light.position.set(50, 30, 5)
  scene.add(light)

  ambient = new THREE.AmbientLight(0x333333)
  scene.add(ambient)