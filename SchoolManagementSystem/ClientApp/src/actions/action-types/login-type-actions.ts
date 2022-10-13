export enum LoginActions{
    LOGIN_REQUEST="LOGIN_REQUEST",
    LOGIN_SUCCESS = "LOGIN_SUCCESS",
    LOGIN_ERROR = "LOGIN_ERROR"
}

export interface loginResponse{
    message:string,
    email:string,
    fullName:string
    role:string,
    token:string,
    validTo:Date
}


export interface LoginState {
    loginresponse: string[];
    loading: boolean;
    error: string | null;
}

export interface loginTypePending {
    type: LoginActions.LOGIN_REQUEST;
}

export interface loginTypeSuccess {
    type: LoginActions.LOGIN_SUCCESS;
    payload: string[];
}

export interface loginTypeFail {
    type: LoginActions.LOGIN_ERROR;
    payload: string;
}

export type KnownAction = loginTypePending | loginTypeSuccess | loginTypeFail;