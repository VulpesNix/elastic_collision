public class particle{
	PVector pos;
	PVector vel;
	float hue;
	ArrayList<particle> collided = new ArrayList<particle>();
	particle(){
		this.vel = PVector.random2D();
		this.vel.setMag(random(1,12));
		this.hue = random(0,360);
		this.pos = new PVector(random(0,width/6),random(0,height/6));
		this.collided.add(this);
		return;
	}
	void drw(){
		stroke(this.hue,255,255);
		point(pos.x,pos.y);
	}
	void neighbor(){
		put(tp,this,(floor(this.pos.y)/res),(floor(this.pos.x)/res));
		put(tp_y,this,(ceil((this.pos.y+res/2)/res)),(floor(this.pos.x)/res));
		put(tp_x,this,(floor(this.pos.y)/res),(ceil((this.pos.x+res/2)/res)));
		put(tp_xy,this,(ceil((this.pos.y+res/2)/res)),(ceil((this.pos.x+res/2)/res)));
	}
	void update(){
		discard(tp,this,(floor(this.pos.y)/res),(floor(this.pos.x)/res));
		discard(tp_y,this,(ceil((this.pos.y+res/2)/res)),(floor(this.pos.x)/res));
		discard(tp_x,this,(floor(this.pos.y)/res),(ceil((this.pos.x+res/2)/res)));
		discard(tp_xy,this,(ceil((this.pos.y+res/2)/res)),(ceil((this.pos.x+res/2)/res)));
		this.pos.x += this.vel.x;
		this.pos.y += this.vel.y;
		if(this.pos.x <= 0){
			this.pos.x = 0;
			this.vel.x = -this.vel.x;
		}if(this.pos.x>=width){
			this.pos.x = width;
			this.vel.x = -this.vel.x;
		}if(this.pos.y <= 0){
			this.pos.y = 0;
			this.vel.y = -this.vel.y;
		}if(this.pos.y >= height){
			this.pos.y = height;
			this.vel.y = -this.vel.y;
		}
		neighbor();
		collide();
		drw();
	}
	void collide(){
		for(particle p: pull(tp,(floor(this.pos.y)/res),(floor(this.pos.x)/res))){
			if(this.collided.contains(p)){}else{
				if(dist(p.pos.x,p.pos.y,this.pos.x,this.pos.y) < 2){
					this.collided.add(p);
					p.collided.add(this);
					PVector vtemp = new PVector(this.vel.x,this.vel.y);
					this.vel.x = p.vel.x;
					this.vel.y = p.vel.y;
					p.vel.x = vtemp.x;
					p.vel.y = vtemp.y;
				}

			}
		}
		for(particle p:pull(tp_y,(ceil((this.pos.y+res/2)/res)),(floor(this.pos.x)/res))){
			if(this.collided.contains(p)){}else{
				if(dist(p.pos.x,p.pos.y,this.pos.x,this.pos.y) < 2){
					this.collided.add(p);
					p.collided.add(this);
					PVector vtemp = new PVector(this.vel.x,this.vel.y);
					this.vel.x = p.vel.x * 0.99;
					this.vel.y = p.vel.y * 0.99;
					p.vel.x = vtemp.x * 0.99;
					p.vel.y = vtemp.y * 0.99;
				}

			}
		}
		for(particle p:pull(tp_x,(floor(this.pos.y)/res),(ceil((this.pos.x+res/2)/res)))){
			if(this.collided.contains(p)){}else{
				if(dist(p.pos.x,p.pos.y,this.pos.x,this.pos.y) < 2){
					this.collided.add(p);
					p.collided.add(this);
					PVector vtemp = new PVector(this.vel.x,this.vel.y);
					this.vel.x = p.vel.x;
					this.vel.y = p.vel.y;
					p.vel.x = vtemp.x;
					p.vel.y = vtemp.y;
				}

			}
		}
		for(particle p:pull(tp_xy,(ceil((this.pos.y+res/2)/res)),(ceil((this.pos.x+res/2)/res)))){
			if(this.collided.contains(p)){}else{
				if(dist(p.pos.x,p.pos.y,this.pos.x,this.pos.y) < 2){
					this.collided.add(p);
					p.collided.add(this);
					PVector vtemp = new PVector(this.vel.x,this.vel.y);
					this.vel.x = p.vel.x;
					this.vel.y = p.vel.y;
					p.vel.x = vtemp.x;
					p.vel.y = vtemp.y;
				}

			}
		}

	}
}