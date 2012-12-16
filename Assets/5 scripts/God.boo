import UnityEngine


class God(MonoBehaviour):


	public title as GUIText
	public subtitle as GUIText
	public cBlue as ParticleSystem
	public cPurple as ParticleSystem
	public cRed as ParticleSystem

	private blink as single = 0
	private checkAnyKey as bool = true


	def Start():
		title.text = "the Throat of the World"
		subtitle.text = "press any key"
		cBlue.transform.position.z = -Random.Range(1, 4)
		cPurple.transform.position.z = -Random.Range(1, 4)
		cRed.transform.position.z = -Random.Range(1, 4)
		

	def Update():
		if checkAnyKey:
			blink += Time.deltaTime
			if blink >= 0.80F:
				subtitle.enabled = not subtitle.enabled
				blink = 0


	def OnGUI():
		if checkAnyKey and Event.current.type == EventType.KeyDown:
			title.text = ""
			subtitle.text = ""
			cBlue.particleSystem.Stop(true)
			cPurple.particleSystem.Stop(true)
			cRed.particleSystem.Stop(true)
			checkAnyKey = false