package com.devcamp.tripssoda.exception;

public class ExceedMaxMemberException  extends Exception{
    public ExceedMaxMemberException(){super("Max member is already exceeded");};
    public ExceedMaxMemberException(String message){super(message);}
}
