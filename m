Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7793702F4;
	Wed, 19 Nov 2025 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546002; cv=none; b=G7eW3lIONO1c3+UMQuqinOa8rZ0Mn4UyK15GeNRf3PEkx2/WEEmry3Fz9BWXaGEeWxuFL8gsIjM38wMwbOY1oZN6Li1+Q/S7Wzi5JdZN8xn3xd5QFMJqUK8v0XzQcXXhC8pU3td8SZFS27klhQJWyIrTQEx6q8sNhdcn5Bg85Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546002; c=relaxed/simple;
	bh=wZvgy/Fme75rwVOjL5QORKabN7qXQvwkxzxcREdEn1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=uP/sNqX4wI5DwbzU2XpweDeIT61BXmBqE6qxK67K8y+PvC2OxJbovM2qHF2Iav5ykMD8y4YBe6s1nr21Vt8OM1PE4yIHtZ/CBJohpPRq9j1lCStv0fJI1ji5NkNpFphtf0KtxVY2KKDlnxaH1T0Ttfs3D+1YpSa18k7wlmVbQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JBc4x5jt; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JBc4x5jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=X80kUk4EF4ZCMXk
	WcAUMerAuWdaW9IXT08uCq/FXNOE=; b=JBc4x5jtBDuJ0KrdiflChiDB7mdj5Cx
	j97vOboC49FzwzRTrQMB9Zk6oELe8bsg8ofyzlk6AVnBjBrmfLJP3GGxi1WLuxXK
	rstcDwnnhkjp0f9EkGzwtezpUyVHNta1H5QJj+hhaBeaUPJ0wMqhCyswXVGGMrwZ
	wOmNXn0eaw8s=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCXAnVEkx1pdv4lEg--.50165S2;
	Wed, 19 Nov 2025 17:52:06 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v2 6/8] hwmon: (ina3221) Support for writing alert limit values and modify the 'ina3221_read_value' function.
Date: Wed, 19 Nov 2025 04:51:17 -0500
Message-Id: <20251119095117.64206-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5b84260d-b8bc-48d7-8334-2ea662e82421@roeck-us.net>
References: <5b84260d-b8bc-48d7-8334-2ea662e82421@roeck-us.net>
X-CM-TRANSID:QCgvCgCXAnVEkx1pdv4lEg--.50165S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4DWr1rWF45ur18Gr1kuFg_yoWxuw1Up3
	yfCF1rtr1xtr12vws2kFs5Wa4fAr1xW3yj9rnrK3s2vF45C3Z2gr4kGw4FyF1UuFnYvrsr
	ZwnIqw15CanrJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JjmKZJUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiGQUL02kdif8crgABs1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

At 2025-11-19 12:20:34, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 11/18/25 04:51, Wenliang Yan wrote:
>> SQ52210 adds power, current, and limit registers. The ina3221_read_value
>> function has been refactored to adapt to the new register data reading
>> format.
>> 
>> Each channel supports four new alert trigger modes, but only one trigger
>> mode can be active at any given time. Alert values are stored in the same
>> register. The sq52210_alert_limit_write function has been added to write
>> alert threshold values and configure alert source type.
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>>   drivers/hwmon/ina3221.c | 150 +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 147 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
>> index 1d589d402b52..9a25a1b40856 100644
>> --- a/drivers/hwmon/ina3221.c
>> +++ b/drivers/hwmon/ina3221.c
>> @@ -66,6 +66,14 @@
>>   #define INA3221_MASK_ENABLE_SCC_MASK	GENMASK(14, 12)
>>   
>>   #define SQ52210_ALERT_CONFIG_MASK	GENMASK(15, 4)
>> +#define SQ52210_MASK_ALERT_CHANNEL1 (BIT(15) | BIT(12) | BIT(9) | BIT(6))
>> +#define SQ52210_MASK_ALERT_CHANNEL2 (BIT(14) | BIT(11) | BIT(8) | BIT(5))
>> +#define SQ52210_MASK_ALERT_CHANNEL3 (BIT(13) | BIT(10) | BIT(7) | BIT(4))
>> +
>> +#define SQ52210_ALERT_ALL_SUL_MASK	(BIT(15) | BIT(14) | BIT(13))
>> +#define SQ52210_ALERT_ALL_BOL_MASK	(BIT(12) | BIT(11) | BIT(10))
>> +#define SQ52210_ALERT_ALL_BUL_MASK	(BIT(9) | BIT(8) | BIT(7))
>> +#define SQ52210_ALERT_ALL_POL_MASK	(BIT(6) | BIT(5) | BIT(4))
>>   
>>   #define INA3221_CONFIG_DEFAULT		0x7127
>>   #define INA3221_RSHUNT_DEFAULT		10000
>> @@ -272,6 +280,18 @@ static inline int ina3221_wait_for_data(struct ina3221_data *ina)
>>   					      cvrf, cvrf, wait, wait * 2);
>>   }
>>   
>> +static const u32 alert_groups[] = {
>> +	SQ52210_MASK_ALERT_CHANNEL1,
>> +	SQ52210_MASK_ALERT_CHANNEL2,
>> +	SQ52210_MASK_ALERT_CHANNEL3,
>> +};
>> +
>> +static const u8 limit_regs[] = {
>> +	SQ52210_ALERT_LIMIT1,
>> +	SQ52210_ALERT_LIMIT2,
>> +	SQ52210_ALERT_LIMIT3,
>> +};
>> +
>>   static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>>   			      int *val)
>>   {
>> @@ -284,13 +304,55 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>>   
>>   	/*
>>   	 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
>> +	 * Current registers have 15-bit value
>> +	 * Power registers have 16-bit value
>> +	 * ALERT_LIMIT registers have 16-bit value with 3-bit shift
>>   	 * Other Shunt Voltage registers have 12 bits with 3-bit shift
>>   	 */
>> -	if (reg == INA3221_SHUNT_SUM || reg == INA3221_CRIT_SUM)
>> +	switch (reg) {
>> +	case INA3221_SHUNT_SUM:
>> +	case INA3221_CRIT_SUM:
>>   		*val = sign_extend32(regval >> 1, 14);
>> -	else
>> +		break;
>> +	case SQ52210_CURRENT1:
>> +	case SQ52210_CURRENT2:
>> +	case SQ52210_CURRENT3:
>> +		*val = sign_extend32(regval, 15);
>> +		break;
>> +	case SQ52210_POWER1:
>> +	case SQ52210_POWER2:
>> +	case SQ52210_POWER3:
>> +		*val = regval;
>> +		break;
>> +	case INA3221_BUS1:
>> +	case INA3221_BUS2:
>> +	case INA3221_BUS3:
>> +	case INA3221_SHUNT1:
>> +	case INA3221_SHUNT2:
>> +	case INA3221_SHUNT3:
>> +	case INA3221_WARN1:
>> +	case INA3221_WARN2:
>> +	case INA3221_WARN3:
>> +	case INA3221_CRIT1:
>> +	case INA3221_CRIT2:
>> +	case INA3221_CRIT3:
>>   		*val = sign_extend32(regval >> 3, 12);
>> -
>> +		break;
>> +	case SQ52210_ALERT_LIMIT1:
>> +	case SQ52210_ALERT_LIMIT2:
>> +	case SQ52210_ALERT_LIMIT3:
>> +		if (ina->alert_type_select & SQ52210_ALERT_ALL_SUL_MASK)
>> +			*val = sign_extend32(regval, 15);
>> +		else if (ina->alert_type_select & (SQ52210_ALERT_ALL_BOL_MASK
>> +					| SQ52210_ALERT_ALL_BUL_MASK))
>> +			*val = regval >> 3;
>> +		else if (ina->alert_type_select & SQ52210_ALERT_ALL_POL_MASK)
>> +			*val = regval;
>> +		break;
>> +	default:
>> +		*val = 0;
>> +		return -EOPNOTSUPP;
>> +	};
>>   	return 0;
>>   }
>>   
>> @@ -443,6 +505,88 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>>   	}
>>   }
>>   
>> +static int sq52210_alert_limit_write(struct ina3221_data *ina, u32 attr, int channel, long val)
>> +{
>> +	struct regmap *regmap = ina->regmap;
>> +	int item = channel % INA3221_NUM_CHANNELS;
>> +	u8 limit_reg;
>> +	u32 alert_group, alert_mask = 0;
>> +	int regval = 0;
>> +	int ret;
>> +
>> +	if (item >= ARRAY_SIZE(alert_groups) || val < 0)
>> +		return -EINVAL;
>> +
>> +	alert_group = alert_groups[item];
>> +	limit_reg = limit_regs[item];
>> +
>> +	/* Clear alerts for this channel group first */
>> +	ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG, alert_group, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Determine alert type and calculate register value */
>> +	switch (attr) {
>> +	/*
>> +	 * The alert warning logic is implemented by comparing the limit register values
>> +	 * with the corresponding alert source register values. Since the current register
>> +	 * is a 15-bit signed register and the power register is a 16-bit unsigned
>> +	 * register, but the lower 3 bits of the limit register default to 0, the lower
>> +	 * 3 bits will be forced to 0 when setting SUL and POL warning values.
>> +	 * Formula to convert register value:
>> +	 *     bus_voltage: (regval / 8mV) << 3
>> +	 *     current: (regval / current_lsb) & 0xfff8
>> +	 *     power: (regval / current_lsb) & 0xfff8
>> +	 */
>> +	case hwmon_curr_lcrit:
>> +		/* SUL: Shunt Under Limit - BIT(15), BIT(14), BIT(13) */
>> +		alert_mask = BIT(15 - item);
>> +		/* Current Register, signed register, result in mA */
>> +		regval = DIV_ROUND_CLOSEST(val * 1000, ina->current_lsb_uA) & 0xfff8;
>> +		regval = clamp_val(regval, -32760, 32760);
>> +		break;
>> +	case hwmon_in_crit:
>> +		/* BOL: Bus Over Limit - BIT(12), BIT(11), BIT(10) */
>> +		alert_mask = BIT(12 - item);
>> +		/* Bus Register, signed register, result in mV */
>> +		regval = clamp_val(val, -32760, 32760);
>> +		break;
>> +	case hwmon_in_lcrit:
>> +		/* BUL: Bus Under Limit - BIT(9), BIT(8), BIT(7) */
>> +		alert_mask = BIT(9 - item);
>> +		/* Bus Register, signed register, result in mV */
>> +		regval = clamp_val(val, -32760, 32760);
>> +		break;
>> +	case hwmon_power_crit:
>
>Didn't I say this before ? The number space for each sensor type overlaps.
>Sensor attributes for different types can not be used in the same case statement.
>
>Did you even compile this ? I would be quite surprised if there is a compiler
>that would accept this code.
>
>Guenter

This was due to an oversight during the preparation of the patch series:
I inadvertently uploaded an incorrect patch version. Specifically, I submitted
code from an earlier modification phase instead of the final thoroughly tested
version. The updated release introduces new enum variables to address this problem,
and I will promptly prepare and submit a corrected v3 version containing the
proper code.
My sincere apologies for any inconvenience this may have caused.
Thank you for your understanding and patience.


Thanks,
Wenlaing Yan

