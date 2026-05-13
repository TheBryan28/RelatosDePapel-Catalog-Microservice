package com.relatosdepapel.catalog.exception;

public class SupplyNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public SupplyNotFoundException(String message) {
        super(message);
    }
    public SupplyNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }
}
