Shader "Custom/TextureMult" {
	Properties {
		_MainTex ("Main (RGB)", 2D) = "white" {}
		_SubTex ("Sub (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#pragma target 3.0

		uniform sampler2D _MainTex;
		uniform sampler2D _SubTex;
		uniform float4 _MainTex_ST;
		uniform float4 _SubTex_ST;

		struct v2f {
			float4 wpos : POSITION;
			float2 uv : TEXCOORD0;
		};

        v2f vert(float4 pos : POSITION , float2 uv : TEXCOORD0) {
        	v2f o;
		    o.wpos = mul(UNITY_MATRIX_MVP,pos);
		    o.uv = float2(uv.xy * _MainTex_ST.xy * _SubTex_ST.xy + _MainTex_ST.zw + _SubTex_ST.zw);
		    return o;
		}
		float4 frag(v2f i) : COLOR {
			float4 mainTex = tex2D(_MainTex, i.uv);
			float4 subTex  = tex2D(_SubTex, i.uv);
			return mainTex * subTex;
		}
		ENDCG
		}
	}
	FallBack "Diffuse"
}
