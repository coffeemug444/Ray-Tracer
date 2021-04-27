main:	glad.c main.cpp stb_image_implementation.cpp shader_s.h stb_image.h
	g++ -I./include/ -g -o main main.cpp glad.c stb_image_implementation.cpp -lglfw -lGL -lGLEW -lGL -ldl
