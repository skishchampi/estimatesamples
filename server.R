
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(DT)

shinyServer(function(input, output) {

  output$samples <- renderDataTable({

  a <- as.numeric(input$alpha)
  t <- input$tail
  b <- as.numeric(input$beta)
  p1 <- as.numeric(input$p1/100)
  pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
  pone_c <- rep(as.numeric(input$p1/100),each=5)
  p2 <- as.numeric(input$p2/100)
  ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
  ptwo_c <- rep(as.numeric(input$p2/100),each=5)
  r <- as.numeric(input$r)
  
  if(input$tail == "one"){
    z0 = c2(a)
  }else{
    z0 = c1(a)
  }
  z1 = c2(b)

  formb1value = abs(p2-p1)
  formb2value = (p1+r*p2)/(r+1)
  formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
  m = mm(formb1value, r, formb3value)
  
  N = round(1 + r)*m
  
  formb6value = pz(z0)
  formb7value = pz(z1)
  
  df <- data.frame(cbind(p1, p2, a, b, N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
  
  colnames(df) <- c("P1","P2","Alpha", "Beta","Samples", "Days", "Weeks", "Months")
  
  datatable(df,options = list(dom='t'))

  })
  
  output$pOne <- renderDataTable({
    
    a <- as.numeric(input$alpha)
    t <- input$tail
    b <- as.numeric(input$beta)
    p1 <- as.numeric(input$p1/100)
    pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    
    if(input$tail == "one"){
      z0 = c2(a)
    }else{
      z0 = c1(a)
    }
    z1 = c2(b)
    
    df <- data.frame()
    for(i in ptwo){
      formb1value = abs(i-p1)
      formb2value = (p1+r*i)/(r+1)
      formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(p1, i, N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("P1","P2", "Samples", "Days", "Weeks", "Months")
    
    datatable(df, extensions = 'TableTools', options = list(
      dom = 'T<"clear">t',
      tableTools = list(sSwfPath = copySWF('www'))
    ))
  })
  output$plot_pOne <- renderPlot({
    
    a <- as.numeric(input$alpha)
    t <- input$tail
    b <- as.numeric(input$beta)
    p1 <- as.numeric(input$p1/100)
    pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    
    if(input$tail == "one"){
      z0 = c2(a)
    }else{
      z0 = c1(a)
    }
    z1 = c2(b)
    
    df <- data.frame()
    for(i in ptwo){
      formb1value = abs(i-p1)
      formb2value = (p1+r*i)/(r+1)
      formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(p1, i, N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("P1","P2", "Samples", "Days", "Weeks", "Months")
    
    p <- ggplot(data=df, aes(x=P2, y =Weeks))
    p + geom_bar(stat = "identity")
  }
    
  )
  output$pTwo <- renderDataTable({
    
    a <- as.numeric(input$alpha)
    t <- input$tail
    b <- as.numeric(input$beta)
    p1 <- as.numeric(input$p1/100)
    pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    
    if(input$tail == "one"){
      z0 = c2(a)
    }else{
      z0 = c1(a)
    }
    z1 = c2(b)
    
    df <- data.frame()
    for(i in pone){
      formb1value = abs(p2-i)
      formb2value = (i+r*p2)/(r+1)
      formb3value = round(m(z0, z1, i, i, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(i, p2, N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("P1","P2", "Samples", "Days", "Weeks", "Months")
    
    datatable(df, extensions = 'TableTools', options = list(
      dom = 'T<"clear">t',
      tableTools = list(sSwfPath = copySWF('www'))
    ))
  })
  output$plot_pTwo <- renderPlot({
    
    a <- as.numeric(input$alpha)
    t <- input$tail
    b <- as.numeric(input$beta)
    p1 <- as.numeric(input$p1/100)
    pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    
    if(input$tail == "one"){
      z0 = c2(a)
    }else{
      z0 = c1(a)
    }
    z1 = c2(b)
    
    df <- data.frame()
    for(i in pone){
      formb1value = abs(p2-i)
      formb2value = (i+r*p2)/(r+1)
      formb3value = round(m(z0, z1, i, i, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(i, p2, N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("P1","P2", "Samples", "Days", "Weeks", "Months")
    

    
    p <- ggplot(data=df, aes(x=P1, y =Weeks))
    p + geom_line(stat = "identity")
  })
  output$alpha <- renderDataTable({
    
    a <- as.numeric(input$alpha)
    #alpha <- c(0.01,0.025,0.05,0.1)
    t <- input$tail
    #b <- as.numeric(input$beta)
    b <- c(0.05,
           0.1,
           0.2,
           0.25)
    p1 <- as.numeric(input$p1/100)
    #     pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    #     pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    #     ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    #     ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    df = data.frame()
    for(i in b){
      if(input$tail == "one"){
        z0 = c2(a)
      }else{
        z0 = c1(a)
      }
      z1 = c2(i)
      
      formb1value = abs(p2-p1)
      formb2value = (p1+r*p2)/(r+1)
      formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(i,N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("Beta", "Samples", "Days", "Weeks", "Months")
    
    datatable(df, extensions = 'TableTools', options = list(
      dom = 'T<"clear">t',
      tableTools = list(sSwfPath = copySWF('www'))
    ))
  })
  output$plot_alpha <- renderPlot({
    
    a <- as.numeric(input$alpha)
    #alpha <- c(0.01,0.025,0.05,0.1)
    t <- input$tail
    #b <- as.numeric(input$beta)
    b <- c(0.05,0.1,0.2,0.25)
    p1 <- as.numeric(input$p1/100)
    #     pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    #     pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    #     ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    #     ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    df = data.frame()
    for(i in b){
      if(input$tail == "one"){
        z0 = c2(a)
      }else{
        z0 = c1(a)
      }
      z1 = c2(i)
      
      
      formb1value = abs(p2-p1)
      formb2value = (p1+r*p2)/(r+1)
      formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(i,N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("Beta", "Samples", "Days", "Weeks", "Months")
    
    p <- ggplot(data=df, aes(x=Beta, y =Weeks))
    p + geom_line(stat = "identity")
  })
  output$beta <- renderDataTable({
    
    # a <- as.numeric(input$alpha)
    a <- c(0.01,0.025,0.05,0.1)
    t <- input$tail
    b <- as.numeric(input$beta)
    p1 <- as.numeric(input$p1/100)
#     pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
#     pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
#     ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
#     ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    df = data.frame()
    for(i in a){
    if(input$tail == "one"){
      z0 = c2(i)
    }else{
      z0 = c1(i)
    }
    z1 = c2(b)
    
      formb1value = abs(p2-p1)
      formb2value = (p1+r*p2)/(r+1)
      formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(i,N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("Alpha", "Samples", "Days", "Weeks", "Months")
    
    datatable(df, extensions = 'TableTools', options = list(
      dom = 'T<"clear">t',
      tableTools = list(sSwfPath = copySWF('www'))
    ))
  })
  output$plot_beta <- renderPlot({
    
    #a <- as.numeric(input$alpha)
    a <- c(0.01,0.025,0.05,0.1)
    t <- input$tail
    b <- as.numeric(input$beta)
    #b <- c(0.05,0.1,0.2,0.25)
    p1 <- as.numeric(input$p1/100)
    #     pone <- seq(as.numeric(input$p1/100),as.numeric(input$p1/100)+0.05,by=0.01)
    #     pone_c <- rep(as.numeric(input$p1/100),each=5)
    p2 <- as.numeric(input$p2/100)
    #     ptwo<- seq(as.numeric(input$p2/100),as.numeric(input$p2/100)+0.05,by=0.01)
    #     ptwo_c <- rep(as.numeric(input$p2/100),each=5)
    r <- as.numeric(input$r)
    df = data.frame()
    for(i in a){
      if(input$tail == "one"){
        z0 = c2(i)
      }else{
        z0 = c1(i)
      }
      z1 = c2(b)
      

      formb1value = abs(p2-p1)
      formb2value = (p1+r*p2)/(r+1)
      formb3value = round(m(z0, z1, p1, p1, formb1value, r, formb2value))
      m = mm(formb1value, r, formb3value)
      
      N = round(1 + r)*m
      
      formb6value = pz(z0)
      formb7value = pz(z1)
      df <- rbind(df,cbind(i,N, (N/input$ph)*5,N/input$ph, ((N/input$ph))/4))
    }
    colnames(df) <- c("Alpha", "Samples", "Days", "Weeks", "Months")
    
    p <- ggplot(data=df, aes(x=Alpha, y =Weeks))
    p + geom_line(stat = "identity")
  })
   pz <- function(z){
    
    a=abs(z)
    
    if (z == 0.0) {
      x = 0.5 
    } else {
      if (z>9) {
        return (1.0)
      } 
      else{
        t=1/(1+0.2316419*a)
        y=exp(-((a^2)/2))/sqrt(2*pi)  
        w=0.31938153*t-0.356563782*(t^2)+1.78147937*(t^3)-1.821255978*(t^4)+1.330274429*(t^5)
      }
      if (z>0) {
        x=1-y*w
      }
      else {
        x=y*w
      }
    }
    return (x)
  }
  
  m <- function(B5,B6,B7,B8,B9,B10,B11) {
    
    m1=(((B5*sqrt((B10+1)*B11*(1-B11))+B6*sqrt(B10*B7*(1-B7)+B8*(1-B8)))^2)/(B10*(B9^2)))
    #cat(m1)
    return (m1)
  }
  
  mm <- function(B9,B10,B12) {
    
    m2=floor(0.5+(B12/4)*((1+sqrt(1+2*(B10+1)/(B10*B12*B9)))^2))
    return (m2)
  }
  
  #two tails total area = a => critical point on right
  
   c1 <- function(a) {
    z = 1/2
    j = 1/2
    
    k = a/2
    d <- c(0.25,0.125,0.0625,0.03125,0.015625,0.0078125,0.00390625,0.001953125,0.0009765625,0.00048828125,0.000244140625,0.0001220703125,0.00006103515625,0.000030517578125,0.0000152587890625,0.00000762939453125,0.000003814697265625,0.0000019073486328125)
    for(i in d) { 
      y=1/j-1  
      if(pz(y)<=(1-k)) { 
        j=j-i
      } else { 
        j=j+i 
      }
    } 
    if (a<=0 || a>=1) { 
      h="infinite"
    } else {
      h=y
    }
    return (h)
  }
  
  #one tails total left area = b => critical point
  
  c2 <- function(b) {
    
    z = 1/2
    j = 1/2
    
    f=1-b
    if  (f>1/2) {
      n=1-f
    } else {
      n=f
    }
    d <- c(0.25,0.125,0.0625,0.03125,0.015625,0.0078125,0.00390625,0.001953125,0.0009765625,0.00048828125,0.000244140625,0.0001220703125,0.00006103515625,0.000030517578125,0.0000152587890625,0.00000762939453125,0.000003814697265625,0.0000019073486328125)
    for(q in d) { 
      l=1/z-1  
      if(pz(l)<=(1-n)) { 
        z=z-q
      } else { 
        z=z+q
      } 
    } 
    if (b<=0 || b>=1) { 
      m="infinite"} 
    else{
      if (f<0.5) { 
        m=-l
      } else {
        m=l
      }
    }
    return (m)
  }
  
})
