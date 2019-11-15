package pojo;

public class Borrow {
    Integer id;
    Integer user_id;
    Integer book_id;


    @Override
    public String toString() {
        return "Borrow{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", book_id=" + book_id +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }
}
