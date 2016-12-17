package ru.royalvr.tusion.scene;

import processing.core.PApplet;

/**
 * Created by Mazunin Konstantin on 17.12.2016.
 */
public class FirstScene extends PApplet {
    public void settings() {
        size(800, 800);
    }

    public void setup() {

    }

    public void draw() {
        if (mousePressed) {
            ellipse(mouseX, mouseY, 50, 50);
        }
    }
}