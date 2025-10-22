import processing.video.*;

Capture video;

int vScale = 16;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  video.start();
  println("Video feed:", video.width, video.height);
}


void draw() {
  background(0);
  if (video.available()) {
    video.read();
  }
  
  video.loadPixels();
  
  
  for (int y = 0; y < video.height; y+=vScale) {
    for (int x = 0; x < video.width; x+=vScale) {
      int index = video.width - x + (y * video.width);
      float r = red(video.pixels[index]);
      float g = green(video.pixels[index]);
      float b = blue(video.pixels[index]);
      
      float bright = (r + g + b) / 3;
      float w = map(bright, 0, 255, 0, vScale);
      
      
      //video.pixels[index] = color(bright);
      fill(r, g, b);
      noStroke();
      ellipseMode(CENTER);
      ellipse(x, y, w, w);
    }
  }
  //image(video, 0, 0);
  
}
