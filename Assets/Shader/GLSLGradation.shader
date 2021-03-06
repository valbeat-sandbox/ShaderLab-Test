﻿Shader "Custom/GLSLGradation"
{
	SubShader
	{
		Pass
		{
			GLSLPROGRAM
			#ifdef VERTEX
			void main() {
				gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
			}
			#endif

			#ifdef FRAGMENT
			uniform vec4 _ScreenParams;
			vec2 resolution = vec2(_ScreenParams.x , _ScreenParams.y);
			void main() {
				vec2 pos = (gl_FragCoord.xy * 2.0 - resolution) / resolution.y;
				gl_FragColor = vec4(pos, 0.0, 1.0);
			}
			#endif
			ENDGLSL
		}
	}
}
