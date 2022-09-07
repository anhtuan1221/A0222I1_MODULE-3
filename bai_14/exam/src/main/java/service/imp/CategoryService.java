package service.imp;

import Model.Category;
import repository.ICategoryRepository;
import repository.IProductRepository;
import repository.imp.CategoryRepository;
import repository.imp.ProductRepository;
import service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    public ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    public List<Category> findListCategory() {
        return categoryRepository.findListCategory();
    }
}
