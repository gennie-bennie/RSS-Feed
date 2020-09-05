XML science, world, politics, health, education;
String[] titles, desc, link;
PFont font1, font2;
color a, b, c, d, e, col;
ButtonRect prev, next;
boolean prevPressed = false;
boolean nextPressed = false;
Radio[] radioButtons = new Radio[5];
XML url;
boolean mouseOver = false;
int start = 0;

void setup() {
 size(500,500);
 
 color button1 = color(177, 183, 183);
 color button2 = color(255);
 
 prev = new ButtonRect(350, 20, 45, 25, button1, button2);
 next = new ButtonRect(400, 20, 45, 25, button1, button2);
 
 for(int i = 0; i < radioButtons.length; i++) {
  int y = 75 + i*50;
  radioButtons[i] = new Radio(20, y, 10, color(255), color(0), i, radioButtons);
 }
 
 a = color(180, 6, 0);
 b = color(255, 170, 41);
 c = color(118, 227, 117);
 d = color(39, 109, 255);
 e = color(201, 52, 247);
 
 world = loadXML("http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk");
 health = loadXML("http://feeds.bbci.co.uk/news/health/rss.xml?edition=uk");
 politics = loadXML("http://feeds.bbci.co.uk/news/politics/rss.xml?edition=uk");
 education = loadXML("http://feeds.bbci.co.uk/news/education/rss.xml?edition=uk");
 science = loadXML("http://feeds.bbci.co.uk/news/science_and_environment/rss.xml?edition=uk");

 url = science;
 col = a;
}

void draw() {
  background(255);
 
 XML[] titleXML = url.getChildren("channel/item/title");
 titles = new String[titleXML.length];
 XML[] descXML = url.getChildren("channel/item/description");
 desc = new String[descXML.length];
 XML[] linkXML = url.getChildren("channel/item/link");
 link = new String[linkXML.length];
 for(int i = 0; i < titleXML.length; i++) {
  String title = titleXML[i].getContent();
  titles[i] = title;
 }
 for(int i = 0; i < descXML.length; i++) {
  String description = descXML[i].getContent();
  desc[i] = description;
 }
 for(int i = 0; i < linkXML.length; i++) {
  String web = linkXML[i].getContent();
  link[i] = web;
 }
 
 prev.update(mouseX, mouseY);
 prev.display();
 
 next.update(mouseX, mouseY);
 next.display();
  
  font1 = createFont("ArialNarrow", 16);
  textFont(font1);
  fill(0);
  text("BBC RSS " + month() + "/" + day() + "/" + year(), 15, 25);
  
  font2 = createFont("ArialNarrow", 20);
  textFont(font2);
  
  int space = 40;
  int x = 45;
  int y = 60;
  int _y = y;
  int _space = 0;
  
  for(int i = 0; i < 6; i++) {
   noStroke();
   fill(255);
   rect(x, y+i*space, 350, 18);
  }
   
   //Description and link
   if(mouseX > x && mouseX < x + 350 && mouseY > _y && mouseY < _y + 18 && _space == 0) {
     mouseOver = true;
     fill(0);
     text(desc[start], 45, 400, width - 60, height - 400);
     if(mousePressed) {
      link(link[start]);
     }
   } else if(mouseX > x && mouseX < x + 350 && mouseY > y + space && mouseY < y + space + 18 && _space + 1 == 1){
     mouseOver = true;
     fill(0);
     text(desc[start+1], 45, 400, width - 60, height - 400);
     if(mousePressed) {
      link(link[start+1]); 
     }
   } else if(mouseX > x && mouseX < x + 350 && mouseY > y + 2*space && mouseY < y + 2*space + 18 && _space + 2 == 2) {
     mouseOver = true;
     fill(0);
     text(desc[start+2], 45, 400, width - 60, height - 400);
     if(mousePressed) {
      link(link[start+2]); 
     }
   } else if(mouseX > x && mouseX < x + 350 && mouseY > y + 3*space && mouseY < y + 3*space + 18 && _space +3 == 3) {
     mouseOver = true;
     fill(0);
     text(desc[start+3], 45, 400, width - 60, height - 400);
     if(mousePressed) {
      link(link[start+3]); 
     }
   } else if(mouseX > x && mouseX < x + 350 && mouseY > y + 4*space && mouseY < y + 4*space + 18 && _space + 4 == 4) {
     mouseOver = true;
     fill(0);
     text(desc[start+4], 45, 400, width - 60, height - 400);
     if(mousePressed) {
      link(link[start+4]); 
     }
   } else if(mouseX > x && mouseX < x + 350 && mouseY > y + 5*space && mouseY < y + 5*space + 18 && _space + 5 == 5) {
     mouseOver = true;
     fill(0);
     text(desc[start+5], 45, 400, width - 60, height - 400);
     if(mousePressed) {
      link(link[start+5]); 
     }
   } else {
    mouseOver = false; 
   }

   //titles of articles
   fill(col);
   textLeading(15);
   _space = 0;
   
   text(titles[start], 45, 60 + _space*space, 450, 75 + _space*space);
   _space++;
   text(titles[start + 1], 45, 60 + _space*space, 450, 75 + _space*space);
   _space++;
   text(titles[start + 2], 45, 60 + _space*space, 450, 75 + _space*space);
   _space++;
   text(titles[start + 3], 45, 60 + _space*space, 450, 75 + _space*space);
   _space++;
   text(titles[start + 4], 45, 60 + _space*space, 450, 75 + _space*space);
   _space++;
   text(titles[start + 5], 45, 60 + _space*space, 450, 75 + _space*space);
   
  if(nextPressed && start + 9 < titles.length) {
    start += 6;
    nextPressed = !nextPressed;
   } 
   if(prevPressed && start > 0) {
    start -= 6; 
    prevPressed = !prevPressed;
   }
 
 for(Radio r : radioButtons) {
  r.display(); 
 }

}

void mousePressed() {
  
 if(radioButtons[0].isPressed(mouseX, mouseY)) {
  url = science;
  col = a;
  start = 0;
 } else if(radioButtons[1].isPressed(mouseX, mouseY)) {
  url = world; 
  col = b;
  start = 0;
 } else if(radioButtons[2].isPressed(mouseX, mouseY)) {
  url = politics; 
  col = c;
  start = 0;
 } else if(radioButtons[3].isPressed(mouseX, mouseY)) {
  url = health; 
  col = d;
  start = 0;
 } else if(radioButtons[4].isPressed(mouseX, mouseY)) {
  url = education; 
  col = e;
  start = 0;
 }
  
  if(prev.isPressed()) {
   prevPressed = !prevPressed; 
  }
  
  if(next.isPressed()) {
   nextPressed = !nextPressed; 
  }
  
}

void mouseReleased() {
 prev.isReleased();
 next.isReleased();
}