package com.lge.mams.common.web.entity;

public class Result {

	private boolean valid;
	private String errorMessage;

	private Result(boolean valid, String errorMessage) {
		this.valid = valid;
		this.errorMessage = errorMessage;
	}

	public boolean isValid() {
		return valid;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public static Result success() {
		return new Result(true, null);
	}

	public static Result fail() {
		return new Result(false, null);
	}

	public static Result fail(String errorMessage) {
		return new Result(false, errorMessage);
	}
}