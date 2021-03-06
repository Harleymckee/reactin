import React, {Component, createElement} from 'react'
import { Editor } from 'slate-react'
import { Value } from 'slate'

const initialValue = Value.fromJSON({
  document: {
    nodes: [
      {
        object: 'block',
        type: 'paragraph',
        nodes: [
          {
            object: 'text',
            leaves: [
              {
                text: 'A line of text in a paragraph. dingus',
              },
            ],
          },
        ],
      },
    ],
  },
})

class HelloWorld extends Component {
  constructor(props) {
    super(props)
    this.state = {
      value: initialValue,
    }
  }

  onChange({value}) {
    this.setState({value})
  }

  render() {
    return <div>
      <Editor value={this.state.value} onChange={this.onChange.bind(this)} />
    </div>
  }
}

export default HelloWorld
