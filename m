Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5BEC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Mar 2022 12:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241181AbiC1M1S (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Mar 2022 08:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232505AbiC1M1S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Mar 2022 08:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58213766A
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Mar 2022 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648470336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GvJCNB2Cnl/nlDULpdtsfyTRfdka37fX/FHgNiQs3CE=;
        b=UWVFKoElXqvWCLqfPsIxURQmLn2qvubUV/RVRGM7DORv0FOGigXsUcqqK9AqWHveY5Kjfk
        eXV1iu8We8fr2MwjDA7KoDoNzdBFcUctxNB7+WpIbP/oeTnew9secspMqkSFMUI26D6rVi
        pNxm83e5nbDqyavahy2BqpO5SAWogIc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-2EiZVqsLMg-hfrQJRLgv6Q-1; Mon, 28 Mar 2022 08:25:35 -0400
X-MC-Unique: 2EiZVqsLMg-hfrQJRLgv6Q-1
Received: by mail-qk1-f199.google.com with SMTP id 207-20020a3703d8000000b0067b14f0844dso8249972qkd.22
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Mar 2022 05:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GvJCNB2Cnl/nlDULpdtsfyTRfdka37fX/FHgNiQs3CE=;
        b=4IE6ie2IZFpzZ6CqBEMSj4oVNCGzYZd40HPyam1unQLPL3+UfP26bbVgZWwCsz/L0O
         6iM/4zWdDLldkSP5VLSzidA0VESgZQ8uEQtp4pqJCUPtKYcZy82Yi+ZrZY+xuUxi0Uir
         y6sHZec8emp5GYgLmfFdwIsSP1P1/75nOHAUDSlVFr3yh1RmxM9TUzWFfR/1UXMlMXfy
         ++plCFmbvm5qbyhFft2LqqeN1PuK9qfOhH23ExNKluH+oNWDQrKZjB4o+CD58OKjZQAq
         dqRW2NGVX0mtFY77pk0uM1v2c/R+GIW9Yrf/rfYFHZrgipdepXfAMPwrH8sCX2Jgwbid
         nW4A==
X-Gm-Message-State: AOAM533DVeb/vJRFfbuHftKuL/0Oh21Y1vkMPODU4MPsqTZez6be3Svb
        3QB30Lo/J5ufHC42DOvKcrN8jb2FkgaQOgq3AXTffXptlFUt1Q9tOYNGLDedLeK7Qi7v1verAPV
        DlKSz00P2Lv+f4o77lXSE2mA=
X-Received: by 2002:a05:622a:107:b0:2e1:d655:cc4c with SMTP id u7-20020a05622a010700b002e1d655cc4cmr21566401qtw.669.1648470334645;
        Mon, 28 Mar 2022 05:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAQwqAdu+kg9mfWp0pBO/UFlRsaaQCJ2OhGI1xR4a2IZwQG3pphqjbnU8jqdybbi/S9OtTEw==
X-Received: by 2002:a05:622a:107:b0:2e1:d655:cc4c with SMTP id u7-20020a05622a010700b002e1d655cc4cmr21566381qtw.669.1648470334415;
        Mon, 28 Mar 2022 05:25:34 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id y17-20020a05622a121100b002e0702457b2sm12282866qtx.20.2022.03.28.05.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 05:25:34 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] hwmon: introduce hwmon_sanitize_name()
To:     Michael Walle <michael@walle.cc>, Xu Yilun <yilun.xu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20220328115226.3042322-1-michael@walle.cc>
 <20220328115226.3042322-2-michael@walle.cc>
From:   Tom Rix <trix@redhat.com>
Message-ID: <a1f71681-0eb0-c67f-53e0-dfce9d2fdea9@redhat.com>
Date:   Mon, 28 Mar 2022 05:25:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220328115226.3042322-2-michael@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 3/28/22 4:52 AM, Michael Walle wrote:
> More and more drivers will check for bad characters in the hwmon name
> and all are using the same code snippet. Consolidate that code by adding
> a new hwmon_sanitize_name() function.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   drivers/hwmon/intel-m10-bmc-hwmon.c |  5 +----
>   include/linux/hwmon.h               | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
> index 7a08e4c44a4b..e6e55fc30153 100644
> --- a/drivers/hwmon/intel-m10-bmc-hwmon.c
> +++ b/drivers/hwmon/intel-m10-bmc-hwmon.c
> @@ -515,7 +515,6 @@ static int m10bmc_hwmon_probe(struct platform_device *pdev)
>   	struct intel_m10bmc *m10bmc = dev_get_drvdata(pdev->dev.parent);
>   	struct device *hwmon_dev, *dev = &pdev->dev;
>   	struct m10bmc_hwmon *hw;
> -	int i;
>   
>   	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
>   	if (!hw)
> @@ -532,9 +531,7 @@ static int m10bmc_hwmon_probe(struct platform_device *pdev)
>   	if (!hw->hw_name)
>   		return -ENOMEM;
>   
> -	for (i = 0; hw->hw_name[i]; i++)
> -		if (hwmon_is_bad_char(hw->hw_name[i]))
> -			hw->hw_name[i] = '_';
> +	hwmon_sanitize_name(hw->hw_name);
>   
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, hw->hw_name,
>   							 hw, &hw->chip, NULL);
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index eba380b76d15..210b8c0b2827 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -484,4 +484,20 @@ static inline bool hwmon_is_bad_char(const char ch)
>   	}
>   }

hwmon_is_bad_char is now only used by hwmon_sanitize_name.

as patch 3, consolidate into only hwmon_sanitize_name.

Tom

>   
> +/**
> + * hwmon_sanitize_name - Replaces invalid characters in a hwmon name
> + * @name: NUL-terminated name
> + *
> + * Invalid characters in the name will be overwritten in-place by an
> + * underscore.
> + */
> +static inline void hwmon_sanitize_name(char *name)
> +{
> +	while (*name) {
> +		if (hwmon_is_bad_char(*name))
> +			*name = '_';
> +		name++;
> +	};
> +}
> +
>   #endif

