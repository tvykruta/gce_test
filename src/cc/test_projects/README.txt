TO build:

mkdir build
cd build
cmake ..
make

NOte, you cannot build libs and projects at the same time. So you'll have to modify the root CMakeLists.txt to first compile libs, then projects.
