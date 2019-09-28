



class Landsail{

    public Landsail(){
        _x = _y = _heading = 0;     // (Float) in mm and °
        _speed = 0;                 // (Float) in mm/s
        _sailOpenning = 0;          // (Float) Between 90° and 0°
        _width = _lenght;           // (Float) mm
        _wheelAngle = 0;
    }

    //l = 44 & L = 58
    public Landsail(float w, float l){
        _x = _y = _heading = 0;     // (Float) in m and °
        _speed = 0;                 // (Float) in m/s
        _sailOpenning = 0;          // (Float) Between 90° and 0°
        _wheelAngle = PI/6;
        _width = w;
        _lenght = l;
    }

    public void computeSpeed(){
        float radius = _lenght / cos((PI/2) - _wheelAngle);
        float beta = _speed / radius;

        _heading += beta;
        _x += _speed * sin(_heading);
        _y += _speed * -cos(_heading);
    }

    public void display(){
        float cx = 1,cy = 1;
        
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

        popMatrix();
    }

    public void setPos(PVector pos){
        _x = pos.x;
        _y = pos.y;
        _heading = pos.z;
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
        _wheelAngle += PI/24;
        if(_wheelAngle > PI/4) _wheelAngle = PI/4;
    }

    public void steerRight(){
        _wheelAngle -= PI/24;
        if(_wheelAngle < -PI/4) _wheelAngle = -PI/4;
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
                    _speed,_sailOpenning, 
                    _width, _lenght;
};