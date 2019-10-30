import java.util.*;


Table table; 

float chart_width;
float chart_height;
float margin_horizontal;
float margin_vertical;
float x_origin;
float y_origin;
ArrayList<Float> data = new ArrayList<Float>();
ArrayList<String> name = new ArrayList<String>(Arrays.asList("Eddard", "Arya", "Robb", "Catelyn", "Sansa", "Bran", "Beron", "Lyana", "Rickon", "Cregan", "Brandon", "Benjen"));
float max_data;
float real_max_data;


void setup() {
  size (1000, 600);
  background (255);
  margin_horizontal = 14.0/100;
  margin_vertical = 14.0/100;
  chart_width = width-width*2*margin_horizontal;
  chart_height = height-height*2*margin_vertical;
  x_origin=width*margin_horizontal;
  y_origin=height*margin_vertical + chart_height;


  table = loadTable("GOTBALLS.csv", "header");

  println(table.getRowCount() + " total rows in table");

  for (TableRow row : table.rows()) {
    float score = row.getFloat("score");
    String short_name = row.getString("short_name");
    String stark = "Stark";

    if ((short_name.contains(stark)) && (score>0.4)) {
      data.add (new Float(score));
    }
  }
  Collections.sort(data);
  Collections.reverse(data);
  max_data = Collections.max(data);
  real_max_data = 105.0/100*max_data;
}

void draw() {
  fill(0, 50, 150);
  textSize(25);
  textAlign(CENTER);
  text("WHO IS THE MOST LOVED STARK ?", 50, 0, 950, 600);

  fill(0);
  textSize(16);
  text("Classement of the 12 main Stark family members (excluding bastards) according to their popularity score", 250, 40, 600, 600);

  textSize(13);
  text("Score", x_origin-10, y_origin-chart_height-20);



  strokeWeight(2);  
  line(x_origin-10, y_origin+1, x_origin+chart_width-6, y_origin+1);
  line(x_origin-10, y_origin+1, x_origin-10, y_origin-chart_height);


  strokeWeight(1);  
  fill(0);
  triangle(x_origin-20, y_origin-chart_height, x_origin-10, y_origin-chart_height-10, x_origin, y_origin-chart_height);



  for (int i=0; i<data.size(); i++) {
    float bar_width = chart_width/data.size();
    float real_bar_width = bar_width*90.0/100;
    fill(i*10, i*20, i*50);
    strokeWeight(0);
    rect(i*bar_width+x_origin, y_origin, real_bar_width, -data.get(i)*chart_height/real_max_data);

    fill(0);
    textSize(13);
    textAlign(CENTER);
    text(name.get(i), i*bar_width+x_origin, y_origin+15, real_bar_width, y_origin+15);

    text("1.4", x_origin-35, y_origin-chart_height*95.0/100+3);
    text("0.7", x_origin-35, y_origin-chart_height*95.0/100/2+3);
    text("0", x_origin-35, y_origin+4);

    strokeWeight(2);  
    line(x_origin-15, y_origin-chart_height*95.0/100, x_origin-10, y_origin-chart_height*95.0/100);
    line(x_origin-15, y_origin-chart_height*95.0/100/2, x_origin-10, y_origin-chart_height*95.0/100/2);
    line(x_origin-15, y_origin+1, x_origin-10, y_origin+1);
  }
}
