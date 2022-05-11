Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94467C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 17:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344528AbiEKRAK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 13:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245580AbiEKRAJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 13:00:09 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDED13C4DD
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:00:08 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso3560468fac.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uHtyS2hhWfzT4HbTy0LgAuKhQEDGtd8wRdT+g+PZk3w=;
        b=nFeeRtRiXc9VlxV6LFvQpEArXXBspnR2CHxpzDsOUGEwTl9AZbjT6ZV8LUPioqcEhD
         zwdFudPHTMKLL0HlbpgE2V/G3E/ZjptPxU1TwScYpzwYd61rzLJDMt9cPfw5QIBHC8bU
         HjsOb3mm8LiKMhOl//xu2Xz6m7JgmHKMbI3zol3zFna+4NGFcenPUHCZn/UX9C4Xgn8R
         blbA+MgjULYABlRdehSwyecfhZi4KnRFKGFFvql0gUeO11IvxpHTxmQU2E0mfFlxN8mn
         XD4LF9TEbG5200lAPGiZkJZEGNG7G5T76tbzkvFhunvj/GPuqxeif5Wi+Td1yHXb/oIN
         5DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uHtyS2hhWfzT4HbTy0LgAuKhQEDGtd8wRdT+g+PZk3w=;
        b=nEizRyIaZ0DedhWLlV7dqNB4RFaXE7uaNrcHLxb0fEe8UxGtGcGV/HNRxt3Ssg7vmv
         wfvdmT+famuSn4pMvAe2H1YwQ86xkLTiFFqam4fsRtQdFTE5vJgx4G0dsTBEPg9JRgCs
         ar3mWpRdVwhhYBtyrF7nc2qLDEEbB37B/TLpoMlOZ0B271K8Ze4kyoY1c7d8avZdKTNe
         bsJnz7KFPpe75vBa+0JJf9tQzk5IGz8tfu6QIwGhat5cXZkqrs0O4+28Zk2HZxCYXwcV
         jdWbY5DtZOesWVudFZIr4IOKotMWWqYBwwzkCSFaBjEkgc3FWdQ3d32vhMJUeCB/bVbh
         1igg==
X-Gm-Message-State: AOAM532JgqB4b3S2dzx15p03IJrwb+cBHYJiZ9Ug8SwHjrqSAZvarSGD
        Siq5HmlgQ4QWgEHs4beH2XMdA+LF6Ab3XQ==
X-Google-Smtp-Source: ABdhPJyjRdwXBkBeOPA2zvhi55gqRZaNqVWF0iIEkTToeHRZfgnfDxV4pI4tArwmBjKWH7jRU4y8Wg==
X-Received: by 2002:a05:6870:568a:b0:ee:1f95:4198 with SMTP id p10-20020a056870568a00b000ee1f954198mr3240301oao.14.1652288407699;
        Wed, 11 May 2022 10:00:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e84-20020acab557000000b003263cf0f282sm929559oif.26.2022.05.11.10.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:00:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <037b551f-1781-321a-1984-117d098d980d@roeck-us.net>
Date:   Wed, 11 May 2022 10:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v2 1/2] dt-bindings: add extended-range-enable property to
 lm90.yaml
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Holger Brunck <holger.brunck@hitachienergy.com>,
        linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <34d88cd9-2bcd-77e6-8cc9-93b8cbd63a8f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/22 08:32, Krzysztof Kozlowski wrote:
> On 10/05/2022 10:08, Holger Brunck wrote:
>> Some devices can operate in an extended temperature mode.
>> Therefore add a boolean onsemi,extended-range-enable to be able to
>> select this feature in the device tree node.
>>
>> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>> cc: Jean Delvare <jdelvare@suse.com>
>> cc: Guenter Roeck <linux@roeck-us.net>
>> cc: Rob Herring <robh+dt@kernel.org>
>> cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> index 30db92977937..92afa01380eb 100644
>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> @@ -52,6 +52,10 @@ properties:
>>     vcc-supply:
>>       description: phandle to the regulator that provides the +VCC supply
>>   
>> +  onsemi,extended-range-enable:
>> +    description: Set to enable extended range temperature.
>> +    type: boolean
>>
> 
> There is no such vendor and it does not match the existing vendor for
> these bindings (nor the current owner of National). Was there some
> change? What is onsemi?
> 
My bad, I should have looked up official prefixes before suggesting onsemi
as an option. That should have been "onnn".

It should be either onnn (for adt7461/adt7461a) or ti for tmp451
and tmp461. adi instead of onnn may make sense since that is already
used in the driver. I personally don't have a preference.

Guenter
