syscall::sendto*:entry  {
    printf("SENT: sock=%d sockadd=%x buffer[%d]=%s",execname, arg0, arg4, arg2, copyinstr(arg1) );
}

syscall::recv*:entry  {
    printf("RECEIVED: sock=%d sockadd=%x buffer[%d]=%s",arg0, arg3, arg2, copyinstr(arg1) );
}
