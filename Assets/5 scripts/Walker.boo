import UnityEngine


class Walker(B2dtk):


	player as GameObject

	isActive as bool = false


	def Start():

		player = GameObject.FindWithTag("Player")
		b2Anime = GetComponent[of tk2dAnimatedSprite]()
		b2Control = GetComponent[of CharacterController]()

		b2IsLookingRight = true


	def Update():

		if not isActive:
			return

		pos = transform.position
		playerPos = player.transform.position

		b2Move = (playerPos - pos).normalized
		b2LookToHim(player)
		b2Walk()

		b2Move = transform.TransformDirection(b2Move)
		b2Move *= b2SpeedGround * 1.2F
		b2Control.Move(b2Move * Time.deltaTime)


	def OnBecameVisible():
		isActive = true