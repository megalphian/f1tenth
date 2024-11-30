# MIT License

# Copyright (c) 2020 Hongrui Zheng

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

FROM autodriveecosystem/autodrive_f1tenth_api:2024-cdc-practice

# dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y git \
                       nano \
                       vim \
                       python3-pip \
                       libeigen3-dev \
                       tmux \
                       ros-humble-slam-toolbox \
                       ros-humble-ackermann-msgs \
                       ros-humble-robot-localization
RUN apt-get -y dist-upgrade

COPY f1tenth_ws/src/sim_league_bridge /home/autodrive_devkit/src/sim_league_bridge
COPY f1tenth_ws/src/kinematic-icp /home/autodrive_devkit/src/kinematic-icp

RUN /bin/bash -c "source /opt/ros/humble/setup.bash && \
                 cd /home/autodrive_devkit && \
                 colcon build"

COPY entrypoint.sh /home/autodrive_devkit/
RUN chmod +x /home/autodrive_devkit/entrypoint.sh

# build
ENTRYPOINT [ "/home/autodrive_devkit/entrypoint.sh" ]