Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2BCC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Apr 2022 19:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244809AbiDYTGl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238545AbiDYTGk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Apr 2022 15:06:40 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1B212C42A;
        Mon, 25 Apr 2022 12:03:35 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id t15so18209407oie.1;
        Mon, 25 Apr 2022 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wJ0D3EKOcgTdOzKv30C8SbeC6VBxjhBJOkCVIoZZVnI=;
        b=M6/7ROsGV/CkFVvgAfwLfgarULW5t6Y3RW8SnGJVBqz5jQMrCJJNs4aaJK5BSMbP47
         l+7Hvn3mALysMGo6BSAGYBHP4JOThfvwPi75s2ZJ0aEbjJneToUopaMWLZRNNNdIHhfe
         luDEnid3+wKAKL7lo6n2x7zCA7NOWIqU4cfp6RqOGGIMF78NPn5zkmr4ZkYtloyP6ldw
         C/iF1qRcnt9kU1JdizsHTLrkPPM9Q66Vzp+FxmmaER/T4eIS0cXfSKnMp2UMZbIvHM+r
         1AWp8PdWPNko4nfTOfzBN+k1i7ZQMAkAMu4Y5l37cWqAT8c+cbQgurwk8gnetQ55xXDv
         9YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wJ0D3EKOcgTdOzKv30C8SbeC6VBxjhBJOkCVIoZZVnI=;
        b=RKJkzb2Q8aLIFeJCnnTccNLdkQgp7xtuGx9s6SELzD3SpaibN4oxkXh/odLd1IgWWN
         5DeYK0+0Zh/ELUDH6Nzv5kQvHZqsiKzITNnysps59lAEOBlAULisy874gqbgweIxMMbj
         97zmuQVUXpyzqj2DtHSsK5R21xWbsgXLeQFwGZ+6U8F20L+I4GAlesKtogj0Rt79nfp9
         z6lklIRaId4mlI/O4QpA1TyPqCG2zTfR1yJOo2/Chl7Z3FROpaUWqwFL3I4kva+5SNwc
         Vd/WSeDMsBO5nZtJkE/REhajyBtG4bymljDYM4OhfuOrAQO72NvcccO2Qy9rzPIAQQlJ
         2Yug==
X-Gm-Message-State: AOAM530TOlZJDuKIQXkeSy8JG3a5IT91P/sffPFeNBIl5o36ww5TsiMT
        m8Mz4ir6BPb0rELoAuE1bnc=
X-Google-Smtp-Source: ABdhPJzNOOXzib9XHOLrtlybvfyD+5ewebR8S0mLhAA1pfnmUqVRIeVjsDE3w1iD7UE8dv8Y5d28Zg==
X-Received: by 2002:a05:6808:181b:b0:322:7181:a183 with SMTP id bh27-20020a056808181b00b003227181a183mr9397048oib.295.1650913415264;
        Mon, 25 Apr 2022 12:03:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q12-20020a4ad54c000000b003245ac0a745sm4644878oos.22.2022.04.25.12.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 12:03:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad6ecb09-7ea2-16e3-35bf-ba430b92885d@roeck-us.net>
Date:   Mon, 25 Apr 2022 12:03:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Atmel AT30TS74
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <abe35ea9-1929-941a-6391-2ce1bc047161@axentia.se>
 <de0b6b20-7b4d-64cb-0ae0-457bbc78cc59@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <de0b6b20-7b4d-64cb-0ae0-457bbc78cc59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/25/22 11:49, Krzysztof Kozlowski wrote:
> On 25/04/2022 07:59, Peter Rosin wrote:
>> Document the Atmel (now Microchip) AT30TS74 which is an LM75 based
>> temperature sensor.
>>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>    Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
>> index 72980d083c21..8226e3b5d028 100644
>> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
>> @@ -14,6 +14,7 @@ properties:
>>      compatible:
>>        enum:
>>          - adi,adt75
>> +      - atmel,at30ts74
> 
> Looks like wrong indentation.
> 

Actually, the patch is corrupted. Unchanged lines have an extra space.

Guenter
