layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;

layout (location = 6) in vec2 inUV0;


uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

uniform vec4 inAlphaMode;
uniform vec4 inFXInfo[2];

#ifdef FX_SCISSOR
smooth out float outScissor;
#endif

smooth out vec4 outCol0;
smooth out vec2 outUV0;

#ifdef DEPTH_BIAS
uniform vec4 inDepth;
smooth out vec2 outUV1;
#endif


smooth out vec3 outPos_W;
smooth out vec3 outEye_W;




uniform vec4 inShieldInfo;



void main()
{


	vec4 usePos = vec4(inPos, 1.0);
	mat4 invV = inverse(inMatV);

	vec4 posW4 = inMatM*usePos;


	outPos_W = posW4.xyz;
	outEye_W = outPos_W-invV[3].xyz;	// World-space for reflections/etc



	//vec4 posW4 = inMatM*vec4(inPos.xyz,1.0);
	//posW4.xyz+=0.01*inTime.x*inNorm;


	//vec4 posT = inMatP*inMatC*inMatV*posW4;
	

	float timer=inFXInfo[0].x;//value from 0.0 to 1.0
	
vec4 posT;

	float degree=clamp((fract(inUV0.x)-timer+fract(inUV0.y)-timer/0.2),0,1);

	//Stripe FX
	float Strp_Thres=inShieldInfo.a;


	posT = inMatP*inMatV*inMatM*vec4(inPos.xyz+
        (1-degree)*inNorm*inFXInfo[0].x*inShieldInfo.z+
           (  0.4f- (1.0f-smoothstep(0,Strp_Thres,     abs(inUV0.y-inFXInfo[0].a))      )    )*inNorm
        , 1.0);

	
	//posT = inMatP*inMatV*inMatM*vec4(inPos.xyz+(1-smoothstep(0,Strp_Thres,abs(inUV0.y-inFXInfo[0].a)))*inNorm*inShieldInfo.z, 1.0);
	
	

	



//old version, no gradient
/*	if(fract(inUV0.x)-timer<=0.1 && fract(inUV0.y)-timer<=0.1)
{
	posT = inMatP*inMatV*inMatM*vec4(inPos.xyz+inFXInfo[0].x*inNorm, 1.0);
}
else
{
		posT = inMatP*inMatV*inMatM*vec4(inPos.xyz, 1.0);
}*/

#ifdef DEPTH_BIAS
	outUV1 = ((posT.xy/posT.w)+1.0)*0.5;
#endif
	
	gl_Position = posT;
	
	vec4 useCol = inFXInfo[0];
	useCol.a = pow(min(1, useCol.a/inAlphaMode.x), inAlphaMode.y);

	
#ifdef FX_SCISSOR
	outScissor = mix(0.5, 1.0-useCol.a, inAlphaMode.y);
#endif

	outCol0 = useCol;
	outUV0 = inUV0;




}