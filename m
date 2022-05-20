Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CAFC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 13:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349966AbiETNqB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 09:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349941AbiETNpy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 09:45:54 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BA9DF9;
        Fri, 20 May 2022 06:45:48 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-e5e433d66dso10343496fac.5;
        Fri, 20 May 2022 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gnfC2gdXt5skunhZgJBZBA6SAXMYjZHmsGyamvnzVS4=;
        b=nEgmTMuQQzYngcAPhpH0B60sFaDtFHDqA6M/SzrCHddwpHgnZlpV643OVR4B4Z7Ia3
         L2Fg/E94/SsyAE7yfTgFRB7O+GgZ6jTfyx8iCr9ev5x+se7rFRqRSJ/3+vgTuPnFNlIb
         DQmF9daCQR5KpZK4QpJlsGUEqe9ABnnzAl7Ez1NRCx6TDtQjPGAEZpDu4wf7jlwNdIwj
         5lgASaxNtzoMV52hX/g8ExxFpBKVorsdK/eOJi/AejzK5kSJ+34pN7uququWTvgQ60s6
         9ytlW2BZftF+v5Ral6lUqxzw6fYFYoG4G8po75UbAJFfI5ogD/sK6oEzk+qV5B0l6xqu
         XZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gnfC2gdXt5skunhZgJBZBA6SAXMYjZHmsGyamvnzVS4=;
        b=ZwnG5jXX6UJPqfxE51kZH3TxtDHoiy6W4CIlFSsCL6EODtBjZHw+PWiOoU13/t1V+K
         9JOlEcaUP3dXjKlRkMG6COqNe9lBdDCQmY98zbKHyFnIumxGw0XCR/3611NgWzTsJznY
         npfOUpYRNIVkopIR2Efbt4NK6edpJoysE8/iAJURmatFjReWjg+vSyYaohVHCtXwnTTp
         X4rr+d8ohno44IoM0EEPN3cVf6ImozSfCzxsJdPay6xpwoXe6X8q22+Uom9dVOwRjJwY
         JONdjTvR9gTJ3whBbVLJoAQr1LG4ljZg/kCKIDfQyNySD+/zp05KCELuBo0GcwUC+wx4
         VyIA==
X-Gm-Message-State: AOAM533lIxCB8CloeO064d63voPRzvu5CU0O5U/Y9I/FUWzHHya/r4QN
        sMjUcN+gseg/n2EYe7N7ZOU=
X-Google-Smtp-Source: ABdhPJw0ZFuoTxLSgxDW7FlXI9RVAyKYaSoVz1TUcTMfOmTaO8SlO0oeVulPZsG+HPigvu5e7VfvJg==
X-Received: by 2002:a05:6870:1690:b0:f1:de50:272b with SMTP id j16-20020a056870169000b000f1de50272bmr5921985oae.145.1653054347945;
        Fri, 20 May 2022 06:45:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i4-20020a056870044400b000f15ca674b2sm884649oak.52.2022.05.20.06.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 06:45:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c1b1f02a-42c2-bc67-ab92-c0bf9dabbe94@roeck-us.net>
Date:   Fri, 20 May 2022 06:45:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/8] Add support for ADT7481 in lm90
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com
References: <20220520093243.2523749-1-sst@poczta.fm>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/20/22 02:32, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> This patch series adds support for ADT7481 in lm90.c driver and extends the
> device-tree options for it.
> 
> The ADT7481 is quite similar to MAX6696 (already supported in lm90) so a lot of
> code is reused.
> 
> One major problem in fitting the ADT7481 in lm90.c is the chip detection.
> However it seems that the chip has been designed and produced with correct
> values at locations: 0xfe (manufactured id) and 0xff (chip id), but this is not
> documented in the datasheet.
> 

Before we go too far along this route, would you mind using my own patch series
as base to implement the devicetree changes ? I had prepared an extensive
patch series a while ago, adding not only support for ADT7481 but for
several other chips as well, I just never got around to sending it out.

Thanks,
Guenter

> $ i2cdump -y -f -r 254-255 1 0x4c
> No size specified (using byte-data access)
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> f0:                                           41 62                  Ab
> 
> The device-tree changes allow to: set the extended temperature range mode and
> set the label and offset for specific channel.
> 
> Note: previous "attempts" for adding ADT7481 in lm90 where here: [1][2].
> 
> [1] https://www.spinics.net/lists/lm-sensors/msg25066.html
> [2] https://marc.info/?l=lm-sensors&m=137786448326215&w=2
> 
> Slawomir Stepien (8):
>        dt-bindings: hwmon: Add support for ADT7481 in lm90
>        dt-bindings: hwmon: Add 'extended-range-enable' property support in lm90
>        dt-bindings: hwmon: Allow specifying channels for lm90
>        hwmon: (lm90) add support for ADT7481
>        hwmon: (lm90) define maximum number of channels that are supported
>        hwmon: (lm90) enable the extended temperature range
>        hwmon: (lm90) read the channel's label from device-tree
>        hwmon: (lm90) read the channel's offset from device-tree
> 
>   .../devicetree/bindings/hwmon/national,lm90.yaml          |  42 ++++
>   Documentation/hwmon/lm90.rst                              |  12 +-
>   drivers/hwmon/Kconfig                                     |  15 +-
>   drivers/hwmon/lm90.c                                      | 251 ++++++++++++++++++++----
>   4 files changed, 271 insertions(+), 49 deletions(-)
> 
> 

