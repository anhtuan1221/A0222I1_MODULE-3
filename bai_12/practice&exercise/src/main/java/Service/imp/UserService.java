package Service.imp;

import Model.User;
import Repository.IUserRepository;
import Repository.imp.UserRepository;
import Service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return  userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> searchUser(String name) {
        return userRepository.search(name);
    }

    @Override
    public List<User> sortByName() {
       return userRepository.sortByName();
    }
}
