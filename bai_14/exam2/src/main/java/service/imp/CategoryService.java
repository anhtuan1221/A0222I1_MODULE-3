package service.imp;

import Repository.ICategoryRepository;
import Repository.imp.CategoryRepository;
import model.Category;
import service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    public ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> findListCategory() {
        return categoryRepository.findListCategory();
    }
}
