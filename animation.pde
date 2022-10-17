//tatijwdnaogl

//dgaszdg

float w, h, fC;
float time1, time2, time3, time4;  // ブロックごとの時間差

boolean shot = false;  // フレームを保存する
boolean finish = false;  // ちょうど1周したとことでプログラム終了
int maxMin = 128;  // 終了する時間（128の倍数でちょうどループ）

float spl_block = 40;  // この数だけ画面（縦横）を分割。画面サイズの約数の時のみブロック周囲の空白なし
int colorBottom = 0;  // 色の変化の下限（RGB）
int colorTop = 150;  // 色の変化の上限（RGB）
int speed = 4;  // 色の変化の速さ

void setup() {
  size(1600, 800);
  noStroke();
  frameRate(25);
  
  w = width / spl_block;
  h = height / spl_block;
}

void draw(){
  background(255);
  
  fC = frameCount * speed;
  
  time1 = map(abs(255 - fC % 512), 0, 256, colorBottom, colorTop);
  time2 = map(abs(255 - (fC + 64) % 512), 0, 256, colorBottom, colorTop);
  time3 = map(abs(255 - (fC + 64 * 2) % 512), 0, 256, colorBottom, colorTop);
  time4 = map(abs(255 - (fC + 64 * 3) % 512), 0, 256, colorBottom, colorTop);
  
  for (int i = 0; i < spl_block / 4; i++) {
    for (int j = 0; j < spl_block / 4; j++) {
      display44(width * i / (spl_block / 4), height * j / (spl_block / 4));
    }
  }
  
  
  if (shot == true) saveFrame("frames//#####.png");
  if ((finish == true)&&(frameCount > maxMin)) exit();
}

// 4マス*4マスのセットを表示する関数
void display44(float _loc_w, float _loc_h){
  
  // fill()について
  // fill(r, g, b)のそれぞれに任意の値を入れる
  // time1~4を入れた場合、colorBottom~colorTopの間で数値が変化
  fill(128, 0, time1);
  rect(_loc_w + 0, _loc_h + 0, w, h);
  rect(_loc_w + w * 2, _loc_h + h, w, h);
  rect(_loc_w + 0, _loc_h + h * 2, w, h);
  rect(_loc_w + w * 2, _loc_h + h * 3, w, h);
  
  fill(128, 0, time2);
  rect(_loc_w + w * 3, _loc_h + 0, w, h);
  rect(_loc_w + w, _loc_h + h, w, h);
  rect(_loc_w + w * 3, _loc_h + h * 2, w, h);
  rect(_loc_w + w, _loc_h + h * 3, w, h);
  
  fill(128, 0, time3);
  rect(_loc_w + w * 2, _loc_h + 0, w, h);
  rect(_loc_w + 0, _loc_h + h * 1, w, h);
  rect(_loc_w + w * 2, _loc_h + h * 2, w, h);
  rect(_loc_w + 0, _loc_h + h * 3, w, h);
  
  fill(128, 0, time4);
  rect(_loc_w + w * 1, _loc_h + 0, w, h);
  rect(_loc_w + w * 3, _loc_h + h * 1, w, h);
  rect(_loc_w + w * 1, _loc_h + h * 2, w, h);
  rect(_loc_w + w * 3, _loc_h + h * 3, w, h);
}
