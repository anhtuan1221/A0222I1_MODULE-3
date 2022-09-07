package repository;

import Model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {
    public boolean insertProduct(Product product);

    public Product selectProduct(int id);

    public List<Product> selectAllProduct();

    public boolean delete(int id);

    public boolean updateProduct(Product product) throws SQLException;

    public Product findById(int id);

    public List<Product> search(String name);


}