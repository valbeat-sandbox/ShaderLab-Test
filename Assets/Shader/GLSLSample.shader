Shader "Custom/GLSLSample"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
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
			void main() {
				gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
			}
			#endif
			ENDGLSL
		}
	}
}
