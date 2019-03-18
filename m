Return-Path: <SRS0=f3EG=RV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA0DC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4B4120872
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtZ+3A0z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfCROhR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:37:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34724 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfCROhP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Mar 2019 10:37:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id v64so11407421pfb.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Mar 2019 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IX4/1fqwLyioxonGSQ088AHdDQSFWYLfy3/RrAqaHsc=;
        b=FtZ+3A0zOIsxxfksKG/g21QHaU4xaXsB3C8Apo1Qk3K1/h3auJIKgPxSx/dFC7VKB7
         Ph8syyxwmkP5+OLdSGJbPnWgIqlcD/0ql9BX2cxjbyo/0TeedErTCc03rAcm7SsXRvE5
         A+9H2w4E/yt7rfp5JTIWSeM79r+sodO06k8z9o2oXQbRNM289Qz5rFVzomQHR2tWibJ2
         l7KFw3Fvtf360PT9tpqDDzSRnIhYGb8Kjg4ma+b+D7AT7Lze8FWYZ1n0wpEmXeZE75I+
         d6Dc12ooBCoItFF3vHl6vOu47B6UW1goRd8h/mYuZPh1Lq/Kr3m/ifJZf6D3zt3KDElF
         XRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IX4/1fqwLyioxonGSQ088AHdDQSFWYLfy3/RrAqaHsc=;
        b=CVZy1/I9iABzZWTCwyis65oW5+A+d86OYi/uSXcZEeg2/JR9RxoUVQth9TMtRHtJSu
         2dLjYZd0WbtemcJLZ5OY9JPfJD8fOPv0iu/1kjKz8m50NB1Z9Dr8u1WM7y59fu4uHQ0q
         SiWgCkTOcZqHR6C1ikN6pZbpBbP2GoT1+1QJHQ7ctDNRSgXKwBprg4wDnyhm2FQxHeWO
         dIJ1vx0nz8CYc+etotxGhlMwketKcDZTGzNHDKRP8IGCuQyszbXkGCKTlfaJ134jDX/d
         NJLQA8djKN559Lf3nndMFa+MOaubdayklqNttHXuSQK7lCspmVq4J8gVLiKzErwGY0F9
         sa7Q==
X-Gm-Message-State: APjAAAXhcnD0pxvgGedVDMcAg90chy0b03RphEpttal5mfUv/+RpN1WA
        vrPmVCXnQiqVzDZt4YHz9uc2XMUI
X-Google-Smtp-Source: APXvYqxVHMar+wtfFk4eCFSXGpPaABShMRecsAKB7I9QakXozcB8YtIqqlqCv4ANtbZoAUzQXNSGHw==
X-Received: by 2002:a63:4f61:: with SMTP id p33mr17990190pgl.303.1552919834002;
        Mon, 18 Mar 2019 07:37:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d130sm2817349pfg.49.2019.03.18.07.37.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 07:37:13 -0700 (PDT)
Subject: Re: [PATCH v1 hwmon-next] hwmon: (mlxreg-fan) Add support for fan
 capability registers
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20190318105324.2602-1-vadimp@mellanox.com>
 <476542da-23fd-0062-ce87-002356410b4d@roeck-us.net>
 <AM6PR05MB522467614FE5E356082E5C47A2470@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2b673978-21e2-3ff2-9ce0-3ec702318028@roeck-us.net>
Date:   Mon, 18 Mar 2019 07:37:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <AM6PR05MB522467614FE5E356082E5C47A2470@AM6PR05MB5224.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/18/19 7:31 AM, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Monday, March 18, 2019 4:18 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>
>> Cc: linux-hwmon@vger.kernel.org
>> Subject: Re: [PATCH v1 hwmon-next] hwmon: (mlxreg-fan) Add support for fan
>> capability registers
>>
>> On 3/18/19 3:53 AM, Vadim Pasternak wrote:
>>> Add support for fan capability registers in order to distinct between
>>> the systems which have minor fan configuration differences. This
>>> reduces the amount of code used to describe such systems.
>>> The capability registers provides system specific information about
>>> the number of physically connected tachometers and system specific fan
>>> speed scale parameter.
>>> For example one system can be equipped with twelve fan tachometers,
>>> while the other with for example, eight or six. Or one system should
>>> use default fan speed divider value, while the other has a scale
>>> parameter defined in hardware, which should be used for divider
>>> setting.
>>> Reading this information from the capability registers allows to use
>>> the same fan structure for the systems with the such differences.
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>> ---
>>>    drivers/hwmon/mlxreg-fan.c | 78
>> +++++++++++++++++++++++++++++++++++++++++++---
>>>    1 file changed, 73 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
>>> index db8c6de0b6a0..5a4d5348516a 100644
>>> --- a/drivers/hwmon/mlxreg-fan.c
>>> +++ b/drivers/hwmon/mlxreg-fan.c
>>> @@ -27,7 +27,10 @@
>>>    #define MLXREG_FAN_SPEED_MAX
>> 	(MLXREG_FAN_MAX_STATE * 2)
>>>    #define MLXREG_FAN_SPEED_MIN_LEVEL		2	/* 20 percent
>> */
>>>    #define MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF	44
>>> -#define MLXREG_FAN_TACHO_DIVIDER_DEF		1132
>>> +#define MLXREG_FAN_TACHO_DIVIDER_MIN		283
>>> +#define MLXREG_FAN_TACHO_DIVIDER_DEF
>> 	(MLXREG_FAN_TACHO_DIVIDER_MIN \
>>> +						 * 4)
>>
>> This is where the unnecessary MLXREG_FAN prefix really starts to hurt.
> 
> Hi Guenter,
> 
> Thank you for quick review.
> I just wanted to keep all the names with the same prefix.
> Maybe it would be better to keep this convention and just make
> names shorter by replacing
> s/DIVIDER/DIV ?
> 
> #define MLXREG_FAN_TACHO_DIV_MIN		283
> #define MLXREG_FAN_TACHO_DIV_DEF		(MLXREG_FAN_TACHO_DIV_MIN * 4)
> #define MLXREG_FAN_TACHO_DIV_SCALE_MAX		64
> 

Sure, that would work. Just something to consider for future drivers - a prefix
of, say, MLX instead of MLXREG_FAN would have been sufficient. I am not suggesting
to change that now, though.

Guenter

>>
>>> +#define MLXREG_FAN_TACHO_DIVIDER_SCALE_MAX	64
>>>    /*
>>>     * FAN datasheet defines the formula for RPM calculations as RPM = 15/t-
>> high.
>>>     * The logic in a programmable device measures the time t-high by
>>> sampling the @@ -360,12 +363,57 @@ static const struct
>> thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
>>>    	.set_cur_state	= mlxreg_fan_set_cur_state,
>>>    };
>>>
>>> +static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
>>> +				     struct mlxreg_core_data *data,
>>> +				     bool *connected)
>>> +{
>>> +	u32 regval;
>>> +	int err;
>>> +
>>> +	err = regmap_read(fan->regmap, data->capability, &regval);
>>> +	if (err) {
>>> +		dev_err(fan->dev, "Failed to query capability register
>> 0x%08x\n",
>>> +			data->capability);
>>> +		return err;
>>> +	}
>>> +
>>> +	*connected = (regval & data->bit) ? true : false;
>>> +
>>> +	return 0;
>>> +}
>>
>> This function could be simplified by returning an int, negative for error or 0/1.
>> 	return !!(regval & data->bit);
>> Even if not,
>> 	*connected = regval & data->bit;
>> would do or, if you want to be explicit,
>> 	*connected = !!(regval & data->bit);
>>
>>> +
>>> +static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
>>> +					struct mlxreg_core_data *data)
>>> +{
>>> +	u32 regval;
>>> +	int err;
>>> +
>>> +	err = regmap_read(fan->regmap, data->capability, &regval);
>>> +	if (err) {
>>> +		dev_err(fan->dev, "Failed to query capability register
>> 0x%08x\n",
>>> +			data->capability);
>>> +		return err;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Set divider value according to the capability register, in case it
>>> +	 * contains valid value. Otherwise use default value. The purpose of
>>> +	 * this validation is to protect against the old hardware, in which
>>> +	 * this register can be un-initialized.
>>
>> un-initialized -> random ? "can return zero" might be a better description if that
>> is what it is.
>>
>>
>>> +	 */
>>> +	if (regval > 0 && regval <= MLXREG_FAN_TACHO_DIVIDER_SCALE_MAX)
>>> +		fan->divider = regval * MLXREG_FAN_TACHO_DIVIDER_MIN;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>    static int mlxreg_fan_config(struct mlxreg_fan *fan,
>>>    			     struct mlxreg_core_platform_data *pdata)
>>>    {
>>>    	struct mlxreg_core_data *data = pdata->data;
>>> -	bool configured = false;
>>> +	bool configured = false, connected = false;
>>>    	int tacho_num = 0, i;
>>> +	int err;
>>>
>>>    	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
>>>    	fan->divider = MLXREG_FAN_TACHO_DIVIDER_DEF; @@ -376,6
>> +424,18 @@
>>> static int mlxreg_fan_config(struct mlxreg_fan *fan,
>>>    					data->label);
>>>    				return -EINVAL;
>>>    			}
>>> +
>>> +			if (data->capability) {
>>> +				err = mlxreg_fan_connect_verify(fan, data,
>>> +								&connected);
>>> +				if (err)
>>> +					return err;
>>> +				if (!connected) {
>>> +					tacho_num++;
>>> +					continue;
>>> +				}
>>> +			}
>>> +
>>>    			fan->tacho[tacho_num].reg = data->reg;
>>>    			fan->tacho[tacho_num].mask = data->mask;
>>>    			fan->tacho[tacho_num++].connected = true; @@ -
>> 394,13 +454,21 @@
>>> static int mlxreg_fan_config(struct mlxreg_fan *fan,
>>>    				return -EINVAL;
>>>    			}
>>>    			/* Validate that conf parameters are not zeros. */
>>> -			if (!data->mask || !data->bit) {
>>> +			if (!data->mask && !data->bit && !data->capability) {
>>>    				dev_err(fan->dev, "invalid conf entry params:
>> %s\n",
>>>    					data->label);
>>>    				return -EINVAL;
>>>    			} > -			fan->samples = data->mask;
>>> -			fan->divider = data->bit;
>>> +			if (data->capability) {
>>> +				err = mlxreg_fan_speed_divider_get(fan, data);
>>> +				if (err)
>>> +					return err;
>>> +			} else {
>>> +				if (data->mask)
>>> +					fan->samples = data->mask;
>>> +				if (data->bit)
>>> +					fan->divider = data->bit;
>>> +			}
>>>    			configured = true;
>>>    		} else {
>>>    			dev_err(fan->dev, "invalid label: %s\n", data->label);
>>>
> 

