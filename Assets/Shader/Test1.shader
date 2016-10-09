Shader "Custom/Test1" {
	Properties {
		_MainTex("Main Texture", 2D) = "white" {}
	}
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			struct v2f {
				float4 uv  : TEXCOORD0;
			};
			v2f vert(float4 pos: POSITION , out float4 outputs : POSITION) {
				v2f o;
				outputs = mul(UNITY_MATRIX_MVP, pos);
				return o;
			}								
			float4 frag() : COLOR {
				return fixed4(1,0,0,1);
			}
			ENDCG
		}
	}
}
