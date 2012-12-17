import UnityEngine


class Trees (MonoBehaviour): 


	def OnTriggerStay(other as Collider):
		print("enter")
		transform.position.z = 1


	def OnTriggerExit(other as Collider):
		print("leave")
		transform.position.z = -1