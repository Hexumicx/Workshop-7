// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/VertexColorShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			uniform float4 _Color;

			struct vertIn
			{
				float4 vertex : POSITION;
                float4 color : COLOR;
			};

			struct vertOut
			{
				float4 vertex : SV_POSITION;
                float4 color : COLOR;
			};

			// Implementation of the vertex shader
			vertOut vert(vertIn v)
			{
				vertOut o;
				o.vertex = UnityObjectToClipPos(v.vertex);
                o.color = v.color;
				return o;
			}
			
			// Implementation of the fragment (pixel) shader
			fixed4 frag(vertOut v) : SV_Target
			{
				return v.color;
			}
			ENDCG
        }
    }
}
