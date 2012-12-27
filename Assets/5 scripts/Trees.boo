import UnityEngine


class Trees (MonoBehaviour):


	mother as GameObject = null

	public originZ as single


	def Start():
		mother = GameObject.FindWithTag("Gaea")
		originZ += Vector3.Distance(Vector3.zero, transform.position) / 1000
		transform.position.z = originZ


	def OnTriggerEnter(other as Collider):
		other.gameObject.GetComponent[of TreeHelper]().up(originZ)


	def OnTriggerExit(other as Collider):
		other.gameObject.GetComponent[of TreeHelper]().down(originZ)