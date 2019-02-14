import {h, route, navLink} from 'web-app-tools'
import counter from './counter'
import '../style'

const home = () =>
  <div>
    <h1>It works!</h1>
    <p>This is the default view for this web app.</p>
    <p>Start by editing <code>src/app.jsx</code>!</p>
    <counter />
  </div>

const another = ({q, ...r}) =>
  <div>
    Another screen.
  </div>

export default props =>
  <div>
    <route path="/" exact render={home} />
    <route path="/another" render={another} />
    <nav-link to="/">home</nav-link>
    <nav-link to="/another">another</nav-link>
  </div>
