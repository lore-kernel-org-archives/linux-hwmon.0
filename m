Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC4FC47088
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 16:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbiLAQPk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 11:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbiLAQPh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 11:15:37 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D328318E17
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 08:15:35 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id x6so2409219lji.10
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2022 08:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVe7HFWMhLBCylNic+cZhWHATEyLIj4l0xDW9sdNQ2M=;
        b=DRyWXk2DOOlUS3kGg3sSzhYkdIOUzMMzyekkn1TZwMe0/2RsrZFOWWgimA5UOjCpy5
         qKDPgv/GLYwxxUOcfetERE98yfh2eKCYoeJ3RBeWKhII3WVZknOs1sAAvjFR4ssnMo29
         7pC9yNN9XSIbX3rVmN7fOFJ9GRaWvbp4hmAAN+rZkdobAiKwpZQ5QxxCduU5IFfVcXMt
         f8LyJP1oRaU3AQ6E1SLooXuVQwuPO7exxY8rf8BBWE6dXounnI3psjZlPwcnMqfjgWeM
         OynlFP7ofqvU+97GIOdTgJzR8eojtOxiV4aN9T1e2GzZUbQs8HBdKsxQ7CVJkouCKEak
         TF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVe7HFWMhLBCylNic+cZhWHATEyLIj4l0xDW9sdNQ2M=;
        b=zXl/CtVlv3fa/MbileH6Oc8VkU7iKZsyifjYZKHNc23woItHEWrh5WIm38z+wgWZqi
         5MewVNQKXWF6icWGpnkHZlXCplNoaM5yYdCmqgTeguDbYIRHAODIeW2tk2Kyo/I4azeZ
         Ac2lcHHhbYOVmf77X5sDVbUrI2ytqJMyfhht5dcPI7x5LJAr4iyusU0vXWBGrGmKQDjc
         capCEhQE1ABXwGobwQGGLRcozkCzhdyp588KHabBXIzTbg7tyYBlVABGPChLyaz7R6o8
         /8bg4TSKectT6/xrOtj+n8EX/nwCQ1ffsHcKLUKOtAUBiT9X91GQPiKjf/4CKF1cOZmW
         grcg==
X-Gm-Message-State: ANoB5pkSHkdtOJCLStPAeH3FMyBZ3M1P4OYVqeFzr4z3+CznXgKZBST3
        4ZbxfTkfLjm9M0B4F9v29+NfrQ==
X-Google-Smtp-Source: AA0mqf71+KG05AOpxBsK2+Wku76C5RQTX31OiWIJub6xX1MDWpXmKNE4alKMSmb7U18uoTko0XBNzg==
X-Received: by 2002:a05:651c:98e:b0:277:a9d:9370 with SMTP id b14-20020a05651c098e00b002770a9d9370mr20152951ljq.103.1669911334190;
        Thu, 01 Dec 2022 08:15:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v3-20020a05651203a300b004a4754c5db5sm688946lfp.244.2022.12.01.08.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:15:32 -0800 (PST)
Message-ID: <785e942a-0691-f87e-b6e9-058749a79ec1@linaro.org>
Date:   Thu, 1 Dec 2022 17:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Saravanan Sekar <saravanan@linumiz.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marten.lindahl@axis.com,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20221201044643.1150870-1-saravanan@linumiz.com>
 <20221201044643.1150870-3-saravanan@linumiz.com>
 <bc86121f-3cc2-1e55-4c6a-02cb1644a8bd@linaro.org>
 <e7b20055-4f44-aa91-e18d-9fb0f835fbf1@linumiz.com>
 <29de4d2b-3e32-809e-6ccd-5e7a4fe548fc@linaro.org>
 <e0d97b79-2133-8869-eaea-eb286fdb3a11@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0d97b79-2133-8869-eaea-eb286fdb3a11@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/2022 16:37, Guenter Roeck wrote:
> On 12/1/22 03:38, Krzysztof Kozlowski wrote:
>> On 01/12/2022 12:29, Saravanan Sekar wrote:
>>> On 01/12/22 11:26, Krzysztof Kozlowski wrote:
>>>> On 01/12/2022 05:46, Saravanan Sekar wrote:
>>>>> Document mpq7932 power-management IC
>>>>>
>>>>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>>>>> ---
>>>>
>>>> This is a friendly reminder during the review process.
>>>>
>>>> It seems my previous comments were not fully addressed. Maybe my
>>>> feedback got lost between the quotes, maybe you just forgot to apply it.
>>>> Please go back to the previous discussion and either implement all
>>>> requested changes or keep discussing them.
>>>>
>>> Hi Krzysztof,
>>>
>>> Thanks for your time to review and feedback.
>>>
>>> Here are the summary of comments on V1, I have fixed all according to my
>>> understanding.
>>>
>>>
>>> 1. Use subject prefixes matching the subsystem (git log --oneline -- ...).
>>>
>>> git log --oneline -- Documentation/devicetree/bindings/hwmon/pmbus/
>>> 1ccca53618c4 dt-bindings: hwmon/pmbus: Add mps,mpq7932 power-management IC
>>> 373c0a77934c dt-bindings: hwmon/pmbus: Add ti,lm25066 power-management IC
>>> 7f464532b05d dt-bindings: Add missing 'additionalProperties: false'
>>> 8a36e38d8b0f dt-bindings: hwmon/pmbus: Add ti,ucd90320 power sequencer
>>>
>>> I have used the same format of 373c0a77934c.
>>>
>>> 2. Does not look like you tested the bindings. Please run `make
>>> dt_binding_check` (see
>>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>>
>>> I did run dt_binding_check on V1 but failed to notice warnings. Fixed
>>> warning on V2 and didn't observed any warnings.
>>>
>>> 3. Why requiring nodename? Device schemas usually don't do that.
>>> dropped "pattern: "pmic@[0-9a-f]{1,2}""
>>>
>>> 4. regulators node is a regulator with one more regulator? Drop.
>>> dropped "$ref: regulator.yaml# "
>>
>> The comment was - drop entire regulators node.
>>
>> Plus additional comment for the driver (and related to bindings) was
>> that this is not hwmon but a regulator driver. Why putting regulator
>> driver in hwmon?
>>
> 
> Turns out this is primarily a hardware monitoring driver, like the drivers
> for all other PMBus chips. Regulator support is actually optional; the driver
> works perfectly well with CONFIG_REGULATOR=n (except that it needs some
> #ifdefs to address that situation).

OK, this would explain location  of the driver. However the bindings are
saying:
"Monolithic Power System MPQ7932 PMIC"
and PMIC is not mainly a hwmon device, even if it has such capabilities.
It might be missing description and proper title... or might be misplaced.

Best regards,
Krzysztof

