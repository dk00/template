import {h, useSharedState} from 'web-app-tools'

const counter = () => {
  const [count, setCount] = useSharedState('count', 0)
  return (
    <div>
      <button onClick={() => setCount(count - 1)}>-</button>
      {count}
      <button onClick={() => setCount(count + 1)}>+</button>
    </div>
  )
}

export default counter
