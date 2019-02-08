float x, y, z, rotationX, rotationY, rotationZ;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;
void setup(){
	size(800,800, P3D);
	x = width/2;
	y = width/2;
	z = 0;
	rotationX = PI/3;
	rotationY = 0;
	rotationZ = PI/4;
}

void draw(){
	background(0);
	pushMatrix();
	translate(x,y,z);
	if(aPressed == true){
		rotationX+=PI/32;
	}
	if(sPressed == true){
		rotationY+=PI/32;
	}
	if(dPressed == true){
		rotationZ+=PI/32;
	}
	rotateX(rotationX);
	rotateY(rotationY);
	rotateZ(rotationZ);
	stroke(255);
	noFill();
	originalFractal(-100,-100,0,200);
	line(-100,0,0,100,0,0);
	line(0,-100,0,0,100,0);
	popMatrix();
}

void originalFractal(int x, int y, int z, int length){
	if(length<=100){
		pyramid(x, y, z, length);
	}else{
		originalFractal(x,y,z,length/2);
		originalFractal(x+length/2,y,z,length/2);
		originalFractal(x,y+length/2,z,length/2);
		originalFractal(x+length/2,y+length/2,z,length/2);
		originalFractal(x+length/4,y+length/4,length,length/2);
	}
}
void pyramid(int x,int y,int z, int length){
	beginShape();
	vertex( x, y, z);
	vertex( x+length, y, z);
	vertex( x+length/2, y+length/2, length);
	vertex( x+length, y, z);
	vertex( x+length, y+length, z);
	vertex( x+length/2, y+length/2, length);
	vertex( x+length, y+length, z);
	vertex( x, y+length, z);
	vertex( x+length/2, y+length/2, length);
	vertex( x, y+length, z);
	vertex( x, y, z);
	vertex( x+length/2, y+length/2, length);
	endShape();
}
void keyPressed() {
	if(key == 'a'){
		aPressed = true;
	}
	if(key == 's'){
		sPressed = true;
	}
	if(key == 'd'){
		dPressed = true;
	}
}
void keyReleased() {
	if(key == 'a'){
		aPressed = false;
	}
	if(key == 's'){
		sPressed = false;
	}
	if(key == 'd'){
		dPressed = false;
	}
}