package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    boolean save(Product product);

    void update(int id, Product product);

    boolean remove(int id);

    Product findById(int id);
}
