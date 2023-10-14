#' Classification Based on Four Classes
#'
#' @param data
#' @details This function returns a dataset named "data" in which includes an additional column that classifies the COICOP code for each code based on Durable, Semi-Durable, Non-Durable and Service goods.
#' @return
#' @export
#'
#' @examples
classified_data <- function(data){
  if(nrow(data)>10){
    empty <- data.frame(matrix(ncol = ncol(data), nrow = 10))
  }else{
    empty <- data.frame(matrix(ncol = ncol(data), nrow = nrow(data)))
  }

  colnames(empty) <- colnames(data)

  for(i in 1:ncol(empty)){
    for(a in 1:nrow(empty)){
      if(grepl("^([1-9][0-9][0-9][0-9]|1[0-9][0-9][0-9][0-9])$",data[a,i])){
        colname <- colnames(data)[i]
        next
      }else{
        break
      }
    }
  }

  col_1 <- as.numeric(which(colnames(data)==colname))

  d_4 <- base_1 |> dplyr::filter(nchar(base_1[,2])<4) |> dplyr::slice(-c(1,2,53,54))
  d_5 <- base_1 |> dplyr::filter(nchar(base_1[,2])==4)
  d_4_0 <- d_4 |> dplyr::filter(substr(HBS, start = nchar(HBS), stop  = nchar(HBS))==0)
  d_5_0 <- d_5 |> dplyr::filter(substr(HBS, start = nchar(HBS), stop  = nchar(HBS))==0)

  data[,ncol(data)+1] <- data.frame(class_4 = as.character(0))

  for (i in 1:nrow(data)) {

    if(nchar(data[i,col_1])==4){
      if(substr(data[i,col_1],start = 1, stop =1) %in% c("1","2")){
        data[i,ncol(data)] = "ND"
      }else{
        d <- d_4 |> dplyr::filter(substr(HBS, start = 1, stop = 3) ==
                                    substr(data[i,col_1], start = 1, stop = 3 ))
        if(nrow(d)==0){
          d <- d_4_0 |> dplyr::filter(substr(HBS, start = 1, stop =2)==
                                        substr(data[i,col_1], start = 1, stop = 2))
          data[i,ncol(data)] = d[1,3]
        }else{
          data[i,ncol(data)] = d[1,3]
        }
      }
    }else{
      if(substr(data[i,col_1],start = 1, stop = 2) %in% c("10","11")){
        data[i,ncol(data)] = "S"
      }else{
        d <- d_5 |> dplyr::filter(substr(HBS, start = 1, stop = 4)==
                                    substr(data[i,col_1], start = 1, stop = 4))
        if(nrow(d)==0){
          d <- d_5_0 |> dplyr::filter(substr(HBS, start = 1, stop = 3)==
                                        substr(data[i,col_1], start = 1, stop = 3))
          data[i,ncol(data)] = d[1,3]
        }else{
          data[i,ncol(data)] = d[1,3]
        }
      }
    }
  }
  assign("data", data, envir = .GlobalEnv)
}

