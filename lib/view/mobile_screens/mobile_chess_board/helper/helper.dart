bool isWhite (int index) {
  int x=index~/8;
  int y=index%8;
  bool isWhite=(x+y)%2==0;
  return isWhite;
}

bool inBoard (int row , int col) {
  if((row>=0 && row < 8) && (col>=0 && col < 8)){
    return true;
  }else{
    return false;
  }


}