import UnityEngine


class GrandPa(MonoBehaviour):


	controller as CharacterController

	move as Vector3 = Vector3.zero
	speedGround as single = 0.25F


	def Start():
		controller = GetComponent[of CharacterController]()


	def Update():
		Cam()
		Controls()
		move = transform.TransformDirection(move)
		move *= speedGround
		controller.Move(move * Time.deltaTime)
		
		
	def Idle():
		move = Vector3.zero
		print(Vector3.Distance(Vector3.zero, transform.position))
		print(transform.position)


	def Controls():
		
		# left

		if Input.GetKey(KeyCode.A):
			move += Vector3.left

		if Input.GetKeyUp(KeyCode.A):
			Idle()

		# right

		if Input.GetKey(KeyCode.D):
			move += Vector3.right

		if Input.GetKeyUp(KeyCode.D):
			Idle()

		# up

		if Input.GetKey(KeyCode.W):
			move += Vector3.up

		if Input.GetKeyUp(KeyCode.W):
			Idle()

		# down

		if Input.GetKey(KeyCode.S):
			move += Vector3.down

		if Input.GetKeyUp(KeyCode.S):
			Idle()


	def Cam():
		
		camX = Camera.main.transform.position.x
		camY = Camera.main.transform.position.y
		posX = transform.position.x
		posY = transform.position.y

		if Mathf.Abs(camX - posX) > 0.35F:
			Camera.main.transform.position.x = Mathf.Lerp(camX, posX, 0.7F * Time.deltaTime)

		if Mathf.Abs(camY - posY) > 0.35F:
			Camera.main.transform.position.y = Mathf.Lerp(camY, posY, 0.7F * Time.deltaTime)