Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8F5C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Apr 2022 13:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiD0NNv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Apr 2022 09:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbiD0NNr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 09:13:47 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEB82F000
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:10:34 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r8so1885825oib.5
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HYGWQcjcFwY6Nx13CJZpy3vlEQTMDUjsKi3PzbizsGA=;
        b=a1mv4+LWJSXQDcVu6WzKBXBr6e+1L+Cg5RhEPUcAM6yoKGHbbc5pAjQGkriXssAwgL
         lfp8C+7dRKqpu1V/dzZY41kUTNASGAIqK6y4aM+JA1xvjMZz36ooSJW6phVSWSTejY9c
         D4Il97lqXBIRg0CBrad0kgz+94QPRhfw5JnKtuc8hwiEc157OE0CsiPkFoLnY7HE4B66
         dt91bDjEDBOgfMLOfFfEC7P2daM1ReLFbIlgIZb3qmWSJV0OabKgyQEnJGJ4kdRLP/h6
         alfOCfVwtoS7UFR60YczN+pMKhQyd2OXjYcUQ/AsftU9ydDU5IDPXzDp/Ph7BpDnGhCJ
         7Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HYGWQcjcFwY6Nx13CJZpy3vlEQTMDUjsKi3PzbizsGA=;
        b=4OLcZsQnemEojrSF/yTxq8AvBIWzj56xcmzsA6P3QTDCWCmW6phh5blC3xfbeVvakf
         0L6y17xn8wSBikMAlHE2+7giMjbrsxBRVqPekeOPy/wQTFLjqJmvSUNH+INNfl2ogjRg
         cyTUfPhCrWH0Aa9Z37UQA1weixfG5K6X74Ya/QeGTLbNTHZNkgg6uVLWvyqQUDTRxvA8
         9MwILzj4RB17x3BmG9P+YhfT8SvoT64FfW77SrlsrpqBAmepefGvphbtRaas/oQw0FIt
         //cKAa0It3JqS3lGL7KyfGHnKl4pXIooMny4GQsp08iJK3Hyxacfd55Aou5DVdbVE1zY
         sqZg==
X-Gm-Message-State: AOAM530UgDricU2dzaOvIUrsAMtNrOHSe18j82swje1TtsVRm0m8NH5S
        zcKGNyM6RJPCEi6AVcPGblI=
X-Google-Smtp-Source: ABdhPJwvvb227MpgIlVQkGrBtmRU38Yb25RoUnQqaIJtf3YaIlcwbAjX+sCS+HOiQOdvHbX3AQIL/A==
X-Received: by 2002:a05:6808:1584:b0:322:3783:8b57 with SMTP id t4-20020a056808158400b0032237838b57mr13348806oiw.240.1651065033402;
        Wed, 27 Apr 2022 06:10:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o19-20020a4a9593000000b0032176119e65sm6780130ooi.34.2022.04.27.06.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 06:10:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <489c0db5-8d90-dfde-0859-2306c808817a@roeck-us.net>
Date:   Wed, 27 Apr 2022 06:10:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/3] hwmon: (pmbus) Add get_voltage/set_voltage ops
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@axis.com
References: <20220427130213.1557793-1-marten.lindahl@axis.com>
 <20220427130213.1557793-4-marten.lindahl@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220427130213.1557793-4-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/27/22 06:02, Mårten Lindahl wrote:
> The pmbus core does not have operations for getting or setting voltage.
> Add functions get/set voltage for the dynamic regulator framework.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 43 ++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 1b0728c3c7d8..afc238faa8ce 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2563,11 +2563,54 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>   	return 0;
>   }
>   
> +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	u8 page = rdev_get_id(rdev);
> +	int ret;
> +
> +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_READ_VOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret *= 1000;
> +
> +	return ((ret >> 13) * 1000);

That will need to use voltage conversion functions. VOUT isn't the same
for all chips.

> +}
> +
> +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
> +					 int max_uV, unsigned int *selector)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	u8 page = rdev_get_id(rdev);
> +	long tmp = DIV_ROUND_CLOSEST(min_uV, 1000);
> +	u32 val = DIV_ROUND_CLOSEST(tmp << 13, 1000);

Same as above.

> +	int ret;
> +	*selector = 0;
> +
> +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Select the voltage closest to min_uV */
> +	if (ret > val)
> +		val = ret;
> +
> +	ret = _pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
> +				    (u16)val);
> +
> +	return ret;
> +}
> +
>   const struct regulator_ops pmbus_regulator_ops = {
>   	.enable = pmbus_regulator_enable,
>   	.disable = pmbus_regulator_disable,
>   	.is_enabled = pmbus_regulator_is_enabled,
>   	.get_error_flags = pmbus_regulator_get_error_flags,
> +	.get_voltage = pmbus_regulator_get_voltage,
> +	.set_voltage = pmbus_regulator_set_voltage,
>   };
>   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>   

