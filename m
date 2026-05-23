Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5A11F7916
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779533919; cv=none; b=Fd42KYTBZZ0RMUg38HmIoTkyjx9IdJHPGy16SMRpdRFsmRO8f8TnhD2+xr7J0n4JqeXGGah2ccNBzSU6COoozqSv6xXL0idlxDnfUVEW2JZkycRDHNlxUgi+dI3LPFTn3IcRbD2rgYX7lASgmKdQlsqSaZ7MRPj3ooNr3SbHvI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779533919; c=relaxed/simple;
	bh=hMFdPE4IF63nPiWFDHf5Fg+zb33xF3PmtCmgT+BAkA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GFNF2Wxbz2btIFQBAMSylp3jrqoKDuRdJ+5HWpDkezbSWwcY3w1YMjEIuDyxsN1aiB/gjoW8wp0d8tpxq+bh8W1DKW/byBdIN8MjE21B63391tPn19RuTEAzBv/6eQTxX7RBIlJoHqJOB4cNQZJvaBZe+NNHz9xlqHvwbndKddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnyWK1uK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnyWK1uK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B9C1F000E9;
	Sat, 23 May 2026 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779533917;
	bh=pSlzHotif3sqGnlpk/09QIL+zMaS/NX4mKbEahb1iS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnyWK1uKuQT9CCNXTaF7E1zi6gSMiTT/R5uSPuAgz0kE6tdu9bHM8Z8MydY16wZYd
	 sTW9h57O4eqL5PiFzYX96awiR5YN5z3XxSehCJXrs6kr7NACKAnm/61PPbYMTFXkWN
	 UR3Osex8dwgebLAGSUbp1FdyPtD5uq4QhW5z9yPC7anPAVonEJgtZX5TiiNFk9kFIg
	 cMkKE/0/LNGHWAOGqbx8w9U6KCVJ6esku7GLGWI94S1uJl1m0+khf+NisPGqVvBNAz
	 nFTx2u4xxzwvx+4Q2rKkcgPHi6ngjxe34x2AhbqUgoOz+2tzUApjeJgKYHDCIiDmQI
	 35vOewEV8jyWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (lm63) expose PWM frequency and LUT
 hysteresis as writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Henrik Bruhn" <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260523095412.3341202-1-kernel@jhbruhn.de>
References: <20260523095412.3341202-1-kernel@jhbruhn.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 10:58:37 +0000
Message-Id: <20260523105837.67B9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing lock in `pwm1_freq_show` causes a data race and a potentia=
l divide-by-zero kernel panic.
--

commit 1bf46f1b90af417821722eaed56484734ef9e3ae
Author: Jan-Henrik Bruhn <kernel@jhbruhn.de>

hwmon: (lm63) expose PWM frequency and LUT hysteresis as writable

This commit exposes the PWM frequency and LUT hysteresis as writable
sysfs attributes. It adds a pwm1_freq attribute to select the closest
SCS + PFR combination, and exposes a chip-wide pwm1_auto_point_temp_hyst
attribute for the hysteresis amount.

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 30500b4d22212..90c49c448c624 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c

[ ... ]

> @@ -455,6 +458,86 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	return count;
>  }
> =20
> +static ssize_t pwm1_freq_show(struct device *dev,
> +			      struct device_attribute *dummy, char *buf)
> +{
> +	struct lm63_data *data =3D lm63_update_device(dev);
> +	unsigned int base =3D (data->config_fan & 0x08) ?
> +			    LM63_PWM_BASE_SLOW_HZ : LM63_PWM_BASE_FAST_HZ;
> +
> +	return sprintf(buf, "%u\n", base / data->pwm1_freq);

[Severity: High]
Can this read of data->pwm1_freq race with an update, resulting in a
divide-by-zero exception?

Looking at lm63_update_device(), it acquires data->update_lock and can
temporarily set data->pwm1_freq to 0 before clamping it to 1:

lm63_update_device() {
    mutex_lock(&data->update_lock);
    ...
    data->pwm1_freq =3D i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
    if (data->pwm1_freq =3D=3D 0)
        data->pwm1_freq =3D 1;
    ...
}

Since pwm1_freq_show() does not hold data->update_lock, could it read
data->pwm1_freq during this transient 0 state and cause a kernel panic?

> +}
> +

[ ... ]

> @@ -629,6 +712,42 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
>  	return sprintf(buf, "%d\n", temp);
>  }
> =20
> +/*
> + * The LM63 has a single hysteresis register shared by all LUT entries.
> + * Expose it as a chip-wide hysteresis amount in millidegrees; the
> + * per-point pwm1_auto_pointN_temp_hyst attributes remain read-only and
> + * show the resulting absolute trip-down temperature for each entry.
> + */
> +static ssize_t pwm1_auto_point_temp_hyst_show(struct device *dev,
> +					      struct device_attribute *dummy,
> +					      char *buf)
> +{
> +	struct lm63_data *data =3D lm63_update_device(dev);
> +
> +	return sprintf(buf, "%d\n", TEMP8_FROM_REG(data->lut_temp_hyst));

[Severity: High]
Does accessing data->lut_temp_hyst here without holding data->update_lock
also result in a data race with concurrent updates?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523095412.3341=
202-1-kernel@jhbruhn.de?part=3D1
