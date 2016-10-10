Shader "Custom/GLSLSample"
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
			uniform vec4 _Time;
			void main() {
				vec4 color;
				color.x = (sin(_Time.x * 10)+ 1.0) * 0.5;
				gl_FragColor = color;
			}
			#endif
			ENDGLSL
		}
	}
}
