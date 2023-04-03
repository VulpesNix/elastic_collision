ArrayList<ArrayList<ArrayList<particle>>> tp;
ArrayList<ArrayList<ArrayList<particle>>> tp_x;
ArrayList<ArrayList<ArrayList<particle>>> tp_y;
ArrayList<ArrayList<ArrayList<particle>>> tp_xy;
int res;
ArrayList<particle> plist;

ArrayList<particle> pull(ArrayList<ArrayList<ArrayList<particle>>> t,int y,int x){
	return t.get(y).get(x);
}
void put(ArrayList<ArrayList<ArrayList<particle>>> t,particle p,int y,int x){
	t.get(y).get(x).add(p);
}
void discard(ArrayList<ArrayList<ArrayList<particle>>> t,particle p,int y,int x){
	t.get(y).get(x).remove(p);
}
void setup(){
	fullScreen();
	background(0);
	colorMode(HSB,255,255,255);
	res = 2;
	plist = new ArrayList<particle>();
	for(int i = 0;i<18000;i++){
		particle p = new particle();
		plist.add(p);
	}
	strokeWeight(2);
	tp = new ArrayList<ArrayList<ArrayList<particle>>>();
	tp_x = new ArrayList<ArrayList<ArrayList<particle>>>();
	tp_y = new ArrayList<ArrayList<ArrayList<particle>>>();
	tp_xy = new ArrayList<ArrayList<ArrayList<particle>>>();
	
	for(int y=0;y<height/res+2;y++){
		ArrayList<ArrayList<particle>> temp1 = new ArrayList<ArrayList<particle>>();
		ArrayList<ArrayList<particle>> temp2 = new ArrayList<ArrayList<particle>>();
		ArrayList<ArrayList<particle>> temp3 = new ArrayList<ArrayList<particle>>();
		ArrayList<ArrayList<particle>> temp4 = new ArrayList<ArrayList<particle>>();
		tp.add(temp1);
		tp_x.add(temp2);
		tp_y.add(temp3);
		tp_xy.add(temp4);
		for(int x=0;x<width/res+2;x++){
			ArrayList<particle> tmp1 = new ArrayList<particle>();
			ArrayList<particle> tmp2 = new ArrayList<particle>();
			ArrayList<particle> tmp3 = new ArrayList<particle>();
			ArrayList<particle> tmp4 = new ArrayList<particle>();
			tp.get(y).add(tmp1);
			tp_x.get(y).add(tmp2);
			tp_y.get(y).add(tmp3);
			tp_xy.get(y).add(tmp4);
		}
	}
}

void draw(){
	background(0);
	// for(int y=0;y<height/res+2;y++){
	// 	for(int x=0;x<width/res+2;x++){
	// 		tp[y][x] = 100;
	// 		tp_x[y][x] = 100;
	// 		tp_y[y][x] = 100;
	// 		tp_xy[y][x] = 100;
	// 	}
	// }
	// if(mouseY>0 && mouseX>0){	
	// 	tp[floor(mouseY)/res][floor(mouseX)/res] = 255;
	// 	tp_y[ceil((mouseY+res/2)/res)][floor(mouseX)/res] = 255;
	// 	tp_x[floor(mouseY)/res][ceil((mouseX+res/2)/res)] = 255;
	// 	tp_xy[ceil((mouseY+res/2)/res)][ceil((mouseX+res/2)/res)] = 255;
	// }
	// for(int y=0;y<height/res+2;y++){
	// 	for(int x=0;x<width/res+2;x++){
	// 		fill(0,tp[y][x],0,100);
	// 		rect(x*res,y*res,res,res);
	// 		fill(tp_x[y][x],0,0,100);
	// 		rect((x-0.5)*res,(y)*res,res,res);
	// 		fill(0,0,tp_y[y][x],100);
	// 		rect((x)*res,(y-0.5)*res,res,res);
	// 		fill(tp_xy[y][x],0,tp_xy[y][x],100);
	// 		rect((x-0.5)*res,(y-0.5)*res,res,res);
	// 	}
	// }
	for(particle p : plist){
		p.update();
		p.collided = new ArrayList<particle>();
		p.collided.add(p);
	}
}