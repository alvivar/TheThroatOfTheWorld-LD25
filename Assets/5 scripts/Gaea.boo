import UnityEngine


class Gaea (MonoBehaviour):


	public cam as Camera
	public grassPrefab as GameObject


	def Start():
		cam = Camera.mainCamera
		paintGrass(Vector3.zero, 20)
		# bounds = grassPrefab.GetComponent[of tk2dSprite]()


	def paintGrass(origin as Vector3, row as single):

		pos as Vector3 = origin
		jump as single = 0.2F

		pos.x = pos.x - (row * jump * 0.5)
		pos.y = pos.y + (row * jump * 0.5)

		for i in range(0, row):
			pos.x = origin.x - (row * jump * 0.5)
			pos.y = pos.y - jump
			for j in range(0, row):
				pos.x = pos.x + jump
				Instantiate(grassPrefab, pos, Quaternion.identity)


	def Update():
		pass