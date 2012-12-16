import UnityEngine


class GrandMa (MonoBehaviour):


	theHusband as GameObject
	

	def Start():
		theHusband = GameObject.FindWithTag("GrandPa")


	def Update():
		transform.LookAt(theHusband.transform)