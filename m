Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AF7C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Apr 2022 14:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234643AbiDEOq5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 5 Apr 2022 10:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353710AbiDENHS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Apr 2022 09:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B69A5167FA
        for <linux-hwmon@vger.kernel.org>; Tue,  5 Apr 2022 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649160547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wTHcEPqS4WZU3twPg6xFE08lBamScSNylvPFU0OFzg4=;
        b=B22yoDcAQRw1Vts9MS32ITUwy6/UdIQ7uF0jPjzo2fFQaRHzVqGAn71l4WMdwI/YPiS89+
        VvY3SfUBiwMAyAjYMm6S9kxg4PAoSF9c6EwSkPoSPbjowUITMpZVVChSxOzPRFTcT2QVh4
        YSPIN3GXs0jObkOHHKj5boFHVd/tEDA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-8jTVMF-9OQeyJrOMWwQfKA-1; Tue, 05 Apr 2022 08:09:06 -0400
X-MC-Unique: 8jTVMF-9OQeyJrOMWwQfKA-1
Received: by mail-qv1-f71.google.com with SMTP id jq7-20020ad45fc7000000b00443f07ce3fcso244462qvb.2
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Apr 2022 05:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wTHcEPqS4WZU3twPg6xFE08lBamScSNylvPFU0OFzg4=;
        b=PxygXRJewpdrbF9O5m7pMElmQObfLpVuxvK0ZSWuHNqmZmRNa94nSqmNpLlKrs9Vsz
         S6O2T7kSGss16R2GoOaCtoD3KT/tAni3xKxY6MhrjZdDy+2m8MR47abNhGU0/MEHKyld
         GdHfyCO4Xs8rWcfB8sAEfYKXgeLJ9X/RI2lVzibFJeV1d2HF30dOD99FxdL93JIn9q+n
         ETAg7aNZ+JWQx3PoKHmM3EcRUyJz82oR+QPtIY0yIk/gqTJexhgI1EDgFl+ucDymg2vz
         VgzkKS/bCnZxZCu+DhuM1JLnA33Y+oToj6uEM4gw2fgf501e2EU93rsbKDZza5hNK6UV
         bTGQ==
X-Gm-Message-State: AOAM533jYEIr+zOpmmVF86ev7p2jhJIZk2FIXrVvMn7fvswcZMuUBimg
        la0nZUM/Q/t/8P1Hlt2KLfJuvP+yoH4n1dEQyXyg39jRzCbk+FVn6wLKuJg5Q7v4ZE2bzxLGdio
        TbtAWMv6IQ6yKmPHlTwtDOpw=
X-Received: by 2002:ac8:4e8b:0:b0:2e2:129b:35f1 with SMTP id 11-20020ac84e8b000000b002e2129b35f1mr2557093qtp.387.1649160546381;
        Tue, 05 Apr 2022 05:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX7HhPj5mEGcuqhZHuJX+RbnyZLGTfgVtl7WdedWYWbPlNoy2uZL3YMCqfNCIwWRAhYtFenA==
X-Received: by 2002:ac8:4e8b:0:b0:2e2:129b:35f1 with SMTP id 11-20020ac84e8b000000b002e2129b35f1mr2557071qtp.387.1649160546126;
        Tue, 05 Apr 2022 05:09:06 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id c20-20020a05622a059400b002e1d59e68f3sm10850768qtb.48.2022.04.05.05.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 05:09:05 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] hwmon: intel-m10-bmc-hwmon: use
 devm_hwmon_sanitize_name()
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
        netdev@vger.kernel.org, David Laight <David.Laight@ACULAB.COM>
References: <20220405092452.4033674-1-michael@walle.cc>
 <20220405092452.4033674-3-michael@walle.cc>
From:   Tom Rix <trix@redhat.com>
Message-ID: <155156e6-e258-78dd-441a-7faad4afde3c@redhat.com>
Date:   Tue, 5 Apr 2022 05:09:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220405092452.4033674-3-michael@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/5/22 2:24 AM, Michael Walle wrote:
> Instead of open-coding the bad characters replacement in the hwmon name,
> use the new devm_hwmon_sanitize_name().
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Xu Yilun <yilun.xu@intel.com>
> ---
>   drivers/hwmon/intel-m10-bmc-hwmon.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
> index 7a08e4c44a4b..6e82f7200d1c 100644
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
> @@ -528,13 +527,9 @@ static int m10bmc_hwmon_probe(struct platform_device *pdev)
>   	hw->chip.info = hw->bdata->hinfo;
>   	hw->chip.ops = &m10bmc_hwmon_ops;
>   
> -	hw->hw_name = devm_kstrdup(dev, id->name, GFP_KERNEL);
> -	if (!hw->hw_name)
> -		return -ENOMEM;
> -
> -	for (i = 0; hw->hw_name[i]; i++)
> -		if (hwmon_is_bad_char(hw->hw_name[i]))
> -			hw->hw_name[i] = '_';
> +	hw->hw_name = devm_hwmon_sanitize_name(dev, id->name);
> +	if (IS_ERR(hw->hw_name))
> +		return PTR_ERR(hw->hw_name);
Reviewed-by: Tom Rix <trix@redhat.com>
>   
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, hw->hw_name,
>   							 hw, &hw->chip, NULL);

