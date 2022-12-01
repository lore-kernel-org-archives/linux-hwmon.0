Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0482C43217
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 11:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbiLALih (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 06:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbiLALif (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 06:38:35 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8682CCB3
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 03:38:32 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id bn5so1570079ljb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 03:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUvP+fbh+LbeoMcKSslf8ydYhHl1l7ffmnzPtMfNWuA=;
        b=k4Dgpb/F7Unab4wrYFJA4Mb9EFuFoR0MUsSAcPi1em3TWiua69YsdPUnTpx/NnnqCC
         xzMTJLNux1isYDHJE7SaOErPXJnzA4H9jMhO1Ng/EK664fBBqnh9QYOwik6Nqa2n3LQl
         E3or9rR6zABHxl6HQQ6kJNBcUKpjuuNaEKlYyzqUHwuYKlTt42ck3GE0KYPgcR0nh5Z5
         1RTbvtfr7ariRZlKZuumbBQl9OucsKanujX/giV/5ZtsMHFd5jxBxAaFIK6fr/6dz+JF
         c7eFF4RIF6sxpClJF2MMxAWQ+k+nrczHhjIE8x7HwD2FRNMGQC961c950af7jVRtJjNb
         fuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUvP+fbh+LbeoMcKSslf8ydYhHl1l7ffmnzPtMfNWuA=;
        b=BaNpvWPJHJVrzYp0snsBtT/i0ZyDPYBsfmxIgYXqyhfEzvSTGjGNhoW7Xuhdhdbq9y
         GvNEpHudeNLA9Y5d9SGzcFIkPhky/FoZI9aFk1iNOhnDgXn2zFfEPHBnxO8bMtK3tFKQ
         OzaGuDe3JQCajF07NpJFJPLV7FTHB4qOWvzqeytv0+Ky6+AdQM1AD2sB6TQdsxdiHg4/
         kO2P8ILW0rZfhgoXzWoymQQQdb4SL8y6HhdcFYpuwBY5LYAhYIkylbeEkIqsdfivm8g4
         X9d+Hw+NxCZNMjN1XHQ9fYhepW+7u2mGsbb9VpLg+YvQTjzeamNtcCM0N5VMahppsEJ8
         cmzA==
X-Gm-Message-State: ANoB5pmfEDSeQSGVwfpPTw24WAmeqnqU3GNso2J6Np0FMphyW8pn6AIy
        JsJiYsvADgKfVPX1cst0fyOA/A==
X-Google-Smtp-Source: AA0mqf5pE5MPhUJ2CBEp6Gwji5cxkigvq5nFV5Vi6RkNBr4c2bCV+qB4f+m3vMpPNjU40MnrQO3H0Q==
X-Received: by 2002:a2e:984d:0:b0:279:8e68:203d with SMTP id e13-20020a2e984d000000b002798e68203dmr9495820ljj.96.1669894710995;
        Thu, 01 Dec 2022 03:38:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a15-20020a19f80f000000b004949f7cbb6esm616990lff.79.2022.12.01.03.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:38:29 -0800 (PST)
Message-ID: <29de4d2b-3e32-809e-6ccd-5e7a4fe548fc@linaro.org>
Date:   Thu, 1 Dec 2022 12:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Saravanan Sekar <saravanan@linumiz.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        marten.lindahl@axis.com, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-3-saravanan@linumiz.com>
 <bc86121f-3cc2-1e55-4c6a-02cb1644a8bd@linaro.org>
 <e7b20055-4f44-aa91-e18d-9fb0f835fbf1@linumiz.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e7b20055-4f44-aa91-e18d-9fb0f835fbf1@linumiz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/2022 12:29, Saravanan Sekar wrote:
> On 01/12/22 11:26, Krzysztof Kozlowski wrote:
>> On 01/12/2022 05:46, Saravanan Sekar wrote:
>>> Document mpq7932 power-management IC
>>>
>>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>>> ---
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
> Hi Krzysztof,
> 
> Thanks for your time to review and feedback.
> 
> Here are the summary of comments on V1, I have fixed all according to my 
> understanding.
> 
> 
> 1. Use subject prefixes matching the subsystem (git log --oneline -- ...).
> 
> git log --oneline -- Documentation/devicetree/bindings/hwmon/pmbus/
> 1ccca53618c4 dt-bindings: hwmon/pmbus: Add mps,mpq7932 power-management IC
> 373c0a77934c dt-bindings: hwmon/pmbus: Add ti,lm25066 power-management IC
> 7f464532b05d dt-bindings: Add missing 'additionalProperties: false'
> 8a36e38d8b0f dt-bindings: hwmon/pmbus: Add ti,ucd90320 power sequencer
> 
> I have used the same format of 373c0a77934c.
> 
> 2. Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 
> I did run dt_binding_check on V1 but failed to notice warnings. Fixed 
> warning on V2 and didn't observed any warnings.
> 
> 3. Why requiring nodename? Device schemas usually don't do that.
> dropped "pattern: "pmic@[0-9a-f]{1,2}""
> 
> 4. regulators node is a regulator with one more regulator? Drop.
> dropped "$ref: regulator.yaml# "

The comment was - drop entire regulators node.

Plus additional comment for the driver (and related to bindings) was
that this is not hwmon but a regulator driver. Why putting regulator
driver in hwmon?

Best regards,
Krzysztof

