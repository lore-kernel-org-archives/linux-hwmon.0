Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F4844E046
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460137; cv=none; b=I1fitcNE9iS4R5f4QuzZOSk+ZQ3Q9yZ20m1A6JcHJ4Z5kfpNV7da+/YcimMAfKcE1T3/E5cm2Ob3UZuK8tjnjsVQd6ixowrilZJ7DBT7GVcrRSSGd2yTfMxQW7wv9RlAVvDazPEP3eIyNBtiFgIn+JGCZHP/IYV919e6eW14rzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460137; c=relaxed/simple;
	bh=cNyJHN6/5FEALtk8KJQmMnGTHwXy/pkRwatXqUHn60Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XmjVEi8oVN5lhBiULHK6ebNnO/As+G0klcX+EbAIzCjg05/5VgiHlx/d5bzTDlqr6Zgs+WAqS8XgQ2SDYBanRLBiHXyLbbOJqzWASjPxdRS6nRfHgpjtOfIp81CzOFTke4bPqa1fzZvW5kKFeYwuBOgAPT6oI7YqSGPz3q2fc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkj1ijdk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkj1ijdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67A01F000E9;
	Fri, 22 May 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779460131;
	bh=LLm3W/lrM5fdZt47gBVBPhherIKFinlSaPYLgydSzNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dkj1ijdkoHIimjc/xYnz2mK4ReCElMsfCvKZI6Nd5hcG2beuNO/dldr4TJJ6OmWoS
	 gG43FYmEq9BSTqmwMb4d6C/8uAG/g111/+FmHJHIwoWAz4AMQWAcLn48P+f6kKgZXr
	 eOaYeCFS5JqgUHtXpHoGHmBsafwLWb4DBtNySOiIr9nNA0R5V4lcODhC1ITXb62wIC
	 Xo3ULRpnSSDyDfUqOf475aThfKHxjnnNBEevis1xk3dFvep9Mb002be7QbSFWgbJxK
	 z0QoQzMmo34UrDGSuwlJzvygV5lrCKX2I/hLwvYjg9fLEDKLcWeO4q7qSQTtCkLc4f
	 C2pMHuWdiuzhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm63) expose PWM frequency and LUT hysteresis
 as writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Henrik Bruhn" <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260522135421.2951534-1-kernel@jhbruhn.de>
References: <20260522135421.2951534-1-kernel@jhbruhn.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 14:28:50 +0000
Message-Id: <20260522142850.E67A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver fails to check if `i2c_smbus_read_byte_data()` returns =
a negative error code before assigning the result to an unsigned 8-bit vari=
able, leading to hardware register corruption on I2C failure.
--

commit 280d2e57aec56ef87aeac8e747586012f93f520e
Author: Jan-Henrik Bruhn <kernel@jhbruhn.de>

hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable

This commit exposes the PWM frequency and LUT hysteresis as writable attrib=
utes
for the LM63 hardware monitoring driver. It adds pwm1_freq and a single
chip-wide pwm1_auto_point_temp_hyst attribute to configure the fan control.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 30500b4d22212..3c9e65e3d81db 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
[ ... ]
> @@ -455,6 +458,75 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	return count;
>  }
> =20
[ ... ]
> +static ssize_t pwm1_freq_store(struct device *dev,
> +			       struct device_attribute *dummy,
> +			       const char *buf, size_t count)
> +{
[ ... ]
> +	mutex_lock(&data->update_lock);
> +	data->config_fan =3D i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_F=
AN);

[Severity: High]
Does this code handle I2C read failures correctly?

If i2c_smbus_read_byte_data() fails, it returns a negative error code.
Because data->config_fan is an 8-bit unsigned variable, this negative
error code is silently truncated into a large positive value.

This corrupted value is then modified and unconditionally written back to
LM63_REG_CONFIG_FAN below, which could clobber other configuration bits
in the register and potentially break hardware fan control.

> +	if (slow_clock)
> +		data->config_fan |=3D 0x08;
> +	else
> +		data->config_fan &=3D ~0x08;
> +	i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, data->config_fan=
);
> +	i2c_smbus_write_byte_data(client, LM63_REG_PWM_FREQ, pfr);
> +	data->pwm1_freq =3D pfr;
> +
> +	if (data->kind =3D=3D lm96163) {
> +		u8 enh =3D i2c_smbus_read_byte_data(client,
> +						  LM96163_REG_CONFIG_ENHANCED);

[Severity: High]
Can this read also fail and silently truncate a negative error code to an
8-bit unsigned variable?

> +		data->pwm_highres =3D !slow_clock && pfr =3D=3D 8 && (enh & 0x10);
> +	}
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522135421.2951=
534-1-kernel@jhbruhn.de?part=3D1
