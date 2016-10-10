Shader "Custom/plasma"
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
			uniform vec4 _ScreenParams;
			float time = _Time.x;
			vec2 resolution = vec2(_ScreenParams.x , _ScreenParams.y);

			float plasma(vec2 p) {
				p*=10.0;
				return ((sin(p.x)*0.25+0.25)+(sin(p.y))*0.25+0.25);
			}

			void main() {
				vec2 pos = (gl_FragCoord.xy * 2.0 - resolution) / resolution.y;
				gl_FragColor = vec4(plasma(pos));
			}
			#endif
			ENDGLSL
		}
	}
}
