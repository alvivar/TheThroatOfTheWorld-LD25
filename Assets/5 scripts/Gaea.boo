import UnityEngine


class Gaea (MonoBehaviour):


	public grassPrefab as GameObject
	public treesPrefabs as (GameObject)
	public groundPrefabs as (GameObject)

	public rain as ParticleSystem

	player as GameObject

	jump as single = 0.2F
	squares as single = 75
	maxTrees as single = 2000

	last as Vector3 = Vector3.zero
	hideLock as bool = false


	def Start():
		player = GameObject.FindWithTag("Player")
		paintGrass(Vector3.zero, squares)
		paintTrees()


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

		ranX as single = 0
		ranY as single = 0

		for i in range(0, maxTrees):

			# harcoded, precalculated values :( #todo
			ranX = Random.Range(0, 7.5F)
			ranY = Random.Range(0, 12F)

			if Random.Range(0, 2):
				ranX *= -1

			if ranY <= 3 and Random.Range(0, 2):
				ranY *= -1

			Instantiate(treesPrefabs[Random.Range(0, len(treesPrefabs))], Vector3(ranX, ranY, 0), Quaternion.identity)

		for i in range(0, maxTrees / 5):

			# harcoded, precalculated values :( #todo
			ranX = Random.Range(0, 7.5F)
			ranY = Random.Range(0, 12F)

			if Random.Range(0, 2):
				ranX *= -1

			if ranY <= 3 and Random.Range(0, 2):
				ranY *= -1

			Instantiate(groundPrefabs[Random.Range(0, len(groundPrefabs))], Vector3(ranX, ranY, 5), Quaternion.identity)