Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D64C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 06:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7438D610D1
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 06:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244281AbhIXG7V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 02:59:21 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44252
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244244AbhIXG7U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 02:59:20 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 06C7E401A9
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Sep 2021 06:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632466667;
        bh=fYF89/5s8KII3IREHfjWBpKm/vkIDDtdQadyjDD6NIg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=v/eRR3JAzJyr+1+ZELD2/1l+NEvuwNC56OV1xdh2W5OT1FuAXYEoGMwdlAamjW3b5
         5elePxelL4awLBXUiJJgJfMxJ5zKKVxk0q6icN7OJN48xZmZl8Q1tw1FrjLOlsnQr5
         apLxt9wr/slvWW1MUlk+xIjJWjKD65T5QoYESiCZZyjlHQnhh7ScK4Sx5YTa8/gknd
         raQXU4J13EC1CyVMD91dYtreLSdGVItk2pmpz5PR1mYpAKp7QBehSoOjDvyTq3xinn
         yG8LFM+aCnGEf0DZdK/aogayw4IvmUWbjJ/LDXIkC5nOm+QUrxulRNQtyFWlD92Jun
         PmXycHMrcpA8A==
Received: by mail-wr1-f72.google.com with SMTP id e1-20020adfa741000000b0015e424fdd01so7241154wrd.11
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Sep 2021 23:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fYF89/5s8KII3IREHfjWBpKm/vkIDDtdQadyjDD6NIg=;
        b=dGzu13t/hmVs0Ygo2cx+4SzWods1Y6vULPpZpr4R2SkrBxM5A+puKLUJqvHivcES+u
         otFPqCkxlg43P45Hlf/ZM0qXOLKyftAiBxhsWCB14Nd7GgjtW2nOGf3tuWzwsgkzQY8Z
         PlG1dbU+lOF3cCnhZJ2AuC/8wo67RarkUtdqJnmlfz9E5/17sfgQ9NorhNg0lfKFOB2s
         7fv6EWStQpG0u053Ruen+xZczOF1N2temw9OGdiKm5vTy7mrAix5Y6J2j70eusID23Y1
         wV5BeL+4YePWOXWf+zWYqnuahznqQDT2HRses04pWshB3NBXKuyMWrcv7wAKTOiT+0G3
         A8Yg==
X-Gm-Message-State: AOAM5337MIzeLoNAciFpASiiy1sWVzsJnepO9in4gh9FikeD4sBP86Si
        IML/9i1aqgLLhvWr0UbYcbyYGcErj5YlPXR6HpQBvHtVWkgYSAawb7N6amPNtUrPspdFPa1KCeu
        CpTW4Z4G/zkly8r2v4zp6FdqmukxrZ2s+KALWWlFn
X-Received: by 2002:a5d:6846:: with SMTP id o6mr9806233wrw.327.1632466666698;
        Thu, 23 Sep 2021 23:57:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc96GEBXTW4Py8e4mdDm49axRJOlOVN4lftQwNblc31HK/fP9loggeXKRQRLCgOrOKVGv6Og==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr9806218wrw.327.1632466666540;
        Thu, 23 Sep 2021 23:57:46 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n15sm7367054wrg.58.2021.09.23.23.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 23:57:45 -0700 (PDT)
Subject: Re: [PATCH 6/6] dt-bindings: hwmon: jedec,jc42: add nxp,se97b
To:     Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210920182114.339419-1-krzysztof.kozlowski@canonical.com>
 <20210920182114.339419-6-krzysztof.kozlowski@canonical.com>
 <YUzuyG3e7sHlMHAJ@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8871dd77-f9f1-bf25-78ad-48f97efcf7d9@canonical.com>
Date:   Fri, 24 Sep 2021 08:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUzuyG3e7sHlMHAJ@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 23/09/2021 23:16, Rob Herring wrote:
> On Mon, Sep 20, 2021 at 08:21:14PM +0200, Krzysztof Kozlowski wrote:
>> Document bindings for NXP SE97B, a DDR memory module temperature sensor
>> with integrated SPD and EEPROM via Atmel's AT24 interface.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
>> index a7bb4e3a1c46..0e49b3901161 100644
>> --- a/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml
>> @@ -10,6 +10,14 @@ maintainers:
>>    - Jean Delvare <jdelvare@suse.com>
>>    - Guenter Roeck <linux@roeck-us.net>
>>  
>> +select:
>> +  properties:
>> +    compatible:
>> +      const: jedec,jc-42.4-temp
>> +
>> +  required:
>> +    - compatible
>> +
> 
> Is this supposed to be in the last patch? And why is it needed?

Yes, this is here on purpose because of nxp,se97b which is sensor with
at24-compatible EEPROM.

arch/arm/boot/dts/at91-nattis-2-natte-2.dts:
169         temp@18 {
170                 compatible = "nxp,se97b", "jedec,jc-42.4-temp";

171                 reg = <0x18>;
172                 smbus-timeout-disable;
173         };
174
175         eeprom@50 {
176                 compatible = "nxp,se97b", "atmel,24c02";
177                 reg = <0x50>;
178                 pagesize = <16>;

Without the select, dtbs_check was complaining about the second node:

eeprom@50: compatible: 'oneOf' conditional failed, one must be fixed:
	['nxp,se97b', 'atmel,24c02'] is too long
	Additional items are not allowed ('atmel,24c02' was unexpected)
	'jedec,jc-42.4-temp' was expected
	From schema:
/home/dev/linux/linux/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml

eeprom@50: 'pagesize' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema:
/home/dev/linux/linux/Documentation/devicetree/bindings/hwmon/jedec,jc42.yaml


>>  properties:
>>    compatible:
>>      oneOf:
>> @@ -31,6 +39,7 @@ properties:
>>                - microchip,mcp98244
>>                - microchip,mcp9843
>>                - nxp,se97
>> +              - nxp,se97b
>>                - nxp,se98
>>                - onnn,cat6095
>>                - onnn,cat34ts02
>> -- 
>> 2.30.2
>>
>>


Best regards,
Krzysztof
