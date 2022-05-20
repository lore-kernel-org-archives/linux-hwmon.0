Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0DEC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 16:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349145AbiETQBS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 12:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351271AbiETQBG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 12:01:06 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0D83DDDC;
        Fri, 20 May 2022 09:01:05 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id n24so10389153oie.12;
        Fri, 20 May 2022 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language
         :from:to:cc:references:subject:in-reply-to:content-transfer-encoding;
        bh=d+ei73L+89HGx3LtqPAuWtv/FMbZQQLdvvm3n6NjwPw=;
        b=WMwx4qqg7Zvw19yyJu65QEwIqVE9asKangEyrcLMhRjxl8l7FB4ugCOviOrQxAiTA+
         OHiy/qA/w8+RpNEwqRH5ZLEfOFnTJZ/F9ydPRVG4ZJVqfqsKIX1q/923i4h3RenXwqDR
         q8CAQymU1zwxkHb/u7gDIK6qLr0zl1EaN0Riv1bh02YkWAQ8u6FOAE1WS6g2m6yu3oYA
         JxEE80TbTyJN6wIESGckZY96jCjqjK21dAQbzZL7tIqQ6AX4uDPzhUKxQ5A6Az2dnAk7
         mefWDwLuMUEMsvlmJBITTjodxE7SLNBpEBW7z7SYWXcDpf6B3X4sxO1AnyqrilZErski
         Zu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:from:to:cc:references:subject:in-reply-to
         :content-transfer-encoding;
        bh=d+ei73L+89HGx3LtqPAuWtv/FMbZQQLdvvm3n6NjwPw=;
        b=WtVF58VMpSE0QaZdSuZfacQ+wNcmvZxWQl8clbwXRGoWb5vxfcPICLgawNZvrsUcjX
         O0/SoXcY/HyJrZG7y4VFbTYv7Kk7ngP1GtOBHctguqV2vr4seKlLVku1LehWMveNP1+N
         NXEhG5ugLGW1rx9sRO5GOK+IMHTntKa21uWzwa3SX8FwpRInrO6/Svai5zTdkEfDZmZT
         ZM5M2kRnenffoSZ2uCy5p+zSGaem+cBJTSrZgwNblHrAbS9xxPAIs0j+wyheeLba/KbB
         XLFYMYaeCl5ICdyKKURnJvQ0TVUzcTd+3Aws8zYQ3QUnxWddtIF+GC6yVKvdqB8L2Til
         Bxng==
X-Gm-Message-State: AOAM531bjrjKTzWFNk+d/i/kr+9vnfPBR8mLAklc+TRUcU/8EB8y/rWz
        4A4mOddDc/wNCs7x0moN0uI=
X-Google-Smtp-Source: ABdhPJwro6w2mgrF65az0vSknujjJ3VjRMgjB6/hgnMQr8R8I2l8gmdmOxheYAIIDY14fSaoGxmRgw==
X-Received: by 2002:a05:6808:1b11:b0:326:4608:4504 with SMTP id bx17-20020a0568081b1100b0032646084504mr5908968oib.145.1653062464381;
        Fri, 20 May 2022 09:01:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b129-20020aca3487000000b0032af475f733sm1130687oia.28.2022.05.20.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 09:01:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62a519ee-c909-bdb8-e686-084ffe8a8bcf@roeck-us.net>
Date:   Fri, 20 May 2022 09:01:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com
References: <20220520093243.2523749-1-sst@poczta.fm>
 <c1b1f02a-42c2-bc67-ab92-c0bf9dabbe94@roeck-us.net>
Subject: Re: [PATCH 0/8] Add support for ADT7481 in lm90
In-Reply-To: <c1b1f02a-42c2-bc67-ab92-c0bf9dabbe94@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/20/22 06:45, Guenter Roeck wrote:
> On 5/20/22 02:32, Slawomir Stepien wrote:
>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>
>> This patch series adds support for ADT7481 in lm90.c driver and extends the
>> device-tree options for it.
>>
>> The ADT7481 is quite similar to MAX6696 (already supported in lm90) so a lot of
>> code is reused.
>>
>> One major problem in fitting the ADT7481 in lm90.c is the chip detection.
>> However it seems that the chip has been designed and produced with correct
>> values at locations: 0xfe (manufactured id) and 0xff (chip id), but this is not
>> documented in the datasheet.
>>
> 
> Before we go too far along this route, would you mind using my own patch series
> as base to implement the devicetree changes ? I had prepared an extensive
> patch series a while ago, adding not only support for ADT7481 but for
> several other chips as well, I just never got around to sending it out.
> 

I made my lm90 patch series available in branch hwmon-lm90 of
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git

The patches in this series were module tested and tested on real hardware
with the test scripts at git@github.com:groeck/module-tests.git;
look for scripts/lm90-real.sh and scripts/lm90.sh.

Guenter
