Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63314C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 16:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3905C60720
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 16:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhDMQlE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 13 Apr 2021 12:41:04 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:40747 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhDMQlD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Apr 2021 12:41:03 -0400
Received: by mail-oo1-f46.google.com with SMTP id j20-20020a4ad6d40000b02901b66fe8acd6so3962562oot.7
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Apr 2021 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HQTafLxklhRd/PS4J84iZKuccf0ooik8RuoR01Uoq44=;
        b=gU/6WtyukM5Anfu4o6WP3h39G1VFEk3sT8ctU0XtU0QH3z/gYEslsXpkcBxnX9VcQk
         1jOlibynGH/8VBlfyJbiwn02Fzr89Y1XMrjxmqe++2ImjPb0Z2LtAyUT4YivzCHt2HX2
         ElE2wlVC703CXrcAHiGNMAy1DDMLDvDK1nlGUoP/SKh/NwX+tBxjWu5Ep+Gl9v0v714N
         xcmswj2empwACnjUubpJep3VFpN/ZGeB4Dvpc3Dd7wNGAAt9X1jrGCeryNyKxBuD4hot
         4kaweJGWfOPUyq0OhX+s3oIROOkugx5GCEz8ptRGdFXXSxVbYDpBBEnlNTUF9ZQhGY09
         mPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HQTafLxklhRd/PS4J84iZKuccf0ooik8RuoR01Uoq44=;
        b=CXq1Lo9OEQDfTA4zhHpFcuErXEGB066/5HtVKm+InCFKMEg/hiN1sB0SGTbWhKN/s1
         ntbN8nTzU/07TVXaoWtDWJqkXnSz2zyY/nrc/OMEGPlaTVkEnFl0b4hGPSfC2HfsDIEU
         fexWs1Tle+7CEpeiyPZOxZQ26jianAu89c1odsvqzHHxWxmMjAKFsEXsHHEaGq31j7Tv
         zmXRQanyNZwdaVpOM/pieUrbluq102MkbEO6BQIJ4+SUnMP77A69q3z0gZktkGSPebSE
         5Thsy2N35813T7u0pLihiwlsK53zrMJX9Ji9WtcwCxBm8UNaWehyk/DvU5AkuPLmYGwh
         D2sQ==
X-Gm-Message-State: AOAM531aJiWA2n+ZYzPRGmJrtyj2IHj4O34L9DdmKNl8Px0F7Eir69eC
        8TkW7aOOXLKQ3ASUUQZTEzVYIc1k+Uk=
X-Google-Smtp-Source: ABdhPJyPbKjaV7nVk9OHUIkgdOeFQo3aQArKX//guYKeNUVf/RjpxESm3a/btdlXW9vdg3Tm5R7kzw==
X-Received: by 2002:a4a:d746:: with SMTP id h6mr8071150oot.23.1618331983887;
        Tue, 13 Apr 2021 09:39:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v13sm1612756ote.74.2021.04.13.09.39.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:39:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 13 Apr 2021 09:39:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     hdegoede@redhat.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (sch5627) Split sch5627_update_device()
Message-ID: <20210413163942.GA108119@roeck-us.net>
References: <20210411164225.11967-1-W_Armin@gmx.de>
 <20210411164225.11967-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411164225.11967-3-W_Armin@gmx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 11, 2021 at 06:42:25PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> An error in sch5627_update_device() could cause sch5627_read()
> to fail even if the error did not affect the target sensor type.
> Split sch5627_update_device() to prevent that.
> 
> Tested on a Fujitsu Esprimo P720.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/sch5627.c | 102 +++++++++++++++++++++++++++-------------
>  1 file changed, 69 insertions(+), 33 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
> index 023376082ee6..9735f3a81cbb 100644
> --- a/drivers/hwmon/sch5627.c
> +++ b/drivers/hwmon/sch5627.c
> @@ -73,66 +73,96 @@ struct sch5627_data {
> 
>  	struct mutex update_lock;
>  	unsigned long last_battery;	/* In jiffies */
> -	char valid;			/* !=0 if following fields are valid */
> -	unsigned long last_updated;	/* In jiffies */
> +	char temp_valid;		/* !=0 if following fields are valid */
> +	char fan_valid;
> +	char in_valid;
> +	unsigned long temp_last_updated;	/* In jiffies */
> +	unsigned long fan_last_updated;
> +	unsigned long in_last_updated;
>  	u16 temp[SCH5627_NO_TEMPS];
>  	u16 fan[SCH5627_NO_FANS];
>  	u16 in[SCH5627_NO_IN];
>  };
> 
> -static struct sch5627_data *sch5627_update_device(struct device *dev)
> +static int sch5627_update_temp(struct sch5627_data *data)
>  {
> -	struct sch5627_data *data = dev_get_drvdata(dev);
> -	struct sch5627_data *ret = data;
> +	int ret = 0;
>  	int i, val;
> 
>  	mutex_lock(&data->update_lock);
> 
> -	/* Trigger a Vbat voltage measurement every 5 minutes */
> -	if (time_after(jiffies, data->last_battery + 300 * HZ)) {
> -		sch56xx_write_virtual_reg(data->addr, SCH5627_REG_CTRL,
> -					  data->control | 0x10);
> -		data->last_battery = jiffies;
> -	}
> -
>  	/* Cache the values for 1 second */
> -	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +	if (time_after(jiffies, data->temp_last_updated + HZ) || !data->temp_valid) {
>  		for (i = 0; i < SCH5627_NO_TEMPS; i++) {
> -			val = sch56xx_read_virtual_reg12(data->addr,
> -				SCH5627_REG_TEMP_MSB[i],
> -				SCH5627_REG_TEMP_LSN[i],
> -				SCH5627_REG_TEMP_HIGH_NIBBLE[i]);
> +			val = sch56xx_read_virtual_reg12(data->addr, SCH5627_REG_TEMP_MSB[i],
> +							 SCH5627_REG_TEMP_LSN[i],
> +							 SCH5627_REG_TEMP_HIGH_NIBBLE[i]);
>  			if (unlikely(val < 0)) {
> -				ret = ERR_PTR(val);
> +				ret = val;
>  				goto abort;
>  			}
>  			data->temp[i] = val;
>  		}
> +		data->temp_last_updated = jiffies;
> +		data->temp_valid = 1;
> +	}
> +abort:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static int sch5627_update_fan(struct sch5627_data *data)
> +{
> +	int ret = 0;
> +	int i, val;
> 
> +	mutex_lock(&data->update_lock);
> +
> +	/* Cache the values for 1 second */
> +	if (time_after(jiffies, data->fan_last_updated + HZ) || !data->fan_valid) {
>  		for (i = 0; i < SCH5627_NO_FANS; i++) {
> -			val = sch56xx_read_virtual_reg16(data->addr,
> -							 SCH5627_REG_FAN[i]);
> +			val = sch56xx_read_virtual_reg16(data->addr, SCH5627_REG_FAN[i]);
>  			if (unlikely(val < 0)) {
> -				ret = ERR_PTR(val);
> +				ret = val;
>  				goto abort;
>  			}
>  			data->fan[i] = val;
>  		}
> +		data->fan_last_updated = jiffies;
> +		data->fan_valid = 1;
> +	}
> +abort:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static int sch5627_update_in(struct sch5627_data *data)
> +{
> +	int ret = 0;
> +	int i, val;
> +
> +	mutex_lock(&data->update_lock);
> 
> +	/* Trigger a Vbat voltage measurement every 5 minutes */
> +	if (time_after(jiffies, data->last_battery + 300 * HZ)) {
> +		sch56xx_write_virtual_reg(data->addr, SCH5627_REG_CTRL, data->control | 0x10);
> +		data->last_battery = jiffies;
> +	}
> +
> +	/* Cache the values for 1 second */
> +	if (time_after(jiffies, data->in_last_updated + HZ) || !data->in_valid) {
>  		for (i = 0; i < SCH5627_NO_IN; i++) {
> -			val = sch56xx_read_virtual_reg12(data->addr,
> -				SCH5627_REG_IN_MSB[i],
> -				SCH5627_REG_IN_LSN[i],
> -				SCH5627_REG_IN_HIGH_NIBBLE[i]);
> +			val = sch56xx_read_virtual_reg12(data->addr, SCH5627_REG_IN_MSB[i],
> +							 SCH5627_REG_IN_LSN[i],
> +							 SCH5627_REG_IN_HIGH_NIBBLE[i]);
>  			if (unlikely(val < 0)) {
> -				ret = ERR_PTR(val);
> +				ret = val;
>  				goto abort;
>  			}
>  			data->in[i] = val;
>  		}
> -
> -		data->last_updated = jiffies;
> -		data->valid = 1;
> +		data->in_last_updated = jiffies;
> +		data->in_valid = 1;
>  	}
>  abort:
>  	mutex_unlock(&data->update_lock);
> @@ -200,14 +230,14 @@ static umode_t sch5627_is_visible(const void *drvdata, enum hwmon_sensor_types t
>  static int sch5627_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
>  			long *val)
>  {
> -	struct sch5627_data *data = sch5627_update_device(dev);
> +	struct sch5627_data *data = dev_get_drvdata(dev);
>  	int ret;
> 
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
>  	switch (type) {
>  	case hwmon_temp:
> +		ret = sch5627_update_temp(data);
> +		if (ret < 0)
> +			return ret;
>  		switch (attr) {
>  		case hwmon_temp_input:
>  			*val = reg_to_temp(data->temp[channel]);
> @@ -226,6 +256,9 @@ static int sch5627_read(struct device *dev, enum hwmon_sensor_types type, u32 at
>  		}
>  		break;
>  	case hwmon_fan:
> +		ret = sch5627_update_fan(data);
> +		if (ret < 0)
> +			return ret;
>  		switch (attr) {
>  		case hwmon_fan_input:
>  			ret = reg_to_rpm(data->fan[channel]);
> @@ -247,6 +280,9 @@ static int sch5627_read(struct device *dev, enum hwmon_sensor_types type, u32 at
>  		}
>  		break;
>  	case hwmon_in:
> +		ret = sch5627_update_in(data);
> +		if (ret < 0)
> +			return ret;
>  		switch (attr) {
>  		case hwmon_in_input:
>  			*val = DIV_ROUND_CLOSEST(data->in[channel] * SCH5627_REG_IN_FACTOR[channel],
