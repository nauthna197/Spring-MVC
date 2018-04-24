package com.fastfood.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private static final int LIMIT_ITEMS = 10;

    private static  final  int MIN_ITEMS = 1;

    private List<OrderDetail> items;

    public Cart(){
        items = new ArrayList<OrderDetail>();
    }

    public List<OrderDetail> getOrderDetails(){return items;}

    public void add(Product product) {
        OrderDetail item = new OrderDetail();
        item.setProduct(product);
        item.setQuantity(1);
        // check item exist
        for (OrderDetail e : items) {
            if (e.getProduct().getId() == product.getId()) {
                if (e.getQuantity() + 1 <= LIMIT_ITEMS) {
                    e.setQuantity(e.getQuantity() + 1);
                } else {
                    e.setQuantity(LIMIT_ITEMS);
                }
                return;
            }
        }
        items.add(item);
    }

    public void update(Product product) {
        OrderDetail item = new OrderDetail();
        item.setProduct(product);
        item.setQuantity(1);
            // check item exist
            for (OrderDetail e : items) {
                if (e.getProduct().getId() == product.getId()) {
                    if (e.getQuantity() - 1 >=MIN_ITEMS) {
                        e.setQuantity(e.getQuantity()-1);
                    } else {
                        e.setQuantity(MIN_ITEMS);
                    }
                    return;
                }
            }
        items.add(item);
    }

    public void remove(int id) {
        for (OrderDetail e : items) {
            if (e.getProduct().getId() == id) {
                items.remove(e);
                return;
            }
        }
    }

    public int getCount() {
        return items.size();
    }


    public int getTotal() {
        int total = 0;
        for (OrderDetail e : items) {
            total += (e.getProduct().getPrice() * e.getQuantity());
        }
        return total;
    }

    public List<OrderDetail> getItems() {
        return items;
    }

    public void setItems(List<OrderDetail> items) {
        this.items = items;
    }

    public static int getLimitItems() {
        return LIMIT_ITEMS;
    }
}
