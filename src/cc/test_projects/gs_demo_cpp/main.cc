// 'Hello World!' program 
 
#include <iostream>
#include <fstream>
using namespace std;

void streamFile() {
cout << "Streaming file from local storage:";
    for (std::string line; std::getline(std::cin, line);) {
        std::cout << line << std::endl;
    }
}

void loadFile() {
  ifstream infile;
  cout << "Loading file from local storage.";
  infile.open ("test.txt", ifstream::in);
  //infile.open("gs://bucket-tvykruta/macbeth.txt", ifstream::in);
  if (infile.good() == false) {
    cout << "Error, could not open test file.\n";
  }
  while (infile.good()){
    cout << (char) infile.get() << endl;
  }
}
 
int main()
{
  std::cout << "File loading demonstrations.\n\n" << std::endl;
  streamFile();
  loadFile();
  return 0;
}
