# arm-catson
An artificial intelligence to identify cat names bases on their fur. Requires arm-catfaces.

To start, you need to mount the pictures directory from Motion on /data and configure global variables in /conf/catson.py :
```bash
docker run -d --name catson -v <conf_directory>:/conf/ -v <data_directory>:/data besn0847/arm-catson
```

Based on Raspbian Linux Stretch, Python 3.5, and OpenCV 3.4.4

#### References
1. https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/
2. https://github.com/besn0847/catfaces 
3. https://github.com/besn0847/arm-tfcv2/
