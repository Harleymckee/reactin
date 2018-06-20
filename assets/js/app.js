import 'babel-polyfill'
import 'phoenix_html'
import '../css/app.scss'

import {hydrateClient} from 'react_render/priv/client'
import HelloWorld from './HelloWorld'

function getComponentFromStringName(stringName) {
  // Map string component names to your react components here
  if (stringName === 'HelloWorld') {
    return HelloWorld
  }

  return null
}

hydrateClient(getComponentFromStringName)