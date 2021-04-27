#version 330 core

out vec4 FragColor;
in vec3 rayDir;
uniform vec3 camPos;

struct Ray {
	vec3 origin;
	vec3 direction;
};

float hit_sphere(vec3 center, float radius, Ray ray) {
	vec3 oc = ray.origin - center;
	float a = dot(ray.direction, ray.direction);
	float b = 2* dot(oc, ray.direction);
	float c = dot(oc, oc) - radius*radius;
	float discriminant = b*b - 4*a*c;
	if (discriminant < 0) {
		return -1;
	} else {
		return (-b - sqrt(discriminant)) / (2*a);
	}
}


void main()
{
	vec4 coolblue = vec4(0.545, 0.714, 0.988, 1.0);
	Ray ray;
	ray.origin = camPos;
	ray.direction = rayDir;

	vec3 spherepos = vec3(0.f,0.f,-1.f);

	float t = hit_sphere(spherepos, 0.5, ray);
	if (t > 0) {
		vec3 n = normalize(ray.origin + t*ray.direction - spherepos);
		n = (n + vec3(1.f,1.f,1.f)) / 2;
		FragColor = vec4(n.xyz, 1.0);
	} else {
		//FragColor = coolblue;
		float x = dot(ray.direction, vec3(0.0, 1.0, 0.0));
		bool up = x > 0;
		if (up) {
			FragColor = coolblue;
		} else {
			x = abs(x);
			x = 0.98*x;
			x = 1 - x;
			x = x*x*x*x;
			float dip = 0.3;
			x = dip + x*(1.0 - dip);
			// x = 1 when looking at ground, 0 when looking horizontally
			FragColor = coolblue * x;
		}

	}

}
