/*
 * declared.cpp
 *
 *  Created on: Dec 12, 2011
 *      Author: vitor, brian
 */

//namespace {
class Base {
public:
	virtual char name(void) {return '0';}
	virtual int nameHash(void) {return (int)name();}
};

class Child : public Base {
public:
	virtual char name(void) {return '1';}
};


int main(int argc, char** args) {
	Base* basePtr = new Base();
	Child* childPtr = new Child();
	char n = '\0';
	int sum = 0;
	for (unsigned i = 0; i < 1000000; ++i) {
		for (unsigned j = 0; j < 1000; ++j) {
			n  |= basePtr->name();
			n |= childPtr->name();
			sum += basePtr->nameHash() + childPtr->nameHash();
		}
	}
	delete basePtr;
	delete childPtr;
	return sum;
}
