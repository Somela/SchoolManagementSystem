import { LoginState } from "./action-types/login-type-actions";

export interface ApplicationState {
    loginresponse : LoginState | undefined;
}
export interface AppThunkAction<TAction> {
    (dispatch: (action: TAction) => void, getState: () => ApplicationState): void;
}