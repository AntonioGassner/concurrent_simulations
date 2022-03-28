#! /bin/bash

sudo docker pull ros:foxy-ros-core-focal
cd ~/concurrent_simulations/base_image
sudo docker build -t base_image .
cd ..
cd simulation
sudo docker build -t simulation .

