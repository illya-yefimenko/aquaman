import React from 'react'

export default class Test extends React.Component {
    
    constructor(props) {
        super(props)
        this.state = { time: null }
    }
    
    componentDidMount() {
        this.myownupdatemethod()
    }
    
    myownupdatemethod() {
        this.timer = setTimeout(()=>{ this.setState({time: new Date()}, ()=>{this.myownupdatemethod()})}, 1000)
    }

    render() {
        return (
            <div>Hello World! {this.props.greeting} = {this.state.time && this.state.time.toString()}</div>
        )
    }

}
