Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B3192D9E;
	Fri, 10 Jan 2025 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543962; cv=none; b=fqM7SG/TayG9RpIZpssl1U/695esoOTkh+3WsOsNK/3BA2CIS0nkhhTnQpRjVs1yNFYhA2c/Fh2OLd+uul28qeDLSN6mhG3a6cSKyMZ7eUSCdU/wGg5+AUspI1sCtLSVzBPANbTxeYXNHne8Nj8M6cs2DyK3abbhqzBacOdEl2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543962; c=relaxed/simple;
	bh=uKQYAnkdMhoNRbbZhzCKvQ2Ixb7zPiNPh9W5dl9s8Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mUgdx7gODnp39z1RMgCXvSfoW+8WiEbFcX7u6JYw5wi1PrYARTcPAyByZHhvFJPj348vAXsWha/Z4HVjj2cAR1MQxVbgg2euct20dL7o6rk6RK2bTZu8DrkhviT+WyUnT4nCuEGF6K8Zig9cJnD+Z2gx/pEGCSdU4abr7uRQNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=RCjSDNhp; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="RCjSDNhp"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id WMPHtmDvDhEBsWMPKtNibi; Fri, 10 Jan 2025 22:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736543950;
	bh=unfU3jicRZHEqL7YpQ2zP+WWKs9cxmjXPFawE9Fxelw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RCjSDNhpYQ1Gq+hJ5oE+QTNL+Mm9Jn+7cYaKEtJPnp99zlhWpHApclrpVJWokzoua
	 ruPSBwJWe6vqR3DeVOkXoh9kRKjAS8IKbCLRcnblBvYLqKZpQ4TVQd8559HP5nQ5lR
	 5FO0fUlANIkd2rZpC9cL3vOLTJrIEQICxH/EHvTjY/OBxKKyM6l57dh8GEqhSK85/7
	 HvVhFUaO/V+M/CpezOtgLCox/CuSefZQM3f6zeHZIjPjTFeFV4hpCz6vtrr0pk7doc
	 we4Jkni0+QJ05dwCOJIDb/6DRrPV9S413YXOy3Wf+hLxV1g6Bz5X3UEz5cCp4lNOLu
	 5445JrXss/j7Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 10 Jan 2025 22:19:10 +0100
X-ME-IP: 90.11.132.44
Message-ID: <dc0bba60-72e1-46a5-a341-a2aa30095042@wanadoo.fr>
Date: Fri, 10 Jan 2025 22:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power
 Monitor
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com, linux@roeck-us.net,
 robh@kernel.org, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
 Delphine_CC_Chiu@Wiwynn.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
 <20250110081546.61667-3-Leo-Yang@quantatw.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250110081546.61667-3-Leo-Yang@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

 > Re: [PATCH v2 2/2] hwmon: Add driver for TI INA232 Current and Power 
Monitor

Should the subject be INA233?


Le 10/01/2025 à 09:15, Leo Yang a écrit :
> Support ina233 driver for Meta Yosemite V4.
> 
> Driver for Texas Instruments INA233 Current and Power Monitor
> With I2C-, SMBus-, and PMBus-Compatible Interface
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501092213.X9mbPW5Q-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202501061734.nPNdRKqO-lkp@intel.com/
> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>

...

> +static void calculate_coef(int *m, int *R, int power_coef)
> +{
> +	s64 scaled_m;
> +	int scale_factor = 0;
> +	int scale_coef = 1;
> +	bool is_integer = false;

Is is_integer really needed?

See below.

> +
> +	/*
> +	 * 1000000 from Current_LSB A->uA .
> +	 * scale_coef is for scaling up to minimize rounding errors,
> +	 * If there is no decimal information, No need to scale.
> +	 */
> +	if (1000000 % *m) {
> +		/* Scaling to keep integer precision */
> +		scale_factor = -3;
> +		scale_coef = 1000;
> +	} else {
> +		is_integer = true;
> +	}
> +
> +	/*
> +	 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
> +	 * to keep integer precision.
> +	 * Formulae referenced from spec.
> +	 */
> +	scaled_m = div_s64(1000000 * scale_coef, *m * power_coef);
> +
> +	/* Maximize while keeping it bounded.*/
> +	while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
> +		scaled_m = div_s64(scaled_m, 10);
> +		scale_factor++;
> +	}
> +	/* Scale up only if fractional part exists. */
> +	while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {

s/!is_integer/scale_coef != 1/
?

> +		scaled_m *= 10;
> +		scale_factor--;
> +	}
> +
> +	*m = scaled_m;
> +	*R = scale_factor;
> +}

...

> +static const struct i2c_device_id ina233_id[] = {
> +	{"ina233", 0},

Extra spaces to be consistant with ina233_of_match below?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ina233_id);
> +
> +static const struct of_device_id __maybe_unused ina233_of_match[] = {
> +	{ .compatible = "ti,ina233" },
> +	{ },

No need for an extra comma after a terminator.

> +};
> +MODULE_DEVICE_TABLE(of, ina233_of_match);

...

CJ
