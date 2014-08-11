#include <iostream>
#include "generated/client.pb.h"
using namespace std;

int main(int argc, char** argv) {
  Person person;
  person.set_id(123);
  person.set_name("Bob");
  person.set_email("bob@example.com");

  fstream out("output/protobuf_demo.pb", ios::out | ios::binary | ios::trunc);
  person.SerializeToOstream(&out);
  out.close();
  std::cout << "Writing protobuf_demo.pb\n";
  return 0;
}
