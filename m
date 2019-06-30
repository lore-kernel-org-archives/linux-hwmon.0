Return-Path: <SRS0=soNe=U5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4FEC5B57E
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jun 2019 20:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 257B2217D8
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jun 2019 20:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uUnZ4Myo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfF3UjG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jun 2019 16:39:06 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44623 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfF3UjG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jun 2019 16:39:06 -0400
Received: by mail-pl1-f194.google.com with SMTP id t7so6166941plr.11
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Jun 2019 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hR5kvArVqFy86BkKOkK83nxGyFp+j6Tx4A9iJI7YqY8=;
        b=uUnZ4MyoFzbIEgbW8mMsVtxawEzbdMkrfrVgpxwzSMiRByL4js3xD1zwC/SHC5mtoz
         Qiow5u+yG4k5ZxgDRZ+HUjF8jCtk/ZgMrSBnWc+mFG7gDT+KM8fpO/EWsiNHftYNLOPF
         McOGiUyo2EfNMQq84HQhhb59MoRV8xsE5Gl97PcogZDH43FRZU8vkXY6CT1Cu+V6zuHp
         aPvnyb89Xesu3jbCWQWiitRSjgrTX3TeRscfcL357fjTV4PCiZIqKjH0dybgSCK79BOA
         HCrqe7cpLBTAbM3UEEoQqKvgifztpsBpscoj1DYF+x+NzLRWG7BqIjEsSp77b+X8mKXT
         W3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hR5kvArVqFy86BkKOkK83nxGyFp+j6Tx4A9iJI7YqY8=;
        b=rYPzFA9bcSNWBDJTOSGtj6+xNyJI8uzKGM2WKwk2hLZhtbI9PQWZjhCAjK0HLSA+vH
         VeGL5HHe2WfPn9u8iPlEH+gwgB0LgPPgmB3JN3axO4Ejr61O961ud14s0lsQVr+MP5Nn
         yp64DkhHmGbQ+IDMLNMhxtej074ykgiTtm4LqqRdygQuZoNKzqQL5tQiC5KNOc2yKYS3
         uq32LEv8p50Ld6ettXbVXSjoq6pYHvU2Uko2YNTL0S73aSmfeM9XN2m8J8A0UYtB/zB5
         qkvD3QKCtGBzHHjghtu9e/wjB4RcmTCos/fox/fwRCb5TMu+N7svZLfGHC9Zi7Y71/Ph
         qc5Q==
X-Gm-Message-State: APjAAAU8BlrQ+EenCkdRUIki4X0brqzU5vgyEp8udF6QM+INqAvVKJ8Z
        SFQaJXT1iMM/kmm3Z5MSeb0=
X-Google-Smtp-Source: APXvYqwlUeWx+WhtacXMi1uiOCtO761+XpzB0UvrNyREz0oIoJpz2Bo182hc2GE8Fa0Qr5hzrCgRaQ==
X-Received: by 2002:a17:902:4201:: with SMTP id g1mr24854798pld.300.1561927145328;
        Sun, 30 Jun 2019 13:39:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t32sm16752948pgk.29.2019.06.30.13.39.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 13:39:04 -0700 (PDT)
Date:   Sun, 30 Jun 2019 13:39:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boyang Yu <byu@arista.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        deank@arista.com, ryant@arista.com
Subject: Re: [PATCH v2] hwmon: (lm90) Fix max6658 sporadic wrong temperature
 reading
Message-ID: <20190630203903.GA24590@roeck-us.net>
References: <20190628190636.5565-1-byu@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628190636.5565-1-byu@arista.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 28, 2019 at 07:06:36PM +0000, Boyang Yu wrote:
> max6658 may report unrealistically high temperature during
> the driver initialization, for which, its overtemp alarm pin
> also gets asserted. For certain devices implementing overtemp
> protection based on that pin, it may further trigger a reset to
> the device. By reproducing the problem, the wrong reading is
> found to be coincident with changing the conversion rate.
> 
> To mitigate this issue, set the stop bit before changing the
> conversion rate and unset it thereafter. After such change, the
> wrong reading is not reproduced. Apply this change only to the
> max6657 kind for now, controlled by flag LM90_PAUSE_ON_CONFIG.
> 
> Signed-off-by: Boyang Yu <byu@arista.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm90.c | 42 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index e562a578f20e..bd00d8eac066 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -174,6 +174,7 @@ enum chips { lm90, adm1032, lm99, lm86, max6657, max6659, adt7461, max6680,
>  #define LM90_HAVE_EMERGENCY_ALARM (1 << 5)/* emergency alarm		*/
>  #define LM90_HAVE_TEMP3		(1 << 6) /* 3rd temperature sensor	*/
>  #define LM90_HAVE_BROKEN_ALERT	(1 << 7) /* Broken alert		*/
> +#define LM90_PAUSE_FOR_CONFIG	(1 << 8) /* Pause conversion for config	*/
>  
>  /* LM90 status */
>  #define LM90_STATUS_LTHRM	(1 << 0) /* local THERM limit tripped */
> @@ -367,6 +368,7 @@ static const struct lm90_params lm90_params[] = {
>  		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
>  	},
>  	[max6657] = {
> +		.flags = LM90_PAUSE_FOR_CONFIG,
>  		.alert_alarms = 0x7c,
>  		.max_convrate = 8,
>  		.reg_local_ext = MAX6657_REG_R_LOCAL_TEMPL,
> @@ -567,6 +569,38 @@ static inline int lm90_select_remote_channel(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static int lm90_write_convrate(struct i2c_client *client,
> +			       struct lm90_data *data, int val)
> +{
> +	int err;
> +	int config_orig, config_stop;
> +
> +	/* Save config and pause conversion */
> +	if (data->flags & LM90_PAUSE_FOR_CONFIG) {
> +		config_orig = lm90_read_reg(client, LM90_REG_R_CONFIG1);
> +		if (config_orig < 0)
> +			return config_orig;
> +		config_stop = config_orig | 0x40;
> +		if (config_orig != config_stop) {
> +			err = i2c_smbus_write_byte_data(client,
> +							LM90_REG_W_CONFIG1,
> +							config_stop);
> +			if (err < 0)
> +				return err;
> +		}
> +	}
> +
> +	/* Set conv rate */
> +	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, val);
> +
> +	/* Revert change to config */
> +	if (data->flags & LM90_PAUSE_FOR_CONFIG && config_orig != config_stop)
> +		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
> +					  config_orig);
> +
> +	return err;
> +}
> +
>  /*
>   * Set conversion rate.
>   * client->update_lock must be held when calling this function (unless we are
> @@ -587,7 +621,7 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
>  		if (interval >= update_interval * 3 / 4)
>  			break;
>  
> -	err = i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE, i);
> +	err = lm90_write_convrate(client, data, i);
>  	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
>  	return err;
>  }
> @@ -1593,8 +1627,7 @@ static void lm90_restore_conf(void *_data)
>  	struct i2c_client *client = data->client;
>  
>  	/* Restore initial configuration */
> -	i2c_smbus_write_byte_data(client, LM90_REG_W_CONVRATE,
> -				  data->convrate_orig);
> +	lm90_write_convrate(client, data, data->convrate_orig);
>  	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
>  				  data->config_orig);
>  }
> @@ -1611,12 +1644,13 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  	/*
>  	 * Start the conversions.
>  	 */
> -	lm90_set_convrate(client, data, 500);	/* 500ms; 2Hz conversion rate */
>  	config = lm90_read_reg(client, LM90_REG_R_CONFIG1);
>  	if (config < 0)
>  		return config;
>  	data->config_orig = config;
>  
> +	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
> +
>  	/* Check Temperature Range Select */
>  	if (data->kind == adt7461 || data->kind == tmp451) {
>  		if (config & 0x04)
