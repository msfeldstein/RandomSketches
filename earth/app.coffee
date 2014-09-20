sflat = 37.7833 #n
sflon = 122.4167 #w
chilat = 41.8819
chilon = 87.6278

onLoad ->
  earth = new THREE.Mesh(
    new THREE.SphereGeometry(0.5, 32, 32),
    new THREE.MeshPhongMaterial({
      map: THREE.ImageUtils.loadTexture('images/2_no_clouds_8k.jpg')
      bumpMap: THREE.ImageUtils.loadTexture('images/elev_bump_8k.jpg')
      bumpScale: 0.005
      specularMap: THREE.ImageUtils.loadTexture('images/water_8k.png')
      specular: new THREE.Color('grey')
    })
  )
  scene.add(earth)

  clouds = new THREE.Mesh(
    new THREE.SphereGeometry(0.503, 32, 32),
    new THREE.MeshPhongMaterial({
      map: THREE.ImageUtils.loadTexture('images/fair_clouds_4k.png'),
      transparent: true
    })
  )
  scene.add(clouds)

  controls = new THREE.TrackballControls(camera)

  pointCount = 20
  points = []
  geom = new THREE.SphereGeometry(.002, 32, 32)
  len = 1.2
  center = new THREE.Vector3(0,0,0)
  drawLine = (lat, lon, r = 0.5) ->
    theta = lat * Math.PI / 180
    phi = lon * Math.PI / 180
    x = r * Math.sin(theta) * Math.cos(phi)
    y = r * Math.sin(theta) * Math.sin(phi)
    z = r * Math.cos(theta)
    material = new THREE.MeshLambertMaterial(transparent: true)
    geometry = new THREE.CylinderGeometry(0, .01, .1, 50, 50, false)
    orientation = new THREE.Matrix4
    offsetRotation = new THREE.Matrix4
    offsetPosition = new THREE.Matrix4
    orientation.lookAt(center, new THREE.Vector3(x, y, z), new THREE.Vector3(0,1,0))
    offsetRotation.makeRotationX(Math.PI * .5)
    orientation.multiply(offsetRotation)
    geometry.applyMatrix(orientation)
    line = new THREE.Mesh(geometry, material)
    
    line.position.set(x, y, z)

    scene.add(line)
    # line.tween = new TWEEN.Tween({scale:0, opacity: 1}).to({scale:1.2, opacity: 0}, 2000).easing(TWEEN.Easing.Cubic.InOut).onUpdate () ->
    #   line.material.opacity = this.opacity
    # line.tween.start()
    # line.tween.onComplete () ->
    #   scene.remove(line)

  drawLine(sflat, sflon)
  drawLine(chilat, chilon)
  onUpdate (t)->
    controls.update()
    TWEEN.update(t)
    # earth.rotation.y += .0005
    # clouds.rotation.y += .0005


