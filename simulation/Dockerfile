FROM base_image

#Just a gimmick to change code and not have it ignored when building image
RUN echo 'v9.9'

RUN sh -c 'mkdir -p /home/robomaker/dev_ws'
RUN sh -c 'cd /home/robomaker/dev_ws && git clone https://bitbucket.org/proslabteam/multirobotsimulation.git'
RUN sh -c 'cd /home/robomaker/dev_ws && mv -v multirobotsimulation src'

RUN cd /home/robomaker/dev_ws && \
 /bin/bash -c "source /opt/ros/foxy/setup.bash && rosdep install --rosdistro foxy --from-paths src --ignore-src -r -y && colcon build"
 
RUN sh -c 'cp -R /home/robomaker/dev_ws/src/agricultural_scenario/models /home/robomaker/.gazebo'

COPY simulation_entrypoint.sh /home/robomaker/simulation_entrypoint.sh
RUN sh -c 'sudo chmod +x /home/robomaker/simulation_entrypoint.sh'
RUN sh -c 'sudo chown robomaker:robomaker /home/robomaker/simulation_entrypoint.sh'
RUN sh -c 'mkdir -p /home/robomaker/dev_ws/logged_files'
RUN sudo chmod -R 777 /home/robomaker

CMD ros2 launch agriculture multi_launch.py
ENTRYPOINT [ "/home/robomaker/simulation_entrypoint.sh" ]
