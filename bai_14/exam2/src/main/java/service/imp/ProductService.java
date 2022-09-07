package service.imp;

import Repository.IProductRepository;
import Repository.imp.ProductRepository;
import model.Product;
import service.IProductuService;

import java.util.List;

public class ProductService implements IProductuService {
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
    public boolean update(Product product) {
        return productRepository.update(product);
    }

    @Override
    public List<Product> search(String name) {
        return productRepository.search(name);
    }
}
