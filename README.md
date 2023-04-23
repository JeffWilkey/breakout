# Breakout - Godot4

## Structure Notes
	- Project Hierarchy: Main > Managers > Individual Scenes (Ball, Paddle)
	- Main node instantiates PackedScenes rather than adding clutter to the scene view
	- LevelManager currently handles placement of walls and will eventually take over the job of placing bricks
	- Plan to add GameManager to handle placement of Paddle & Ball and probably some other stuff I haven't thought of yet
	- Other individual scenes are intended to be used by the Managers

	
## Todo
- [x] Improve ball/paddle physics
- [x] Organize filesystem
- [ ] Level Manager
	- [x] Add a level manager
	- [ ] Allow for multiple level configurations
- [ ] Game Manager
	- [ ] Handle Placement of Paddle and Ball
	- [ ] Handle points, manage power ups
- [x] Walls
	- [x] Use one wall scene for all walls
	- [x] Instantiate walls from level manager
- [ ] Bricks
	- [x] Allow for dynamic brick size and padding
	- [ ] Add dynamic brick lay. Add variable for amount of bricks then divide viewport width by amount and set brick width to equal that amount.
	- [ ] Add code for dynamic brick placement using a matrix `[[x, null, x, x, x, x, null, x]]` would give you a row of bricks where `null` === a gap and x is a placed brick. Then use dynamic brick lay code based on size of array rather than hardcoded value. Also consider making `x` an object that allows specifying `color`, `brick_type`, `brick_health`
	- [ ] Make bricks look cooler
		- [x] Regular Bricks
		- [ ] Glass Bricks
		- [ ] Indestructable Bricks
	- [ ]  Instantiate bricks from level manager
- [ ] Accumulate ball speed as time passes for both paddle and ball
- [ ] Add power-ups
	- [ ] 2x Speed w/ Wider paddle
	- [ ] Invinciball where ball passes through bricks and destroys them rather than colliding
	- [ ] Mega ball -- make the ball really big
	- [ ] Nuke -- w/ animation
	- [ ] Bonus: Fireball -- ignite the ball and every brick it touches will ignite as well, spreading fire to other bricks
	- [ ] Make bricks spawn power ups randomly or add power up bricks
- [ ] Points
	- [ ] Add points based on accumulated speed
	- [ ] Add point multiplier when bricks are destroyed quickly (using a timer probably)
	- [ ] Track score in UI
- [ ] Lives
	- [ ] Add lives to player
	- [ ] Track lives in UI
- [ ] Add a GUI
- [ ] 5 Levels
	- [ ] Level 1
	- [ ] Level 2
	- [ ] Level 3
	- [ ] Level 4
	- [ ] Level 5
