Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF66C678D5
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Mar 2023 10:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjCHK0G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Mar 2023 05:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjCHKZm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2023 05:25:42 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BE8B78AB
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Mar 2023 02:25:37 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s11so63646051edy.8
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Mar 2023 02:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naE0AMEKJ5IdS0Ovxmj4rx2/QwnramEvAuCqlBIumMM=;
        b=dVDL5zUG4JGyuWAHDz+UPheNWi5fB+AUPJUeNsSYz8UBQyU+UPr07Oy87rHoM57KqG
         SiYm09nouXAOu1xy20isJg9rflIeHpgQLcyzVEuBtph/mbXyyYxktRtMSVvFvrRcmg80
         0j7T1UlWHyAxXmVb2lFSAP5bCYAtwzIIKt88+f+6e0Ji/APZh3H+nUVvF4tLW49zF2xS
         dZijPFAn2TARv1H6RyZ9mW+mTXtx8+3GxekBQYq2nVNcNBs7DN8qJANRSUDkvV1RZ11C
         Q2PE4bGIT749q4HTRjLbQSo9+D7XAqV+syPq9tHOyNnIP/8Ns6mju78vrp3LwbyAxGth
         oaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naE0AMEKJ5IdS0Ovxmj4rx2/QwnramEvAuCqlBIumMM=;
        b=iTHfgJpdJN+dcNWB47z3vOmUniV5CCXxIF9PPENpXuAzpMJYuMDWHN6MHWbjUT/XSe
         vKqkh6F3ac1meJPXwq5Z5sYARennGujNb1vLmqNXSjqcUElSvaCUy1q1BX7FaTEHU88q
         UaJeETnYBoIAonOzzLmj4dLr36aIt1XXdZMD1jKjmfVw+uF3C1hZhHCH9oqJ8B3ZpVb8
         bsBohR+LjxIdzCkniqK7m60yjHPfqX6MdoYfNHAwcGvnoEfa8zKLhxmVGPEk36r7Dpxz
         Dwtpf2+ywGGYBIYCcybmjyE2jdHebUO/P6kRc/NAdtcnbc+o/OCiOO4XVLvcUxi2Ydx6
         EGbg==
X-Gm-Message-State: AO0yUKX1FkggAakslVq8JRv7pw23F3NsekhYWiYtj97R3d+uHpkJBu3v
        3tb35AuMYPAuMx2jqmoYKiBJpw==
X-Google-Smtp-Source: AK7set8Fyw8TIFE80cIdQQaNSL2L+M3bCLUt7FEH9FghDHD/wj4KnH/NSk2TBZENzRYuKxK5d6OVnA==
X-Received: by 2002:a17:907:94c6:b0:8b1:2c37:ae97 with SMTP id dn6-20020a17090794c600b008b12c37ae97mr20440340ejc.43.1678271136253;
        Wed, 08 Mar 2023 02:25:36 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id v9-20020a17090651c900b008b2e4f88ed7sm7335405ejk.111.2023.03.08.02.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:25:35 -0800 (PST)
Message-ID: <378db0d7-4d5a-a445-3e1a-ee6d8da5a9e2@linaro.org>
Date:   Wed, 8 Mar 2023 11:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] hwmon: ina2xx: add optional regulator support
Content-Language: en-US
To:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308094024.14115-1-clamor95@gmail.com>
 <20230308094024.14115-3-clamor95@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308094024.14115-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/03/2023 10:40, Svyatoslav Ryhel wrote:
> Some devices may need a specific supply provided
> for this sensor to work properly, like p895 does.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/hwmon/ina2xx.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 00fc70305a89..4a3e2b1bbe8b 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -119,6 +119,7 @@ struct ina2xx_data {
>  	long power_lsb_uW;
>  	struct mutex config_lock;
>  	struct regmap *regmap;
> +	struct regulator *vdd_supply;
>  
>  	const struct attribute_group *groups[INA2XX_MAX_ATTRIBUTE_GROUPS];
>  };
> @@ -656,6 +657,17 @@ static int ina2xx_probe(struct i2c_client *client)
>  		return PTR_ERR(data->regmap);
>  	}
>  
> +	data->vdd_supply = devm_regulator_get_optional(dev, "vdd");
> +	if (IS_ERR(data->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
> +				     "failed to get vdd regulator\n");
> +
> +	ret = regulator_enable(data->vdd_supply);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable vdd power supply\n");
> +		return ret;

And where is disable? On each error path, removal etc.

Best regards,
Krzysztof

