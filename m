Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C7AEB64DD
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 12:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbjGLMHu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 08:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbjGLMHt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 08:07:49 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB391BC0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 05:07:35 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-991ef0b464cso151027466b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 05:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689163653; x=1691755653;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIlGfu8m5d5ZQkeZoOR0iSZhRUvPSChL4hPGHRMsFF0=;
        b=g/1xVqjy/HPBV5OmMqyjLrlIDKpCIp3xzzy81/AMgFSyXl4v5CvWjM1AmYYRy+7TdE
         jfwW9wv/FJzEd8MdK2XWlQMffknItrG95PHwgBlleVcgmho7dbwS8TwhO87+FSt0P2T1
         45UnZzOXv8Ce/MSH5T+aOxTkOXSR+8+QAS4VoBqAGglkowXLgV7z2G5GF2/vtPPFQIpx
         7xo+/1H0FzrBfQ1oHUPXV4LQtBB/mA25ITDQKFB2W6b1us7blXZgu9Rr7h4I+nkv9+5F
         Sc74Emd/VUyTrIRapYlktFn90wjboJKRZp8Vvhf4YzK4MCBUXLOYzaOAuZjocosnpMHB
         Yemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163653; x=1691755653;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIlGfu8m5d5ZQkeZoOR0iSZhRUvPSChL4hPGHRMsFF0=;
        b=UcVHRIBOGNsrprVRkI7MHHBHnQRrBLtyKB4mWXSPE9rpaRXQaqdohkog9UeJt3/gz9
         6gs6MsTmTb7kWSXoI8JaJ+z/Lr40E/grPCZLtoKcDn2pGfhB+LYre/9GMMfLDUX2w4s3
         8487u2yFlGVvvSLTXCO6r62zjxV3dAdHy6CjeayWv2KR6gWZ6Iom9ZmCj5YDeYz1hBL8
         KaTkv5W2GGPz4afne7IWycSBhU2+GWsCSmEUDjJLeHK6nhx1OpBCwXTPrQLNjJH7O2qW
         E8zCPMRG0xFpsmcPEi4x6Ne2jWFGhACFX4cGA6kfmq/PK4MLSWmf6CtEXov3iUdNkKzF
         3fMA==
X-Gm-Message-State: ABy/qLbRQIpjsWd8Y3wLXDEMPCK0QE12zCJTJJAawyLci+WLbl94qv2u
        vCM5SC9KbMWMcJO/5Al75B9+DQ==
X-Google-Smtp-Source: APBJJlEykDE6ERuH6spFAbf69B6y/WO55GrI76PSo9E9V8DqXVkCs5tSDioJtQrJYxUHVR6wBeikUg==
X-Received: by 2002:a17:906:8e:b0:993:e81a:f093 with SMTP id 14-20020a170906008e00b00993e81af093mr2496708ejc.26.1689163653331;
        Wed, 12 Jul 2023 05:07:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id sd6-20020a170906ce2600b0099275c59bc9sm2488709ejb.33.2023.07.12.05.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 05:07:32 -0700 (PDT)
Message-ID: <36182c36-07fc-e6f6-eb63-bf51ee3d8a86@linaro.org>
Date:   Wed, 12 Jul 2023 14:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: hwmon: moortec, mr75203: fix multipleOf for
 coefficients
Content-Language: en-US
To:     "Farber, Eliav" <farbere@amazon.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rahul Tanwar <rtanwar@maxlinear.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230712081124.110345-1-krzysztof.kozlowski@linaro.org>
 <4d9a0899-145e-3223-41da-b91b81afaaa2@amazon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4d9a0899-145e-3223-41da-b91b81afaaa2@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/07/2023 13:58, Farber, Eliav wrote:
> On 7/12/2023 11:11 AM, Krzysztof Kozlowski wrote:
>> Few coefficients use default values multiple of 100, not 1000 (in the
>> example DTS and in the Linux driver):
>>
>>  moortec,mr75203.example.dtb: pvt@e0680000: moortec,ts-coeff-g:0:0: 
>> 61400 is not a multiple of 1000
> 
> Why isn't multiple of 1000 correct?

61400 is not a multiple of 1000, at least not in integers. 61400 is a
multiple of 100.

> According to the Moortec datasheet for the series 6 of the temperature 
> sensor
> the coefficients are:
> G = 57.4 (57.4 * 1000 = 57400)

57.4 is not integer. With that approach 1 is also multiple of 1000, because:

G = 1 * 0.001 * 1000.

> H = 249.4
> For series 5 coefficients are:
> G = 60 (60 * 1000 = 60000)
> H = 200
> J = -0.1

Trim the context of replies. No need to quote entire text below.

Best regards,
Krzysztof

