import UnityEngine


class B2dtk(MonoBehaviour):


	b2Anime as tk2dAnimatedSprite
	b2Control as CharacterController

	b2Move as Vector3 = Vector3.zero
	b2SpeedGround as single = 0.25F

	b2IsAttacking as bool = false
	b2IsLookingRight as bool = false
	b2IsWalking as bool = false


	def b2Idle():
		b2Anime.Play("idle")
		b2IsAttacking = false
		b2IsWalking = false
		b2Move = Vector3.zero


	def b2Walk():
		if not b2IsWalking:
			b2Anime.Play("walk")
			b2IsWalking = true


	def b2LookRight():
		if not b2IsLookingRight:
			b2Anime.FlipX()
			b2IsLookingRight = true


	def b2LookLeft():
		if b2IsLookingRight:
			b2Anime.FlipX()
			b2IsLookingRight = false


	def b2LookToHim(him as GameObject):
		if transform.position.x < him.transform.position.x:
			b2LookRight()
		else:
			b2LookLeft()

