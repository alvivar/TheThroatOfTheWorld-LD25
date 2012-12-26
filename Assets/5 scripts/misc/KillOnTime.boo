import UnityEngine


class KillOnTime(MonoBehaviour):


	time as single = 2.9F


	def Start ():
		Invoke("Suicide", time)


	def Suicide():
		Destroy(self.gameObject)