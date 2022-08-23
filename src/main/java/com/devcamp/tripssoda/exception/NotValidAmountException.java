package com.devcamp.tripssoda.exception;

public class NotValidAmountException extends Exception{
    public NotValidAmountException(){super("Not valid pay amount");};
    public NotValidAmountException(String message){super(message);};

}
