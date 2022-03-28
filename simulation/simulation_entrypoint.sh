#!/bin/bash
cd /home/robomaker/project_ccc
source /opt/ros/foxy/setup.bash
source /usr/share/gazebo-11/setup.sh
source ./install/setup.sh
export SVGA_VGPU10=0
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=~/ros2_install
export GAZEBO_RESOURCE_PATH=/usr/share/gazebo-11
ros2 launch ccc_pkg simulation.launch.py &
cd /home/robomaker/my_logs &
ros2 bag record -o subset /dolly_1/cmd_vel &
ros2 launch ccc_pkg controllers.launch.py 

exec "${@:1}"
