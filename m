Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EA1C73C41
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B99EB2080C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjPjvy+Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfGINd4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 09:33:56 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39583 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGINd4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 09:33:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so10116187pls.6
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jul 2019 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zvty9xOK+oLoE46mYYAxFUDJ2Y2dPP9vSMOo0oDAysY=;
        b=kjPjvy+YO0hlhpt7A8z2wvxyn6Gtn4BFvSBPL62K0eExaZeMaQfVgbe/TqkHv/eVeQ
         G+GTljP6WWT+cssAFaUygD0Lk4+vN4ojWAcJmU6IbWi19N7rDCERseJDcjboWQCeRW5O
         3XyPbTwFF9NvWB2pcrtVG0m/GG4/EMbIjxkmAnFbjjyRjoMG1HKgFfnohQzAJQAYVsED
         zgXW32e9i8nbOpmWYPZefHrb8nj9sGwf+Unbs1YfkfG/ROFr1kwZltsiRIFNGDveavf0
         +yv8h/16PK8DZlhFdpp7hC+zBHXhBxyK4lQeBNfwuwNSglgDO4FfiCr3vdJBrvSPStV2
         9isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zvty9xOK+oLoE46mYYAxFUDJ2Y2dPP9vSMOo0oDAysY=;
        b=MbABFKvQ4qR4H6F2A/REgE5pRJnUaPJvSKq2k51R9Ybr2B9fJz/0gOkGZZngafossP
         XDBFdueKy0SprM+U4A+KuypZw0XiW1KDcGeMj4Tsu05yWOub1kLc0HOC50k9m30hwl33
         tHkCnoTEYZYWILLlPnT/UQr7byJAU+y203K4Fcr5/T/RqqCRQOSa6b6ymxXD6J/ErHVm
         Uesfbwr9JJ0z/IQ1ESGjFV1KU6RNjnay95bofhKeubWCwTfAvV2K9dLYxnMgkPitCL3Q
         1DEIwmk8JJAaioMjw3eJPwOE4OAYBtjQaq9HnP0bOesRGbuEgcr+MBvcJIYzdXNxQSVS
         VMXg==
X-Gm-Message-State: APjAAAXdAnVbmS98qRQlA0VYCXcARv55llNVAzqqrCjJuL4g8ZBRH9S/
        YqgkB/SumaPU8U77YGmPGJSTYNha
X-Google-Smtp-Source: APXvYqyeqp+cCYFCpsxJNo44F78EZSTVEK7x3ebCAylkqMAy8r/X4DcugPIzp0MbtDTypT5U43TNfQ==
X-Received: by 2002:a17:902:1125:: with SMTP id d34mr32295682pla.40.1562679235407;
        Tue, 09 Jul 2019 06:33:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d14sm38983690pfo.154.2019.07.09.06.33.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:33:54 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] First approach to sample time writing method
To:     Iker Perez <iker.perez@codethink.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
 <20190709095052.7964-6-iker.perez@codethink.co.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <95484247-ff5e-8207-a682-ed641d5452b3@roeck-us.net>
Date:   Tue, 9 Jul 2019 06:33:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709095052.7964-6-iker.perez@codethink.co.uk>
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
> Switch between the possible update_time values and write into the
> configuration register the selected value.
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> ---
>   drivers/hwmon/lm75.c | 43 ++++++++++++++++++++++++++++++++++---------
>   1 file changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 5ba7277dac69..9d48a85fd3e5 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -156,21 +156,46 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>   }
>   
>   static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
> -		      u32 attr, int channel, long temp)
> +		      u32 attr, int channel, long val)
>   {
>   	struct lm75_data *data = dev_get_drvdata(dev);
> -	u8 resolution;
> -	int reg;
> +	u8 resolution, set_mask, clr_mask;
> +	int reg, status;
> +
> +	// This are provisional changes, to be improved in case this approach works
> +	set_mask = 0;
> +	clr_mask = LM75_SHUTDOWN;
>   
>   	switch (type) {
>   	case hwmon_chip:
>   		switch (attr) {
>   		case hwmon_chip_update_interval:
> -			if (data->kind == tmp75b)
> -				pr_info("Iker inside write\n");
> +			if (data->kind == tmp75b) {
> +				clr_mask |= 1 << 15 | 0x3 << 13;
> +				switch (val) {
> +				case (27):
> +					set_mask |= 0x3 << 13;
> +					data->sample_time = MSEC_PER_SEC / 37;
> +						break;
> +				case (55):
> +					set_mask |= 0x2 << 13;
> +					data->sample_time = MSEC_PER_SEC / 18;
> +						break;
> +				case (111):
> +					set_mask |= 0x1 << 13;
> +					data->sample_time = MSEC_PER_SEC / 9;
> +						break;
> +				case (250):
> +					set_mask |= 0x0 << 13;
> +					data->sample_time = MSEC_PER_SEC / 4;
> +						break;
> +				default:
> +						return -EINVAL;
> +				status = configure_reg(set_mask, clr_mask, data, client);

You'll probably want to provide all the necessary variants (supported update times
as well as associated resolutions and set/clear masks) in the data structure,
to make it easy to support multiple chips. Either case, it is unacceptable to
only accept specific values: You can not expect the user to figure out individual
supported values on a per-chip basis. Please use something like find_closest()
to find the best match.

> +				}
> +			}
>   			else
>   				return -EINVAL;
> -			break;
>   		default:
>   			return -EINVAL;
>   		}
> @@ -195,11 +220,11 @@ static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
>   		else
>   			resolution = data->resolution;
>   
> -		temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
> -		temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
> +		val = clamp_val(val, LM75_TEMP_MIN, LM75_TEMP_MAX);
> +		val = DIV_ROUND_CLOSEST(val  << (resolution - 8),
>   					 1000) << (16 - resolution);
>   
> -		return regmap_write(data->regmap, reg, temp);
> +		return regmap_write(data->regmap, reg, val);
>   	default:
>   		return -EINVAL;
>   	}
> 

