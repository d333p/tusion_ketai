package ru.royalvr.tusion;

/**
 * Created by Mazunin Konstantin on 17.12.2016.
 */

public class MenuItem {
    private int imageId;
    private String name;

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MenuItem(int imageId, String name) {
        this.imageId = imageId;
        this.name = name;
    }
}
