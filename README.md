Blast
=====
The best graphics engine in the whole fekkin world (not really)

How to use this
---------------
First of all, you need to set yourself up. Then use it so that it works for you.

How to set up?
--------------
1. Download and install [CMake][cmake].
2. Make sure you have [Boost][boost] (version 1.44 or higher) installed. On Windows you can use the [BoostPro installer][boostpro].
3. `git clone git://github.com/evoL/blast.git`
4. `cd blast`
5. `git submodule init`  
6. `git submodule update`  
7. **WINDOWS USERS:** Put your Visual Studio path in the `CMakeLists.txt` file or it won't build the libraries!
8. Use the CMake GUI and point both directories it asks at the `blast` directory. Or do it the UNIX way and just type `cmake .`.
9. Build using your dev tools. On Windows we use VS2008, on Mac Xcode and on Linux we just use `make`.
10. Do something awesome (unless it doesn't work)!

[cmake]: http://www.cmake.org/cmake/resources/software.html
[boost]: http://www.boost.org/users/download/
[boostpro]: http://www.boostpro.com/download/

License
-------
For the time being, this code is licensed under the [WTFPL][license].

[license]: http://sam.zoy.org/wtfpl/ 