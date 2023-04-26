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
- [x] Level Manager
	- [x] Add a level manager
	- [x] Allow for multiple level configurations
- [x] Game Manager
	- [x] Handle Placement of Paddle and Ball
	- [x] Handle lives
- [x] Ball
	- [x] Add damage variable to ball
- [x] Walls
	- [x] Use one wall scene for all walls
	- [x] Instantiate walls from level manager
- [x] Bricks
	- [x] Allow for dynamic brick size and padding
	- [x] Add dynamic brick lay.
	- [x] Add code for dynamic brick placement using a matrix `[[x, null, x, x, x, x, null, x]]` would give you a row of bricks where `null` === a gap and x is a placed brick. Then use dynamic brick lay code based on size of array rather than hardcoded value. Also consider making `x` an object that allows specifying `color`, `brick_type`, `brick_health`
	- [x] Make bricks look cooler
	- [x] Add health to bricks
	- [x] Subtract health from bricks when colliding w/ ball based on ball `damage` property
	- [x] Instantiate bricks from level manager
- [x] Lives
	- [x] Add lives to game manager
	- [x] Track lives in GUI
- [x] Add a GUI
- [x] Game over
	- [x] Add game over variable to game manager
	- [x] The game is over when lives are <= 0
	- [x] Add Game Over to the GUI
- [ ] Bugs
	- [ ] Ball acceleration
	- [ ] Some weird collsion bugs between ball and paddle
	- [ ] Ball vector can be too close to perpendicular with paddle

