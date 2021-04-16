/*
	Complete the following functions and submit your file to Canvas.

	========= IMPORTANT ==========
	Change the name of the file so that it contains your student ID or name.
	Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
	Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
	Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
	If your file does not compile, your grade will be zero. Then, submit only code that works.

	To compile, run: "g++ HW05.cpp -std=c++11 -o HW05"
*/

#include <iostream>
#include <vector>

using namespace std;

int sum(vector<int> v)
{
	if(v.size() == 0) 
	{
		return 0;
	}

	int n = v.back();
	v.pop_back();

	return n + sum(v);

}

int fibonacci(int n)
{
	if(n == 0 || n == 1) 
	{
		return n;
	}
	return fibonacci(n-1) + fibonacci(n-2);
}

int toBinary(int n)
{
	if(n == 0)
	{
		return 0;
	}

	return n%2 + 10*toBinary(n/2);

}

int main()
{
	/*
		Test your codes here.
	*/
	// Test sum

	vector<int> n = {};
	cout << "Sum of an empty array is: " << sum(n) << endl;
	n = {1,2,3,4,5};
	cout << "Sum of an array with 1,2,3,4,5 is: " << sum(n) << endl;

	// Test fibonacci

	cout << "Fibonacci of 0 is: " << fibonacci(0) << endl;
	cout << "Fibonacci of 1 is: " << fibonacci(1) << endl;
	cout << "Fibonacci of 6 is: " << fibonacci(6) << endl;


	// Test toBinary

	cout << "1 in binary is: " << toBinary(1) << endl;
	cout << "7 in binary is: " << toBinary(7) << endl;
	cout << "20 in binary is: " << toBinary(20) << endl;

}
