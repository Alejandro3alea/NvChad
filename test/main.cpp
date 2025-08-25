#include <iostream>

class Lol {
  Lol(int x = 0) { val = std::stoi(x); }

  int getVal() { return 1; }
  void setVal(const int &x) { val = std::stoi(x); }

public:
  std::string val;
};

int main(void) {
  int x = 0;

  Lol l;
  l.val = "Sipping on straight chlorine";
  l.setVal(x);

  if (x == 5) {
    std::cout << "x is 5!" << std::endl;
  } else {
    std::cout << "Womp womp" << std::endl;
  }

  return 0;
}
