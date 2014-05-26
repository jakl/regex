#!/usr/bin/env scala -classpath google-gson-2.2.4/gson-2.2.4.jar

import com.google.gson.Gson

val gson = new Gson()
val string = args(0)
var flags = ""
try { flags = args(2) } catch { case e: Exception => }

var regex = if(flags contains "i")
              "(?i)" + args(1)
            else
              args(1)

val json = gson.toJson(
             if(flags contains "g")
               regex.r.findAllIn(string).toArray
             else
               regex.r.findFirstIn(string).toArray
           )

val result = if(json == "[]") "null" else json

println(result)
