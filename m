Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D034C43334
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 12:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240732AbiFGMtZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236004AbiFGMtY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 08:49:24 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E2713EA2
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 05:49:23 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-e93bbb54f9so22971015fac.12
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jun 2022 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+486gv9ExQWKWNTiYVIiCKE5UqNDFp0I8roYNutSnXE=;
        b=MpOQnnY5gfP/4xG7+3aTAu2uYTyQCAAq4G6O0DA0x0ciT14Orl2+O63Ad4OsX4Ppij
         laIH/+hp/jXH7XSr93kw2e9eI+zhpTQINCygavdo/xg/XMS8AZcR+kGZz/cPqM3PS/dC
         mOUCIjqvgdssJHWj8qLtY3v+pktRIVeA1C0PINJM3hPcIy8TaDAoqD9U0J+4x4M1Ueff
         I9ilr3EQpfc5mLMhrzFyqYpQTNp+s2DX6PDNTvqUS0xPQyT4J7Vn/DFNhI+LtLJS+r3b
         qrTeLq2H1rgUvaMF00OaQaWzNhmpSNOVvfeg9Zw3RmXmajsXpAkqkYDsp99ktQii4BFN
         7MXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+486gv9ExQWKWNTiYVIiCKE5UqNDFp0I8roYNutSnXE=;
        b=zm5SuEFXmTgUvTfCB19zkUKvXK/ee3yuXWZQ/7jTxMySjOPbylUZa41WbX6TiehVS4
         1C3KxaMxBA2syN6Q8IjMv9+YafjeeG5GeqM/5zchyhcwAn4QrGqogWH7u1M9tzkX0cHz
         KEvekgtO98HesvDlXzUUu5YWEnUu0eHTUWf9bbBVO8GOwCIrkePPrNsEu0a+bP47/gcs
         BQrwP+p2aJ+QgaGPIqjOd5xnJw2WMwaENYp4PWIxsZY+y/kepfJBcgrtR4Xnm5Bwf+64
         8kNB7UFq6nu6Hk6G38up0L3dKr8E4kVrltz49LxtPgqeMpj28qxca6Pgtbqabv99b4wy
         mcrQ==
X-Gm-Message-State: AOAM5302xmcGtvRxGjz8AxAUzbt8QT5m7fsH3SCYuhdised+x01bpTa2
        D0I/9fPJyrj8RUPz9+EIpZk=
X-Google-Smtp-Source: ABdhPJz0A6UczwXb1HxRLRBWaxiH8Vm1ReIvIPW/pcy+BXva7JvGdE3kuoRSdgwQthaTgVhulDdaUw==
X-Received: by 2002:a05:6870:961c:b0:df:27ec:ed7f with SMTP id d28-20020a056870961c00b000df27eced7fmr16244760oaq.275.1654606162559;
        Tue, 07 Jun 2022 05:49:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g3-20020a056870ea0300b000f33ced2c50sm7942832oap.56.2022.06.07.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:49:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Jun 2022 05:49:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        przemyslaw.cencner@nokia.com, krzysztof.adamski@nokia.com,
        alexander.sverdlin@nokia.com, slawomir.stepien@nokia.com
Subject: Re: [PATCH 1/2] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
Message-ID: <20220607124920.GA1786819@roeck-us.net>
References: <20220607063504.1287855-1-sst@poczta.fm>
 <20220607063504.1287855-2-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607063504.1287855-2-sst@poczta.fm>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jun 07, 2022 at 08:35:03AM +0200, Slawomir Stepien wrote:
> From: Slawomir Stepien <slawomir.stepien@nokia.com>
> 
> The ADT7481 have LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags, but the
> support of second remote channel's offset is missing. Add that
> implementation.
> 
> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> Changes since v1:
> * New functions lm90_get_temp_offset and lm90_set_temp_offset.
> * Use the same addresses to access remote channel 1 and 2 registers.
> * Use new lm90_temp_offset_index translation table.
> 
>  drivers/hwmon/lm90.c | 58 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index a18aed5f96d1..ec885cb3ab92 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -672,6 +672,7 @@ enum lm90_temp_reg_index {
>  	REMOTE2_TEMP,	/* max6695/96 only */
>  	REMOTE2_LOW,	/* max6695/96 only */
>  	REMOTE2_HIGH,	/* max6695/96 only */
> +	REMOTE2_OFFSET,
>  
>  	TEMP_REG_NUM
>  };
> @@ -1028,6 +1029,14 @@ static int lm90_update_limits(struct device *dev)
>  			return val;
>  		data->temp[REMOTE2_HIGH] = val << 8;
>  
> +		if (data->flags & LM90_HAVE_OFFSET) {
> +			val = lm90_read16(client, LM90_REG_REMOTE_OFFSH,
> +					  LM90_REG_REMOTE_OFFSL, false);
> +			if (val < 0)
> +				return val;
> +			data->temp[REMOTE2_OFFSET] = val;
> +		}
> +
>  		lm90_select_remote_channel(data, false);
>  	}
>  
> @@ -1298,6 +1307,7 @@ static int lm90_temp_get_resolution(struct lm90_data *data, int index)
>  			return data->resolution;
>  		return 8;
>  	case REMOTE_OFFSET:
> +	case REMOTE2_OFFSET:
>  	case REMOTE2_TEMP:
>  		return data->resolution;
>  	case LOCAL_TEMP:
> @@ -1428,6 +1438,36 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
>  	return lm90_write_reg(data->client, LM90_REG_TCRIT_HYST, data->temp_hyst);
>  }
>  
> +static int lm90_get_temp_offset(struct lm90_data *data, int index)
> +{
> +	int res = lm90_temp_get_resolution(data, index);
> +
> +	return lm90_temp_from_reg(0, data->temp[index], res);
> +}
> +
> +static int lm90_set_temp_offset(struct lm90_data *data, int index, int channel, long val)
> +{
> +	int err;
> +
> +	val = lm90_temp_to_reg(0, val, lm90_temp_get_resolution(data, index));
> +
> +	/* For ADT7481 we can use the same registers for remote channel 1 and 2 */
> +	if (channel > 1)
> +		lm90_select_remote_channel(data, true);
> +
> +	err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH, LM90_REG_REMOTE_OFFSL, val);
> +
> +	if (channel > 1)
> +		lm90_select_remote_channel(data, false);
> +
> +	if (err)
> +		return err;
> +
> +	data->temp[index] = val;
> +
> +	return 0;
> +}
> +
>  static const u8 lm90_temp_index[MAX_CHANNELS] = {
>  	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
>  };
> @@ -1448,6 +1488,10 @@ static const u8 lm90_temp_emerg_index[MAX_CHANNELS] = {
>  	LOCAL_EMERG, REMOTE_EMERG, REMOTE2_EMERG
>  };
>  
> +static const s8 lm90_temp_offset_index[MAX_CHANNELS] = {
> +	-1, REMOTE_OFFSET, REMOTE2_OFFSET
> +};
> +
>  static const u16 lm90_min_alarm_bits[MAX_CHANNELS] = { BIT(5), BIT(3), BIT(11) };
>  static const u16 lm90_max_alarm_bits[MAX_CHANNELS] = { BIT(6), BIT(4), BIT(12) };
>  static const u16 lm90_crit_alarm_bits[MAX_CHANNELS] = { BIT(0), BIT(1), BIT(9) };
> @@ -1519,8 +1563,7 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
>  		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel], channel);
>  		break;
>  	case hwmon_temp_offset:
> -		*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET],
> -					  lm90_temp_get_resolution(data, REMOTE_OFFSET));
> +		*val = lm90_get_temp_offset(data, lm90_temp_offset_index[channel]);
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
> @@ -1560,13 +1603,8 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
>  				    channel, val);
>  		break;
>  	case hwmon_temp_offset:
> -		val = lm90_temp_to_reg(0, val,
> -				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
> -		err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
> -				   LM90_REG_REMOTE_OFFSL, val);
> -		if (err)
> -			break;
> -		data->temp[REMOTE_OFFSET] = val;
> +		err = lm90_set_temp_offset(data, lm90_temp_offset_index[channel],
> +					   channel, val);
>  		break;
>  	default:
>  		err = -EOPNOTSUPP;
> @@ -2803,6 +2841,8 @@ static int lm90_probe(struct i2c_client *client)
>  		}
>  		if (data->flags & LM90_HAVE_EMERGENCY_ALARM)
>  			data->channel_config[2] |= HWMON_T_EMERGENCY_ALARM;
> +		if (data->flags & LM90_HAVE_OFFSET)
> +			data->channel_config[2] |= HWMON_T_OFFSET;
>  	}
>  
>  	data->faultqueue_mask = lm90_params[data->kind].faultqueue_mask;
