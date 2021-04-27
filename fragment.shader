#version 330 core

out vec4 FragColor;
in vec3 rayDir;
uniform vec3 camPos;

struct Ray {
	vec3 origin;
	vec3 direction;
};

bool hit_sphere(vec3 center, float radius, Ray ray) {
	vec3 oc = ray.origin - center;
	float a = dot(ray.direction, ray.direction);
	float b = 2* dot(oc, ray.direction);
	float c = dot(oc, oc) - radius*radius;
	float discriminant = b*b - 4*a*c;
	return discriminant > 0;
}


void main()
{
	Ray ray;
	ray.origin = camPos;
	ray.direction = rayDir;

	if (hit_sphere(vec3(0,0,-1), 0.5, ray)) {
		FragColor = vec4(1.0, 0.0, 0.0, 1.0);
	} else {
		FragColor = vec4(0.0, 1.0, 0.0, 1.0);
	}

}
