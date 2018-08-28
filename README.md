# docker-qt-cmake-gtest-valgrind-ubuntu

Dockerfile for building MRTS/QT-CMAKE-GTEST-VALGRIND-UBUNTU Docker image with  Qt, Qt Quick, CMake,
Google Test, Valgrind, clang-format and C++ build tools.


# Usage

    docker build --tag=mrts/qt-cmake-gtest-valgrind-ubuntu .
    docker tag mrts/qt-cmake-gtest-valgrind-ubuntu:latest mrts/qt-cmake-gtest-valgrind-ubuntu:v1.0
    docker login
    docker push mrts/qt-cmake-gtest-valgrind-ubuntu
