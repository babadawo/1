package Exception;

public class ParamErrorException extends Exception{

    String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ParamErrorException() {

    }
}
