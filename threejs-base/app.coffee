onLoad ->
  material = new THREE.MeshLambertMaterial({color: 0xbbbbbb})
  mesh = new THREE.Mesh(new THREE.BoxGeometry(100,100,100,4,4,4), material)
  mesh.rotation.x = Math.PI / 6
  mesh.rotation.y = Math.PI / 5
  scene.add(mesh)

  onUpdate ->
    mesh.rotation.y += 0.01 