package service.imp;

import Model.Product;
import repository.IProductRepository;
import repository.imp.ProductRepository;
import service.IProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    public IProductRepository productRepository = new ProductRepository();

    @Override
    public boolean insertProduct(Product product) {
        productRepository.insertProduct(product);
        return true;
    }

    @Override
    public Product selectProduct(int id) {
        return productRepository.selectProduct(id);
    }

    @Override
    public List<Product> selectAllProduct() {
        return productRepository.selectAllProduct();
    }

    @Override
    public boolean delete(int id) {
        return productRepository.delete(id);
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        return productRepository.updateProduct(product);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> search(String name) {
        return productRepository.search(name);
    }


}
