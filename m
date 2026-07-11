Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447EE3815E4
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757559; cv=none; b=elEoKzESmTB8Spy9epvkhme7I5Ad4pi9jd0wwWNJzBbfNfPNAepqY97sHR7VrW422MUHdyQ+Z9sf/i5jTnVG2sTnzHFWyX0B6UEiGjiL+4plYXBhLPF94tylWpDElxCWrhaPl2JPw4/PBHSbGnG9kBId/WLblrTqL20L7NBodpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757559; c=relaxed/simple;
	bh=ZfhCc4RBeV7neL1aTIZfn++0J9LcMigmsjKAKnv9df0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UjCWPnac0w3c1wYoYveAwM1qTW6/RYsPM4ZCMCKgrUJOEvEDjTmF8PEUPr/zGVF1oVdid6CxOVr+KFRAtb9mGa43Or0QhvBqGG9SCSRsQTBpUt1ODdJ4ncq1wd1mkylEFR6lKWamaIwDil0ayIHtaj9LAEo6N6MfZX096v4O3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZf7cZT/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZf7cZT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A121F000E9;
	Sat, 11 Jul 2026 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783757557;
	bh=HAdfnXbP5mLH7jM7/6hMCFMQa4NKXOZrOAydNX9D1KU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZf7cZT/O66KFOjxpwYmpdyw+MgUrJAtvf5WJ5fyc20dLvyAvyfN/tH2aK+kur9yO
	 s69bBvIp27JTIa/LWp4bQ5HXOChBPexwGi+HAA6v+kKwyjryYJ9EFziszJD5pxFxTH
	 /nD3AtgqFXXdJujwFnj0tiJTtVIU8A5IwX3mS5G0+W6taSZ041jzKYc01e5jDAjMZS
	 F3u7E1zEQdXoOmsvfkqVMajLCVEtsh06tcbSagE1JKC564vh4BSBJblAfVLNzb1/60
	 PVoOrWOORuWXMj4l5lam8DyfbngVLKQIIxKeZaLOkRQaUdtBRGe+Q3d4fIJ6HkDhEi
	 +mcuFYu38ktLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711075754.11358-4-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
 <20260711075754.11358-4-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 08:12:37 +0000
Message-Id: <20260711081237.A8A121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The new `pwmX_enable` attribute implementation violates the standa=
rd hwmon ABI by mapping automatic mode to `0` and explicitly rejecting `2`.
--

--- Patch [3]: [PATCH v5 3/3] hwmon: (applesmc) Convert to hwmon_device_reg=
ister_with_info ---
commit 5c6fadffca7be1d46d146ede611dc2b9077f542a
Author: Shih-Yuan Lee <fourdollars@debian.org>

hwmon: (applesmc) Convert to hwmon_device_register_with_info

This commit converts the legacy hwmon_device_register() function in the
applesmc driver to the modern hwmon_device_register_with_info() API. It
dynamically allocates standard hwmon channels and standardizes attribute
naming, such as mapping the legacy fanX_manual attributes to the standard
pwmX_enable ABI.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 317135fc4b73b..bec9e9e988969 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c

[ ... ]

> @@ -1321,8 +1186,238 @@ static const struct dmi_system_id applesmc_whitel=
ist[] __initconst =3D {
> +static int applesmc_hwmon_read(struct device *dev, enum hwmon_sensor_typ=
es type,
> +			       u32 attr, int channel, long *val)
> +{
> +	int ret;
> +
> +	switch (type) {

[ ... ]

> +	case hwmon_pwm:
> +		if (attr =3D=3D hwmon_pwm_enable) {
> +			u8 buffer[2];
> +
> +			ret =3D applesmc_read_key(FANS_MANUAL, buffer, 2);
> +			if (ret)
> +				return ret;
> +			*val =3D ((buffer[0] << 8 | buffer[1]) >> channel) & 0x01;

[Severity: High]
Does returning 0 when the fan is in automatic control mode conflict with the
standard hwmon ABI?

The standard hwmon ABI defines 2 as automatic control, while 0 typically
means 'no control' or 'full speed'. Returning 0 here might cause standard
userspace tools like fancontrol or pwmconfig from lm-sensors to incorrectly
assume the fan has no speed control.

> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +static int applesmc_hwmon_write(struct device *dev, enum hwmon_sensor_ty=
pes type,
> +				u32 attr, int channel, long val)
> +{
> +	int ret;
> +
> +	switch (type) {

[ ... ]

> +	case hwmon_pwm:
> +		if (attr =3D=3D hwmon_pwm_enable) {
> +			u8 buffer[2];
> +			u16 manual_val;
> +			const struct applesmc_entry *entry;
> +
> +			if (val !=3D 0 && val !=3D 1)
> +				return -EINVAL;

[Severity: High]
Will rejecting standard hwmon ABI values like 2 break userspace tools?

By explicitly returning -EINVAL for values other than 0 or 1, attempts to
restore automatic mode by writing 2 (the standard hwmon ABI value for
automatic control) will fail. This could leave the fan stuck in manual mode
at an arbitrary speed, risking system overheating.

Since this patch standardizes the attribute name to pwmX_enable, should this
function accept 2 and translate it into the hardware's automatic mode?

> +
> +			entry =3D applesmc_get_entry_by_key(FANS_MANUAL);
> +			if (IS_ERR(entry))
> +				return PTR_ERR(entry);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711075754.1135=
8-1-fourdollars@debian.org?part=3D3
