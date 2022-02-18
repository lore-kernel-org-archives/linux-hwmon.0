Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63D0C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Feb 2022 11:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbiBRLpi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Feb 2022 06:45:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234926AbiBRLpc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Feb 2022 06:45:32 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEFF2656C
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Feb 2022 03:45:12 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9FAC53F1B6
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Feb 2022 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645184711;
        bh=45nuHUTa3RbpU9ZD2lFZMGw59sOMcHKVRXRiU7R5uSM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ggRoyrwCgnNxLT9ztgEVy9MIiNaEtqT5m37epkFcrfOro7jxvvJ162YWwIGWFKC7z
         1mQW35a8Vy8t8mhX0FoUYuY8R4CLVa4+FA9gs1Lk7TVjBrTqffrJ00kuTXOMJfG5p/
         JrS59G73LXp6sZLs8l7x7FfrQS5RsQtUEPtM8EyKII7A30V83ztY1IAJX7wHahIXhe
         36l5U+U1ys594I4dHHYzKOq7Xg4NyEnB6pv5X5pf5Eyj08paYs0UBOk2KPZ+7MLD8/
         2DOODsEV6W0YZCqAoroVm1wePrh5vU+hDV1Tnqg5kW7L5LQ6Walvkbq00DOtZC7fxc
         snU81A6HBoj3A==
Received: by mail-ed1-f72.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so5352582edw.23
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Feb 2022 03:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=45nuHUTa3RbpU9ZD2lFZMGw59sOMcHKVRXRiU7R5uSM=;
        b=GXG0t8Yr0BQctttLp7I3znEgnq+6xbFfRWMeSPhKydgUhal8zo6jb1P0g1cSjp31Ec
         EAuccyrNAgZOKtdp4QDUe2CUoukIMQcR6ahpF+AbjWubv8CesskKCX8BIQUkVAD+tWaR
         QaRQvmOcpUE8NrqdvU0p7L3PhxuNmrJ8oKt6hMM41m0My5rulzJBHm9yeXQG3tw76E9D
         mwE5ySoTXQUcjVcBaPdvwGAZKOkaBbWiEjMbx4xtEqwxJWSsSRQXbPqsE5p2JEOktX1R
         cl4M+4ehB/sHkUJHcpfgZ6uXylcdq7vcJSL6QHB5+lNodhSZA4W9LvQz9F0VYwPmdVNb
         JfOQ==
X-Gm-Message-State: AOAM533+ixpOsJNZj5qm3i+YDIgTBparD+/K5edGie7c1g3e6yUGAHzX
        vjIMuciOkKPAE6f1qfg7Y4Uo//3HfYPkkLZCOMFdmPtP9hQnkXqmAFLcl6uz1bArXF8VcZofgPV
        AwAynQcknqpOvOQCOJMbXGFNf7RfYaRBYNtDY7qr1
X-Received: by 2002:a17:906:278f:b0:6d0:432:2bbb with SMTP id j15-20020a170906278f00b006d004322bbbmr6167786ejc.160.1645184711325;
        Fri, 18 Feb 2022 03:45:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynV0dqjgLoTTflCymfyGQ9pUWeXfBpXUKar3Oqdvi+s3Aq3gKPvuS2SCHhSltOpHfDxs7+Wg==
X-Received: by 2002:a17:906:278f:b0:6d0:432:2bbb with SMTP id j15-20020a170906278f00b006d004322bbbmr6167766ejc.160.1645184711154;
        Fri, 18 Feb 2022 03:45:11 -0800 (PST)
Received: from [192.168.0.114] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 5sm2166711eji.192.2022.02.18.03.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 03:45:10 -0800 (PST)
Message-ID: <71974ee4-c21a-a446-91cc-7a3ced59af5b@canonical.com>
Date:   Fri, 18 Feb 2022 12:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: Add ti,tmp125 temperature sensor
 binding
Content-Language: en-US
To:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
References: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <d3538ba9beededfe3a9ad5dab4903a6a01834822.1645175187.git.chunkeey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 18/02/2022 10:06, Christian Lamparter wrote:
> From the freely available Texas Instruments' TMP125 datasheet:
> 
> "The TMP125 is an SPI-compatible temperature sensor available in the
> tiny SOT23-6 package. Requiring no external components, the TMP125
> is capable of measuring temperatures within 2 degree C of accuracy
> over a temperature range of −25 degree C to +85 degree C and
> 2.5 degree C of accuracy over −40 degree C to +125 degree C."
> 
> The TMP125 is very similar to the TMP121/TMP122 series of familiar
> chips.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
