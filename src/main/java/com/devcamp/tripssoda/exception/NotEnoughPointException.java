package com.devcamp.tripssoda.exception;

public class NotEnoughPointException extends Exception{
    public NotEnoughPointException(){super("Not enough user point");};
    public NotEnoughPointException(String message){super(message);};
}
