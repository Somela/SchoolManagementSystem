export interface IMenusList{
    id:number,
    moduleName:string,
    icon:string
}
export const escapeRegExp = (value: string)=> {
    return value.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&');
}

export interface SuccessMessageResponse{
    statusCode:number,
    message:string
}