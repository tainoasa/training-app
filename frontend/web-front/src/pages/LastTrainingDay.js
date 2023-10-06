import React from 'react';

class LastTrainingDay extends React.Component {
    constructor() {
        super();
        this.state = {
            currentDate: new Date()
        };
    }

    render() {
        const { currentDate } = this.state;

        return (
            <div>
                <h1>現在の日付:</h1>
                <p>{currentDate.toDateString()}</p>
            </div>
        );
    }
}

export default LastTrainingDay;
