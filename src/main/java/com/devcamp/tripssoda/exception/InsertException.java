package com.devcamp.tripssoda.exception;

public class InsertException extends Exception{
    public InsertException(){super("Error occurred during inserting payment info");};
    public InsertException(String message){super(message);}
}
