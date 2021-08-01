#ifdef FX_SCISSOR
smooth in float outScissor;
#endif

smooth in vec4 outCol0;
smooth in vec2 outUV0;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;


uniform sampler2D inTexDiff;
uniform sampler2D inTexGlow;


uniform vec4 inFXInfo[2];
uniform vec4 inShieldInfo;


layout (location = 0) out vec4 finalCol0;

#ifdef DEPTH_BIAS
smooth in vec2 outUV1;
uniform sampler2D inTexDepth;
uniform vec4 inDepth;

float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));
	return ret;
}
#endif


void main()
{




	vec4 fxTex = texture(inTexDiff, outUV0);
	vec4 glowTex=texture(inTexGlow, outUV0);
	
#ifdef FX_SCISSOR
	if (fxTex.a < outScissor)
	{
		discard;
	}
#endif

	fxTex.rgb *= 2.0;
	vec4 fxCol = fxTex*outCol0;


#ifdef DEPTH_BIAS
	float biasWindow = 5.0;
	float depthB = linearize(texture(inTexDepth, outUV1).x);
	float depthF = linearize(gl_FragCoord.z);
	float depthO = clamp((depthB-depthF)/biasWindow, 1.0-inFXInfo[1].y, 1.0);
	
	// This isn't correct (darking RGB on alpha blend) - but it _looks_ great with most alpha textures
	// Smoke grows dark against surfaces as it fades, etc.  So let's keep it...
	fxCol.rgb = fxCol.rgb*depthO;

	// This is the correct math - which we'll disable
	//fxCol.rgb = mix(fxCol.rgb*depthO, fxCol.rgb, inFXInfo[1].x);
	
	fxCol.a = mix(fxCol.a, fxCol.a*depthO, inFXInfo[1].x);
#endif

	float timer=inFXInfo[0].x;//value from 0.0 to 1.0
	
	//Stripe FX
	float Strp_Thres=inShieldInfo.a;
	
	finalCol0.rgb+=1.6*glowTex.rgb*(1-smoothstep(0,Strp_Thres,abs(outUV0.y-inFXInfo[0].a)));
	


	float uvFlipX=fract(inShieldInfo.x*fract(outUV0.x));
	float uvFlipY=fract(inShieldInfo.y*(outUV0.y));
	if(uvFlipX>0.5) uvFlipX=1-uvFlipX;
	if(uvFlipY>0.5) uvFlipY=1-uvFlipY;

	float valX=uvFlipX-timer,valY=uvFlipY-timer;

//	float rate=(valX+valY);

//	finalCol0=  clamp(fxCol*(1-rate)+glowTex*rate,0.0,1.0);

	float Thres=0.1;
	float degree=clamp((valX+valY),0,1);
	finalCol0+= fxTex*(1-degree)*1.2+glowTex*(degree);


/*	if(  (valX>=Thres || valY>=Thres)   )
{
		finalCol0= 0.5*fxTex+glowTex;
}
	else
{
	finalCol0 = fxTex;
}*/


}
