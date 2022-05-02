Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6641DC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 16:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238923AbiEBQv6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 12:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234379AbiEBQv5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 12:51:57 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEAB267
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 09:48:28 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-d39f741ba0so14787839fac.13
        for <linux-hwmon@vger.kernel.org>; Mon, 02 May 2022 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=M3Dn+HCmKZVuINI/pTwN6516LW8LicoUgjPdV/+5QTs=;
        b=BG29C5odYorxPdpmtuMLNPWqGrCq10CNovTOYf1Hp/PKtRZ+/Y6OXV1n9frObm0hPN
         TYCfLCldOGn9hTAuQ/OdLUqCPCo3vDQGFa5xm0a25TsREPw5ufDBiHysBOBAHxYL1Skb
         1mJsJhqGdd1wuovdAGz7WAfE4JurXzXnJk9tzVNI8IuzJI1EdTW8NJOGwxwqOPBfwkpf
         QmSQoarJG6gHqMA/D1v2WmuA6g5uKeXiyI+yOEIcb7aS2KO6SyzimTYfHxpLzN4Zp82Y
         Mz8sCnhWiXf/fQp9rElyg8EiNEEalQ8DA1s1Px1pR5D/zi5Xs/afcX9K2jpWscZQ4UOF
         To6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=M3Dn+HCmKZVuINI/pTwN6516LW8LicoUgjPdV/+5QTs=;
        b=WdACyHuHmNv6uyo+YADID/QgmbNt1cQBas0rZOJX6nrd+3hlwzJvBcj2BK0lCGZPLi
         +sFg/T3ocJaABaftLD3xhlbnSrjO5TaLEnWhWDgXkYrFYku/HutzKa1tcgdlwGzRl0Sq
         bdxk5q5mWvLv4pfb7kZpzCEG36BkjBUeAJdzymNkFGsMf9YKpz25hDYSK9qGjkwTae7x
         c6OPywlklSk1kUtG5i4bKnJotTDpnsMyzetTrJpmGptrJWM0d6BaneQfgqsZvRFF605H
         nTVMFtojP90RzTbq29jKu7y8F/SnvUusEId6g6p9cypBt2oldIZQ7r1PRQaQ9vod3IXi
         afJQ==
X-Gm-Message-State: AOAM530tFyZRR4gw+Q4MH3V8MKUkSCItPfvKBh5UZhKbXYdlIZtTSj8C
        Dmg8Fg9+2PFiDx72SwSyPIs=
X-Google-Smtp-Source: ABdhPJwtFPqk61l7c6GG2RTuQQWaXkhLAudBm1sxDORFhDEyMKZU2NMAenH/Hz6AdHBOADGBJTL/4A==
X-Received: by 2002:a05:6870:c393:b0:e2:ae03:70ff with SMTP id g19-20020a056870c39300b000e2ae0370ffmr4772053oao.231.1651510107868;
        Mon, 02 May 2022 09:48:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r7-20020a056870878700b000e686d1386csm6046985oam.6.2022.05.02.09.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 09:48:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0edfd625-8e73-b739-16be-7818f2918fa6@roeck-us.net>
Date:   Mon, 2 May 2022 09:48:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@axis.com
References: <20220502111345.3100970-1-marten.lindahl@axis.com>
 <20220502111345.3100970-5-marten.lindahl@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
In-Reply-To: <20220502111345.3100970-5-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/2/22 04:13, Mårten Lindahl wrote:
> The pmbus core does not have operations for getting or setting voltage.
> Add functions get/set voltage for the dynamic regulator framework.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 63 ++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index bd143ca0c320..455d06ba5fdf 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2563,11 +2563,74 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>   	return 0;
>   }
>   
> +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = rdev_get_id(rdev),
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +	};
> +
> +	s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);
> +	if (s.data < 0)
> +		return s.data;
> +
> +	return (int)pmbus_reg2data(data, &s) * 1000; /* unit is uV */
> +}
> +
> +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
> +					 int max_uV, unsigned int *selector)

Just noticed: Please don't use camelCase.

> +{
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	struct pmbus_sensor s = {
> +		.page = rdev_get_id(rdev),
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +	};
> +	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */

min_uV is already an int, so converting it to s64 will never be
necessary.

> +	int low = -1, high = -1;
> +	u16 val;
> +	*selector = 0;
> +
> +	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
> +		low = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
> +	if (low < 0) {
> +		low = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> +		if (low < 0)
> +			return low;
> +	}
> +
> +	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
> +		high = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
> +	if (high < 0) {
> +		high = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
> +		if (high < 0)
> +			return high;
> +	}
> +
> +	val = pmbus_data2reg(data, &s, tmp);
> +
> +	/* Make sure we are within margins */
> +	if (low > val)
> +		val = low;
> +	if (high < val)
> +		val = high;
> +

The above assumes that register values are directly comparable.
Unfortunately that isn't really the case. It happens to work
for ULINEAR16 and DIRECT mode, but chips could also support
IEEE-754 (maybe in the future) or VID mode.

You need to read the limits from the registers, convert to voltages,
compare and adjust the voltage, and as final step convert the adjusted
voltage to a register value.

Thanks,
Guenter
