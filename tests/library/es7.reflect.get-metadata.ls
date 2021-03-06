{module, test} = QUnit
module \ES7

test 'Reflect.getMetadata' (assert)!->
  {defineMetadata, getMetadata} = core.Reflect
  {create} = core.Object
  assert.isFunction getMetadata
  assert.arity getMetadata, 2
  assert.throws (!-> getMetadata \key void void), TypeError
  assert.same getMetadata(\key {}, void), void
  obj = {}
  defineMetadata \key \value obj, void
  assert.same getMetadata(\key obj, void), \value
  prototype = {}
  obj = create prototype
  defineMetadata \key \value prototype, void
  assert.same getMetadata(\key obj, void), \value
  assert.same getMetadata(\key {}, \name), void
  obj = {}
  defineMetadata \key \value obj, \name
  assert.same getMetadata(\key obj, \name), \value
  prototype = {}
  obj = create prototype
  defineMetadata \key \value prototype, \name
  assert.same getMetadata(\key obj, \name), \value