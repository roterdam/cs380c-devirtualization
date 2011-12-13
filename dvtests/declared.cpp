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
	const char baseName = basePtr->name();
	const char childName = childPtr->name();
	const int s = (int)baseName + (int)childName;
	delete basePtr;
	delete childPtr;
	return s + basePtr->nameHash() + childPtr->nameHash();
}
