class Landsail{
    //float w = 44, float l = 58, float sailArea = 0.3, float sailborder = 58,  float mass = 1
    public Landsail(float w, float l, float sailArea, float sailborder,  float mass){
        _x = _y = _heading = 0;     // (Float) in m and °
        _speed = 0;                 // (Float) in m/s
        _sailOpenning = PI/6;          // (Float) Between 90° and 0°
        _wheelAngle = 0;
        _width = w;
        _lenght = l;
        _sailBorder = sailborder;
        _sailArea = sailArea;
        _mass = mass;
        _accel = 0;
        _dragForce = 0;
        _rollForce = 0.3*9.81*mass;
    }


    public void autoPilot(){
        autoSail();

    }

    public void autoSail(){
        println(Wind.direction() - _heading);
        if((Wind.direction() - _heading) < PI || Wind.direction() - _heading > 2*PI ) {
            _sailOpenning = -_sailOpenning;
        }


    }

    public void computeSpeed(){
        float alpha =  _heading - _sailOpenning + Wind.direction();
        
        float a = cos(alpha) * (Wind.speed()/3600);
        a -= _speed*0.03;

        _speed += a;

//           stroke(color(255, 165, 0));
//           fill(color(255, 165, 0));
//           drawVector(_x,_y, _speed, _heading);

        float radius = _lenght / cos((PI/2) - _wheelAngle);
        float beta = _speed / radius;

        _heading += beta;
        if(_heading > 2*PI) _heading -= 2*PI;
        if(_heading < 0) _heading += 2*PI;
        _x += _speed * sin(_heading);
        _y += _speed * -cos(_heading);

    }

    public void display(){
        float cx = 1,cy = 1;
        stroke(color(0,0,0));
        fill(color(255,255,255));
        pushMatrix();
            translate(_x*cx, _y*cy);
            rotate(PI + _heading);

            
            beginShape();
                vertex(0,0);
                vertex(-_width/2, -_lenght);
                vertex(0, (-2*_lenght)/3);
                vertex(_width/2, -_lenght);
            endShape(CLOSE);

            rotate(_wheelAngle);
            line(0,0,0,_lenght/8);
            rotate(-_wheelAngle);
            rotate(_sailOpenning);
            line(0,0,0,-_lenght);

        popMatrix();
    }

    public void setPos(PVector pos){
        _x = pos.x;
        _y = pos.y;
        _heading = pos.z;
        if(_heading > 2*PI) _heading -= 2*PI;
        if(_heading < 0) _heading += 2*PI;
    }

    public PVector getPos(){
        return new PVector(_x,_y,_heading);
    }

    public void setSpeed(float s){
        _speed = s;
    }

    public float getSpeed(){
        return _speed;
    }

    public void steerLeft(){
        _wheelAngle -= PI/24;
        if(_wheelAngle < -PI/4) _wheelAngle = -PI/4;
    }

    public void steerRight(){
        _wheelAngle += PI/24;
        if(_wheelAngle > PI/4) _wheelAngle = PI/4;
    }

    public void accelerate(){
        _speed += 1;
        if(_speed > 10) _speed = 10;
    }

    public void decelerate(){
        _speed -= 2.5;
        if(_speed < 0) _speed = 0;
    }


    private float   _x,_y,
                    _heading, _wheelAngle,
                    _speed, _mass, _accel,
                    _rollForce, _dragForce,
                    _sailOpenning, _sailBorder,
                    _width, _lenght,
                    _sailArea;
};