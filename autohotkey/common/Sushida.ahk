#Requires AutoHotkey v2.0

isSushiMode:=false
ModeSushida(){
    global isSushiMode
    if(isSushiMode){
        MsgBox("通常モードに戻ります。")
    }else{
        MsgBox("寿司打モードに移行します。")
    }
    isSushiMode:=!isSushiMode
}

#HotIf isSushiMode
$l::{
    if(A_PriorKey=="k"){
        SendInput("i")
        return
    }else if(A_PriorKey=="m"){
        SendInput("u")
        return 
    }else if(A_PriorKey=="d"){
        SendInput("e")
        return
    }

    lInput:=InputHook("L1 T0.4","sdfghjkwtrpzvbnm")
    lInput.OnEnd:=lInputCallback 
    lInputCallback(lInput){
        if(lInput.EndReason=="EndKey"){
            SendInput(lInput.EndKey . lInput.EndKey)
        }else{
            SendInput("l" . lInput.Input)
        }
    }

    lInput.Start()
    lInput.Wait()
}

$x::{
    if(A_PriorKey=='n'){
        SendInput("u")
    }else{
        SendInput("x")
    }
}
#HotIf 
