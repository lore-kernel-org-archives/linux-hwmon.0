Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C53803ED
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 18:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241043; cv=none; b=n5oGQVvvB15E/bVF+FAj+Os9qJkXuqJqxY99CUdfZVZkG1AfUoqtflpjiUuGmi22sDe8inpJCzDNkOwihIB5FfJif4ate3gxnzfnG+dvv7zqBIC+TniaKKM2Ue3Mn2Tc0HCwYTsjHRiH+NTsaNXWIdcduE4JH104zddZxx7CVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241043; c=relaxed/simple;
	bh=s0DyzuRoahq/948IDG6/4DfMllFeddohpgguBX6Q5Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWxRw37VPSLx3NYe5dO2Wb81UCpvoNaLFyLIyDjrht0Rq1BozBeFmiUpDhSCc3791FgXYlbSuUbm0ErSA56CMSVsrBA4EpmHQl9qDZsG6LJKXZSrStgdAUA6rgueXNKYOV3MjdHttqXPUVC0o8nm1TKgQWswENqobzMOHRpn9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+xLCkjw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+xLCkjw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so4800843a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 10:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768241042; x=1768845842; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHOdFCVwPg+cWYrkZjMT76zLSqbmskzKF7iiDprWkXM=;
        b=Y+xLCkjwQ93q2fybjqeSGN84RYx/myhSlFJn8TxLik6/YFpZTME7/Lv0FPJ8SE/IwC
         R0k1Rbg90iTmOSWu1aXYTh/3ZA6GNP7lFYNbGb4R5UIIluc2lYIRd4HZlPjSMZ+5dZFF
         UTmUlIIa2l/WAj0Ofgwn4LHt2xRwlNDYUhmswh9ir20dmd9VK6w/2jT5QARZSAYZ35x0
         MgKEwKNb45rVhzNTLu5iPBs3Xs5iFbgV1zqijZ0rFbEcRU6KCxPNmhaZAwPU0ar8r1AO
         Txwtnd70PBNwdNot5TqCXq0XSLxe+5/SUr/VKpBJIH27+IuTFbqFTxbuIa2pb3nXUL7d
         HHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768241042; x=1768845842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHOdFCVwPg+cWYrkZjMT76zLSqbmskzKF7iiDprWkXM=;
        b=nNoCGEPAhG2xeE41taWMLyS2dvzB2QOGvhNR29G1FE1p8L13DJXelHZw0WVFANpzTS
         s7Q9ou8ls01MLONOM4gQX9Oy5BdRpspTcJzCBCVCWGUBlsTnoPOeAtBfQYNzXok7eUE8
         HgJpmK/e28RjFPQJ94eojmwXcsTM6v5jjV3ivkkio8C2QGu0Os6m2uYZNDT04bEyR1kf
         4A0DlpAFHxeUVEu7phCKRl5kE+XTDQQlgg5+j8r67qGvkluhoSn7Gh7V3Ukzb19ZI2Eh
         06/pghKikKsTUqxCMiDVpcJ2LwF48AgCzH00GBgTk8Luf8+uxkQ+6VeKrZqKRvEVnMt8
         6eZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOtNlcniN5IZubYDy6P76kduWICjls7b5xFG7iHYFiy+k87SXN5ty1Ljft11SfJtvWK8uIshNcQyAlqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu13O/7Y/B1PjWY0WPPSwqXwe/11cqP5PPDAc7vRZexkclzLOs
	aognuCWdIPpx3daIEiv+YCcjf4RCukbUDEEWy5xDthwTdVX9KB1CT+ez
X-Gm-Gg: AY/fxX4ksKgY39tJAKEsInjJGrvK4+cAiKih5rLW1XhEoAOatyoKStPvOrJKLfMdPMb
	yxyjvBx2jz41j/wJk4AJyYCiEj4wdt3woPo3xpNEv91zE4u2SP48lzgnJ2TA+fhNwdjAUlXrUul
	JxKNIfb5hsGuf0N/vKX/L0Tlcp4pj0IAKi33oSR/S7uKX85/lwYnIqtu+8FOwV0yYECL7+KTTvT
	YTbJJe+iWzkWDatEV7io6YJ7eljuS4Eb7mUl03HxI07CofGofrDZVQYHWKbqlZEVjUuUXam9hDX
	kEygX1pWD+9fH84odton01HrV8GPaNBorQO5qe6GqZN/2KvBXpHLFFCwOhryIs4KA5jA4p2+Gnn
	vwldF+l6C0yXf/nzzqVolWUCsf3cDD0YXKPEJSTzoz3OGJs5nYnFnOR6FjsQIeB1yms7JYFgRcr
	xCmDgr9GyHlSTHWgtW/jI=
X-Google-Smtp-Source: AGHT+IG+4HLDxw75AREG9Cn7q0iZTkTuEpR+ouZIoe4nrPNgxO9/2Yto8IAno89RDPTKdWTsaRJEXQ==
X-Received: by 2002:a17:90b:5830:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-34f68c4cdcfmr14902163a91.13.1768241041645;
        Mon, 12 Jan 2026 10:04:01 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fd7b8e1bsm7135a91.8.2026.01.12.10.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:04:01 -0800 (PST)
Date: Mon, 12 Jan 2026 23:33:52 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
Message-ID: <aWUvvzDCtVCOaBwq@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-2-krishna.chomal108@gmail.com>
 <ce48f7b8-7d88-266f-ca8d-6af3b01815db@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce48f7b8-7d88-266f-ca8d-6af3b01815db@linux.intel.com>

On Mon, Jan 12, 2026 at 05:13:05PM +0200, Ilpo Järvinen wrote:
>On Tue, 30 Dec 2025, Krishna Chomal wrote:
>
[snip]
>>  #include <linux/string.h>
>>  #include <linux/dmi.h>
>> +#include <linux/fixp-arith.h>
>> +#include <linux/limits.h>
>> +#include <linux/minmax.h>
>> +#include <linux/compiler_attributes.h>
>>
[snip]
>> +
>> +struct victus_s_fan_table_header {
>> +	u8 unknown;
>> +	u8 num_entries;
>> +} __packed;
>
>Please add #include for __packed.
>

__packed is defined in compiler_attributes.h, which is included in this
patch. Please let me know if there are any other headers that should be
included.

>> +struct victus_s_fan_table_entry {
>> +	u8 cpu_rpm;
>> +	u8 gpu_rpm;
>> +	u8 unknown;
>> +} __packed;
>> +
>> +struct victus_s_fan_table {
>> +	struct victus_s_fan_table_header header;
>> +	struct victus_s_fan_table_entry entries[];
>> +} __packed;
>> +
>> +static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
>> +{
>> +	return fixp_linear_interpolate(0, 0, priv->max_rpm, U8_MAX,
>> +					clamp_val(rpm, 0, priv->max_rpm));
>
>Please align the correctly.
>

Apologies for the bad alignment of multi-line function calls and
if-statements in this patch. I have noted them and will fix them all in
v3.

[snip]
>> -static int hp_wmi_fan_speed_max_reset(void)
>> -{
>> -	int ret;
>> +	/*
>> +	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
>> +	 * this delta value from the fan table during hwmon init.
>> +	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
>> +	 * automatic mode.
>> +	 */
>> +	if (speed != HP_FAN_SPEED_AUTOMATIC)
>> +		fan_speed[GPU_FAN] = clamp_val((unsigned int)speed +
>> +						(unsigned int)priv->gpu_delta,
>> +						0, U8_MAX);
>
>Add braces is it's multiline if.
>
>If you use unsigned int, clamp to 0 makes no sense as those values have
>already underflowed.
>
>You also have an alignment problem here, but this seems a cleaner way
>which doesn't have underflow issues:
>
>	if (...) {
>		int new_speed = speed + priv->gpu_delta;
>
>		fan_speed[GPU_FAN] = clamp_val(new_speed, 0, U8_MAX);
>	}
>

Understood. I will introduce a new "gpu_speed" variable and follow this
style in v3.

[snip]
>> @@ -2147,16 +2244,21 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>>  		*val = ret;
>>  		return 0;
>>  	case hwmon_pwm:
>> -		switch (hp_wmi_fan_speed_max_get()) {
>> -		case 0:
>> -			/* 0 is automatic fan, which is 2 for hwmon */
>> -			*val = 2;
>> +		if (attr == hwmon_pwm_input) {
>> +			if (!is_victus_s_thermal_profile())
>> +				return -EOPNOTSUPP;
>
>Add an empty line here.
>

Will do.

>> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
>> +			if (ret < 0)
>> +				return ret;
>> +			current_rpm = ret;
>
>I'm not sure if using ret here makes things better or not, I'd prefer just
>assigning directly to current_rpm without ret as intermediate var.
>

Understood. I will directly use current_rpm then.

[snip]
>>  static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>>  			      u32 attr, int channel, long val)
>>  {
>> +	struct hp_wmi_hwmon_priv *priv;
>> +	int current_rpm, ret;
>> +
>> +	priv = dev_get_drvdata(dev);
>>  	switch (type) {
>>  	case hwmon_pwm:
>> +		if (attr == hwmon_pwm_input) {
>> +			if (!is_victus_s_thermal_profile())
>> +				return -EOPNOTSUPP;
>> +			/* pwm input is invalid when not in manual mode */
>
>PWM (capitalize textual/comment "pwm"s correctly please).
>

Corrected.

>> +			if (priv->mode != PWM_MODE_MANUAL)
>> +				return -EINVAL;
>
>ADd empty line here.
>

Added.

>> +			/* ensure pwm input is within valid fan speeds */
>
>PWM
>

Fixed.

>> +			priv->pwm = rpm_to_pwm(clamp_val(pwm_to_rpm(val, priv),
>> +							priv->min_rpm,
>> +							priv->max_rpm),
>
>These look misaligned.
>
>I suggest you split this to multiple lines though, it will likely be
>easier to read that way.
>

Agreed, this is too much nesting. I will split it into separate statements
for each function call.

>> +						priv);
>> +			return hp_wmi_apply_fan_settings(priv);
>> +		}
>>  		switch (val) {
>> -		case 0:
>> -			if (is_victus_s_thermal_profile())
>> -				hp_wmi_get_fan_count_userdefine_trigger();
>> -			/* 0 is no fan speed control (max), which is 1 for us */
>> -			return hp_wmi_fan_speed_max_set(1);
>> -		case 2:
>> -			/* 2 is automatic speed control, which is 0 for us */
>> -			if (is_victus_s_thermal_profile()) {
>> -				hp_wmi_get_fan_count_userdefine_trigger();
>> -				return hp_wmi_fan_speed_max_reset();
>> -			} else
>> -				return hp_wmi_fan_speed_max_set(0);
>> +		case PWM_MODE_MAX:
>> +			priv->mode = PWM_MODE_MAX;
>> +			return hp_wmi_apply_fan_settings(priv);
>> +		case PWM_MODE_MANUAL:
>> +			if (!is_victus_s_thermal_profile())
>> +				return -EOPNOTSUPP;
>> +			/*
>> +			 * When switching to manual mode, set fan speed to
>> +			 * current RPM values to ensure a smooth transition.
>> +			 */
>> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
>
>Assign directly to current_rpm ?
>

Yes, will do in v3.

>> +			if (ret < 0)
>> +				return ret;
>> +			current_rpm = ret;
>> +			priv->pwm = rpm_to_pwm(current_rpm / 100, priv);
>> +			priv->mode = PWM_MODE_MANUAL;
>> +			return hp_wmi_apply_fan_settings(priv);
>> +		case PWM_MODE_AUTO:
>> +			priv->mode = PWM_MODE_AUTO;
>> +			return hp_wmi_apply_fan_settings(priv);
>>  		default:
>> -			/* we don't support manual fan speed control */
>>  			return -EINVAL;
>>  		}
>>  	default:
>> @@ -2196,7 +2322,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>>
>>  static const struct hwmon_channel_info * const info[] = {
>>  	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
>> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
>> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
>>  	NULL
>>  };
>>
>> @@ -2211,12 +2337,57 @@ static const struct hwmon_chip_info chip_info = {
>>  	.info = info,
>>  };
>>
>> +static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>> +{
>> +	u8 fan_data[128] = { 0 };
>> +	struct victus_s_fan_table *fan_table;
>> +	u8 min_rpm, max_rpm, gpu_delta;
>> +	int ret;
>> +
>> +	/* Default behaviour on hwmon init is automatic mode */
>> +	priv->mode = PWM_MODE_AUTO;
>> +
>> +	/* Bypass all non-Victus S devices */
>> +	if (!is_victus_s_thermal_profile())
>> +		return 0;
>> +
>> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
>> +				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
>> +	if (ret)
>> +		return ret;
>> +
>> +	fan_table = (struct victus_s_fan_table *)fan_data;
>> +	if (fan_table->header.num_entries == 0 ||
>> +		sizeof(struct victus_s_fan_table_header) +
>> +		sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries >
>> +		sizeof(fan_data))
>
>Badly misaligned.
>
>Splitting at > is somewhat misleading so I'd prefer to avoid it (you can
>use up to 100 chars per line if needed).
>

Ok, will fix the alignment and ensure to keep the > in a single line.
