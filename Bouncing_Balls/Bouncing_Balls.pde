int xSize = 700;
int ySize = 700;

float distance = 150;

Table table; 

ArrayList<Ball> balls = new ArrayList<Ball>();

public class Color {
  private int r;
  private int g;
  private int b;
  
  Color(){
    this.r = (int)random(0, 256);
    this.g = (int)random(0, 256);
    this.b = (int)random(0, 256);
  }
  
  public int getRed(){ return this.r; }
  public int getGreen(){ return this.g; }
  public int getBlue(){ return this.b; }
}

public class Ball {
  private int x;
  private int y;
  private float speed;
  private boolean right;
  private boolean up;
  private float radius;
  private Color rgb;
  private String name;

  Ball(float r, String n, float s) {
    this.x = (int)random(0, xSize);
    this.y = (int)random(0, xSize);
    this.speed = s;
    this.right = false;
    this.up = true;    
    this.radius = r;
    this.rgb = new Color();
    this.name = n;
  }

  public void draw() {
    fill(this.rgb.getRed(), this.rgb.getGreen(), this.rgb.getBlue());
    circle(this.x, this.y, this.radius);
    
    textSize(12);
    fill(255,255,255);
    text(this.name, this.x-radius, this.y);
  }

  public void move() {
    if (this.x >= xSize - this.radius/2) {
      this.right = false;
    } 
    if (this.x <= 0 + this.radius/2) {
      this.right = true;
    }

    if (this.right == false) {
      this.x -= this.speed;
    } else {
      this.x += this.speed;
    }

    if (this.y >= ySize - this.radius/2) {
      this.up = true;
    }
    if (this.y <= 0 + this.radius/2) {
      this.up = false;
    }

    if (this.up == true) {
      this.y -= this.speed;
    } else {
      this.y += this.speed;
    }
  }
  
  boolean close(Ball b){
    float x = pow((b.x - this.x), 2);
    float y = pow((b.y - this.y), 2);
    return sqrt(x+y) < distance;
  }
}

void setup() {
  background(0, 0, 0);
   size(700, 700);
   

  
  
   table = loadTable("GOTBALLS.csv", "header");

  println(table.getRowCount() + " total rows in table");

  for (TableRow row : table.rows()) {

    int size = row.getInt("awoif_in_degree");
    String name = row.getString("common_name");
    float score = row.getFloat("score");
    if (size > 150) {
      balls.add(new Ball(size/5,name,score*1.5));
    }
    
  }

 }

  

void draw() {
  background(0, 0, 0);
  
  for (int i=0; i<balls.size(); i++) {
    balls.get(i).draw();
    balls.get(i).move();
    
   
  }
  
  
  
}
