//#include <iostream>
//using namespace std;

class Z {
public:
  virtual char g() {return 'g';}
  static Z Create() {return Z();}
private:
  int xx;
  Z() : xx(4) {}
};
class A {
public:
  int x;
  A(int x) : x(x) {}
  virtual void aha(void);
  virtual char foo() {return 'A';}
  virtual char foo(char y) {return y;}
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
  virtual char foo(char y) {return y+1;}
  virtual int foo(int x) {return x*3;}
  virtual int goo() {return 42;}
};
class C : public B {
};
class D : public C {
public:
virtual char foo() {return 'D';}
};
int main() {
  A* a = new A(1);
  A2* a2 = new A2();
  B* b = new B(2);
  D* d = new D();
  A* x = b;
  a->aha();
  Z* z;
  C* c;
  d->foo();
  //cout << "Reg: " << b->foo() << b->foo(1) << endl;
  //cout << "Virt: " << x->foo() << x->foo(1) << endl;
  //cout << "Forced: " << x->A::foo() << x->A::foo(1) << endl;
  delete a;
  delete a2;
  delete b;
  return 0;
}
