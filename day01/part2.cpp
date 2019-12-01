#include <fstream>
#include <iostream>

using std::cerr;
using std::cout;
using std::endl;
using std::ifstream;


int fuelVal(int weight) {
    int val = weight / 3 - 2;
    if (val <= 0) {
        return 0;
    } else {
        return val + fuelVal(val);
    }
}


int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "usage: " << argv[0] << " FILENAME" << endl;
        return 1;
    }

    ifstream f{argv[1]};
    if (!f) {
        cerr << "could not open file: " << argv[1] << endl;
        return 1;
    }

    int total = 0;
    int n;
    while (f >> n) {
        total += fuelVal(n);
    }
    cout << total << endl;

    return 0;
}
