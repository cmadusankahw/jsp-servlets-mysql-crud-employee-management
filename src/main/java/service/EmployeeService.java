package service;
import entity.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {
    Connection connection= DBConnection.getInstance().getConnection();
    public boolean insertData(Employee employee) {
        String sql = "insert into employee (first_name,last_name,address,mobile_no,age) values (?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, employee.getFirstName());
            statement.setString(2, employee.getLastName());
            statement.setString(3, employee.getAddress());
            statement.setString(4, employee.getMobileNo());
            statement.setInt(5,(int) employee.getAge());
            int records=statement.executeUpdate();
            System.out.println(records>0);
            return (records>0);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public boolean deleteData(int empId){
        String sql="delete from employee where emp_id=?";
        try {
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setInt(1,empId);
            return statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
    public boolean updateData(Employee employee){
        System.out.println(employee);
        String sql = "UPDATE employee SET first_name = ?, last_name = ?, address = ?, mobile_no = ?, age = ?  where emp_id=?";
        try {
            PreparedStatement statement=connection.prepareStatement(sql);
            statement.setString(1, employee.getFirstName());
            statement.setString(2, employee.getLastName());
            statement.setString(3, employee.getAddress());
            statement.setString(4, employee.getMobileNo());
            statement.setInt(5, employee.getAge());
            statement.setInt(6, employee.getEmpId());
            return statement.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
    public List<Employee> listAllData(){
        List<Employee> list=new ArrayList<>();
        String sql="select * from employee;";
        try {
            Statement statement=connection.createStatement();
            ResultSet result=statement.executeQuery(sql);
            while (result.next()){
                System.out.println(result.getString(2));    // check constructor
                list.add(new Employee(result.getInt(1),result.getString(2),result.getString(3),result.getString(4), result.getString(5), Integer.parseInt(result.getString(6))));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        return list;
    }
}
