##### TV 焦点问题

- recycleview-itme获取焦点

  ```kotlin
  manager.findViewByPosition(adapter.getCurrentPosition())?.apply {
  	requestFocusFromTouch()
  	requestFocus()
  } 
  ```

- 控件获取焦点失败

  ```kotlin
  // 解决requestFocus()不生效的问题
  requestFocusFromTouch()
  ```

##### RecyclerView问题

- recycleview 居中

  ```kotlin
  // 如果你想让rv整体居中，rv的item又是动态的，且你的刷新方式不是notifyDataSetChanged()的时候，如下设置
  // 原因是：当我们确定Item的改变不会影响RecyclerView的宽高的时候可以设置setHasFixedSize(true)，并通过Adapter的增删改插方法去刷新RecyclerView，而不是通过notifyDataSetChanged()。（其实可以直接设置为true，当需要改变宽高的时候就用notifyDataSetChanged()去整体刷新一下）
  setHasFixedSize(false)
  ```

  