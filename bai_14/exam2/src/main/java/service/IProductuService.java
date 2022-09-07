package service;

import model.Product;

import java.util.List;

public interface IProductuService {
    public boolean insertProduct(Product product);

    public Product selectProduct(int id);

    public List<Product> selectAllProduct();

    public boolean delete(int id);

    public boolean update(Product product);

    public List<Product> search(String name);
}
