Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC88EB64DC
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jul 2023 19:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjGQTTC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 15:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGQTTB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 15:19:01 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA02116
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 12:19:01 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8ad907ba4so27360815ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2023 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689621540; x=1692213540;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dcftTlcVuD+VKmMawmKHZnRyFp4WYWxqe3j8Q1l8RmQ=;
        b=k948AL8X8Ubeb+7CSUlMJoeDVKolgmmFCJngib3JT5oGBL/L6LDjJ6jPZKwRRStwwp
         bZq34plHVXU3XBW2hexS/m9XgIEL9zSKtchCTZXi8igIRGWuhg6TnTADUO9VFpObH4su
         kdCHkVoXyb6FknnGDmACRiYZVeGXkuC35UhiMXz0hT51GOmVDvch7FLDL0jYhLh6S4OI
         JBJmVJ8jjr+tFowL8WW5QHlVYFe1SepZ3ZQvRbV1YoF3lVEa5Be1ElQXOnxxppZSpSPg
         PnmVo4lPXn++XJoqdxkqLpilQN/b7NgXAabO01FOrqrn5WxlO1MaRVWme5pgK5RjpZ5m
         nwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689621540; x=1692213540;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcftTlcVuD+VKmMawmKHZnRyFp4WYWxqe3j8Q1l8RmQ=;
        b=BLpPMEbfXtcdTaY7oGWkpGeqI7ncGYqXjPnP8EKEDg890jF8Z9s4kCuYCn3Dnx8zKA
         T2uSw35pVG8AV/33ijgC47jCXnkzpaWS41N4UEx9WRBBgL4OD3dDymMbeCCfBvKqd3f5
         h/IrmKBi/hVd7i3BuASeBF1lrgjZ3QQtd7pzQPnh+7Pid3ybYh/QmkPZBdW7vpC8urks
         lpcx8aky1AiKVqX5QEwroe8twgJ7aQq5TOwqsoQmDQpNmdCYFM01koB96I+eTJfq+jlZ
         lXOAU/RekQT4EH0BZVkVamCTpzUR+zQUVcR9Gpn7oSWrXp3687W0iXhAz25bI50s3+xI
         2x7g==
X-Gm-Message-State: ABy/qLZT2i8hM6XCCwLyUdvNW0jXpy3OPBej4VAu4wVbUZAdhIku9pwh
        zEJUKm0y5h0VSGbkQg3CxVedAk4U4sQ=
X-Google-Smtp-Source: APBJJlGsxzPgqctKjgQnacm3I7P1VXdiCRVoNRtenDSio7aj+DiHcrOcPUQnfcDNJFCIzTo98zSZOQ==
X-Received: by 2002:a17:902:c945:b0:1b2:5689:8686 with SMTP id i5-20020a170902c94500b001b256898686mr11704455pla.63.1689621540456;
        Mon, 17 Jul 2023 12:19:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902868c00b001ac6b926621sm208222plo.292.2023.07.17.12.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 12:18:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b5ec528b-874e-5a9a-a149-2e43e6c35979@roeck-us.net>
Date:   Mon, 17 Jul 2023 12:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (nct6775) Increase and reorder ALARM/BEEP bits
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
References: <20230717164927.1625616-1-ahmad@khalifa.ws>
 <f6581485-54a6-1b83-dbba-9289b4c84fbb@roeck-us.net>
 <e8744ee0-7953-347e-c0e9-f80132fc0eec@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <e8744ee0-7953-347e-c0e9-f80132fc0eec@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/17/23 10:39, Ahmad Khalifa wrote:
> On 17/07/2023 18:25, Guenter Roeck wrote:
>> On 7/17/23 09:49, Ahmad Khalifa wrote:
>>> * Increase available bits, IN: 16 to 24, FAN: 8 to 12,
>>>    TEMP: 6 to 12
>>
>> intrusion: 2 to 4 ? Curious: Why ? It doesn't seem to be used,
>> and it could easily be extended later if really needed.
> 
> Just thought I'd save others having to reorder bits again.
> But thinking about it now, never seen a 4-door case.
> Having 2 only and beep at 50 means the whole thing likely pads to
> 52B instead of 56B.
> 
> Will update.
> 
>> Move the story behind the change (what you tried but didn't work)
>> after '---' and just list the actual changes in the commit description.
> 
> Testing note too?
> 
No, that is fine.

Guenter

>>> Testing note:
>>> * Tested on nct6799 with IN/FAN/TEMP, and changing min/max/high/hyst,
>>>    that triggers the corresponding alarms correctly. Good confirmation
>>>    on the original mapping of the registers and masks.
>>>    As to be expected, only 4 fans and 2 temps (fixed) have limits
>>>    currently on nct6799 on my board.
>>> * Trouble with testing intrusion alarms and beeps, no way to confirm
>>>    those. As I understand now, intrusion/caseopen is probably not
>>>    connected on my board.
>>>    And I haven't seen a buzzer on a board in ages.
> 

