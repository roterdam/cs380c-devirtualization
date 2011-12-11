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

class D : public C {
public:
	virtual char foo() {return 'D';}
};

int main() {
  A* a = new A(1);
  A2* a2 = new A2();
  B* b = new B(2);
  A* x = b;
  Z* z;
  C* c;
  D* d;
  a->nonvirt();
  x->nonvirt();
  b->nonvirt();
  delete a;
  delete a2;
  delete b;
  return 0;
}
