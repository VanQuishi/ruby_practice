#include <iostream>
using namespace std;

int max(int a, int b)
{
	if (a > b) return a;
	else return b;
}
struct node
{
	int data;
	node* left;
	node* right;
	int height;
};

class AVL {
public:
	node* root;
	bool isEmpty() { return (root == nullptr); }
	void makeEmpty(node*& t);
	node* singleRightRotate(node* &t);
	node* singleLeftRotate(node* &t);
	node* doubleLeftRotate(node*& t);
	node* doubleRightRotate(node*& t);
	node* findMin(node* t);
	node* findMax(node* t);
	node* remove(int x, node* t);
	int height(node* t);
	int getBalance(node* t); 
	node* insert(int x, node* t);
	void inorder(node* t);
	void inorderlvl(node* t, int x) {
		if (t == nullptr) return;
		else if (x == 1) cout << t->data << " ";
		else if (x > 1)
		{
			inorderlvl(t->left, x-1);
			inorderlvl(t->right, x-1);
		}
	}
	
	void display();
};

void AVL::makeEmpty(node*& t) 
{
	if (t == nullptr) return;
	makeEmpty(t->left);
	makeEmpty(t->right);

	delete(t);
	t = nullptr;

}
int AVL::height(node* t)
{
	if (t == nullptr)	return 0;
	else return t->height;
}

node* AVL::singleRightRotate(node* &t)
{
	node* nroot = t->left;
	node* tempt = nroot->right;

	nroot->right = t;
	nroot->right->left = tempt;

	//update height
	t->height = max(height(t->left), height(t->right)) + 1;
	nroot->height = max(height(nroot->left), height(nroot->right)) + 1;

	return nroot;
}

node* AVL::singleLeftRotate(node*& t) {
	node* nroot = t->right;
	node* tempt = nroot->left;

	nroot->left = t;
	nroot->left->right = tempt;

	//update height
	t->height = max(height(t->left), height(t->right)) + 1;
	nroot->height = max(height(nroot->left), height(nroot->right)) + 1;

	return nroot;

}
node* AVL::doubleLeftRotate(node*& t) {
	t->left = singleLeftRotate(t->left);
	return singleRightRotate(t);
}
node* AVL::doubleRightRotate(node*& t) {
	t->right = singleRightRotate(t->right);
	return singleLeftRotate(t);
}

int AVL::getBalance(node* t)
{
	if (t == 0)
		return 0;
	return height(t->left) - height(t->right);
}

node* AVL::insert(int x, node* t)

{
	if (t == 0) {
		node* a = new node();
		a->data = x;
		a->left = a->right = 0;
		a->height = 1;
		 root = a;
		return a;
	}
	else if (x < t->data) t->left = insert(x, t->left);
	else if (x > t->data) t->right = insert(x, t->right);
	else return t;

	t->height = 1 + max(height(t->left), height(t->right));

	
	// After insertion determine which kind of rotation should be done
	// Look up on Geek for geek

	// Left Left Case  
	if (getBalance(t) > 1 && x < t->left->data)
		return root = singleRightRotate(t);

	// Right Right Case  
	if (getBalance(t) < -1 && x > t->right->data)
		return root = singleLeftRotate(t);

	// Left Right Case  
	if (getBalance(t) > 1 && x > t->left->data)
	{
		return root = doubleLeftRotate(t);
	}

	// Right Left Case  
	if (getBalance(t) < -1 && x < t->right->data)
	{
		return root = doubleRightRotate(t);
	}

	// return the (unchanged) node pointer
	return root = t;
}

node* AVL::remove(int x, node* t) {
	if (t == nullptr) return t;
	else if (x < t->data) t->left = remove(x, t->left);
	else if (x > t->data) t->right = remove(x, t->right);

	//node to be deleted
	else {
		// node with only one child or no child 
		if (t->left == nullptr || t->right == nullptr) {
			node* temp;
			if (t->left != nullptr) temp = t->left;
			else temp = t->right;
			// no child
 			if (temp == nullptr) {
				temp = t;
				t = nullptr;
				free(temp);
			}
			// 1 child case
			else
			{
				*t = *temp;
				free(temp);
			}				
		}
		// 2 child node
		else {
			node* temp = findMin(t->right);
			t->data = temp->data;
			//free(temp);
			t->right = remove(temp->data, t->right);
		}
	}
	if (t == nullptr) return t;

	t->height = 1 + max(height(t->left), height(t->right));

	// Left Left Case  
	if (getBalance(t) > 1 && getBalance(t->left) >= 0)
		return root = singleRightRotate(t);

	// Right Right Case  
	if (getBalance(t) < -1 && getBalance(t->right) <= 0)
		return root = singleLeftRotate(t);

	// Left Right Case  
	if (getBalance(t) > 1 && getBalance(root->left) < 0)
	{
		return root = doubleLeftRotate(t);
	}

	// Right Left Case  
	if (getBalance(t) < -1 && getBalance(root->right) > 0)
	{
		return root = doubleRightRotate(t);
	}

	/* return the (unchanged) node pointer */
	return root = t;

}


node* AVL::findMin(node* t){
	if (t->left == nullptr) return t;
	else return findMin(t->left);
}
node* AVL::findMax(node* t) {
	if (t->right == nullptr) return t;
	else return findMin(t->right);
}
void AVL::inorder(node* t)
{
	if (t != 0)
	{
		inorder(t->left);
		cout << t->data << "-" << t->height << " ";
		inorder(t->right);
	}
}
void AVL::display() {
/*cout << "level 1: "; inorderlvl(root, 1);cout << endl;
cout << "level 2: "; inorderlvl(root, 2); cout << endl;
cout << "level 3: "; inorderlvl(root, 3); cout << endl;
cout << "level 4: "; inorderlvl(root, 4); cout << endl;*/
for (int i = 1; i <= root->height; i++) {
	cout << "lvl " << i << ": "; inorderlvl(root, i); cout << endl;
}

}

int main()
{
	node* root = NULL;
	AVL t;
	

	root = t.insert(20, root);
	root = t.insert(25, root);
	root = t.insert(15, root);
	root = t.insert(10, root);
	root = t.insert(30, root);
	root = t.insert(5, root);
	root = t.insert(35, root);
	root = t.insert(67, root);
	root = t.insert(43, root);
	root = t.insert(21, root);
	root = t.insert(10, root);
	root = t.insert(89, root);
	root = t.insert(38, root);
	root = t.insert(69, root);

	t.display();
	cout << endl;

	root = t.remove(5, root);
	root = t.remove(35, root);
	root = t.remove(65, root);
	root = t.remove(89, root);
	root = t.remove(43, root);
	root = t.remove(88, root);
	root = t.remove(20, root);
	root = t.remove(38, root);

	
	t.display();
	return 0;
}