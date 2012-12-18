import UnityEngine


class GrandPa(MonoBehaviour):

	cameraFollow as bool = false

	controller as CharacterController

	move as Vector3 = Vector3.zero
	speedGround as single = 0.25F


	def Start():
		controller = GetComponent[of CharacterController]()


	def Update():

		if cameraFollow:
			Cam()

		Controls()

		move = transform.TransformDirection(move)
		move *= speedGround
		controller.Move(move * Time.deltaTime)
		
		
	def Idle():
		move = Vector3.zero


	def Controls():
		
		# left

		if Input.GetKey(KeyCode.A):
			move += Vector3.left
			lastDir = 3

		if Input.GetKeyUp(KeyCode.A):
			Idle()

		# right

		if Input.GetKey(KeyCode.D):
			move += Vector3.right
			lastDir = 1

		if Input.GetKeyUp(KeyCode.D):
			Idle()

		# up

		if Input.GetKey(KeyCode.W):
			move += Vector3.up
			lastDir = 0

		if Input.GetKeyUp(KeyCode.W):
			Idle()

		# down

		if Input.GetKey(KeyCode.S):
			move += Vector3.down
			lastDir = 2

		if Input.GetKeyUp(KeyCode.S):
			Idle()


	public def setCameraFollow(val as bool):
		cameraFollow = val


	def Cam():
		
		camX = Camera.main.transform.position.x
		camY = Camera.main.transform.position.y
		posX = transform.position.x
		posY = transform.position.y

		if Mathf.Abs(camX - posX) > 0.35F:
			Camera.main.transform.position.x = Mathf.Lerp(camX, posX, 0.7F * Time.deltaTime)

		if Mathf.Abs(camY - posY) > 0.35F:
			Camera.main.transform.position.y = Mathf.Lerp(camY, posY, 0.7F * Time.deltaTime)