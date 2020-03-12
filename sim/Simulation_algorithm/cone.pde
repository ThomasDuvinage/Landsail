class Cone{
    PVector _posCone = new PVector();
    private int index;

    public Cone(PVector pos){
        _posCone = pos;
    }

    public void displayCone(){
        fill(color(200,0,0));
        pushMatrix();
            text("Pos", _posCone.x,_posCone.y-25);
            triangle(_posCone.x, _posCone.y,_posCone.x + 20, _posCone.y, _posCone.x + 10, _posCone.y-20);
        popMatrix();
    }

    public PVector getConePos(){
        return _posCone;
    }

    public void setConePos(PVector newPos){
        _posCone = newPos;
    }

    public int getIndex(){
        return index;
    }

    public void setIndex(int index){
        this.index = index;
    }
    
}