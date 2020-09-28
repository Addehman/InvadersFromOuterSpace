float deltaTime, time, framerateMod = 30;

void setup() 
{
	size(640, 480);
	rectMode(CENTER);

	frameRate(framerateMod);

}

void draw() 
{
	background(0, 20, 39);

	game();
}

void game()
{
	//Calculate delta time
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;
}
