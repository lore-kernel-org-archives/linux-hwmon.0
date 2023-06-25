Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFA4EB64DC
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jun 2023 15:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjFYPM2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Jun 2023 11:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFYPM1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Jun 2023 11:12:27 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4EE1B3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jun 2023 08:12:26 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666eec46206so2111935b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jun 2023 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687705946; x=1690297946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nnsXFOQMO6cTCUc7ebSJpSUxy4wNuS5recEmMFpkqUg=;
        b=HM+AR0OUpPLJz2fL99s3MLyFpHtu2FKtlfq9UUKXrbsNgBbpG0F3bGOM5Bl3xdT9fs
         ZjCsOmhMj6D9s6rTdZ9w6X1uTMCPHvU7JHH1QLRIjMTcxbnOw+Aaj7zSy+P96Fd3sRoZ
         PouYxiAcj1ILgDNogXFGBoQduz2ur81VwQRBGDVk/Q8omCzbWAb5pWlDn88FISt6MPJT
         iBWJmYXR+UGftAKqgU/nPfbqNUC8rpfRla/fz27i+VBO4pxVcOx4SedT8ralJDMWgEYZ
         upjZEOlep53Xz05r8C4hvw3Uv6SP1GrAMJJf3Gy6HFoD6BAlKTIxLUJxg1ToF0qGUDFg
         mFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687705946; x=1690297946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnsXFOQMO6cTCUc7ebSJpSUxy4wNuS5recEmMFpkqUg=;
        b=NVQhqBmFobm5qoDf64vilKWRTglkvJ2xaoqbnx1x3EdgmtElNb4YDmPvajJtBUWjte
         MX8NPyLisHNNjpYfa6pyvxvRFxLVYLdjwt3UzFX+nb2Ew32m7ahTf/q59Ub2pUTEas0Z
         Muo19CMufdojGx9MgVJtzuvN+nenJlA+08EeQfydGOaly0btu4OtJsokWCSx5JwCTZQV
         nXvMBnKTLSPM0Szb/G7AFesGAqXtNROfFYlYkR82Z4gM51v2KO44TANBaeXVBpCcb6HH
         jHf1PQPx55M5lD85rV8l0miRLiWXZSIBiCa7f3Q4xgUiP6qjZ3kZrUBj3o+u7oFrQFxf
         IM9w==
X-Gm-Message-State: AC+VfDzPR7/+iRVHCxgzfgt8FY8X3p5eDTwcglYFR3epdxKmlFIZds+v
        fRpTpOQ1/MG9JmCqH19Fdykz2X4MtD8=
X-Google-Smtp-Source: ACHHUZ5IO3J1zI2uL38WqDvgGosu3xLbaUo9OrPotcYVEHfCWQuBQlTTQZDHfvn/27qtQQ6890rBUw==
X-Received: by 2002:a05:6a00:2d02:b0:669:4481:1224 with SMTP id fa2-20020a056a002d0200b0066944811224mr17922153pfb.11.1687705945508;
        Sun, 25 Jun 2023 08:12:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w2-20020a636202000000b005439aaf0301sm2552060pgb.64.2023.06.25.08.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 08:12:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5c1f3c1f-c5a0-39c7-aee1-d9b8f143ba79@roeck-us.net>
Date:   Sun, 25 Jun 2023 08:12:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] hwmon: (it87) Separate temperature type to separate
 funtion and detect AMDTSI
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20230625111838.3779678-1-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230625111838.3779678-1-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/25/23 04:18, Frank Crawford wrote:
> The temperature sensor type needs to be used in multiple places, so
> split it out into its own function.  It is used both in show_temp_type
> attribute and testing if the attribute should be visible (i.e. is
> defined).
> 
> The sensor type also reports the type AMDTSI on certain chipsets.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>   drivers/hwmon/it87.c | 78 ++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5deff5e5f693..ba75f33301ce 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -221,6 +221,10 @@ static bool fix_pwm_polarity;
>    * Super-I/O configuration space.
>    */
>   #define IT87_REG_VID           0x0a
> +
> +/* Interface Selection register on other chips */
> +#define IT87_REG_IFSEL         0x0a
> +
>   /*
>    * The IT8705F and IT8712F earlier than revision 0x08 use register 0x0b
>    * for fan divisors. Later IT8712F revisions must use 16-bit tachometer
> @@ -1159,28 +1163,68 @@ static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
>   static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
>   static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
>   
> +static int get_temp_type(struct it87_data *data, int index)
> +{
> +	/*
> +	 * 2 is deprecated;
> +	 * 3 = thermal diode;
> +	 * 4 = thermistor;
> +	 * 5 = AMDTSI;
> +	 * 6 = Intel PECI;
> +	 * 0 = disabled
> +	 */
> +	u8 reg, extra;
> +	int ttype, type = 0;
> +
> +	/* Detect PECI vs. AMDTSI */
> +	ttype = 6;
> +	if ((has_temp_peci(data, index)) || data->type == it8721 ||
> +	    data->type == it8720) {
> +		extra = it87_read_value(data, IT87_REG_IFSEL);
> +		if ((extra & 0x70) == 0x40)
> +			ttype = 5;
> +	}
> +
> +	reg = it87_read_value(data, IT87_REG_TEMP_ENABLE);
> +
> +	/* Per chip special detection */
> +	switch (data->type) {
> +	case it8622:
> +		if (!(reg & 0xc0) && index == 3)
> +			type = ttype;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (type || index >= 3)
> +		return type;
> +

The above is really all new code, not just refactoring,
and needs to be explained separately. Please split the patches
into refactoring and separate patch(es) for functional changes.

Thanks,
Guenter

> +	extra = it87_read_value(data, IT87_REG_TEMP_EXTRA);
> +
> +	if ((has_temp_peci(data, index) && (reg >> 6 == index + 1)) ||
> +	    (has_temp_old_peci(data, index) && (extra & 0x80)))
> +		type = ttype;	/* Intel PECI or AMDTSI */
> +	else if (reg & BIT(index))
> +		type = 3;	/* thermal diode */
> +	else if (reg & BIT(index + 3))
> +		type = 4;	/* thermistor */
> +
> +	return type;
> +}
> +
>   static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
>   			      char *buf)
>   {
>   	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> -	int nr = sensor_attr->index;
>   	struct it87_data *data = it87_update_device(dev);
> -	u8 reg, extra;
> +	int type;
>   
>   	if (IS_ERR(data))
>   		return PTR_ERR(data);
>   
> -	reg = data->sensor;	/* In case value is updated while used */
> -	extra = data->extra;
> -
> -	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
> -	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
> -		return sprintf(buf, "6\n");  /* Intel PECI */
> -	if (reg & (1 << nr))
> -		return sprintf(buf, "3\n");  /* thermal diode */
> -	if (reg & (8 << nr))
> -		return sprintf(buf, "4\n");  /* thermistor */
> -	return sprintf(buf, "0\n");      /* disabled */
> +	type = get_temp_type(data, sensor_attr->index);
> +	return sprintf(buf, "%d\n", type);
>   }
>   
>   static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
> @@ -2313,6 +2357,14 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
>   	if (!(data->has_temp & BIT(i)))
>   		return 0;
>   
> +	if (a == 3) {
> +		int type = get_temp_type(data, i);
> +
> +		if (type == 0)
> +			return 0;
> +		return attr->mode;
> +	}
> +
>   	if (a == 5 && !has_temp_offset(data))
>   		return 0;
>   

