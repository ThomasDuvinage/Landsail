
 public static class DIRECTION{ public static final  float      NORTH  = 3*PI/2,
                                                                SOUTH = PI/2,
                                                                EAST   = 0,
                                                                WEST   = PI; };

  public static class FORCE{ public static final float          LIGHT = 50,
                                                                STRONG = 70; };

 class STABILITY{ public static final float         STABLE = 1,
                                                    UNSTABLE = 2; };

class WindOb{

    public WindOb(){
        _direction = DIRECTION.EAST;
        _speed = 50;
    }

    public void setDirection(float dir){
        _direction = dir;
    }

    public float direction(){
        return _direction;
    }

    public float speed(){
        return _speed;
    }

    public void draw(float x, float y){
        drawVector(x, y, _speed, _direction, color(200, 200, 200));
    }

    private float   _direction, _speed;
};