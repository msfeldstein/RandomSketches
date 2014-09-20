hasVR = !!navigator.getVRDevices

onLoad ->
  if hasVR
    fullScreenButton = document.createElement('div')
    fullScreenButton.className = 'full-screen-button'
    fullScreenButton.innerText = 'Full Screen'
    document.body.appendChild(fullScreenButton)
    controls = new THREE.OculusRiftControls(camera)

    vrEffect = new THREE.VREffect(renderer, (e) -> fullScreenButton.innerHTML = e)
    vrControls = new THREE.VRControls(camera)
    time = Date.now()
    onUpdate ->
      vrState = vrControls.getVRState()
      s = 500
      cPos = controls.getObject().position
      vrPos = vrState.hmd.position
      pos = vrPos
      pos[0] *= s
      pos[1] *= s
      pos[2] *= s
      camera.position.fromArray(pos)
      controls.update(Date.now() - time, vrState)
      vrControls.update()
      vrEffect.render(scene, camera)
      time = Date.now()

    fullScreenButton.addEventListener 'click', () -> vrEffect.setFullScreen(true)

    window.addEventListener 'resize', () ->
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);

    scene.add(controls.getObject())