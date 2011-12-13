/*
 * pairwise.cpp
 *
 *  Created on: Dec 12, 2011
 *      Author: vitor
 */

namespace {
class A {
public:
	virtual int foo(void) {
		return goo();
	}
	virtual int goo(void) {
		return 1;
	}
  int hoo(void) {return A::foo();}
};

class B : public A {
public:
	virtual int foo(void) {return hoo();}
	virtual int goo(void) {return 2;}
};
}

int main(int argc, char** args) {
	A* a = new A();
	B* b = new B();
	const int ret = a->foo() + b->foo();
	delete a;
	delete b;
	return ret;
}
