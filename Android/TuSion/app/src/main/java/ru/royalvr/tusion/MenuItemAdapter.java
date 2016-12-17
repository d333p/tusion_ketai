package ru.royalvr.tusion;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by Mazunin Konstantin on 17.12.2016.
 */

public class MenuItemAdapter extends RecyclerView.Adapter<MenuItemAdapter.ViewHolder> {
    private MenuItem[] items;

    public static class ViewHolder extends RecyclerView.ViewHolder {
        ImageView image;
        TextView name;

        public ViewHolder(View itemView) {
            super(itemView);
            image = (ImageView)itemView.findViewById(R.id.menu_item_image);
            name = (TextView)itemView.findViewById(R.id.menu_item_name);
        }
    }

    public MenuItemAdapter(MenuItem[] myDataset) {
        items = myDataset;
    }

    public MenuItemAdapter(List<MenuItem> myDataset) {
        items = myDataset.toArray(items);
    }


    @Override
    public MenuItemAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.menu_list_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        holder.image.setBackgroundResource(items[position].getImageId());
        holder.name.setText(items[position].getName());
    }

    @Override
    public int getItemCount() {
        return items.length;
    }
}