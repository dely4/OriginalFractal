float x, y, z, rotationX, rotationY, rotationZ;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;
boolean zPressed = false;
boolean xPressed = false;
void setup(){
	size(800,800, P3D);
	x = width/2;
	y = width/2+500;
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
	rotationZ+=PI/128;
	if(zPressed){
		z+=20;
	}
	if(xPressed){
		z-=20;
	}
	rotateX(rotationX);
	rotateY(rotationY);
	rotateZ(rotationZ);
	stroke(255);
	noFill();
	originalFractal(-1000,-1000,0,2000);
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
		originalFractal(x+length/4,y+length/4,z+length/2,length/2);
	}
}
void pyramid(int x,int y,int z, int length){
	beginShape();
	vertex( x, y, z);
	vertex( x+length, y, z);
	vertex( x+length/2, y+length/2, z+length);
	vertex( x+length, y, z);
	vertex( x+length, y+length, z);
	vertex( x+length/2, y+length/2, z+length);
	vertex( x+length, y+length, z);
	vertex( x, y+length, z);
	vertex( x+length/2, y+length/2, z+length);
	vertex( x, y+length, z);
	vertex( x, y, z);
	vertex( x+length/2, y+length/2, z+length);
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
	if(key == 'z'){
		zPressed = true;
	}
	if(key == 'x'){
		xPressed = true;
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
	if(key == 'z'){
		zPressed = false;
	}
	if(key == 'x'){
		xPressed = false;
	}
}
