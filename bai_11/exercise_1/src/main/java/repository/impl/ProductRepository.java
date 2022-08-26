package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone", 12.3, "new", "Apple"));
        productList.add(new Product(2, "SamSungG", 10.0, "new", "SamSung"));
        productList.add(new Product(3, "Nokia", 5.0, "old", "Nokia"));
        productList.add(new Product(4, "Bphone", 11.5, "new", "Bphone"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public boolean save(Product product) {
        productList.add(product);
        return true;
    }

    @Override
    public void update(int id, Product product) {
        productList.add(id, product);
    }

    @Override
    public boolean remove(int id) {
        productList.remove(id);
        return true;
    }

    @Override
    public Product findById(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId()==id){
                return productList.get(i);
            }
        }
        return null;
    }

}

