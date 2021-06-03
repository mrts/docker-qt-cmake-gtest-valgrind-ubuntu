# Dockerfile with with Qt, Qt Quick, CMake, Google Test, Valgrind and C++ build tools

FROM ubuntu:latest

# Avoid prompts during tzdata configuration
ENV DEBIAN_FRONTEND=noninteractive

# Install Ubuntu packages, as each RUN commits the layer to image, need to
# chain commands and clean up in the end to keep the image small
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        build-essential \
        clang clang-format \
        pkg-config \
        cmake \
        libgtest-dev \
        libssl-dev \
        dh-make devscripts cdbs fakeroot \
        valgrind \
        qtbase5-dev qt5-default libqt5svg5-dev \
        qttools5-dev \
        # For QML:
        # qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-controls2 \
        pcscd libpcsclite-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Optionally alias cc, c++ to Clang
# RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
#     update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100

# Build GTest library
RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
