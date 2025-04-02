package s380f.gp.s380f.model;

import jakarta.persistence.*;
import org.h2.table.Table;

@Entity
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;
  @Column(name = "name")
  private String username;
  private String password;
  private String name;
  private String email;
  private String phoneNumber;
  private String role;

  public User(String username, String password, String name, String email, String phone, String role) {
    this.username = username;
    this.password = password;
    this.name = name;
    this.email = email;
    this.phoneNumber = phone;
    this.role = role;
  }
  public long getId() {
    return id;
  }

  public String getUsername() {
    return username;
  }

  public String getPassword() {
    return password;
  }

  public String getName() {
    return name;
  }

  public String getEmail() {
    return email;
  }

  public String getPhoneNumber() {
    return phoneNumber;
  }

  public String getRole() {
    return role;
  }

  public void setId(long id) {
    this.id = id;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  public void setRole(String role) {
    this.role = role;
  }
  // setters of all properties
}
