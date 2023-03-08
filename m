Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87647C64EC4
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Mar 2023 14:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbjCHOiD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Mar 2023 09:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjCHOiB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2023 09:38:01 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02967A267
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Mar 2023 06:37:58 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g3so66751140eda.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Mar 2023 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678286277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IswmBeGDujtpSeyrahtx2BBhupqfPmXINK1Qc/Od5So=;
        b=Y0uHWC456U/oCFTWFkzg842eAyPPsA9wRLoFWBcw+bq0YFXbSnS+Iixk1cAHP0ZECo
         uB4hST+fylxggFmTrIhSZUy4NKrksR/q4aG7DxhKMbMktBqc6i6dAiutGRT/+I0Epn8z
         L02ERPOXLJeKJWG4UDJ4119pTiAwR34s3YnRaErMTFrL9VpGsZcH+INbgvpRwlfdNHEB
         RlIG3nmmSELH21YymDfRuNdCB/3HmMnf/mvCHVvmBUOC2AMsZDw/J7hI6r3K91UAvsJL
         ki6Jkq6YFNBS6+OwQffCxDLm2CWYfd7i+XX0QG0SIDpMKF4SeQYyI44QiNTWPjHMzMs/
         gMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678286277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IswmBeGDujtpSeyrahtx2BBhupqfPmXINK1Qc/Od5So=;
        b=tGEahMEdLroAygom3wYkGVqZYWinjayBx5z6EfkS+QRQfVPi/tmTD///zBqWePyvDc
         XulaoiE+Eoa6kWPAHyVQ4mzz3WhE+bqhhtB3GywB5zqvfAvFjaTwPLHAT9nK26k5ld/V
         knRG3EAgcXpD0q7R/O3J4UGftcKqUjfQoNjJ1JTKmz7GI38aPaq5D7AbE7929o5gpbWj
         3cejr1sre5hb/jqY19J7iEU2HxDvB7q/5gCRbRiRgD3gftrn6Ry2jJXBrQbwPnrfC1Ga
         PMrB17DkPKU2IM1bojf8YWQQ3RJ/RHCY+qsQHHgpL1NjmEHhk/io4nPp/ngzdVd7BJgO
         V+CA==
X-Gm-Message-State: AO0yUKXFXzSJh9wL0yzjq5Zg2om+9hJwU6iIUKLeDcfA4wIuH5dRJ/vC
        syxOTqHH3nI2kJHfpMxWTlV2NQ==
X-Google-Smtp-Source: AK7set9+IzJD5CqH8haTjWU1/y5zJiGgFWDJmbLkSNeyLdj0vKmCTEnqxayI0EfYpnPVJb7gZ07BWg==
X-Received: by 2002:a17:907:9713:b0:8b1:a3c7:a9c9 with SMTP id jg19-20020a170907971300b008b1a3c7a9c9mr22751328ejc.70.1678286276907;
        Wed, 08 Mar 2023 06:37:56 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id u17-20020a50c2d1000000b004af759bc79asm8266873edf.7.2023.03.08.06.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 06:37:56 -0800 (PST)
Message-ID: <8f855f2d-fbe8-fc51-0524-390605c9f91e@linaro.org>
Date:   Wed, 8 Mar 2023 15:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: ina2xx: add supply property
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308094024.14115-1-clamor95@gmail.com>
 <20230308094024.14115-2-clamor95@gmail.com>
 <31ca0ede-012c-4849-bf25-d0492b116681@sirena.org.uk>
 <6DBD0F5A-4625-4FCD-8D64-23293D734A82@gmail.com>
 <5cd6764c-9b04-42ea-932d-9f14aa465605@sirena.org.uk>
 <135993BF-B4AC-42C1-AD36-94F66EE1620D@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <135993BF-B4AC-42C1-AD36-94F66EE1620D@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/03/2023 15:01, Svyatoslav Ryhel wrote:
>>>>> +  vdd-supply: true
>>>>> +
>>>>>  required:
>>>>>    - compatible
>>>>>    - reg
>>
>>>> Unless the device can work without power the supply should be required.
>>
>>> Device can work without supply defined on most devices, but in my case power is gated with gpio and devices will not work without fixed regulator.
>>
>> If there are devices that work without any source of power at all that
>> would be very surprising.  It doesn't matter if a particular system has
>> a non-controllable regulator, the binding should still make it mandatory
>> to describe that.
> 
> Then question is WHY and WHO passed driver without power supply system implemented? Why it pops only now?

Why do you mention driver? We talk about bindings and device. What the
driver does, matters less here.

Best regards,
Krzysztof

