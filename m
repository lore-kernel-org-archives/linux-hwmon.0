Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6D224B14;
	Fri, 14 Nov 2025 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105873; cv=none; b=So3kzwQjlw5zWPN1T1TF/bh78j1hMpOCOxgaqnxDu25W9A8lznzpYtUwZFVQD3KIRxUlvxWaVXf4T8Pf8u3W3jM2fn8M8kQarP7gaTvGGqNOk+ZweAvViumMfYlYtyWReHU7yGlVXpr7ZAj42+USWaXdCu8htdNmsS36AK+/MRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105873; c=relaxed/simple;
	bh=enPaN1dMJTFLYdpII4RfRPdvr7fAva+Fa7XW5ElKwE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=obHJlK9L56Gt0RHvPz1qAwIcDUmQ4rBwBqq57uEl6Eg5werAHMuNfujfiSYExPcf176eBPaSzhRo+trpeSXN5v6lnIO3qoaBYIm3/IMQ+dCpV8xbAQWdAKi4+SEHeuUd4LNQMcBqrUpIPf6leJFDPhX6Uy0QjkbHNO0Vys1RQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iHtGkl1t; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iHtGkl1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=XLOgeU0Epl2MTru
	mwoIXG9fnH1GQGTrV8VoYLmCIIQs=; b=iHtGkl1tVq/rBzfvOoY8frx9vgzkU0Z
	MLGYi4nK1gf/l882asFkrKNtwQrXlZmXc5uIj1j7TrZt7MFSbfWDOGGVkVo694Gl
	GJLCh42jKzL5G6nGQ0RHr0imdGnP9QQKFVXneNYa1FLWxBHqMUCuFG9wHQFzs1Ko
	lUrAs/iQwBEk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXDqUh3BZpyMCjDg--.18708S2;
	Fri, 14 Nov 2025 15:37:07 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH 1/8] dt-binding:ti,ina3221:Add SQ52210
Date: Fri, 14 Nov 2025 02:36:44 -0500
Message-Id: <20251114073644.6813-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <05cf9a44-506c-4515-ae12-39ac0bf0cc3d@roeck-us.net>
References: <05cf9a44-506c-4515-ae12-39ac0bf0cc3d@roeck-us.net>
X-CM-TRANSID:PCgvCgAXDqUh3BZpyMCjDg--.18708S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF1rCw1DKw47XrWUGw15Arb_yoWxGr4Dp3
	y8GF48tr1xtr1xZr4vkFs5GF18Zr4Ig342yryDKa4vvan5Arnag34kGw40yryxuFn3WFs7
	Za1ayryakanrtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JjT-erUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbCwAMf8mkW3CM5DAAA3b
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

At 2025-11-14 01:16:07, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On Tue, Nov 11, 2025 at 03:05:44AM -0500, Wenliang Yan wrote:
>>  enum ina3221_channels {
>> @@ -293,11 +303,39 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>>  	 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
>>  	 * Other Shunt Voltage registers have 12 bits with 3-bit shift
>>  	 */
>> -	if (reg == INA3221_SHUNT_SUM || reg == INA3221_CRIT_SUM)
>> +	switch (reg) {
>> +	case INA3221_SHUNT_SUM:
>> +	case INA3221_CRIT_SUM:
>>  		*val = sign_extend32(regval >> 1, 14);
>> -	else
>> +		break;
>> +	case SQ52210_CURRENT1:
>> +	case SQ52210_CURRENT2:
>> +	case SQ52210_CURRENT3:
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
>>  		*val = sign_extend32(regval >> 3, 12);
>> -
>> +		break;
>> +	case SQ52210_ALERT_LIMIT1:
>> +	case SQ52210_ALERT_LIMIT2:
>> +	case SQ52210_ALERT_LIMIT3:
>> +		*val = regval >> 3;
>> +		break;
>> +	};
>
>This returns 0 if the register is not listed in the case statement while leaving
>val unset. It would probably be better to drop this function entirely and handle the
>conversions in the calling code.
>

This call is used quite frequently, and handling it directly in the calling code
would result in significant code redundancy. I believe adding default: *val = 0;
return -EOPNOTSUPP; should address your concerns.

>>  	return 0;
>>  }
>>  

>> +/*
>> + * Turns alert limit values into register values.
>> + * Opposite of the formula in ina3221_read_value().
>> + */
>> +static u16 sq52210_alert_to_reg(struct ina3221_data *ina, int reg, long val)
>> +{
>> +	int regval;
>> +	/*
>> +	 * Formula to convert voltage_uv to register value:
>> +	 *     regval = (voltage_mv / scale) << shift
>> +	 * Results:
>> +	 *     bus_voltage: (1 / 8mV) << 3 = 1 mV
>> +	 */
>> +	switch (reg) {
>> +	case INA3221_BUS1:
>> +	case INA3221_BUS2:
>> +	case INA3221_BUS3:
>> +		/* clamp voltage */
>> +		regval = clamp_val(val, -32760, 32760);
>> +		return regval;
>> +	case SQ52210_CURRENT1:
>> +	case SQ52210_CURRENT2:
>> +	case SQ52210_CURRENT3:
>> +		/* signed register, result in mA */
>> +		regval = DIV_ROUND_CLOSEST(val * 8000, ina->current_lsb_uA);
>> +		return clamp_val(regval, -32760, 32760);
>> +	case SQ52210_POWER1:
>> +	case SQ52210_POWER2:
>> +	case SQ52210_POWER3:
>> +		regval = DIV_ROUND_CLOSEST(val * 8000, ina->power_lsb_uW);
>> +		return clamp_val(regval, 0, 65528);
>> +	default:
>> +		/* programmer goofed */
>> +		WARN_ON_ONCE(1);
>> +		return 0;
>
>Same as above. I know other code uses the samew approach, but this kind of
>"validation" would be better to avoid. It would be much better to handle the
>conversions in the calling code.
>

As per your recommendation, I will remove this function and complete the
conversion directly within the sq52210_alert_limit_write function.

>> +	}
>> +}
>> +
>>  static int ina3221_read_chip(struct device *dev, u32 attr, long *val)
>>  {
>>  	struct ina3221_data *ina = dev_get_drvdata(dev);
>> @@ -373,6 +461,25 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
>>  	case hwmon_in_enable:
>>  		*val = ina3221_is_enabled(ina, channel);
>>  		return 0;
>> +	case hwmon_in_crit:
>> +	case hwmon_in_lcrit:
>> +		reg = alert_limit_reg[channel];
>> +		ret = ina3221_read_value(ina, reg, &regval);
>> +		if (ret)
>> +			return ret;
>> +		/*
>> +		 * Scale of bus voltage (mV): LSB is 8mV
>> +		 */
>> +		*val = regval * 8;
>> +		return 0;
>> +	case hwmon_in_crit_alarm:
>> +	case hwmon_in_lcrit_alarm:
>> +		reg = alert_flag[channel];
>> +		ret = regmap_field_read(ina->fields[reg], &regval);
>> +		if (ret)
>> +			return ret;
>> +		*val = regval;
>> +		return 0;
>>  	default:
>>  		return -EOPNOTSUPP;
>>  	}
>> @@ -450,6 +557,58 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>>  	}
>>  }
>>  
>> +static const u32 sq52210_alert_mask[][INA3221_NUM_CHANNELS] = {
>> +	[hwmon_curr_lcrit] = { BIT(15), BIT(14), BIT(13) },
>> +	[hwmon_in_crit] = { BIT(12), BIT(11), BIT(10) },
>> +	[hwmon_in_lcrit] = { BIT(9), BIT(8), BIT(7) },
>> +	[hwmon_power_crit] = { BIT(6), BIT(5), BIT(4) },
>
>This does not work. hwmon_curr_xxx, hwmon_inxxx, and hwmon_power_xxx use
>different and overlapping number spaces. Even if that was not the case,
>the above would result in a serverely sparse array, and the callingo code
>would have to make sure that the row is actually populated before using it.
>

Using an array here isn't quite appropriate. I'll use a switch statement in
the next version to determine different alert flags to resolve this issue.

>> +};
>> +
>> +static int sq52210_alert_limit_write(struct ina3221_data *ina, u32 attr, int channel, long val)
>> +{
>> +	struct regmap *regmap = ina->regmap;
>> +	int ret, limit_reg, item;
>> +	u32 alert_group;
>> +
>> +	if (val < 0)
>> +		return -EINVAL;
>> +	item = channel % INA3221_NUM_CHANNELS;
>> +	switch (item) {
>> +	case 0:
>> +		alert_group = SQ52210_MASK_ALERT_CHANNEL1;
>> +		limit_reg = SQ52210_ALERT_LIMIT1;
>> +		break;
>> +	case 1:
>> +		alert_group = SQ52210_MASK_ALERT_CHANNEL2;
>> +		limit_reg = SQ52210_ALERT_LIMIT2;
>> +		break;
>> +	case 2:
>> +		alert_group = SQ52210_MASK_ALERT_CHANNEL3;
>> +		limit_reg = SQ52210_ALERT_LIMIT3;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +	/*
>> +	 * Clear all alerts first to avoid accidentally triggering ALERT pin
>> +	 * due to register write sequence. Then, only enable the alert
>> +	 * if the value is non-zero.
>> +	 */
>> +	ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG,
>> +				alert_group, 0);
>> +	if (ret < 0)
>> +		return ret;
>> +	ret = regmap_write(regmap, limit_reg,
>> +			sq52210_alert_to_reg(ina, ina3221_curr_reg[attr][item], val));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (val)
>> +		return regmap_update_bits(regmap, SQ52210_ALERT_CONFIG,
>> +					alert_group, sq52210_alert_mask[attr][item]);
>> +	return 0;
>> +}
>> +
 


Thanks,
Wenlaing Yan

