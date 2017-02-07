import os
import cv2
import dlib
import numpy

if not os.path.exists('/usr/share/opencv/haarcascades/haarcascade_frontalface_default.xml'):
    print 'OpenCV required!!'

if not os.path.exists('/usr/share/dlib/shape_predictor_68_face_landmarks.dat'):
    print 'Dlib data required!!'


# Load files
cascade = cv2.CascadeClassifier('/usr/share/opencv/haarcascades/haarcascade_frontalface_default.xml')
predictor = dlib.shape_predictor('/usr/share/dlib/shape_predictor_68_face_landmarks.dat')

db_path = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), os.pardir)) + "/database"

l = 1;
for root, dirs, files in os.walk(db_path):
    for file in files:
        if file.endswith(".mp4"):

             video_file = os.path.join(root, file) # video file path
             print str(l) + " : " + video_file

             cap = cv2.VideoCapture(video_file) # open video

             # creat csv file for face landmarks
             csv_file = video_file[:-3] + "csv"
             f = open(csv_file, 'w')

             while (True):
                 ret, frame = cap.read()

                 # Test for the end of video
                 if type(frame) == type(None):
                     break

                 # Convert frame to gray-scale
                 gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

                 # Face detection
                 faces = cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5,
                                                  minSize=(120, 120), flags=cv2.cv.CV_HAAR_FIND_BIGGEST_OBJECT)


                 pts = ""
                 for (x, y, w, h) in faces:
                     # face postion
                     face = dlib.rectangle(numpy.uint32(x).item(), numpy.uint32(y).item(),
                                       numpy.uint32(x).item() + numpy.uint32(w).item(),
                                       numpy.uint32(y).item() + numpy.uint32(h).item())
                     # detect face landmarks
                     shape = predictor(frame, face)
                     for points in range(0, 67):
                         pts = pts + str(shape.part(points).x) + ',' + str(shape.part(points).y) + ";"
  
                 # write landmarks in one line
                 f.write(pts + '\n')

             f.close()
             cap.release()
             cv2.destroyAllWindows()
             l=l+1
