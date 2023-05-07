package domain;

public class Service {
    // Идентификатор сервиса
    private Long id;

    // Название услуги
    private String title;

    // Стоимость услуги
    private Float price;

    // Продолжиткльность услуги
    private Float duration;

    // Внешний ключ - ссылка на сущность Master
    private Long idMaster;

    // Навигационное свойства - ссылка на мастера
    private Master master;

    public Service() {
    }

    public Service(String title, Float price, Float duration, Master master) {
        this.title = title;
        this.price = price;
        this.duration = duration;
        this.master = master;
    }

    public Service(String title, Float price, Float duration, Long idMaster, Master master) {
        this.title = title;
        this.price = price;
        this.duration = duration;
        this.idMaster = idMaster;
        this.master = master;
    }

    public Service(Long id, String title, Float price, Float duration, Long idMaster, Master master) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.duration = duration;
        this.idMaster = idMaster;
        this.master = master;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDuration() {
        return duration;
    }

    public void setDuration(Float duration) {
        this.duration = duration;
    }

    public Long getIdMaster() {
        return idMaster;
    }

    public void setIdMaster(Long idMaster) {
        this.idMaster = idMaster;
    }

    public Master getMaster() {
        return master;
    }

    public void setMaster(Master master) {
        this.master = master;
    }

    @Override
    public String toString() {
        return "Service {" + "Id = " + id + ", Title = " + title + ", Price = " + price + ", Duration = " + duration + ", Master = " + getMaster() + "}";
    }
}
