import UnityEngine


class Green(MonoBehaviour):


	def OnBecameInvisible():
		self.gameObject.SetActive(false)


	def OnBecameVisible():
		self.gameObject.SetActive(true)