import * as C from '../constants'

const initialState = {
  count: 0
}

export default (state = initialState, action) => {
  switch (action.type) {
    case C.INCREMENT:
      return {count: state.count + 1}
    
    case C.DECREMENT:
      return {count: state.count - 1}
    
    case C.RESET:
      return {count: 0}
    
    default:
      return state;
  }
};
