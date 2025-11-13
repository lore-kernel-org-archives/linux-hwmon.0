Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945435B12A
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763054173; cv=none; b=u84mdP/mh/DmvYnY6AwhzCaEN3TgbiGrP4YUZcU+CSlGSehVfuDGdLXbzJOcY+Xt6Tcb1W0T5C73IPPVPwgG1Krsrv89wNwUjh8pDVYMkmmzoA5/mqw4lQQtPbWPfn/4XAlxnn5Ux7Fru6hjjHfchRtM74vNP7rjEkUob+apHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763054173; c=relaxed/simple;
	bh=kqOapHUlJokGBMDLAw5/AmUa8eanlJO9CMQNBhMqoTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on+il8YN8tKouZQZLhoPRyoCe9RHogNdFLl7XT5kfH85ZdVrodoDbdfY1dt7CiRfM8Y3AZZDjOk0gTyDJC7gvp7KW8Fid5r0SLSwpXjVgz3y4C6Y+dSEKbJPoW5KgkNLAHXNSiqJlzpDl/snXx++o0cimGbYOEvGO+Oz/Gerxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXWK5cyU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXWK5cyU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7af603c06easo1236145b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 09:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763054170; x=1763658970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG+8vrqjSfz++GhVWiiV/C0o3uKcfQReluhJYZukBK8=;
        b=AXWK5cyUJNMljJzHtTy42iEV0gpdaScXCohsV3wUI0oksp8ijLzfHgbOBD5RrdL8hQ
         C8+8x8xVVetcL7ywnAeEBhbf1HQ8rQ4gJvkErsmcLoe1VHa/41HT7urnVML99xWeB64M
         YhFP3iRsGEqEdV3X4yEY3rXJn4sxat5xmcKOwnkRN26Ui8fDNxi+WCKRdNUhj2/0sgpr
         UCf/cqrOwHKBMqz03xuSQTlJI44kGhwjOSzqjdvm6TnH6JwKz2jKhX1X0oX3+SHitiSg
         wvZed+7mNgDCvsHTRCLRg2omSuoMRMiqyH2/GUFeVAWGBnWrnCwx7JuTzNNpXXZSGEk7
         hWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763054170; x=1763658970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uG+8vrqjSfz++GhVWiiV/C0o3uKcfQReluhJYZukBK8=;
        b=YlAVIOwXAX0+fdJlOWQ6nn8nrLWF0oaB17UEaqqY67U2N8WlEOpFXKhN1SdPEAxksF
         Lq8Yw2WTn9+97qaVtY6sSKhaDOBoPcc6PWSRLGEK11YJhbwFuWKXvFIQIbxEm4AMfvYz
         y0FSh2kR9wUFI/g5BRYrmAjS2akqdFbJQ0+Q/ABgvj0mdAjz+WR3S1ZcupIdl7HF+FVP
         EGslXkslHOoHMPiE7kN5+dPLoOhg2LsG5g1aMzuNjvIP0n/No5qMNaHEA9YwkziMNcdv
         WxuRLW1pqMoD6r05xBTSN1Xmn0TWSWf22u/SwrjEB7uksaazs8P+nzka23XQGbnevE2K
         IsGg==
X-Forwarded-Encrypted: i=1; AJvYcCUuPxDPjUoQ6r3D4QFz60mylYjH64KyfQTW/vZtjD4BHxNO43HhisaxFnxEAxviS85Wp28juZc4JREP9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YycJdS5mgnyKA8z2fNunPUIv2QLQuFXYyaNHxmDdpnmEbs2M1F7
	/x58iJaE45aKcHSCfJswSqRUphVrzEro0Cnowvv/umBrBfS+nZY0Hhgc
X-Gm-Gg: ASbGnctTyuoa+wD8/zO+gBBANfHLeOE+H6nIJWUsviTtlsmY98Ow53fp2U/cw5CUgiI
	EV9wIBVd5xMUDCSyKZPsCS2gzPzb+0ml2Cu5h5zLCJmh0qWEQHN7LopmL+/NrgjpMNwriR1QvD3
	cchkTKu19F3ISuf3TQ5Wnf05hRFl0KNNgpu/80PMdYK583WmFojvi+DSosrwXroXRDFvFCwypNO
	l45EPZdROPr4d9yPsHlRT3fiUUF6irOz0gln8vs7wwcAXa3qQNI21O6mSIgoZyrk0Uc8Om239do
	BtB7QJX6U/IaIG40I0aMknnCLCk5iShzRbr3RGFFpoks51gVlNxmNxUISAjJMQkD897sXzgs/tT
	AYrS1AJBrCC4PR6YLprX1Op0RB9rvCHdbMSxwjs5qdFgd1utYvW91vnVQKsc/D5yq0Pk234i5XB
	DUWUC5CCaKkX6C
X-Google-Smtp-Source: AGHT+IEpVcVjkR7tBwOR+VbhWQK7bhDkeeibEPzjJSicrGZb7ubD0P6CLIsCvytRfb2Tgt2Sd2OjRQ==
X-Received: by 2002:a05:6a00:3d42:b0:776:19f6:5d2f with SMTP id d2e1a72fcca58-7ba3419a59emr440944b3a.11.1763054169507;
        Thu, 13 Nov 2025 09:16:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aede04sm2847809b3a.11.2025.11.13.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 09:16:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 09:16:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 6/8] hwmon:(ina3221)Modify read/write functions for 'in'
 attribute
Message-ID: <05cf9a44-506c-4515-ae12-39ac0bf0cc3d@roeck-us.net>
References: <20251111080546.32421-1-wenliang202407@163.com>
 <20251111080546.32421-7-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111080546.32421-7-wenliang202407@163.com>

On Tue, Nov 11, 2025 at 03:05:44AM -0500, Wenliang Yan wrote:
> SQ52210 adds current, power, and alert-limit sensors, with read/write
> functions modified to accommodate these new changes.
> 
> The ina3221_read_value function has been rewritten to adapt to the
> new register format for data reading.
> 
> The sq52210_alert_to_reg function has been added to handle reading
> of different data types.
> 
> Each channel supports four new alert trigger modes, with only one
> trigger active at any given time. Alert values are stored in the
> same register. The sq52210_alert_limit_write function has been
> implemented for writing alert threshold values.
> 
> The 'in' read/write functions have been modified to add crit,
> lcrit, crit_alarm, and lcrit_alarm characteristics.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
>  drivers/hwmon/ina3221.c | 182 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 178 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 77b2505a49a2..abb6049c8eab 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -66,6 +66,9 @@
>  #define INA3221_MASK_ENABLE_SCC_MASK	GENMASK(14, 12)
>  
>  #define SQ52210_ALERT_CONFIG_MASK	GENMASK(15, 4)
> +#define SQ52210_MASK_ALERT_CHANNEL1 (BIT(15) | BIT(12) | BIT(9) | BIT(6))
> +#define SQ52210_MASK_ALERT_CHANNEL2 (BIT(14) | BIT(11) | BIT(8) | BIT(5))
> +#define SQ52210_MASK_ALERT_CHANNEL3 (BIT(13) | BIT(10) | BIT(7) | BIT(4))
>  
>  #define INA3221_CONFIG_DEFAULT		0x7127
>  #define INA3221_RSHUNT_DEFAULT		10000
> @@ -84,6 +87,9 @@ enum ina3221_fields {
>  	/* Alert Flags: SF is the summation-alert flag */
>  	F_SF, F_CF3, F_CF2, F_CF1,
>  
> +	/* Alert Flags: AFF is the alert function flag */
> +	F_AFF3, F_AFF2, F_AFF1,
> +
>  	/* sentinel */
>  	F_MAX_FIELDS
>  };
> @@ -99,6 +105,10 @@ static const struct reg_field ina3221_reg_fields[] = {
>  	[F_CF3] = REG_FIELD(INA3221_MASK_ENABLE, 7, 7),
>  	[F_CF2] = REG_FIELD(INA3221_MASK_ENABLE, 8, 8),
>  	[F_CF1] = REG_FIELD(INA3221_MASK_ENABLE, 9, 9),
> +
> +	[F_AFF3] = REG_FIELD(SQ52210_ALERT_CONFIG, 1, 1),
> +	[F_AFF2] = REG_FIELD(SQ52210_ALERT_CONFIG, 2, 2),
> +	[F_AFF1] = REG_FIELD(SQ52210_ALERT_CONFIG, 3, 3),
>  };
>  
>  enum ina3221_channels {
> @@ -293,11 +303,39 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>  	 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
>  	 * Other Shunt Voltage registers have 12 bits with 3-bit shift
>  	 */
> -	if (reg == INA3221_SHUNT_SUM || reg == INA3221_CRIT_SUM)
> +	switch (reg) {
> +	case INA3221_SHUNT_SUM:
> +	case INA3221_CRIT_SUM:
>  		*val = sign_extend32(regval >> 1, 14);
> -	else
> +		break;
> +	case SQ52210_CURRENT1:
> +	case SQ52210_CURRENT2:
> +	case SQ52210_CURRENT3:
> +	case SQ52210_POWER1:
> +	case SQ52210_POWER2:
> +	case SQ52210_POWER3:
> +		*val = regval;
> +		break;
> +	case INA3221_BUS1:
> +	case INA3221_BUS2:
> +	case INA3221_BUS3:
> +	case INA3221_SHUNT1:
> +	case INA3221_SHUNT2:
> +	case INA3221_SHUNT3:
> +	case INA3221_WARN1:
> +	case INA3221_WARN2:
> +	case INA3221_WARN3:
> +	case INA3221_CRIT1:
> +	case INA3221_CRIT2:
> +	case INA3221_CRIT3:
>  		*val = sign_extend32(regval >> 3, 12);
> -
> +		break;
> +	case SQ52210_ALERT_LIMIT1:
> +	case SQ52210_ALERT_LIMIT2:
> +	case SQ52210_ALERT_LIMIT3:
> +		*val = regval >> 3;
> +		break;
> +	};

This returns 0 if the register is not listed in the case statement while leaving
val unset. It would probably be better to drop this function entirely and handle the
conversions in the calling code.

>  	return 0;
>  }
>  
> @@ -311,6 +349,56 @@ static const u8 ina3221_in_reg[] = {
>  	INA3221_SHUNT_SUM,
>  };
>  
> +static const u8 alert_limit_reg[] = {
> +	SQ52210_ALERT_LIMIT1,
> +	SQ52210_ALERT_LIMIT2,
> +	SQ52210_ALERT_LIMIT3,
> +};
> +
> +static const u8 alert_flag[] = {
> +	F_AFF1,
> +	F_AFF2,
> +	F_AFF3,
> +};
> +
> +/*
> + * Turns alert limit values into register values.
> + * Opposite of the formula in ina3221_read_value().
> + */
> +static u16 sq52210_alert_to_reg(struct ina3221_data *ina, int reg, long val)
> +{
> +	int regval;
> +	/*
> +	 * Formula to convert voltage_uv to register value:
> +	 *     regval = (voltage_mv / scale) << shift
> +	 * Results:
> +	 *     bus_voltage: (1 / 8mV) << 3 = 1 mV
> +	 */
> +	switch (reg) {
> +	case INA3221_BUS1:
> +	case INA3221_BUS2:
> +	case INA3221_BUS3:
> +		/* clamp voltage */
> +		regval = clamp_val(val, -32760, 32760);
> +		return regval;
> +	case SQ52210_CURRENT1:
> +	case SQ52210_CURRENT2:
> +	case SQ52210_CURRENT3:
> +		/* signed register, result in mA */
> +		regval = DIV_ROUND_CLOSEST(val * 8000, ina->current_lsb_uA);
> +		return clamp_val(regval, -32760, 32760);
> +	case SQ52210_POWER1:
> +	case SQ52210_POWER2:
> +	case SQ52210_POWER3:
> +		regval = DIV_ROUND_CLOSEST(val * 8000, ina->power_lsb_uW);
> +		return clamp_val(regval, 0, 65528);
> +	default:
> +		/* programmer goofed */
> +		WARN_ON_ONCE(1);
> +		return 0;

Same as above. I know other code uses the samew approach, but this kind of
"validation" would be better to avoid. It would be much better to handle the
conversions in the calling code.

> +	}
> +}
> +
>  static int ina3221_read_chip(struct device *dev, u32 attr, long *val)
>  {
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
> @@ -373,6 +461,25 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
>  	case hwmon_in_enable:
>  		*val = ina3221_is_enabled(ina, channel);
>  		return 0;
> +	case hwmon_in_crit:
> +	case hwmon_in_lcrit:
> +		reg = alert_limit_reg[channel];
> +		ret = ina3221_read_value(ina, reg, &regval);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * Scale of bus voltage (mV): LSB is 8mV
> +		 */
> +		*val = regval * 8;
> +		return 0;
> +	case hwmon_in_crit_alarm:
> +	case hwmon_in_lcrit_alarm:
> +		reg = alert_flag[channel];
> +		ret = regmap_field_read(ina->fields[reg], &regval);
> +		if (ret)
> +			return ret;
> +		*val = regval;
> +		return 0;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -450,6 +557,58 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>  	}
>  }
>  
> +static const u32 sq52210_alert_mask[][INA3221_NUM_CHANNELS] = {
> +	[hwmon_curr_lcrit] = { BIT(15), BIT(14), BIT(13) },
> +	[hwmon_in_crit] = { BIT(12), BIT(11), BIT(10) },
> +	[hwmon_in_lcrit] = { BIT(9), BIT(8), BIT(7) },
> +	[hwmon_power_crit] = { BIT(6), BIT(5), BIT(4) },

This does not work. hwmon_curr_xxx, hwmon_inxxx, and hwmon_power_xxx use
different and overlapping number spaces. Even if that was not the case,
the above would result in a serverely sparse array, and the callingo code
would have to make sure that the row is actually populated before using it.

> +};
> +
> +static int sq52210_alert_limit_write(struct ina3221_data *ina, u32 attr, int channel, long val)
> +{
> +	struct regmap *regmap = ina->regmap;
> +	int ret, limit_reg, item;
> +	u32 alert_group;
> +
> +	if (val < 0)
> +		return -EINVAL;
> +	item = channel % INA3221_NUM_CHANNELS;
> +	switch (item) {
> +	case 0:
> +		alert_group = SQ52210_MASK_ALERT_CHANNEL1;
> +		limit_reg = SQ52210_ALERT_LIMIT1;
> +		break;
> +	case 1:
> +		alert_group = SQ52210_MASK_ALERT_CHANNEL2;
> +		limit_reg = SQ52210_ALERT_LIMIT2;
> +		break;
> +	case 2:
> +		alert_group = SQ52210_MASK_ALERT_CHANNEL3;
> +		limit_reg = SQ52210_ALERT_LIMIT3;
> +		break;
> +	default:
> +		break;
> +	}
> +	/*
> +	 * Clear all alerts first to avoid accidentally triggering ALERT pin
> +	 * due to register write sequence. Then, only enable the alert
> +	 * if the value is non-zero.
> +	 */
> +	ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG,
> +				alert_group, 0);
> +	if (ret < 0)
> +		return ret;
> +	ret = regmap_write(regmap, limit_reg,
> +			sq52210_alert_to_reg(ina, ina3221_curr_reg[attr][item], val));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val)
> +		return regmap_update_bits(regmap, SQ52210_ALERT_CONFIG,
> +					alert_group, sq52210_alert_mask[attr][item]);
> +	return 0;
> +}
> +
>  static int ina3221_write_chip(struct device *dev, u32 attr, long val)
>  {
>  	struct ina3221_data *ina = dev_get_drvdata(dev);
> @@ -586,6 +745,21 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
>  	return ret;
>  }
>  
> +static int ina3221_write_in(struct device *dev, u32 attr, int channel, long val)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_in_lcrit:
> +		return sq52210_alert_limit_write(ina, attr, channel, val);
> +	case hwmon_in_crit:
> +		return sq52210_alert_limit_write(ina, attr, channel, val);
> +	case hwmon_in_enable:
> +		return ina3221_write_enable(dev, channel, val);
> +	default:
> +		return 0;
> +	}
> +}
>  static int ina3221_read(struct device *dev, enum hwmon_sensor_types type,
>  			u32 attr, int channel, long *val)
>  {
> @@ -620,7 +794,7 @@ static int ina3221_write(struct device *dev, enum hwmon_sensor_types type,
>  		break;
>  	case hwmon_in:
>  		/* 0-align channel ID */
> -		ret = ina3221_write_enable(dev, channel - 1, val);
> +		ret = ina3221_write_in(dev, attr, channel - 1, val);
>  		break;
>  	case hwmon_curr:
>  		ret = ina3221_write_curr(dev, attr, channel, val);
> -- 
> 2.17.1
> 
> 
