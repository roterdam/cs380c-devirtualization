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
};

class B : public A {
public:
	virtual int foo(void) {return 2;}
	virtual int goo(void) {return 2;}
};
}

int main(int argc, char** args) {
	A* a = new A();
	B* b = new B();
	int ret = 0;
	for (unsigned i = 0; i < 1000000; ++i) {
		for (unsigned j = 0; j < 1000; ++j) {
			ret +=  a->foo() + b->foo();
		}
	}
	delete a;
	delete b;
	return ret;
}
