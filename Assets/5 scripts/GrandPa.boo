import UnityEngine


class GrandPa(B2dtk):


	public cameraFollow as bool = false

	myLove as GameObject


	def Start():
		myLove = GameObject.FindWithTag("GrandMa")
		b2Anime = GetComponent[of tk2dAnimatedSprite]()
		b2Control = GetComponent[of CharacterController]()


	def Update():

		if cameraFollow:
			Cam()

		Controls()

		b2Move = transform.TransformDirection(b2Move)
		b2Move *= b2SpeedGround
		b2Control.Move(b2Move * Time.deltaTime)


	def Controls():
		
		# left

		if Input.GetKey(KeyCode.A):
			b2LookLeft()
			b2Walk()
			b2Move += Vector3.left

		if Input.GetKeyUp(KeyCode.A):
			b2Idle()

		# right

		if Input.GetKey(KeyCode.D):
			b2LookRight()
			b2Walk()
			b2Move += Vector3.right

		if Input.GetKeyUp(KeyCode.D):
			b2Idle()

		# up

		if Input.GetKey(KeyCode.W):
			b2Walk()
			b2Move += Vector3.up

		if Input.GetKeyUp(KeyCode.W):
			b2Idle()

		# down

		if Input.GetKey(KeyCode.S):
			b2Walk()
			b2Move += Vector3.down

		if Input.GetKeyUp(KeyCode.S):
			b2Idle()


		# call protection.

		if Input.GetKeyDown(KeyCode.Space):
			myLove.GetComponent[of GrandMa]().CallProtection()


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