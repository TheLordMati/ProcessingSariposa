import peasy.*;

PeasyCam cam;

int resolucion;

float radio;
float x;
float y;
float z;
float Xprima;
float Yprima;

PVector [][] esfera;

void setup() {
size (600,600, P3D);
cam = new PeasyCam(this,500);

radio = 200;
resolucion = 21; //Debe de ser impar 
esfera = new PVector [resolucion+1][resolucion+1];

}

void draw() {
background(0);

lights();

for (int i = 0; i< resolucion+1; i++){
 Xprima = map(i, 0, resolucion, -PI, PI);
 
  for ( int j =0; j < resolucion+1; j++){
  Yprima = map(j,0, resolucion,- HALF_PI, HALF_PI);

  //formulas para la esfera x = radio * sin alpha * cos phi
  x = radio * sin(Xprima)* cos(Yprima);
  // formula para la esfera y = radio * sin alpha * sin phi
  y= radio * sin(Xprima) *sin(Yprima);
  // formula para la esfera z = cos alpha
  z = radio * cos(Xprima);
  
  esfera[i][j] = new PVector(x,y,z);
  stroke(255);
  strokeWeight(1);
  }
}

for (int i = 0; i< resolucion; i++){
  
  if ( i % 2 == 0){
  fill(0);
  }else{
  fill(255);
  }
  
  
  beginShape(TRIANGLE_STRIP);
for ( int j =0; j < resolucion+1; j++){
  PVector e = esfera[i][j];
  stroke(255);
  strokeWeight(1);
  vertex(e.x,e.y,e.z);
  PVector e1 = esfera[i+1][j];
  vertex(e1.x,e1.y,e1.z);
  }
    endShape();
 }

}
