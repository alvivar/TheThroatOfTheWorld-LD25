import UnityEngine


class Gaea (MonoBehaviour):


	public grassPrefab as GameObject

	player as GameObject

	jump as single = 0.2F
	squares as single = 75

	radius as single = 0
	last as Vector3 = Vector3.zero


	def Start():
		player = GameObject.FindWithTag("Player")
		paintGrass(Vector3.zero, squares)
		radius = jump * (squares + 1)


	# origin : center of the generation
	# row    : how many squares around, need to be multiple of 2. -to-do-> validate.
	# need to be called at least once to work properly with paintUp, etc.

	def paintGrass(origin as Vector3, row as single):

		last = origin
		pos as Vector3 = origin

		pos.x = pos.x - (row * jump * 0.5)
		pos.y = pos.y + (row * jump * 0.8)
		pos.z = 10

		for i in range(0, row + 1):
			pos.x = origin.x - (row * jump * 0.5)
			for j in range(0, row + 1):
				Instantiate(grassPrefab, pos, Quaternion.identity)
				pos.x = pos.x + jump
			pos.y = pos.y - jump


	def paintTrees():
		pass