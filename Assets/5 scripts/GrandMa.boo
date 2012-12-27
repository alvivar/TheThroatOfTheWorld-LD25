import UnityEngine


class GrandMa(B2dtk):


	public luzGliph as GameObject
	public luzParticles as ParticleSystem

	player as GameObject


	def Start():
		player = GameObject.FindWithTag("Player")
		b2Anime = GetComponent[of tk2dAnimatedSprite]()
		b2Control = GetComponent[of CharacterController]()


	def Update():

		if b2IsAttacking:
			return

		pos as Vector3 = transform.position
		pos.z = 0

		playerPos as Vector3 = player.transform.position
		playerPos.z = 0

		if 0.15F < Vector3.Distance(pos, playerPos):
			b2LookToHim(player)
			b2Walk()
			b2Move = (playerPos - pos).normalized
			b2Move = transform.TransformDirection(b2Move)
			b2Move *= b2SpeedGround * 1.2F
			b2Move.z = GetComponent[of TreeHelper]().level
			b2Control.Move(b2Move * Time.deltaTime)
		else:
			b2Idle()


	public def CallProtection():

		if b2IsAttacking:
			return

		b2IsAttacking = true
		b2Anime.Play("attack")

		luz as Vector3 = transform.position
		if b2IsLookingRight:
			luz.x -= -0.05F
		else:
			luz.x += -0.05F
		luz.y += 0.035F
		luz.z = -1

		Instantiate(luzGliph, luz, Quaternion.identity)
		Instantiate(luzParticles, luz, Quaternion.identity)

		Invoke("b2Idle", 2)