class Screen{
  protected ArrayList<Being> beingCollection;
  protected ArrayList<Interactor> interactors;
  
  Screen(){
    beingCollection = new ArrayList<Being>();
    interactors = new ArrayList<Interactor>();
  }
  
  void step(){
    //1. draw every being in my colection
    for(int i=0; i<beingCollection.size(); i++){
      beingCollection.get(i).step();
      beingCollection.get(i).drawme();
    }
    //2. detect resolve every interaction in my collection
    for(int i=0; i<interactors.size(); i++){
      if(interactors.get(i).detect()){
        interactors.get(i).resolve();  
      }
    }
  }
  
  void register(Being b){
    beingCollection.add(b);
  }
  
  void register(Interactor i){
    interactors.add(i);
  }
  
  void delete(Being b){
    beingCollection.remove(b);
    for(int i=interactors.size()-1; i>=0; i--){
      if(interactors.get(i).involves(b)){
        interactors.remove(i);  
      }
    }
  }
  
  void delete(Interactor i){
    interactors.remove(i);
  }
  
}
