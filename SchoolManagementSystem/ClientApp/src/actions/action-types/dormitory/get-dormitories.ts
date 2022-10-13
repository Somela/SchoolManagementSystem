export enum GetDormitoriesActions{
    GetDormitories_REQUEST="GetDormitories_REQUEST",
    GetDormitories_SUCCESS = "GetDormitories_SUCCESS",
    GetDormitories_ERROR = "GetDormitories_ERROR"
}

export interface DormitoryResponse{
    id:number,
    dormitoryName:string,
    dormitoryDescription:string
}

export interface GetDormitoriesState {
    getDormitoriesresponse: DormitoryResponse[];
    loading: boolean;
    error: string | null;
}

export interface GetDormitoriesTypePending {
    type: GetDormitoriesActions.GetDormitories_REQUEST;
}

export interface GetDormitoriesTypeSuccess {
    type: GetDormitoriesActions.GetDormitories_SUCCESS;
    payload: DormitoryResponse[];
}

export interface GetDormitoriesTypeFail {
    type: GetDormitoriesActions.GetDormitories_ERROR;
    payload: string;
}

export type KnownAction = GetDormitoriesTypePending | GetDormitoriesTypeSuccess | GetDormitoriesTypeFail;