Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1FFC43334
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Jun 2022 14:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiFJO2A (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Jun 2022 10:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiFJO17 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jun 2022 10:27:59 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB862C116
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 07:27:58 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-fe4ac3b87fso3421366fac.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=EFFdHp0y1VwzFZ/TXnic0ibPjsdgiCwFQAJL7QEjQqo=;
        b=GqBkdF58MpnjqLZZFOfTqBF1/y61cI2BjWk1IX8+EfnOUvfE8inYFuEpfN8Xc/+3Ea
         Fgha2VKDIVzcs6iFfgaLs6OmPAolcA5mzClGxg4F84NUhT2jscOE/+wACArVf/V0ACrY
         f41shNDWBtpHTImjQ+lQY4gFjKLnzhJjIXMO/p36uI7HFyoPi9FnJJj4cMyzQYpzVvcj
         FUHAgEe+lOjlbkFxLZ+uLTLpfAKKPT8vOgs5nXx6QjyTqbdtwbqF3TsELgwyP5ASMY+V
         Q7sB6jofRxkSWN3ttfFQzqx0sFP+Z7wpe+bZNu7erSDEr7n1ptNK2mK6MQHH6fIqyrwG
         xVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=EFFdHp0y1VwzFZ/TXnic0ibPjsdgiCwFQAJL7QEjQqo=;
        b=mf0O/1EDzfTuhsIhPybM0wD0DYvA8KVx92cHZSRvm8pWFbC49oiDo4m8ERQsxKbBT4
         JvXX9Uf9WWb7V3PAw7TbNx9PyCTRh/gA9jjG16rSFmeNk+WrDhwgaApQUNsBtm9UtVJj
         OcoicV9QtWUWkmoB6Lmg6sWIP8v9WupqIOmfB3R+17X079jA6RN+d1UPYXWaAaAS3sVh
         F12bArGuwJ9qW1Jc6G72D5E4DtODxdKN9jCspMf4q3JxFznM9RIYA4M9Ack9Sf2w4Vx9
         x1bgU9frbHQPspt7qgtbsecnXXZ/45JGELXnb+d9prpYqb7j7vYhCUWeCFZUaKIKOC3M
         509A==
X-Gm-Message-State: AOAM5305B6kTF1cifKklKHez0v3LeCwE9VZgBu5OIvp+Af2i3TA5sD8h
        NAFmgfkq0gWQFhu9k+0irUqDjdyJHIA=
X-Google-Smtp-Source: ABdhPJxHDCydY0daZV497U7TNsPAofyPsG7qq2PLTe53sQ0G/sZtUV4ba+Est+xWu28Mo+F6qtCNYA==
X-Received: by 2002:a05:6870:89aa:b0:fb:13a9:de68 with SMTP id f42-20020a05687089aa00b000fb13a9de68mr19072oaq.63.1654871277681;
        Fri, 10 Jun 2022 07:27:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e4-20020a9d63c4000000b0060603221281sm7450150otl.81.2022.06.10.07.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 07:27:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0fd2af05-937a-af7d-8f12-fdee7e03ddb9@roeck-us.net>
Date:   Fri, 10 Jun 2022 07:27:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@axis.com
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
 <20220610114732.2370242-4-marten.lindahl@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/ltc2978) Set voltage resolution
In-Reply-To: <20220610114732.2370242-4-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/10/22 04:47, Mårten Lindahl wrote:
> The LTC2977 regulator does not set the regulator_desc .n_voltages value
> which is needed in order to let the regulator core list the regulator
> voltage range.
> 
> This patch defines a regulator_desc with a voltage range, and uses it
> for defining voltage resolution for regulators LTC2972/LTC2974/LTC2975/
> LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have a 16
> bit ADC with the same stepwise 122.07uV resolution. It also scales the
> resolution to a 1mV resolution which is easier to handle.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>   drivers/hwmon/pmbus/ltc2978.c | 56 ++++++++++++++++++++++++++++++++---
>   1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 531aa674a928..7d44e64c61c1 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -562,7 +562,36 @@ static const struct i2c_device_id ltc2978_id[] = {
>   MODULE_DEVICE_TABLE(i2c, ltc2978_id);
>   
>   #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> +#define LTC2978_ADC_RES	0xFFFF
> +#define LTC2978_N_ADC	122
> +#define LTC2978_MAX_UV	(LTC2978_ADC_RES * LTC2978_N_ADC)
> +#define LTC2978_UV_STEP	1000
> +
> +#define PMBUS_LTC2978_REGULATOR(_name, _id)               \
> +	[_id] = {                                               \
> +		.name = (_name # _id),                                \

This needs 'supply_name = "vin"'. See commit 54cc3dbfc10dc ("hwmon:
(pmbus) Add regulator supply into macro").

> +		.id = (_id),                                          \
> +		.of_match = of_match_ptr(_name # _id),                \
> +		.regulators_node = of_match_ptr("regulators"),        \
> +		.ops = &pmbus_regulator_ops,                          \
> +		.type = REGULATOR_VOLTAGE,                            \
> +		.owner = THIS_MODULE,                                 \
> +		.n_voltages = (LTC2978_MAX_UV / LTC2978_UV_STEP) + 1, \
> +		.uV_step = LTC2978_UV_STEP,                           \
> +	}

Please introduce a new generic macro PMBUS_REGULATOR_STEP()
with additional parameters n_voltages and uV_step and use it here.
PMBUS_REGULATOR() can then be redefined as

#define PMBUS_REGULATOR(n, i)	PMBUS_REGULATOR_STEP(n, i, 0, 0)

Thanks,
Guenter

> +
>   static const struct regulator_desc ltc2978_reg_desc[] = {
> +	PMBUS_LTC2978_REGULATOR("vout", 0),
> +	PMBUS_LTC2978_REGULATOR("vout", 1),
> +	PMBUS_LTC2978_REGULATOR("vout", 2),
> +	PMBUS_LTC2978_REGULATOR("vout", 3),
> +	PMBUS_LTC2978_REGULATOR("vout", 4),
> +	PMBUS_LTC2978_REGULATOR("vout", 5),
> +	PMBUS_LTC2978_REGULATOR("vout", 6),
> +	PMBUS_LTC2978_REGULATOR("vout", 7),
> +};
> +
> +static const struct regulator_desc ltc2978_reg_desc_default[] = {
>   	PMBUS_REGULATOR("vout", 0),
>   	PMBUS_REGULATOR("vout", 1),
>   	PMBUS_REGULATOR("vout", 2),
> @@ -839,10 +868,29 @@ static int ltc2978_probe(struct i2c_client *client)
>   
>   #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
>   	info->num_regulators = info->pages;
> -	info->reg_desc = ltc2978_reg_desc;
> -	if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> -		dev_err(&client->dev, "num_regulators too large!");
> -		info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> +	switch (data->id) {
> +	case ltc2972:
> +	case ltc2974:
> +	case ltc2975:
> +	case ltc2977:
> +	case ltc2978:
> +	case ltc2979:
> +	case ltc2980:
> +	case ltm2987:
> +		info->reg_desc = ltc2978_reg_desc;
> +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> +			dev_warn(&client->dev, "num_regulators too large!");
> +			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> +		}
> +		break;
> +	default:
> +		info->reg_desc = ltc2978_reg_desc_default;
> +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
> +			dev_warn(&client->dev, "num_regulators too large!");
> +			info->num_regulators =
> +			    ARRAY_SIZE(ltc2978_reg_desc_default);
> +		}
> +		break;
>   	}
>   #endif
>   

