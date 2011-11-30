
class A {
public:
  int x;
  A(int x) : x(x) {}
  int hoo() {return 4;}
  virtual int foo() {return x;}
  virtual int goo() {return foo()+10;}
  virtual int operator+(A &a) {
    return x + a.x;
  }
};
class B : public A {
public:
  B(int x) : A(x) {}
  int hoo() {return 2;}
  virtual int foo() {return A::foo()*2;}
};
int main() {
  A* a = new A(1);
  B* b = new B(2);
  int y = a->foo() + b->goo() + a->hoo() + b->hoo() + (*a + *b);
  delete a;
  return y;
}
