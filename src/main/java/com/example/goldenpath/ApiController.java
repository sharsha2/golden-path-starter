package com.example.goldenpath;

import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
public class ApiController {

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of("status", "ok");
    }

    @GetMapping("/items")
    public List<Map<String, Object>> items() {
        return List.of(Map.of("id", 1, "name", "hello"));
    }
}