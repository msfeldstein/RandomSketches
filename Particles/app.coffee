onLoad ->
  particleCount = 1800
  particles = new THREE.Geometry
  material = new THREE.PointCloudMaterial
    color: 0xFFFFFF
    size: 2
    blending: THREE.AdditiveBlending
    map: THREE.ImageUtils.loadTexture('images/particle.png')
    transparent: true
  for i in [0..particleCount]
    particle = new THREE.Vector3(
      Math.random() * 500 - 250,
      Math.random() * 500 - 250,
      Math.random() * 500 - 250)
    particles.vertices.push particle
  particleSystem = new THREE.PointCloud particles, material
  particleSystem.sortParticles = true;
  scene.add(particleSystem)

  onUpdate ->
    # for particle in particles.vertices
    #   particle.z -= .1

    #   if particle.z <= -250
    #     particle.z += 500

  dickMat = new THREE.MeshBasicMaterial
    map: THREE.ImageUtils.loadTexture('images/dickbutt.png')
    blending: THREE.AdditiveBlending
    transparent: true
  geom = new THREE.PlaneGeometry(200, 200)
  plane = new THREE.Mesh(geom, dickMat)
  plane.material.side = THREE.DoubleSide
  plane.position.z = -500
  console.log plane
  scene.add(plane)

  onUpdate ->