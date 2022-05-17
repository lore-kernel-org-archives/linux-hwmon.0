Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF60CC433FE
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 08:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243756AbiEQIl7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243690AbiEQIl5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 04:41:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8863E0DE
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:41:56 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id m20so33207878ejj.10
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 01:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IkM37jEKXSj6PzDQC4Z24cZhJuaaSOBMUNZg03RlZIQ=;
        b=xesQ8AaB1K4u+VbRPhxy0P1hcr00q2xalB5nbnFbq1M67b1QFJ3A38QhOJNsd47d2F
         Bu0M3typemF9zf9AZCNlbMOtZGoRwy2fO0/F/ZxOE7YqTTLw2UDxvw6UDbigGtYyr4oV
         6ff/S4Nz+Lo/gvEafeg07A/4FocQG3UCpMoQJE2RsUJKiQWVWWsCmRDh9KDfVZlpXxM4
         BFX+qeEL2iTwxX77opxRNJM7OAdJcjUtOxw+I2cG7uY3hW33m+e4ihQXzCwJDAz118SE
         L71yJ/KerU0Xm8sI7hhi4/XsEquZlPaGh5cAz9ckPCbEylBE/Z0pUL6nogss8kBkj9ef
         P+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IkM37jEKXSj6PzDQC4Z24cZhJuaaSOBMUNZg03RlZIQ=;
        b=FWKFEHELvsl9WSC1h8YU6gMlwTV6uB7KEIkwMSLG97DymzkoApg8izccRJjZtLDbU+
         W4Al2z8lx84tbK0nmXY8JJE2rgV166DsxLUBGlCkoMwW09Kbvb1NE+lMtDw5THStdsS9
         ZtJnsGsCGGkec5hVsjoHnEaDbvQQ6dRNSyV+ycveOoIS8AxCicU43mDI5cJqExl5w6+j
         7nbwgOhkZlhknC7+uWsM0ZQiHL6Wd0s/rgBs6iDwP3McENgd2vui/nXLCJGZ8j5kI4zZ
         RfN++Sve+bOd4YuEnOV+mlPNfdWPZmRzYMtwL337q4852p1S9JR0uw3ZFjSR9n8ux4Fx
         s8xQ==
X-Gm-Message-State: AOAM532Nybfa+Zh//SNvnJrHUi6QrH34bKQ/UCjRMDLcW5iQx0kFZi+r
        f1PeKgPR9YGaB/E/vYeMAd+B9w==
X-Google-Smtp-Source: ABdhPJwQPClVVEB6rdFpu5/weZxbmgtDpME0X+jBJVx6cmsTKuHY+R3Umo1FsR76u39v58AQRwMXFw==
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id sg7-20020a170907a40700b006f43f147707mr18961345ejc.351.1652776914880;
        Tue, 17 May 2022 01:41:54 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id eb8-20020a170907280800b006f3ef214e28sm758297ejc.142.2022.05.17.01.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:41:54 -0700 (PDT)
Message-ID: <b0e8e834-cad8-e53e-7962-84d648f31d7c@linaro.org>
Date:   Tue, 17 May 2022 10:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v3 2/3] dt-bindings: hwmon: lm90: add ti,extended-range-enable
 property
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220517075703.16844-1-holger.brunck@hitachienergy.com>
 <02062376-86cf-dcee-7560-2edd55ee16de@linaro.org>
 <DB9PR06MB72895A514CDE3E3BB5E46445F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB9PR06MB72895A514CDE3E3BB5E46445F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 17/05/2022 10:38, Holger Brunck wrote:
>> On 17/05/2022 09:57, Holger Brunck wrote:
>>> Some devices can operate in an extended temperature mode.
>>> Therefore add a boolean ti,extended-range-enable to be able to select
>>> this feature in the device tree node. Also make sure that this feature
>>> can only be enabled for the devices supporting this feature.
>>>
>>> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>>> ---
>>> changes for v3:
>>>   - rename property to ti,extended-range-enable
>>>   - use allOf:if to check if the device supports this feature
>>>   - rephrase commit msg
>>
>> Please use standard email subjects, so with the PATCH keyword in the title.
>> `git format-patch` helps here to create proper versioned patch.
> 
> I did this but I used only "--subject-prefix=v3" instead of
> "--subject-prefix="PATCH v3". I will change that for the next version.

Before sending you can always review the mails. The easiest is anyway
"git format-patch -3 -v3"

> 
>> Skipping it makes filtering of emails more difficult thus making the review
>> process less convenient.
>>
> 
> yes.
>  
>> Then use standard email-sending tools to properly thread your patchset.
>> git send-email for example. Kernel docs also explain this.
>>
> 
> I used "git send-email" but I guess my problem was that I was sending patch
> per patch as I had a  different set of recipients in the CC list.

The recipients list should be the same, why it's different set?

>  
>> Currently, this patchset is not possible to apply due to missing threading.
>>
> 
> Ok. So would "git send-email --to ... --cc ... 000*" take care of correct
> threading  as it send is handled from one command?

Yes.

You can send it also one-by-one with proper threading, if for some
reason you do not want to follow the easy path. Regardless which way you
choose - easy or manual - just be sure that effect is correct and the same.



Best regards,
Krzysztof
