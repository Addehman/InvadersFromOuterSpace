class Explosion 
{
	float expX, expY;
	int counter = 0;
	PImage Image1, Image2, Image3,Image4,Image5,Image6,Image7,Image8,Image9;


	Explosion(float expX, float expY) 
	{
		this.expX = expX;
		this.expY = expY; 

		Image1 = loadImage("Images/Image1.png");
		Image1.resize(70,70);
		Image2 = loadImage("Images/Image2.png");
		Image2.resize(70,70);
		Image3 = loadImage("Images/Image3.png");
		Image3.resize(70,70);
		Image4 = loadImage("Images/Image4.png");
		Image4.resize(70,70);
		Image5 = loadImage("Images/Image5.png");
		Image5.resize(70,70);
		Image6 = loadImage("Images/Image6.png");
		Image6.resize(70,70); 
		Image7 = loadImage("Images/Image7.png");
		Image7.resize(70,70); 
		Image8 = loadImage("Images/Image8.png");
		Image8.resize(70,70); 
		Image9 = loadImage("Images/Image9.png");
		Image9.resize(70,70); 
	}

	void renderExp(float x, float y)
	{
// setting the explosion's position, which are used to define it to be the same as the enemy's position.
		this.expX = x;
		this.expY = y;

		if(counter >=0 && counter <=5) {
			image(Image1,expX,expY);
		}
		if(counter > 5 && counter <=10) {
			image(Image2,expX,expY);
		}
		if(counter > 10 && counter <=15) {
			image(Image3,expX,expY);
		}
		if(counter > 15 && counter <=20) {
			image(Image4,expX,expY);
		}
		if(counter > 20 && counter <=25) {
			image(Image5,expX,expY);
		}
		if(counter > 25 && counter <=30) {
			image(Image6,expX,expY);
		}
		if(counter > 30 && counter <=35) {
			image(Image7,expX,expY);
		}
		if(counter > 35 && counter <=40) {
			image(Image8,expX,expY);
		}
		if(counter > 40 && counter <=45) {
			image(Image9,expX,expY);
		}

		counter++;
	}
}