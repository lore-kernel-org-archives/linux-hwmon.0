Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597E9C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 May 2022 17:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235846AbiEXR7T (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 May 2022 13:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbiEXR7S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 May 2022 13:59:18 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7B63A71A
        for <linux-hwmon@vger.kernel.org>; Tue, 24 May 2022 10:59:17 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gi33so28417071ejc.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 May 2022 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pO9+5FvH2gC4RB2t7JEHm779XNwPcXe+oKNK7teE6y8=;
        b=ekHWPPF9gjP9Tq65v4Ro6X4Tzl6+F0xcMBDPNsV3DDFZBfcMjdn7xhs2eHivua+IQK
         HFzMCiWtXIc3PyOoDasP+m5y+NVdDzgLQKER45wydviPV6eTlQVAB217SJgWvQ3JRBJ3
         VUvBGXR3gWlhbGZT0iRD+o9L8hG8uagNoUPPnVplbtWdhoX67Dxcm1tWNTCfjQjD5A6P
         uplzCQMPV/1qRu6rcjhPG5rP43ely3OvJjLYpgzaFv/xIJYQYS8LIgBGXc4/inquZI+3
         E57unzyRiKDs4ZZoPEuEqK7uyxHS35U/EN6OAqRL2gUy3MTP+YVDkPHHzU6eKSJNOHv8
         kCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pO9+5FvH2gC4RB2t7JEHm779XNwPcXe+oKNK7teE6y8=;
        b=4CoLBJt4UslzVqqXQhvX1f6/q9CL0ZHLozODG7YUi0MOUOAkODWO1UOj8VmSojlr+W
         lSY27CAA0g6+9an5a3c+/+LeoopA7TfTqYYe1569xKRvyFIMQQTirUFgmyUo7M6D6yST
         B1eGlHEv/tG8jUDQvaD7qXHErWtbBz+rSKY6ojyHWg6A/pVK5wUd9w2w2ubx7vEpYzrA
         hfmNcdplfyE1W95POLQ0UhKu7lyXl7MQYC9n54CkQjfRyJ0X5BoNVb03bczGww73VDyd
         5uGEPWm1Ut9JBJjacnz8SRrztZ8FjoH9tUKS88DBNBV5K/RquwhN0edaL4y01k8m0eKZ
         LXpQ==
X-Gm-Message-State: AOAM5306bAuPpX8e+3DaOsznWSZrbp7t1ydX4fBpF4bjJVWfEC/McBX8
        bq7tlnFC2c4yqxMixsvogKNxVA==
X-Google-Smtp-Source: ABdhPJxWVK2ukINulMs9nwTRbFCFJEPYD/aNeNtg8NzCbY+S+OIDYVBI5sP7NK8vTGuPhYuejIZLcA==
X-Received: by 2002:a17:907:7da3:b0:6f5:2d00:e069 with SMTP id oz35-20020a1709077da300b006f52d00e069mr24451497ejc.743.1653415155919;
        Tue, 24 May 2022 10:59:15 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020aa7d441000000b0042aae0a4699sm9849134edr.60.2022.05.24.10.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 10:59:15 -0700 (PDT)
Message-ID: <5e841cdb-ca44-02f9-6c98-3d000b515b6b@linaro.org>
Date:   Tue, 24 May 2022 19:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/8] dt-bindings: hwmon: Allow specifying channels for
 lm90
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-4-sst@poczta.fm>
 <3ea92486-0cf9-ce3d-d1b6-7a76f1d5a129@linaro.org>
 <0b84d109-d6be-dfba-99bb-0b7136af875e@roeck-us.net>
 <b5ff0f2c-d741-6dec-c306-b54cb5075ccf@linaro.org>
 <f124cbcb-3fca-3f1c-f47e-730f15c1f074@roeck-us.net>
 <YozHOsSdpWBRNLYt@t480s.localdomain> <YozM0L5uftHOgkjL@t480s.localdomain>
 <Yo0VfVthNdtjIWF+@t480s.localdomain>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yo0VfVthNdtjIWF+@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 24/05/2022 19:27, Slawomir Stepien wrote:
>> Well ok, looks like this:
>>
>>       temperature-offset-millicelsius:
>>         description: Temperature offset to be added to or subtracted from remote temperature measurements.
>>         items:
>>           items:

I think this is not an array, so items are not needed.

>>             type: integer

types are instead:
$ref: /schemas/types.yaml#/definitions/int32
but I think it still does not work.

>>             minimum: -128000
>>             maximum: 127000
> 
> This isn't working...from what I've read we cannot just simply overwrite existing schemas.
> 
> Krzysztof, Guenter what I should do? Is there a way to match with uint32-array schema and with
> schema that allows items in array to be below 0 (seems impossible to me)? I've tried a lot of
> combinations today without any luck. Any helpful tips? Thanks!

However this still does not work. I changed in schema:

   # Temperature

   "-celsius$":

-    $ref: "types.yaml#/definitions/uint32-array"

+    $ref: "types.yaml#/definitions/int32-array"


but that does not solve the problem that property is stored as uint32
and parsed like uint32:

    4294967291 is greater than the maximum of 40


Maybe Rob has some idea. Till then, you can skip minimum.

Best regards,
Krzysztof
