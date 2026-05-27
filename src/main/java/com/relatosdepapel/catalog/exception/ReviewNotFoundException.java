package com.relatosdepapel.catalog.exception;

public class ReviewNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ReviewNotFoundException(String message) {
        super(message);
    }

    public ReviewNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
