package domain;

public class Master {
    // Идентификатор мастера
    private Long id;

    // ФИО мастера
    private String fullName;

    // Наименование должности
    private String post;

    // Номер телефона мастера
    private String phone;

    public Master() {
    }

    public Master(String fullName, String post, String phone) {
        this.fullName = fullName;
        this.post = post;
        this.phone = phone;
    }

    public Master(Long id, String fullName, String post, String phone) {
        this.id = id;
        this.fullName = fullName;
        this.post = post;
        this.phone = phone;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return fullName + "(" + post + ") " + phone;
    }
}
