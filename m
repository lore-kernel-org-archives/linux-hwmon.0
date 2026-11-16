Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861500;
	b=aov7fzmRvvwDAqTcHgOJHdoO2ahI7/EJojTicXPH44nNZ7DiY2BcJmP++qJUtZ+NvfQn
	 XA0gHO6RQghqakUCbIi1mcdbTqq/8Et3ZkLW+rf2BHw4Px1YOeOv0sVvLPOWvuqeNRagf
	 UQJCFXZAdeuFjhYEySM9jgsKrXHW/9WT5PNYbNE+0/ecp4IWDjgmdVu8fmCb6EG9HbUcH
	 cJCc/JWcx0Vj0C7Ijyh0U11l1zBpLiOnU9HlO08ADzvHGQ8siWvC8VNxHUUKZXAaWtBki
	 lBBuFwuAxci6h/xI4WpdGgGetSwPHrCwHTIhhPyOQSgGcXSAPC5GNyZVJuQYlAcSE1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861500;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=CWNWmhQVqp9smPPN5dAvPrupnM9rqByK5XnNwGRNKHI=;
	b=dZNl+BQ+XU7HO5V9SVES915ufXLTzlaGSOEgSaM/cNjtLdQVyY9n8TP6U29G3XniukI5
	 udj3boyeuqOs7vs87G0NencrXSEqkV1s9Of8tc9ahfIfcLDVP5TslYbO8AB9RonJJvNaq
	 brtxt9cdrR6PzmMLmnB4602vHgDCFQ1Hfj+a40F/xgqbESLWJCGUtzSHxaTeKyg31LGKv
	 gFqi1pcYIkU69Hk9bP8uhH7U8iTeOy2zW2vvAERP8pV34JZtflbIw91rqzhlG3E8qAkDE
	 oTHgnssCxarqIje72jiEUDykUTlBtbuT+Jb82e/4z2Po3lWMiCjl06N3NpKzfNa6K6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=uuG7yGr7;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB08606A329
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 20:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB08606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=uuG7yGr7
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id Sz7jxRTd7VK9UT3T1x1BF7; Mon, 16 Nov 2026 20:38:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id T3T0xOrujSgq1T3T1xkRuD; Mon, 16 Nov 2026 20:38:19 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6afb69bb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=a_U1oVfrAAAA:8 a=xo-uq7kjQxKnqSatDakA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=CWNWmhQVqp9smPPN5dAvPrupnM9rqByK5XnNwGRNKHI=; b=uuG7yGr7DiyM
	2NpamV/SbvrfBXIDtDk3f5tvqxevBCQpOP79XNTcm17b6gJI4XCBSI50xaVMSLE+2fIiNfTMck5y6
	jioh8a0SeY+nGhJ0+66P7RJn2YtSc7Dwz3cSdCFdViM9TyoQq5enZIcDYpAy4Uvg/+avVZ/hbWrKl
	SKeRoPdRmSlwn3tuDuOLFBIP/1PSrm93yONdf/iXjDRffT6TBi/WCj+B9NVTz+Lj/CXBI6q4HMQOM
	VWVuut/VO+mbYizB4haUAUaOZsuWQrmOcLJwctTKNDz9RchJ6SnA3SDRMAK75PcuffCfnu5RCddRQ
	fzMzUMDHnfY7kDU4bbeu0Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48854)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xT3T0-00000002JRv-1omU;
	Tue, 17 Nov 2026 02:08:18 +0530
Message-ID: <1f3fc32d-d6b4-4a87-a2c1-dc2060ae828f@roeck-us.net>
Date: Mon, 16 Nov 2026 12:38:17 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
To: sashiko-reviews@lists.linux.dev,
 Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
References: <20261116163257.1303207-1-benedikt.niedermayr@siemens.com>
 <20261116163257.1303207-2-benedikt.niedermayr@siemens.com>
 <sashiko-outbox-217386@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-217386@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xT3T0-00000002JRv-1omU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:48854
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHkQcsW9gx0gL42pWhS5OIW5hN5GimkILuGjTF829b1tq8b/dZIjhI8PllMByD2+UgOnKv1eMrCXh9DxcdxcxOIcG0obtPzM4wVM76MyQl4hxghrwa+6
 tgPX6v9zKDm48I6VZTUKGNnzaLOtrzGDNv9JhYykC8ARHq+AVbgGX86q6QvLGgcmKWIK9e4czv1+YLCDZpO07HIDJcHhAEFksJSCLf10lR3tgEPtv/iGqJUW

Hi,

On 11/16/26 08:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential
> issues to consider:
> - [High] hwmon: simatic-ipc-ec-sensors: temp limits exposed as *_alarm
>    attributes
> - [High] hwmon: pointer-sign mismatch passing s8 * to ec_read() in temp
>    read callback
> - [Medium] hwmon: premature s8 cast before clamp() in
>    simatic_ipc_ec_temp_write()
> - [Medium] hwmon: u8 truncation in simatic_ipc_ec_fan_write() bypasses
>    range check
> - [Medium] hwmon: uninitialized reads on ec_read() error in temp and fan
>    read callbacks
> - [Medium] hwmon: devm buffer stored in global struct in
>    simatic_ipc_ec_hwmon_probe()
> - [Low] hwmon: unsanitized and unlowercased chip_name in
>    simatic_ipc_ec_fan_probe()
> - [Low] hwmon: simatic-ipc-ec-sensors: missing Documentation/hwmon/
>    driver doc

Please fix.

Tanks,
Guenter

> --
> 
> commit 830c0088242b1976cce59ca2195a3aaabae749d2
> Author: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
> 
> This commit adds a hardware monitoring driver for temperature sensors and
> fan control on the embedded controller of Siemens SIMATIC IPC BX-54A
> systems.
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ccbcdc0799b9f..8e567b60f6487 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25763,6 +25763,12 @@ F:	drivers/media/mmc/siano/
>>   F:	drivers/media/usb/siano/
>>   F:	drivers/media/usb/siano/
>>   
>> +SIEMENS IPC EC SENSORS DRIVER
>> +M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>> +L:	linux-hwmon@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/hwmon/simatic-ipc-ec-sensors.c
> 
> [Severity: Low]
> New hwmon drivers require a documentation file under
> Documentation/hwmon/simatic-ipc-ec-sensors.rst per
> Documentation/hwmon/submitting-patches.rst.
> 
> [ ... ]
> 
>> diff --git a/drivers/hwmon/simatic-ipc-ec-sensors.c b/drivers/hwmon/simatic-ipc-ec-sensors.c
>> new file mode 100644
>> index 0000000000000..690da5dde2bf8
>> --- /dev/null
>> +++ b/drivers/hwmon/simatic-ipc-ec-sensors.c
>> @@ -0,0 +1,568 @@
> 
> [ ... ]
> 
>> +static umode_t simatic_ipc_ec_temp_is_visible(const struct simatic_ipc_ec_temp *temp,
>> +					      u32 attr, int channel)
>> +{
>> +	switch (attr) {
>> +	case hwmon_temp_input:
>> +		return 0444;
>> +	case hwmon_temp_max_alarm:
>> +	case hwmon_temp_min_alarm:
>> +	case hwmon_temp_crit:
>> +		return 0644;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int simatic_ipc_ec_temp_read(const struct simatic_ipc_ec_temp *temp, u32 attr,
>> +				    int channel, long *val)
>> +{
>> +	s8 value;
>> +	int ret;
>> +	u8 reg;
>> +
>> +	switch (attr) {
>> +	case hwmon_temp_input:
>> +		reg = temp_reg(temp->base, channel, TEMP_REG_VALUE);
>> +		break;
>> +	case hwmon_temp_max_alarm:
>> +		reg = temp_reg(temp->base, channel, TEMP_REG_ALARM_HIGHLIMIT);
>> +		break;
>> +	case hwmon_temp_min_alarm:
>> +		reg = temp_reg(temp->base, channel, TEMP_REG_ALARM_LOWLIMIT);
>> +		break;
>> +	case hwmon_temp_crit:
>> +		reg = temp_reg(temp->base, channel, TEMP_REG_CRITICAL);
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
> 
> [Severity: High]
> Should the low and high temperature thresholds use hwmon_temp_min and
> hwmon_temp_max (with HWMON_T_MIN and HWMON_T_MAX in
> simatic_ipc_ec_hwmon_probe()) instead of hwmon_temp_min_alarm and
> hwmon_temp_max_alarm?
> 
> Under the hwmon ABI, tempX_min_alarm and tempX_max_alarm are read-only
> boolean flags (0 or 1), so exposing writable millidegree Celsius limits
> there causes tools like libsensors to treat any non-zero limit as an
> active alarm while missing the min and max thresholds.
> 
>> +
>> +	ret = ec_read(reg, &value);
> 
> [Severity: High]
> Does passing &value (s8 *) to ec_read(u8, u8 *) trigger a -Wpointer-sign
> warning (and build failure under CONFIG_WERROR)?
> 
>> +
>> +	/* Degree Celsius to millidegree Celsius */
>> +	*val = value * 1000;
>> +
>> +	return ret;
>> +}
>> +
>> +static int simatic_ipc_ec_temp_write(const struct simatic_ipc_ec_temp *temp, u32 attr,
>> +				     int channel, long val)
>> +{
>> +	/*
>> +	 * Millidegree Celsius to degree Celsius
>> +	 */
>> +	s8 value = (s8)clamp((s8)DIV_ROUND_CLOSEST(val, 1000), (s8)-128, (s8)127);
> 
> [Severity: Medium]
> Does casting the result of DIV_ROUND_CLOSEST(val, 1000) to s8 before
> clamp() make clamp() a no-op?
> 
> Because the first argument is already truncated to s8, writing a threshold
> outside [-128000, 127499] wraps modulo 256 instead of saturating (for
> example, 130000 wraps to -126 C), and values near LONG_MAX or LONG_MIN can
> also overflow DIV_ROUND_CLOSEST(val, 1000) unless val is clamped before
> division.
> 
> [ ... ]
> 
>> +static int simatic_ipc_ec_fan_read(struct simatic_ipc_ec_fan *fan, enum hwmon_sensor_types type,
>> +				   u32 attr, int channel, long *val)
>> +{
>> +	u16 value_u16;
>> +	u8 value_u8;
>> +	int ret;
>> +	u8 reg;
>> +
>> +	switch (type) {
>> +	case hwmon_fan:
>> +		switch (attr) {
>> +		case hwmon_fan_input:
>> +			reg = fan_reg(fan->base, FAN_REG_SPEED);
>> +			ret = simatic_ipc_ec_read_block(reg, &value_u16, sizeof(value_u16));
>> +			*val = value_u16;
>> +			return ret;
>> +		default:
>> +			break;
>> +		}
>> +		break;
>> +	case hwmon_pwm:
>> +		switch (attr) {
>> +		case hwmon_pwm_input:
>> +			reg = fan_reg(fan->base, FAN_REG_DUTY_LEVEL);
>> +			ret = ec_read(reg, &value_u8);
>> +			*val = value_u8;
>> +			return ret;
>> +		case hwmon_pwm_enable:
>> +			reg = fan_reg(fan->base, FAN_REG_MODE);
>> +			ret = ec_read(reg, &value_u8);
>> +			*val = CONTROL_MODE_GET(value_u8);
>> +			return ret;
> 
> [Severity: Medium]
> When ec_read() or simatic_ipc_ec_read_block() fails here and in
> simatic_ipc_ec_temp_read(), does assigning *val read uninitialized stack
> variables (value_u16, value_u8, and value)?  ec_read() leaves its output
> parameter untouched on error, which triggers KMSAN uninitialized-memory
> warnings when *val is computed before checking ret.
> 
> [ ... ]
> 
>> +static int simatic_ipc_ec_fan_set_control_mode(struct simatic_ipc_ec_fan *fan, u8 ctrl_mode)
>> +{
>> +	int ret;
>> +	u8 mode;
>> +
>> +	/* 0: full speed, 1: mannual control, 2: auto-control */
>> +	if (ctrl_mode > 2)
>> +		return -EINVAL;
> 
> [ ... ]
> 
>> +static int simatic_ipc_ec_fan_write(struct simatic_ipc_ec_fan *fan, u32 attr, int channel,
>> +				    long val)
>> +{
>> +	switch (attr) {
>> +	case hwmon_pwm_input:
>> +		if (val < 0 || val > 0xFF)
>> +			return -EINVAL;
>> +		return ec_write(fan_reg(fan->base, FAN_REG_DUTY_LEVEL), (u8)val);
>> +	case hwmon_pwm_enable:
>> +		return simatic_ipc_ec_fan_set_control_mode(fan, (u8)val);
> 
> [Severity: Medium]
> Does casting val to u8 before calling simatic_ipc_ec_fan_set_control_mode()
> allow out-of-range values such as 256 or -255 to bypass the ctrl_mode > 2
> check and change the EC fan control mode?
> 
> [ ... ]
> 
>> +static struct hwmon_channel_info simatic_ipc_ec_temp_ch_info = {
>> +	.type = hwmon_temp,
>> +	.config = NULL
>> +};
> 
> [ ... ]
> 
>> +static int simatic_ipc_ec_hwmon_probe(struct device *dev, struct simatic_ipc_ec_sensor *data)
>> +{
> 
> [ ... ]
> 
>> +	temp_config = devm_kzalloc(dev, (temp_count + 1) * sizeof(u32), GFP_KERNEL);
>> +	if (!temp_config)
>> +		return -ENOMEM;
>> +
>> +	simatic_ipc_ec_temp_ch_info.config = temp_config;
> 
> [Severity: Medium]
> Can storing the per-device devm-allocated temp_config into the static
> global simatic_ipc_ec_temp_ch_info.config leave a dangling pointer on probe
> failure or unbind, or overwrite another instance's config if more than one
> 110A5004 device is probed?
> 
> [ ... ]
> 
>> +static int simatic_ipc_ec_fan_probe(struct device *dev, struct simatic_ipc_ec_sensor *data)
>> +{
> 
> [ ... ]
> 
>> +	if (fan_name) {
>> +		char *p;
>> +
>> +		snprintf(fan->chip_name, CHIP_NAME_MAX_LEN, "simatic_ipc_ec_%s", fan_name);
>> +		for (p = fan->chip_name; *p; p++)
>> +			*p = tolower(*p);
>> +	} else {
>> +		snprintf(fan->chip_name, CHIP_NAME_MAX_LEN, "simatic_ipc_ec_%s", label);
>> +	}
> 
> [Severity: Low]
> What happens if label contains uppercase characters when fan_name is
> absent, or if either string contains characters disallowed in hwmon chip
> names such as '-' or spaces?
> 
> The else branch skips the tolower() loop, and neither branch sanitizes
> characters rejected by __hwmon_device_register() (or via
> devm_hwmon_sanitize_name()).
> 

