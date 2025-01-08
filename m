Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF68719CC29;
	Wed,  8 Jan 2025 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304841; cv=none; b=uVw156H+ipzHQXqbbrBE7B5RDbX8/IpMTpnlQ54Xf0cXu/UdcVMuvWpWiFhsZwrBYdcsTeD/ZE8o9YGAKzwpsbhF6PXZoORrueSIRQkxRQnRZh553uHrucfs2dQ9hhM2npyWB7kYJbcOiN1fv8T7krwlP878UoEPHviHs1XM/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304841; c=relaxed/simple;
	bh=+ozAqA/7zYhjKaAVy+rs5gLUFI8eWLeEdNdzwXhsr8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkMWAp0fbrYmweau61cR4QfrRCIOyQBpk8ApwtoRqoH4aqpMesJ+4hySoOiZsDXZBPmyzmP3yIS6IuU1+t/xduWKmBRLtqDtZ9LY2daGluWcSlbhj6Rf70QeWDwxVYeePzQtbdRFF56dd3CBRQ1NiMKPXzr1wQvCercjU3iRe70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aNIha6mh; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aNIha6mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=nl6PW
	Fqhd8rOBb/WgBb7pu3ksJbKMFOwsiIM8IFyoXo=; b=aNIha6mhYJ2xWQAPPu+Pr
	LMoy1CKfxchRWgg+ZckUqg9r03mtTO+W/xmv2bgwXv2bMMKTPpKzoaE21REflCcH
	pnELll0T1riSXrrQ8fwYvPVe8x5QXXxKZ2H1RkewTQaIFA7N/ZWbRq/llo74ae1q
	It0ypYvHjAOwcHJ67398Eo=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3jxeY6H1npdBREg--.62358S4;
	Wed, 08 Jan 2025 10:53:13 +0800 (CST)
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
Subject: Re: [PATCH 1/3] hwmon:(ina238)Add support for SQ52206
Date: Wed,  8 Jan 2025 10:53:05 +0800
Message-ID: <20250108025305.60705-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4f707f3f-8929-4453-8b18-285594b5f99d@roeck-us.net>
References: <4f707f3f-8929-4453-8b18-285594b5f99d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3jxeY6H1npdBREg--.62358S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4fXF1DCr17Zry8uF1fXrb_yoW5WF18pF
	y5JF4DKr4DXr17Crs2qr4SgF12yr17Kr97Xr95Kw15ZFn0vFykuF4Iqa1ruryxZw1xZF48
	try7trW3A39FyFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUZIDwUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiowDO02d95OlgSwAAsC

At 2025-01-07 23:02:09, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 1/7/25 04:43, Wenliang Yan wrote:
>...
>>>> -#define INA238_REGISTERS		0x11
>>>> +#define INA238_MAX_REGISTERS		0x20
>>>
>>> Why this change ?
>>>
>> 
>> The maximum register address for SQ52206 is 0x20.
>> 
>
>That isn't what I referred to. Th value change is ok.
>The question was why change INA238_REGISTERS to INA238_MAX_REGISTERS.
>That is a personal preference change. I strongly discourage such
>changes because if I accept them someone else may come tomorrow
>and change the name again to match their preference.
>

I understand, I will modify.

>>>> -#define INA238_FIXED_SHUNT		20000
>>>> +#define INA238_FIXED_SHUNT			20000
>>>
>>> Why this change ?
>>>
>> 
>> Also refer to the chip manual provided in the website above.
>> 
>
>The value didn't change. The indentation changed without reason.
>

This is due to my format alignment, I will adjust it back.

>>>>    
>>>>    static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
>>>> @@ -197,10 +239,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
>>>>    		regval = (s16)regval;
>>>>    		if (channel == 0)
>>>>    			/* gain of 1 -> LSB / 4 */
>>>> -			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
>>>> -			       (1000 * (4 - data->gain + 1));
>>>> +			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
>>>> +					data->gain / (1000 * 4);
>>>
>>> Why this change ?
>>>
>> 
>> Because INA238 only has two gains of 1 and 4, the previous formula can
>> be used, but SQ52206 has a gain of 2, so I changed the formula
>> 
>Ok.
>
>>>>    		else
>>>> -			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
>>>> +			*val = (regval * data->config->bus_voltage_lsb) / 1000;
>>>>    		break;
>>>>    	case hwmon_in_max_alarm:
>>>>    	case hwmon_in_min_alarm:
>>>> @@ -225,8 +267,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
>>>>    	case 0:
>>>>    		/* signed value, clamp to max range +/-163 mV */
>>>>    		regval = clamp_val(val, -163, 163);
>>>> -		regval = (regval * 1000 * (4 - data->gain + 1)) /
>>>> -			 INA238_SHUNT_VOLTAGE_LSB;
>>>> +		regval = (regval * 1000 * 4) /
>>>> +			 INA238_SHUNT_VOLTAGE_LSB * data->gain;
>>>
>>> Why this change ?
>>>
>> 
>> Consistent with the reason described in the previous article.
>> 
>Ok.
>
>>>>    	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
>>>> @@ -564,48 +673,15 @@ static int ina238_probe(struct i2c_client *client)
>>>>    	/* load shunt gain value */
>>>>    	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
>>>>    		data->gain = 4; /* Default of ADCRANGE = 0 */
>>>> -	if (data->gain != 1 && data->gain != 4) {
>>>> +	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
>>>
>>> Chip independent changes should be in separate patch(es).
>>>
>> 
>> SQ52206 has a gain of 2.
>> 
>Ok.
>
>
>Thanks,
>Guenter

Thanks,
Wenliang Yan

