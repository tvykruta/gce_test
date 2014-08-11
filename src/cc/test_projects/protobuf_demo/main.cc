#include <iostream>
#include <fstream>
#include "generated/client.pb.h"
using namespace std;

int main(int argc, char** argv) {
  // Verify that the version of the library that we linked against is
  // compatible with the version of the headers we compiled against.
  GOOGLE_PROTOBUF_VERIFY_VERSION;

  tutorial::Person person;
  person.set_id(123);
  person.set_name("Bob");
  person.set_email("bob@example.com");

  fstream out("protobuf_demo.pb", ios::out | ios::binary | ios::trunc);
  person.SerializeToOstream(&out);
  out.close();
  std::cout << "Writing protobuf_demo.pb\n\n";
  return 0;
}
