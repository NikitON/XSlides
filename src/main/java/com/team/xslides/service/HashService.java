package com.team.xslides.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

@Service
public class HashService {
    public String getHash(String clearText) {
        return DigestUtils.shaHex(clearText);
    }
}
