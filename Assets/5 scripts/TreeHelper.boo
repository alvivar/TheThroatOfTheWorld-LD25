import UnityEngine


class TreeHelper(MonoBehaviour):


	public level as single = 0


	def FixedUpdate():
		transform.position.z = level


	public def up(fromLevel as single):
		level = fromLevel - 0.5F


	public def down(fromLevel as single):
		level = fromLevel + 0.5F