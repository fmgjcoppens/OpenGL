#!/usr/bin/bash

GLSLC=/usr/bin/glslc

$GLSLC shader.vert -o vert.spirv
$GLSLC shader.frag -o frag.spirv
