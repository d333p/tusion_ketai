package ru.royalvr.tusion;

import android.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import processing.android.PFragment;
import processing.core.PApplet;
import ru.royalvr.tusion.scene.FirstScene;

public class SceneActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_scene);
        FragmentManager fragmentManager = getFragmentManager();
        PApplet sketch = new FirstScene();
        PFragment fragment = new PFragment();
        fragment.setSketch(sketch);
        fragmentManager.beginTransaction()
                .replace(R.id.scene_frame, fragment)
                .commit();
    }
}
