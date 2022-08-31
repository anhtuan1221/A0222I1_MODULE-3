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

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userRepository.insertUserStore(user);
    }

    @Override
    public List<User> selectUser_procedure() {
        return userRepository.selectUser_procedure();
    }

    @Override
    public boolean updateUser_store_procedure(User user) throws SQLException {
        return userRepository.updateUser_store_procedure(user);
    }

    @Override
    public boolean deleteUser_store(int id) throws SQLException {
        return userRepository.deleteUser_store(id);
    }
}
