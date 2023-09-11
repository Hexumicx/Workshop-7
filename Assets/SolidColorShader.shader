﻿//UNITY_SHADER_NO_UPGRADE

Shader "Unlit/SolidColorShader"
{
	Properties
	{
		_Color ("Color", Color) = (1, 1, 1, 1)
	}
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			uniform float4 _Color = {1,1,1,1};

			struct vertIn
			{
				float4 vertex : POSITION;
			};

			struct vertOut
			{
				float4 vertex : SV_POSITION;
			};

			// Implementation of the vertex shader
			vertOut vert(vertIn v)
			{
				vertOut o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}
			
			// Implementation of the fragment (pixel) shader
			fixed4 frag(vertOut v) : SV_Target
			{
				return _Color;
			}
			ENDCG
		}
	}
}
