Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E69BECAAD5
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 23:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbiICXrp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 19:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiICXro (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 19:47:44 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600FE48EB8
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 16:47:43 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f24so5324300plr.1
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 16:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=UYS35+vgl4uSzx/ZZvBFrUCMhv7wMfsL4fdM4w7RvjQ=;
        b=JGSPN0puLvr7p6D66ret/qP+3z2vOOz5AcAw50/FBFDWsxOckA/KiEkf4sQipbLnU4
         WTLz+Zbk2yGweN7x/r0Ys3gKHzI6b78/6kI41Ch7txyrvv76dEyLIBWIe1YEFQ8LNw/S
         Yznx2pq85OtflqcimEh+dKxF33io0jInTqSBzCw6GOQ3uQ236pSBhiEWY0dEx+3n2ziz
         ma0U7Qf2mvT/OaJw6amVtyHPTuCxNQCzxyFzehO3mGG+jpo7ZykQIOLnovoTfANa9fBe
         szmHGOoEnREkhdRwJdBQK5J6OV9y1ke8MNRKNX6VWL9EFN0z2msyUQeXNxmIEXokV0iE
         ZALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=UYS35+vgl4uSzx/ZZvBFrUCMhv7wMfsL4fdM4w7RvjQ=;
        b=It4iCfzZ49x3YOswD3/cRy9Xh/gsfBnzlsPYYAVI/GVPahsq6qcCgPInRxzMZOJZ6T
         BX8CLvRoEM/jWyjsNvdiMF9gr+e43Tqdg4kX3EcI486lA3DXktE6hvjkMwQ/avi5Ciu1
         XRHiQfQokhh3bIs3AJ54Ff6sQew+tngycPuZjtW+B6hqU+29Gowx3SL6I4mv8+Fdq2JF
         zB2NnhVhqRfR1fvZMvAOc+clEX3z0CgQ6DJfLAQxVuoQSBlrxjIHT1hy/S53o8v+dOkF
         MjfgwFepxQdRi/PoMXbdFd32MlaFXzsBNgN4kPeNpklDwUDzRa/Z9Wv3kNJHeOeIyAKm
         Aj9A==
X-Gm-Message-State: ACgBeo07Mw3NWJy6bW9eKrN+74UeX8d3MA/OyrzrqxGpGdOtlLKn1dO2
        B4fwuX6eIVRfRg7z7rd5m0o=
X-Google-Smtp-Source: AA6agR45o2OA06cBbkS6IlhspwVrvctBRi6D37hSZa6PAp2/x1Ea4CvK2Jf4eqOyTEI8pStXXwRaEQ==
X-Received: by 2002:a17:902:ccd1:b0:172:5c49:34be with SMTP id z17-20020a170902ccd100b001725c4934bemr41444324ple.23.1662248862739;
        Sat, 03 Sep 2022 16:47:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4-20020a631204000000b0042b08b6158dsm3685816pgl.56.2022.09.03.16.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 16:47:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
Date:   Sat, 3 Sep 2022 16:47:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
 <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
 <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/3/22 15:37, Eugene Shalygin wrote:
> On Sun, 4 Sept 2022 at 00:00, Guenter Roeck <linux@roeck-us.net> wrote:
>> What does the name of the struct platform_driver data structure
>> have to do with __init ?
> 
> That's what the modpost warning message suggests:
> WARNING: modpost:
> /home/eugene/develop/asus-ec-sensors/asus-ec-sensors.o(.data+0x60):
> Section mismatch in reference from the variable
> asus_ec_sensors_platform_driver to the function
> .init.text:asus_ec_probe()
> The variable asus_ec_sensors_platform_driver references
> the function __init asus_ec_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> 

A driver with a probe function can be unloaded and reloaded manually.
I don't see how you can do that if the functions are marked __init
and the driver is built into the kernel.

Besides that, I _really_ dislike side effect programming.

Guenter
