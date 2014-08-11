#include <iostream>
#include <gflags/gflags.h>
using namespace std;

DEFINE_bool(big_menu, false, "Include 'advanced' options in the menu listing");
DEFINE_string(custom_path, "", "Custom path to local storage.");

int main(int argc, char** argv)
{
  std::cout << "Try running as: --big-menu 123 --custom_path=gs://bucket\n";
  // This is required to enable flag support.
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  std::cout << "Flag demonstration. Flag big_menu = " << FLAGS_big_menu 
            << ", custom_path = " << FLAGS_custom_path << std::endl;
  return 0;
}
