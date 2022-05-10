Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA265C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 00:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbiEJApE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 May 2022 20:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbiEJApD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 May 2022 20:45:03 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C18109C
        for <linux-hwmon@vger.kernel.org>; Mon,  9 May 2022 17:41:07 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id h10-20020a056830400a00b00605e92cc450so11203786ots.11
        for <linux-hwmon@vger.kernel.org>; Mon, 09 May 2022 17:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+bvLg5pe14pnrlv8qNsizxHPMc8sTUjdCuLXchjVPW0=;
        b=QRIaiF8MjwqXqy3piDnbP9v8ZfCD3lCDPRZ0zhe7LK7cwdTocFGG9w+OJqNGpzfjHB
         7JJTrfdOQ/yWt1kfyzBGg2IK0srXbjaIPehNWfIXRjFR7Kk7oTOvC3t8HNtU/WrkXlbe
         ta3f90k+THMXwdR6R1wDE/MN7Gj4HcXD5XXrdIajlTbSIztut66M4ZY5scNQv58jbMJq
         vlTRabPVyqKa9e94rNhTlS3/PZh2yO/8XF/vJhxgtHPWsvCgtMc595WHHV+rUOQMqxC4
         PoQCsbHRCByeC8cromBFbYbfgr//qT0u9nA20AkfmwEeiPxPYMjuKJ8pY6o5szhq7szr
         zMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+bvLg5pe14pnrlv8qNsizxHPMc8sTUjdCuLXchjVPW0=;
        b=HJ6HhkgIN9pQ3IuMGRYeirE1OUgrg3jWrSGuAqZ47D8jRwby95M4x6u8gSh035eujn
         sRBa9qbqs8wy/Gip+9vf+lmoXXMqlQ65eH4M8wMTGKq8YoGWjgmu6eIHr1vjMbWnWNGO
         UXuCoYXzxIVKWYyB67PHbLpxPr24Idh7iDx9sSp3q9oBatshlCiW3oVx4A4TUSR04SeZ
         c+6CYp9wDTJtaA2KSBFHGj3cSHHJWviIh+FTkjDd9Wn7wEOEA5a7sofXU4bzhgpZukmj
         GVdQKaeRV6S2RNxGgbDZ0UVgMCYKXz+PQQct+u8fXR5L4ZOnSAMLCRvv+36X3qwazIsz
         MB5Q==
X-Gm-Message-State: AOAM531j6MTnIETVB9UjSmTAtWZFGh28OiNVQRO2XkQKlypXfW06/Wzp
        /Oyq3VtzPIV75NUWMxyiwdCJO22wgTaveA==
X-Google-Smtp-Source: ABdhPJywniTH7VWl3/1h7wC9IqqfHqTi2JDg1ep8I7SEGrStKUpJjPvuSghv/u57iwI4pwa1AcTvVg==
X-Received: by 2002:a9d:740b:0:b0:606:21eb:8f93 with SMTP id n11-20020a9d740b000000b0060621eb8f93mr6963448otk.330.1652143266722;
        Mon, 09 May 2022 17:41:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e89-20020a9d2ae2000000b006060322125bsm5325307otb.43.2022.05.09.17.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 17:41:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <af58fc2a-9d72-82b5-2cd4-8376a99e9ef5@roeck-us.net>
Date:   Mon, 9 May 2022 17:41:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220509131016.29481-1-holger.brunck@hitachienergy.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220509131016.29481-1-holger.brunck@hitachienergy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/9/22 06:10, Holger Brunck wrote:
> Add a boolean extended-range-enable to make the extented temperature
> feature for some lm90 devices configurable.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
> cc: Jean Delvare <jdelvare@suse.com>
> cc: Guenter Roeck <linux@roeck-us.net>
> cc: Rob Herring <robh+dt@kernel.org>
> cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> ---
>   Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> index 30db92977937..98d01f6c9331 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> @@ -52,6 +52,10 @@ properties:
>     vcc-supply:
>       description: phandle to the regulator that provides the +VCC supply
>   
> +  extended-range-enable:

This should probably be either "onsemi,extended-range-enable" (for adt7461)
or "ti,extended-range-enable" (for the supported TI chips).

Guenter

> +    description: Set to enable extended range temperature.
> +    type: boolean
> +
>   required:
>     - compatible
>     - reg

