import {useLocation} from 'react-router-dom';

 function ComponentB() {

    const location = useLocation();
   
        return (

            <>               
                <div>
                    <br></br>
                    <table border="1">
                        <tr>
                            <td>COURSE CODE</td>
                            <td>COURSE TITLE</td>
                            <td>CREDITS</td>
                        </tr>
                        <tr>
                            <td>{location.state.coursecode}</td>
                            <td>{location.state.coursename}</td>
                            <td>{location.state.credits}</td>
                        </tr>
                    </table>
                    
                </div>

            </>
        )
    }

export default ComponentB;