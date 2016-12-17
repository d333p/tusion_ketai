package ru.royalvr.tusion;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.view.View;

import processing.core.PApplet;

public class MenuActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        RecyclerView.LayoutManager manager = new StaggeredGridLayoutManager(2,  StaggeredGridLayoutManager.VERTICAL);
        MenuItem[] data = {new MenuItem(R.drawable.first, "Сцена номер один")};
        RecyclerView.Adapter adapter = new MenuItemAdapter(data);
        RecyclerView list = (RecyclerView) findViewById(R.id.menu_list);
        list.setAdapter(adapter);
        list.setLayoutManager(manager);
        startActivity(new Intent(MenuActivity.this, SceneActivity.class));
    }
}
