package com.ymww.start.controller;


import com.sun.javafx.collections.MappingChange;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AFLearn {

    @RequestMapping(value = "af/test")
    public Map<String, String> simpleRequest() {
        Map<String, String> result = new HashMap();
        result.put("name", "python");
        result.put("sex", "boy");
        return result;
    }
}
