Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEFEC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 17:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238444AbiLNRYK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 12:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237566AbiLNRYJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 12:24:09 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46374C770;
        Wed, 14 Dec 2022 09:24:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id m204so3171244oib.6;
        Wed, 14 Dec 2022 09:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRtrDGud35GWo1Og9uP0h9lSdVfkn+80KxzIfd/X9u4=;
        b=DUGuOk5jRdzvd9Nu5EdH3OJFEYzRFxO6wHaZj2mzcSTuJAl39B2nE7EikFlYTUCezM
         vDWjKtqPUFjghcCpN5E6t5qkYFhzUcULvZyNRtJbwiJNrKoGwdZd8OPOl/xGc0ExGlVT
         KgMvjDzYtDshDV3I8EdePNLZGqWqV20hoZGPH13URHqhUzLHTDxQ+jmR/oeYJxKdxSwH
         MzyzgQ1lbilun59rsFVIJEaLmGZiwaoFX/baIoZ/X0INpXj2UqNunyYHKncd+feKtFnI
         WvvT3VIwLsnkXIBAYHniqb8f7j8BFl2mKoq3jpfx3t0MJk20OdT4UU0KI7te7rTbkemR
         QjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRtrDGud35GWo1Og9uP0h9lSdVfkn+80KxzIfd/X9u4=;
        b=TK+Q/pOR2j/OOZdUls77COQOTv8Mrsa0B9VCu22V3DmCsD7iD85QOI4Q+gC866a6Dc
         K/AlyIxNsG3SlQGdXggd2hOAmHoU8pbxY3MdxnPFilxWedzcaYePPKUeLWzSLx8S9lvF
         +4GlnKpVXT23avoGy/oAU4i1MVYmmK0RH76p+gKnE7GiQ0bGWZQEYzzc/Mvc/sYG5bTK
         5QZYWqHVF6NlaCXoIeF0QewVOtnn2Xu4Iaejfoutm/qh8OHQTdGzhRcvx3dWNiq6p1O5
         kouolYgnHc9pr4PO4kbYHsCkT+Q8SV8f3u/AIqJvUkW9ltc1WudYVHSw6Rd4f+itpPjT
         mVrA==
X-Gm-Message-State: ANoB5pm8V3s1tWKfHX3+meTZQr/I4lRbZ9TGhVyMvqj/UtyWawYBfDHN
        8vXZNJYj8Am5vPein5IbkRY=
X-Google-Smtp-Source: AA0mqf5fbDegiQBJfDKx1esJo0idySzdd90F2xAuMuZPlzq+5tjwya6HFbHiECTfHrgRq2zjjLoMOw==
X-Received: by 2002:a05:6808:20aa:b0:35b:704f:d636 with SMTP id s42-20020a05680820aa00b0035b704fd636mr13670320oiw.48.1671038648594;
        Wed, 14 Dec 2022 09:24:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e13-20020a056830200d00b00661ad8741b4sm2608015otp.24.2022.12.14.09.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 09:24:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <246e7330-430f-e569-124d-55afc1b98dce@roeck-us.net>
Date:   Wed, 14 Dec 2022 09:24:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sinan Divarci <Sinan.Divarci@analog.com>, jdelvare@suse.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214142206.13288-1-Sinan.Divarci@analog.com>
 <20221214142206.13288-2-Sinan.Divarci@analog.com>
 <1697ded6-f04c-183b-4f92-ea4d5eb1c187@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] drivers: hwmon: Add max31732 quad remote
 temperature sensor driver
In-Reply-To: <1697ded6-f04c-183b-4f92-ea4d5eb1c187@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/14/22 09:02, Krzysztof Kozlowski wrote:
> On 14/12/2022 15:22, Sinan Divarci wrote:
>> The MAX31732 is a multi-channel temperature sensor that monitors its own
>> temperature and the temperatures of up to four external diodeconnected
>> transistors.
> 
> Use subject prefixes matching the subsystem (git log --oneline -- ...).
> There is no such prefix as "drivers".
> 
> I did not review the code, but it is easily visible that it does not
> conform to Linux coding style wrapping at 80. Wrap at 80.
> 

I accept line lengths up to 100 to avoid excessive and misaligned
continuation lines. As long as checkpatch --strict doesn't complain,
I won't complain either. checkpatch --strict doesn't complain, and a
brief look into the code tells me that - in terms of line length -
it is fine. Please do not introduce additional continuation lines.

Thanks,
Guenter

