#include "main.h"

#include <opencv2/opencv.hpp>
#include <iostream>
using std::cout;
using std::endl;
#include <fstream>
#include <string>

// when testing, the main of gtest and this main function will collide,
// this prevents the collision, but it's an ugly hack like all ifdef branches
#ifdef UNIT_TESTS
#define MAIN not_main
#else
#define MAIN main
#endif

int MAIN(int argc, char** argv) {
  std::cout << "Hey there buddy!" << std::endl;
  
	if (argc != 2) {
		printf("usage: DisplayImage.out <Image_Path>\n");
		return -1;
	}
  cv::Mat image;
  image = cv::imread(argv[1], 1);
	if (!image.data) {
		printf("No image data \n");
		return -1;
	}
	cv::namedWindow("Display Image", cv::WINDOW_AUTOSIZE);
	cv::imshow("Display Image", image);
	cv::waitKey(0);
  
  return EXIT_SUCCESS;
}


// just some function to have something that can be test
#include <exception>

void GetFrobnicationInterval() {
  throw std::string("InvalidOperation: frobnication interval can't be retrieved");
}

