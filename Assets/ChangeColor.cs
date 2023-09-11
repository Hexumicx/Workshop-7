using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeColor : MonoBehaviour
{
    [SerializeField] private float frequency = 1f;
    [SerializeField] private Color _Color;
    // Start is called before the first frame update
    private Material _Material;
    void Start()
    {
        _Material = GetComponent<MeshRenderer>().material;
    }

    // Update is called once per frame
    void Update()
    {
        var t = Time.time * frequency % 1.0f;
        _Color = Color.HSVToRGB(t, 1, 1);
        _Material.SetColor("_Color", _Color);
    }   

}
