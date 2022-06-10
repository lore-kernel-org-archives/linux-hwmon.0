Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733ABC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jun 2022 14:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344807AbiFJOQy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Jun 2022 10:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344676AbiFJOQv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jun 2022 10:16:51 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029F13149B3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 07:16:50 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id k24so9016378oij.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=Jasx9AHLnmX8hVayxpYatIn4MjakLNOzQbMncyNk7z8=;
        b=PyUFcBKoyHG3IgLufBmxOMt27EN1xgeXQGxQ1InDdHC9rOH3ANuxP9uWkVEsyvia9p
         BI9CoIp6V60LSM7FNetGzJ/lnGHaR1DLuWDjFPGpTckqXZ6Woxq+BAgCpA/Ugul4ZHGH
         A8dQ0bxRcjRgviwSLh2a4ulMKcFHKO0eso1ZTYhKNljMoX1XLBwi7jRDkiK7TmhOYRz/
         021YHSJYHNZYdOxBc+6K52AfTHC5GOtGGbV0CKSznDM9l04gY5vFanVsP7lQOVGNcVHK
         7mnc2X1JcbKx5BcRq9YPbOrjuJ8BYzYNTgzWnAI8HZw5ULxnprc4HHZ8SARASSYrZ0Yf
         iPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=Jasx9AHLnmX8hVayxpYatIn4MjakLNOzQbMncyNk7z8=;
        b=QsFmR0KveDH7ZcaWNoiNra5HhYIM4uexyzGy8kPIm3c2zQctS2pIRvpoo+qw8Gq65c
         hwbYJO5usaNDbO0ADcLiRJmlYG3TEebCGIizosYkwgj9X2EBqiR7KRT/ZybpbwYoWifd
         bMGxFtgIpS2OIfc/LIMboVwnBBwnJM+W1Y/2XFiqBBFhDHlp5cIh3Pvqu0+9vYzMo9T+
         Qbpm67nEGKL1Glo6g2kMe3F3cUg/FwSt5bZJdqxsqMbvjhxxwUavVBcw+M4nSMU2bh+5
         YrcFx1Vd+ouXR1+4GBwg2Jw/snifOF//mHuhyDsIPk3gyhT6nIvt6Xc9Psv6YMTNR6eP
         uYnQ==
X-Gm-Message-State: AOAM532Vt3Yaw1g2AJ71u0YuuyBV/LGr/GCP/jLLHot97dikoOM7+iyH
        uEppaQIn69ooSYhNz33h3OB/ohCumsc=
X-Google-Smtp-Source: ABdhPJxqvz4tbSyjTDDUgGPUsY6xlB82q/aJBrGu4ILdd/Y9hhVl44NNNWsCjXxJNSTI0NmT0WuQxA==
X-Received: by 2002:a05:6808:1204:b0:325:73cc:867c with SMTP id a4-20020a056808120400b0032573cc867cmr4458054oil.95.1654870609326;
        Fri, 10 Jun 2022 07:16:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ga9-20020a056870ee0900b000f5ccbb7d75sm12229740oab.1.2022.06.10.07.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 07:16:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a9c983f9-9aa8-caa2-b970-46fd2ae1c96f@roeck-us.net>
Date:   Fri, 10 Jun 2022 07:16:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@axis.com
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
 <20220610114732.2370242-3-marten.lindahl@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus) Add list_voltage to pmbus ops
In-Reply-To: <20220610114732.2370242-3-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/10/22 04:47, Mårten Lindahl wrote:
> When checking if a regulator supports a voltage range, the regulator
> needs to have a list_voltage callback set to the regulator_ops or else
> -EINVAL will be returned. This support does not exist for the pmbus
> regulators, so this patch adds pmbus_regulator_list_voltage to the
> pmbus_regulator_ops.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 50 ++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 478dda49a45f..24ba4b2b03d4 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2711,6 +2711,55 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
>   	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
>   }
>   
> +static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
> +					 unsigned int selector)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = rdev_get_id(rdev),
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +		.data = -1,
> +	};
> +	int val = DIV_ROUND_CLOSEST(rdev->desc->min_uV +
> +				    (rdev->desc->uV_step * selector),
> +				    1000); /* convert to mV */
> +
> +	if (!data->vout_low[s.page]) {
> +		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
> +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> +						       PMBUS_MFR_VOUT_MIN);
> +		if (s.data < 0) {
> +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> +						       PMBUS_VOUT_MARGIN_LOW);
> +			if (s.data < 0)
> +				return s.data;
> +		}
> +		data->vout_low[s.page] = pmbus_reg2data(data, &s);
> +	}
> +
> +	if (!data->vout_high[s.page]) {
> +		s.data = -1;
> +		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
> +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> +						       PMBUS_MFR_VOUT_MAX);
> +		if (s.data < 0) {
> +			s.data = _pmbus_read_word_data(client, s.page, 0xff,
> +						       PMBUS_VOUT_MARGIN_HIGH);
> +			if (s.data < 0)
> +				return s.data;
> +		}
> +		data->vout_high[s.page] = pmbus_reg2data(data, &s);
> +	}
> +

The code above is similar to the same code in the first patch. Please
move it into a function (in the first patch).

> +	if (val >= data->vout_low[s.page] && val <= data->vout_high[s.page])
> +		return val * 1000; /* unit is uV */
> +
> +	return 0;

Other drivers return -EINVAL here. Should this be returned as well
if rdev->desc->min_uV or rdev->desc->uV_step is 0, if selector
is out of range, or if data->vout_low[s.page] / data->vout_high[s.page]
is 0 ?

Thanks,
Guenter

> +}
> +
>   const struct regulator_ops pmbus_regulator_ops = {
>   	.enable = pmbus_regulator_enable,
>   	.disable = pmbus_regulator_disable,
> @@ -2718,6 +2767,7 @@ const struct regulator_ops pmbus_regulator_ops = {
>   	.get_error_flags = pmbus_regulator_get_error_flags,
>   	.get_voltage = pmbus_regulator_get_voltage,
>   	.set_voltage = pmbus_regulator_set_voltage,
> +	.list_voltage = pmbus_regulator_list_voltage,
>   };
>   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>   

