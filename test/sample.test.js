import app from '../src/app'

test('Given top level component, should render', () => {
  expect(typeof(app())).toEqual('object')
})
