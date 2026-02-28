# Use android phone as webcam on linux

This repo provides the file webcam.sh which sets up a virtual webcam and then copies the camera output from your phone camera to the virtual camera. This allows you to use the camera as any other webcam.

Install instruction:

clone the repo: `git clone https://github.com/dy-dt/Android-webcam----Linux.git`
Install all dependencies `./setupWebcam.sh`
Then when you want to run the webcam run `./webcam.sh`

By default the program uses camera 1 from your phone. This can be edited in webcam.sh or provided as the first arg.
You can check the id's of the your cameras with `scrcpy --list-cameras`

By default the camera is not rotated. This can be changed either in webcam.sh or provided as the second arg.

Due to this relying on a virual camera device the first time you run webcam.sh per session the virtual camera will be re-setup (hence why a password is needed for the first run of it).

For any other customisations or more information reference the scrcpy github.

