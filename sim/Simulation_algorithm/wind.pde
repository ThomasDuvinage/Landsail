
class WindOb{
    class DIRECTION{ public static final  float     NORTH  = 0.0,
                                                    SOUTH = PI,
                                                    EAST   = PI/2,
                                                    WEST   = 3*PI/2; };

    class FORCE{ public static final float          LIGHT = 50,
                                                    STRONG = 70; };

    class STABILITY{ public static final float      STABLE = 1,
                                                    UNSTABLE = 2; };


    public WindOb(){
        _direction = DIRECTION.EAST;
        _speed = 50;
    }

    public float direction(){
        return _direction;
    }

    public float speed(){
        return _speed;
    }

    public void draw(){
        drawVector(width/2, height/2, _speed*10, _direction,color(200, 200, 200));
    }

    private float   _direction, _speed;
};