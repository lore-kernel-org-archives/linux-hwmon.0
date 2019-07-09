Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58556C73C46
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:26:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1757620844
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:26:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4hf0QvQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfGIN0z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 09:26:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43228 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfGIN0z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 09:26:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id i189so9294816pfg.10
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jul 2019 06:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1gkKQN682IkoNiUt0fYH54Mc8eaKv7Y0QBFa1SEAXxE=;
        b=Y4hf0QvQOrhkD3koOcGiiN2VB0ZOPz+ZYlDStE8KJRUAY4R1q4E388Rf1249oVFDoU
         9xl6jRm22rq3PXTbcER0e5TSFG5Sx4YwVRYs8Zj6efksvKtrTJdv9kfHEbA2t5gDUl+y
         CrxmHMgkVXHP3DIjdvhBmNatKKtiR8hrAv5WgiIGQvlvhTCgv4qzXBEqekdCnWnadljd
         FqrTWEbVLdLfrFvGhlfCKrGlXjZ8e437H4EUkV2Rsc/TjFe0LQxE/iHFP7426tlx992r
         mCbfWqaYDFBLNb6+yrr2tBHjxhIzvYNvdZuDQKMwxeEswmBZzBK8XllGZTvfsagGWYvm
         sBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1gkKQN682IkoNiUt0fYH54Mc8eaKv7Y0QBFa1SEAXxE=;
        b=Tvr5lQo7/VXYDirJEUzxpW7TMFmP0Oq+bJjGQD+X/K+zIC4x3JMdCQbYQYJcDD0xuj
         6ZUbDqzdDm2fFcnHbjIKw4obmCfDyroeYdZYdpgmODdy960HYmbudmh8u4uRoQ0OZi06
         8zgcrTNe5z50uCtARR5dUSOL7OR2QE7EPHs5yz26OmvdHkI4B8eV8a/B9Zf+lX/1OIc8
         AN9KhUuEAQTsBFweQ+KfT0Bu9dTAeQMMH9CvP23O6Nc4FaS1e68XJ8NKsPl41f4EptA5
         w4x4NmT2PKdae/rldZRSNQE0eZy2VeUenHupK5DM7caqdQfkx9j7lzN0p6MGEpfgbvRg
         D8Gg==
X-Gm-Message-State: APjAAAWaN6fQyEbm8ErmudNeLTBDUOhiqx3PX1RjKrM0NbgCJPKSnOvp
        S8i3D9rlLp1TQvxVSfF+tRVbaOxg
X-Google-Smtp-Source: APXvYqwVoONEK5GfrK9S1nlYAA/x+tW8Isd1UlL4Thz7CBFkYJzS1aA1m/H5osxk04RbWpcrRIR2oA==
X-Received: by 2002:a63:4554:: with SMTP id u20mr31398988pgk.406.1562678814509;
        Tue, 09 Jul 2019 06:26:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 10sm31947999pfb.30.2019.07.09.06.26.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:26:53 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] hwmon: (lm75) Include hwmon_chip in the permitted
 types to be writen
To:     Iker Perez <iker.perez@codethink.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
 <20190709095052.7964-3-iker.perez@codethink.co.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <9df1acf2-054c-6f25-2da2-888006d7d776@roeck-us.net>
Date:   Tue, 9 Jul 2019 06:26:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709095052.7964-3-iker.perez@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/9/19 2:50 AM, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> hwmon_chip needs to be allowed to be written because tmp75b's sample time
> can be configured. Allowing hwmon_chip to be written will allow to
> configure the update_interval from sysfs.
> 

You'll want to have separate functions for the different sensor types,
and not fold it all into one. lm75_write() should be something like

static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
                       u32 attr, int channel, long val)
{
	switch(type) {
	case hwmon_temp:
		return lm75_write_temp(dev, attr, channel, val);
	case hwmon_chip:
		return lm75_write_chip(dev, attr, val);
	default:
		return -EINVAL;
	}
}

> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> ---
>   drivers/hwmon/lm75.c | 62 ++++++++++++++++++++++++++++++++--------------------
>   1 file changed, 38 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 0209e0719784..80a11c33db77 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -128,34 +128,48 @@ static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
>   	u8 resolution;
>   	int reg;
>   
> -	if (type != hwmon_temp)
> -		return -EINVAL;
> -
> -	switch (attr) {
> -	case hwmon_temp_max:
> -		reg = LM75_REG_MAX;
> -		break;
> -	case hwmon_temp_max_hyst:
> -		reg = LM75_REG_HYST;
> -		break;
> -	default:
> -		return -EINVAL;
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			if (data->kind == tmp75b)
> +				pr_info("Iker inside write\n");
> +			else
> +				return -EINVAL;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			reg = LM75_REG_MAX;
> +			break;
> +		case hwmon_temp_max_hyst:
> +			reg = LM75_REG_HYST;
> +			break;
> +		default:
> +			return -EINVAL;
>   	}

Please watch out for indentation. Running checkpatch over your patches
would be highly recommended.

Guenter

>   
> -	/*
> -	 * Resolution of limit registers is assumed to be the same as the
> -	 * temperature input register resolution unless given explicitly.
> -	 */
> -	if (data->resolution_limits)
> -		resolution = data->resolution_limits;
> -	else
> -		resolution = data->resolution;
> +		/*
> +		* Resolution of limit registers is assumed to be the same as the
> +		* temperature input register resolution unless given explicitly.
> +		*/
> +		if (data->resolution_limits)
> +			resolution = data->resolution_limits;
> +		else
> +			resolution = data->resolution;
>   
> -	temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
> -	temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
> -				 1000) << (16 - resolution);
> +		temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
> +		temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
> +					 1000) << (16 - resolution);
>   
> -	return regmap_write(data->regmap, reg, temp);
> +		return regmap_write(data->regmap, reg, temp);
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
>   }
>   
>   static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
> 

