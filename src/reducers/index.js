import * as C from '../constants'

const initialState = {
  count: 0
}

export default (state = initialState, action) => {
  switch (action.type) {
    case C.INCREMENT:
      return state.count + 1
    
    case C.DECREMENT:
      return state.count - 1
    
    case C.RESET:
      return 0
    
    default:
      return state;
  }
};
