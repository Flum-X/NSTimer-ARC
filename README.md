## NSTimer循环引用问题
*  代码重点是说明NSTimer循环引用解决办法，其它方面实现比较随意。
*  在```DXTimer```类中对定时器进行初始化，控制器中只需要对```DXTimer```初始化并在```delloc```方法中调用```DXTimer```的```cleanTimer```释放定时器。
*  ```NSTimer+Block```是```NSTimer```的一个分类，给```NSTimer```新增了一个API，实际初始化一个定时器调用这个新的API。```weakifySelf```这个宏是避免循环引用的关键。
*  ```NSLog```是否打印结果很好的反映了定时器是否被释放。
