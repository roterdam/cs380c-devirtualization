//#include <iostream>
//using namespace std;

class Z {
public:
  virtual char g() {return 'g';}
private:
  Z() {}
};
class A {
public:
  int x;
  A(int x) : x(x) {}
  virtual char foo() {return 'A';}
  //virtual char foo(int off) {return foo()+off;}
  void nonvirt() {}
};
class B : public A {
public:
  B(int x) : A(x) {}
  virtual char foo() {return 'B';}
};
int main() {
  A* a = new A(1);
  B* b = new B(2);
  A* x = b;
  Z* z;
  a->nonvirt();
  x->nonvirt();
  b->nonvirt();
  char reg = b->foo();
  a->foo();
  char virt = x->foo();
  char forced = x->A::foo();
  b->A::foo();
  delete a;
  //cout << "Reg: " << reg << endl;
  //cout << "Virt: " << virt << endl;
  //cout << "Forced: " << forced << endl;
  return reg+virt+forced;
}
