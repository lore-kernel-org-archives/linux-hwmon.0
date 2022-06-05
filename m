Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF58DC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jun 2022 18:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351489AbiFESDP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jun 2022 14:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351440AbiFESDO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jun 2022 14:03:14 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BD5625B;
        Sun,  5 Jun 2022 11:03:13 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id s8so11776508oib.6;
        Sun, 05 Jun 2022 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CHQW975P3NRJbEVtJMxYHvUX61G0qthq75U3rwPIUh4=;
        b=i8lHsn7b9XNKF2+5+O1TZu1wkyguPvW2YdSQWDWDqSrFPyoRHjfiwCRis3E0P6vDEh
         Qz6DHa6NbZ0P0E0FPGg+zzKQYyOEg/r1v3THfUPACkJfkBzkgVlFfHs6U+L+dW+RkmdG
         /PaOHnFoACiVQAfSkDmpptzeOFl2xQR+niDs0uLYoo43d7Yy3EBiXIGEvJ8LgX9k4Gm4
         7BYA9YVSgP8VHeaOxRuuQjAa1PpGElKu+O+gAtKT8FTcs2xamIIKffQwen73XNtGgBM2
         gHtZ+SnNuHVZwe537ZYx+0yWzUEbO3WIFlCE6T+xQd/pijcxchWX3SQ+1OyjfYrsRVHL
         wgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CHQW975P3NRJbEVtJMxYHvUX61G0qthq75U3rwPIUh4=;
        b=o+pNmhIT9nNDpSUd9qA6O/InKHCvujL6I3SGtvk99cZQefARrhekSDgdmbyVsaGZhK
         MVBhLJJ2HITtDsa9Lve3TeBSsgngEta5Ssn5lrJz5K6nn1OAgPP5LQ3Rz8+kMjwMXmuk
         N3mPnNcyQYR7sb4JfRH6+2YeHi43ZTNQcBemPFdV9MYtct+psvGXCNoq9/fqb1myj2uS
         zob46KVRjrg4JQenfCrwCpe7pnNlyZN9EVujaDqFWz8IKfK3WBb85ciiNOYnM/sh226W
         sHlnCE8Z7zo5HPc8kxfJ0OLz4O25oGrWFEbc+uXX1nCFr2dUDDkWPSUsLs1OwKrw/WjJ
         O0jg==
X-Gm-Message-State: AOAM532hKCxPioRDJ4SmKu76Sds/1dabF1mR7oCVZ/rV1InShZMf41Un
        U+xKdGLRnbVCQOgvr3vdDSs=
X-Google-Smtp-Source: ABdhPJyLswB5nZi6rVpDnr3j0jABrApOlpbBuNQIFe1GgEic+Js1reAW9Vw7ysTIwvJGbzWEofG6KA==
X-Received: by 2002:a05:6808:191d:b0:32e:8e4e:abbd with SMTP id bf29-20020a056808191d00b0032e8e4eabbdmr1254000oib.263.1654452192365;
        Sun, 05 Jun 2022 11:03:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6-20020a4adf46000000b0035eb4e5a6b8sm6661954oou.14.2022.06.05.11.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 11:03:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 5 Jun 2022 11:03:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
Subject: Re: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
Message-ID: <20220605180310.GA3151289@roeck-us.net>
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-5-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525073657.573327-5-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 25, 2022 at 09:36:54AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> The ADT7461 supports offset register for both remote channels it has.

ADT7481

> Both registers have the same bit width (resolution).
> 
> In the code, this device has LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags,
> but the support of second remote channel's offset is missing. Add that
> implementation.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> ---
>  drivers/hwmon/lm90.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 02b211a4e571..d226f1dea2ba 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -153,6 +153,8 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
>  #define LM90_REG_REMOTE_TEMPL		0x10
>  #define LM90_REG_REMOTE_OFFSH		0x11
>  #define LM90_REG_REMOTE_OFFSL		0x12
> +#define LM90_REG_REMOTE2_OFFSH		0x34
> +#define LM90_REG_REMOTE2_OFFSL		0x35

I don't think those are needed.

>  #define LM90_REG_REMOTE_HIGHH		0x07
>  #define LM90_REG_REMOTE_HIGHL		0x13
>  #define LM90_REG_REMOTE_LOWH		0x08
> @@ -669,6 +671,7 @@ enum lm90_temp_reg_index {
>  	REMOTE2_TEMP,	/* max6695/96 only */
>  	REMOTE2_LOW,	/* max6695/96 only */
>  	REMOTE2_HIGH,	/* max6695/96 only */
> +	REMOTE2_OFFSET,
>  
>  	TEMP_REG_NUM
>  };
> @@ -1024,6 +1027,14 @@ static int lm90_update_limits(struct device *dev)
>  			return val;
>  		data->temp[REMOTE2_HIGH] = val << 8;
>  
> +		if (data->flags & LM90_HAVE_OFFSET) {
> +			val = lm90_read16(client, LM90_REG_REMOTE2_OFFSH,
> +					  LM90_REG_REMOTE2_OFFSL, false);

Why not use LM90_REG_REMOTE_OFFSH and LM90_REG_REMOTE_OFFSL ?
The remove channel is selected here, after all.

> +			if (val < 0)
> +				return val;
> +			data->temp[REMOTE2_OFFSET] = val;
> +		}
> +
>  		lm90_select_remote_channel(data, false);
>  	}
>  
> @@ -1294,6 +1305,7 @@ static int lm90_temp_get_resolution(struct lm90_data *data, int index)
>  			return data->resolution;
>  		return 8;
>  	case REMOTE_OFFSET:
> +	case REMOTE2_OFFSET:
>  	case REMOTE2_TEMP:
>  		return data->resolution;
>  	case LOCAL_TEMP:
> @@ -1515,8 +1527,13 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
>  		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel], channel);
>  		break;
>  	case hwmon_temp_offset:
> -		*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET],
> -					  lm90_temp_get_resolution(data, REMOTE_OFFSET));
> +		/* Both offset registers have the same resolution */
> +		int res = lm90_temp_get_resolution(data, REMOTE_OFFSET);
> +
> +		if (channel == 1)
> +			*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET], res);
> +		else
> +			*val = lm90_temp_from_reg(0, data->temp[REMOTE2_OFFSET], res);

I would prefer the use of lm90_temp_offset_index[] as implemented for the
other attributes.

>  		break;
>  	default:
>  		return -EOPNOTSUPP;
> @@ -1556,11 +1573,19 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
>  				    channel, val);
>  		break;
>  	case hwmon_temp_offset:
> +		/* Both offset registers have the same resolution */
>  		val = lm90_temp_to_reg(0, val,
>  				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
> -		data->temp[REMOTE_OFFSET] = val;
> -		err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> -				   LM90_REG_REMOTE_OFFSL, val);
> +
> +		if (channel == 1) {
> +			data->temp[REMOTE_OFFSET] = val;
> +			err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> +					   LM90_REG_REMOTE_OFFSL, val);
> +		} else {
> +			data->temp[REMOTE2_OFFSET] = val;
> +			err = lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
> +					   LM90_REG_REMOTE2_OFFSL, val);
> +		}

Same as above.

Thanks,
Guenter

>  		break;
>  	default:
>  		err = -EOPNOTSUPP;
> @@ -2733,6 +2758,8 @@ static int lm90_probe(struct i2c_client *client)
>  		}
>  		if (data->flags & LM90_HAVE_EMERGENCY_ALARM)
>  			data->channel_config[2] |= HWMON_T_EMERGENCY_ALARM;
> +		if (data->flags & LM90_HAVE_OFFSET)
> +			data->channel_config[2] |= HWMON_T_OFFSET;
>  	}
>  
>  	data->faultqueue_mask = lm90_params[data->kind].faultqueue_mask;
