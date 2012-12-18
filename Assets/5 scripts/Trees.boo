import UnityEngine


class Trees (MonoBehaviour):


	mother as GameObject = null

	public originZ as single


	def Start():
		mother = GameObject.FindWithTag("Gaea")
		originZ += Vector3.Distance(Vector3.zero, transform.position) / 1000
		transform.position.z = originZ


	public def adjustZ(howMuch as single):
		transform.position.z = originZ + howMuch


	def OnTriggerStay(other as Collider):
		if mother:
			mother.GetComponent[of Gaea]().hideTrees(originZ)


	def OnTriggerExit(other as Collider):
		if mother:
			mother.GetComponent[of Gaea]().showTrees(originZ)


	def OnBecameVisible():
		if mother:
			mother.GetComponent[of Gaea]().trees.Add(self.gameObject)


	def OnBecameInvisible():
		if mother:
			mother.GetComponent[of Gaea]().trees.Remove(self.gameObject)