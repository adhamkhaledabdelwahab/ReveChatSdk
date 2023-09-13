package kh.ad.reve_chat_sdk;

import java.util.HashMap;

public class UserModel {
    private final String email;
    private final String name;
    private final String phoneNumber;

    private UserModel(String email, String name, String phoneNumber) {
        this.email = email;
        this.name = name;
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    static UserModel fromMap(HashMap<String, ?> json) {
        String name = (String) json.get("username");
        String email = (String) json.get("userEmail");
        String phoneNumber = (String) json.get("phoneNumber");
        return new UserModel(
                email,
                name,
                phoneNumber
        );
    }
}
