#include <iostream>
using namespace std;

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
  virtual int foo(int x) {return x*2;}
  void nonvirt() {}
  virtual int operator+(A a) {return 3;}
};
class A2 {
public:
  virtual int goo() {return 22;}
};
class B : public A, public A2 {
public:
  B(int x) : A(x) {}
  B() : A(3) {}
  virtual char foo() {return 'B';}
  virtual int foo(int x) {return x*3;}
  virtual int goo() {return 42;}
};
class C : public B {
private: C(): B() {}
};
int main() {
  A* a = new A(1);
  A2* a2 = new A2();
  B* b = new B(2);
  A* x = b;
  Z* z;
  C* c;
  a->nonvirt();
  x->nonvirt();
  b->nonvirt();
  cout << "Reg: " << b->foo() << b->foo(1) << endl;
  cout << "Virt: " << x->foo() << x->foo(1) << endl;
  cout << "Forced: " << x->A::foo() << x->A::foo(1) << endl;
  delete a;
  delete a2;
  delete b;
  return 0;
}
