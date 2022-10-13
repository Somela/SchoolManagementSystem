import React from 'react';
import DormitoryComponent from './dormitory';

interface ILoadPagesProps{
    Name:string
}

const LoadPages = (props: ILoadPagesProps) => {
    const findPage = () =>{
        switch(props.Name){
            case 'Dormitory':{
                return <DormitoryComponent Name={props.Name[0]} />
            }
            default:
                return <div></div>
        }
    }
    return (
        <div className='container'>
            {findPage()}
        </div>
    )
}

export default LoadPages;