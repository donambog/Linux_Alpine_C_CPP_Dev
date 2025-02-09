FROM alpine:latest

# Install development tools
RUN apk add --no-cache \
    autoconf \
    automake \
    bash \
    boost-dev \
    ccache \
    clang \
    cmake \
    cppcheck \
    dos2unix \
    doxygen \
    g++ \
    gcc \
    gdb \
    git \
    gtest-dev \
    libtool \
    linux-headers \
    lldb \
    ltrace \
    make \
    musl-dev \
    nano \
    openssh \
    pkgconfig \
    shadow \
    strace \
    sudo \
    valgrind \
    vim

# Copy .bashrc to root and devuser home directories
COPY .bashrc /root/.bashrc
COPY .bashrc /home/devuser/.bashrc

# Convert .bashrc to Unix format
RUN dos2unix /root/.bashrc
RUN dos2unix /home/devuser/.bashrc

# Add line to .bash_profile to source .bashrc
RUN echo "source ~/.bashrc" >> /home/devuser/.bash_profile

# Create a non-root user
RUN useradd -m -s /bin/bash devuser && \
    echo "devuser:password" | chpasswd && \
    mkdir -p /home/devuser/.ssh && \
    chown devuser:devuser /home/devuser/.ssh

# Set permissions for devuser home directory
RUN chown -R devuser:devuser /home/devuser && \
    chmod -R 755 /home/devuser

# Add devuser to sudoers file for passwordless sudo
RUN echo 'devuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Copy SSH keys to devuser .ssh directory
COPY id_rsa /home/devuser/.ssh/id_rsa
COPY id_rsa.pub /home/devuser/.ssh/id_rsa.pub

# Set permissions for SSH keys
RUN chmod 700 /home/devuser/.ssh && \
    chmod 600 /home/devuser/.ssh/id_rsa && \
    chmod 644 /home/devuser/.ssh/id_rsa.pub && \
    chown -R devuser:devuser /home/devuser/.ssh

# Set working directory
WORKDIR /home

# Switch to non-root user
USER devuser

# Set bash as default shell
SHELL ["/bin/bash", "-c"]