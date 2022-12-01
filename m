Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5A8C43217
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Dec 2022 16:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiLAQjK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Dec 2022 11:39:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiLAQjH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2022 11:39:07 -0500
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com [192.185.145.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81E874AB6
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 08:39:06 -0800 (PST)
Received: from atl1wswcm01.websitewelcome.com (unknown [50.6.129.162])
        by atl3wswob03.websitewelcome.com (Postfix) with ESMTP id 24B5AEB23
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 16:39:06 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id 0maVpWIvGR3dd0maXpROeA; Thu, 01 Dec 2022 16:39:06 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
        Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=GgTnhe0B3cXs/oLOsaLvp0MgyDCHto0gydBPYUNi4j8=; b=O8MZrlCIlNpe/UdkM6ccTdg+j5
        ZAx2s5ewseqOrE7vzzY3mhlmDrOjoAAchyJd7QpumSQ/65NciS+H1/vyCq1pWXu+odlqLqqhq7tGT
        RrTsk86uS3l8lwMnOKDJtzb5GIwo5eDl5vmFPvVYLq+QbRHPhqrUsZDJspLaE/C4dM6fO8Fdc4n2+
        9hM0134bLFgisyaXCT9/5zjRKOBxcTfJwsC/ArupZ1JupXQqgOX2mBFdafcxentyAIIVXbMLucv6t
        lI2NU1cmJkdk5r96OwM0PyTtKYy/VcCxx6ydKOX7xJHAsjcx81hnTGG96dulol036wpedaEavnx1e
        I/QY6TLA==;
Received: from [106.197.183.239] (port=59743 helo=[192.168.221.42])
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1p0maS-003nb2-KA;
        Thu, 01 Dec 2022 16:39:02 +0000
Message-ID: <8228db8d-2a32-1d23-74f3-05b9fe529a82@linumiz.com>
Date:   Thu, 1 Dec 2022 17:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Saravanan Sekar <saravanan@linumiz.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: hwmon/pmbus: Add mps,mpq7932
 power-management IC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
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
 <785e942a-0691-f87e-b6e9-058749a79ec1@linaro.org>
Content-Language: en-US
In-Reply-To: <785e942a-0691-f87e-b6e9-058749a79ec1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 106.197.183.239
X-Source-L: No
X-Exim-ID: 1p0maS-003nb2-KA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.221.42]) [106.197.183.239]:59743
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 7
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM3bq91SC5HQFLl4EHQks6a3rKF/irORWycZ9RALbeIXB3bYeRuOjWN59COMCmuqyy3zU7L07tvK+eBM6n/hnVCcAZGoejP3pV84FKK2sFXXuG67dYOD
 yhuR2Zb0qI3r7eF3iilY/e/K35qOzN0ZRFYbnX+Zcxot3V8PAv5JJp0R0OfME4apmY+6Bf38P4Qc1lB11iy48G6KWnAe776egi8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 01/12/22 17:15, Krzysztof Kozlowski wrote:
> On 01/12/2022 16:37, Guenter Roeck wrote:
>> On 12/1/22 03:38, Krzysztof Kozlowski wrote:
>>> On 01/12/2022 12:29, Saravanan Sekar wrote:
>>>> On 01/12/22 11:26, Krzysztof Kozlowski wrote:
>>>>> On 01/12/2022 05:46, Saravanan Sekar wrote:
>>>>>> Document mpq7932 power-management IC
>>>>>>
>>>>>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>>>>>> ---
>>>>>
>>>>> This is a friendly reminder during the review process.
>>>>>
>>>>> It seems my previous comments were not fully addressed. Maybe my
>>>>> feedback got lost between the quotes, maybe you just forgot to apply it.
>>>>> Please go back to the previous discussion and either implement all
>>>>> requested changes or keep discussing them.
>>>>>
>>>> Hi Krzysztof,
>>>>
>>>> Thanks for your time to review and feedback.
>>>>
>>>> Here are the summary of comments on V1, I have fixed all according to my
>>>> understanding.
>>>>
>>>>
>>>> 1. Use subject prefixes matching the subsystem (git log --oneline -- ...).
>>>>
>>>> git log --oneline -- Documentation/devicetree/bindings/hwmon/pmbus/
>>>> 1ccca53618c4 dt-bindings: hwmon/pmbus: Add mps,mpq7932 power-management IC
>>>> 373c0a77934c dt-bindings: hwmon/pmbus: Add ti,lm25066 power-management IC
>>>> 7f464532b05d dt-bindings: Add missing 'additionalProperties: false'
>>>> 8a36e38d8b0f dt-bindings: hwmon/pmbus: Add ti,ucd90320 power sequencer
>>>>
>>>> I have used the same format of 373c0a77934c.
>>>>
>>>> 2. Does not look like you tested the bindings. Please run `make
>>>> dt_binding_check` (see
>>>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>>>
>>>> I did run dt_binding_check on V1 but failed to notice warnings. Fixed
>>>> warning on V2 and didn't observed any warnings.
>>>>
>>>> 3. Why requiring nodename? Device schemas usually don't do that.
>>>> dropped "pattern: "pmic@[0-9a-f]{1,2}""
>>>>
>>>> 4. regulators node is a regulator with one more regulator? Drop.
>>>> dropped "$ref: regulator.yaml# "
>>>
>>> The comment was - drop entire regulators node.
>>>
>>> Plus additional comment for the driver (and related to bindings) was
>>> that this is not hwmon but a regulator driver. Why putting regulator
>>> driver in hwmon?
>>>
>>
>> Turns out this is primarily a hardware monitoring driver, like the drivers
>> for all other PMBus chips. Regulator support is actually optional; the driver
>> works perfectly well with CONFIG_REGULATOR=n (except that it needs some
>> #ifdefs to address that situation).
> 
> OK, this would explain location  of the driver. However the bindings are
> saying:
> "Monolithic Power System MPQ7932 PMIC"
> and PMIC is not mainly a hwmon device, even if it has such capabilities.
> It might be missing description and proper title... or might be misplaced.
> 

Indeed it is PMIC chip. I think this is not the first and not sure title 
has to be changed for hwmon subsystem.

bindings/hwmon/pmbus/ti,lm25066.yaml
title: National Semiconductor/Texas Instruments LM250x6/LM506x 
power-management ICs

Thanks,
Saravanan
