#!/bin/bash
source /opt/ros/humble/setup.bash
colcon build
source install/setup.bash
ros2 launch sim_league_bridge drive_local_launch.py