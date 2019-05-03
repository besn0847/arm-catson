# arm-catson
An artificial intelligence to identify cat names bases on their fur. Requires arm-catfaces.

To start, you need to mount the pictures directory from Motion on /data and configure global variables in /conf/catson.py :
```bash
docker run -d --name catson -v <conf_directory>:/conf/ -v <data_directory>:/data besn0847/arm-catson
```

Based on Raspbian Linux Stretch, Python 3.5, and OpenCV 3.4.4

#### Logic

 1. Catson listens for new files in the Motion pictures/ directory
 2. When new files are added, it stores each new file name and waits until the detection is over + 15 seconds
 3. The last frame captured is an empty one as there is a 5 to 10 seconds with no motion detected configured in Motion
 4. This frame is used as the reference one to extract deltas with the others
 5. Each other frame is analyzed against the reference one and the extracted deltas greather than 200x200 (aka contours) are sent to the Catfaces RNN which performas fur recognition
 6. Catfaces returns a catname with a probability 
 7. For each frame processed, Catson only keeps the one with the highest probability
 8. At the end of frame processing, if this probability is above 98%, then Catson notifies Slack that a feline has come in the lanscape

#### References
1. https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/
2. https://github.com/besn0847/catfaces 
3. https://github.com/besn0847/arm-tfcv2/
