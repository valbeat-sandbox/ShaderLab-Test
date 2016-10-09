Shader "Custom/Texture" {
	Properties {
		_MainTex("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			uniform sampler2D _MainTex;

			struct v2f {
				float4 uv  : TEXCOORD0;
				float4 wpos : SV_POSITION;
			};
			v2f vert(float4 pos: POSITION , float4 uv : TEXCOORD0) {
				v2f o;
				o.wpos = mul(UNITY_MATRIX_MVP, pos);
				o.uv = uv;
				return o;
			}			
								
			float4 frag(v2f img) : COLOR {
				float4 tex = tex2D(_MainTex, img.uv);
				return tex;
			}
			ENDCG
		}
	}
}
