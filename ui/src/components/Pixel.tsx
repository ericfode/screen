import React, { Component, useState } from 'react';
import { render } from 'react-dom';
import { Group ,Stage, Layer, Rect, Text } from 'react-konva';
import Konva from 'konva';


// Declare interface for a single pixel
export interface Pixel {
    x: number;
    y: number;
    color: string;
}

export const APixel = ({ x, y, color }: Pixel) => {
    return (
    <Rect
        x={x*50}
        y={y*50}
        width={50}
        height={50}
        fill={color}
        shadowBlur={5}
    />);
};

export const Pixels = ({ screenState }: { screenState: Array<Array<Number>> }) => {
    const pixels = screenState.flatMap((row, i) => {
                    return row.map((pixel, j) => {
                        if (pixel == 0) {
                            return (<APixel key={i*10+j} x={j} y={i} color={"black"} />);
                        }
                        else {
                            return (<APixel key={i*10+j} x={j} y={i} color={"white"} />);
                        }
                    });
            });
    return (
    <Group>
       {pixels} 
    </Group>)
        };
/*
      {
                
*/
export const AScreen = ({ screenState }: { screenState: Array<Array<Number>> }) => {
    return (
        <Stage width={window.innerWidth} height={window.innerHeight}>
            <Layer>
                <Pixels screenState={screenState} />
            </Layer>
        </Stage>
    );
};