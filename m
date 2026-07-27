Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F118FDDE
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124173; cv=none; b=sqXb8fiXbHRo9tjupHx8k8+QgcwKYv3KBeG8vkGibknikfnlqvc82ZamvLpa9Yszp9aOUP/nYQBJ7kahdQNooc6QKOLbwTaqY1pOguR56nR1J9I+IjtenHSI7l1rmGykpRvvGODug8PGwUGlP/yzbJaAOqUR7GXVH5z54LPBDe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124173; c=relaxed/simple;
	bh=4rPWHm8e6ZJXeu5W5P4nuF7QEOsdpvwe+Ou/coWgNv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XfNoi/Q38bQElSg470sexPuhpHu85Rl5jNsS/gM6N9VvvLwTjIKo19jOpepmPAIosHW9t0yFKtS5MtaB81tgSXLjI+tHjP+ScKX9gNeHyRWhY3ovEUkkcRz12MhvTzrPPkrNzIdA+9djAVGYYS9smGWOklYOP31IDAqYksrVRGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNjB6Olh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNjB6Olh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7C41F000E9;
	Mon, 27 Jul 2026 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785124172;
	bh=ZUGL+udE47m/cT2LZmzTYhONBY2fbiy/v2TImW4l064=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNjB6Olhkp/EqAEqVp+0Pa8yFhMho0BKN1BfHncEPViZLytlvT99bwN0TKpd8saTp
	 EheUvZi58euRlUSRuDwHFjRTi14nZCwadhL1lW3t3eYa1GmCwvoO0oM8zkGye7lEpn
	 NfYqT4tAEptDRCIxpkcPRRpmgBx1brUuVw5RNqumhcUeln9fS53raU0mjxgNOv4TyO
	 FZYgceG/BXkC4fTkZinwq65217pkw0NRbDJqpi5KC6PY564cidXWIEYINTx1xBaw+r
	 ysViIqGveqOtQ2dpVWps8FS8yVeNa5jtp87gLjH9vNHM91vcWJ4PMZp5g9e5+T568t
	 kwtbMWF3zWn0g==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v3 3/6] hwmon: (adt7470) Fix busy-loop and I2C
 flooding in update thread
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_thermalzone-v3-3-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-3-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 03:49:31 +0000
Message-Id: <20260727034932.0B7C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The temperature alarm reporting logic uses the raw integer channel=
 index instead of a bitmask, resulting in incorrect alarm reporting.
- [High] In `pwm_auto_temp_store`, user input overflows a hardware bit-fiel=
d due to missing bounds checks, and is written to the wrong state array, co=
rrupting the PWM automatic enable state.
--

--- Patch [3]: [hwmon PATCH v3 3/6] hwmon: (adt7470) Fix busy-loop and I2C =
flooding in update thread ---
commit c10c388e55482dcd15df4bd6225052bbff835213
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread

Setting 'auto_update_interval' and 'num_temp_sensors' to 0 forces the
background thread into a tight, unbounded busy-loop, hogging the CPU and
flooding the I2C bus. This patch fixes the vulnerability by raising the
lower limit in auto_update_interval_store() to 500 milliseconds. This
guarantees a reasonable minimum sleep window between sensor updates.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.o=
rg
Fixes: 89fac11cb3e7 ("adt7470: make automatic fan control really work")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 62ec68ea0a406..0b19b0925d1c7 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -509,7 +509,7 @@ static ssize_t auto_update_interval_store(struct devi=
ce *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
> =20
> -	temp =3D clamp_val(temp, 0, 60000);
> +	temp =3D clamp_val(temp, 500, 60000);
> =20
>  	mutex_lock(&data->lock);
>  	data->auto_update_interval =3D temp;

While reviewing the code, I found a few unrelated issues in this driver.

drivers/hwmon/adt7470.c:adt7470_temp_read() {
...
	case hwmon_temp_min:
		*val =3D 1000 * data->temp_min[channel];
		break;
	case hwmon_temp_max:
		*val =3D 1000 * data->temp_max[channel];
		break;
	case hwmon_temp_alarm:
		*val =3D !!(data->alarm & channel);
		break;
...
}

[Severity: High]
This isn't a bug introduced by this patch, but is the temperature alarm
reporting logic using the raw integer channel index instead of a bitmask?

If channel is 0 (temp1_alarm), data->alarm & 0 is always 0. For other
channels, it checks bit 0, 1, 2, or 3 incorrectly, which might lead to
false positives or missed alarms.


drivers/hwmon/adt7470.c:pwm_auto_temp_store() {
...
	temp =3D cvt_auto_temp(temp);
	if (temp < 0)
		return temp;

	mutex_lock(&data->lock);
	data->pwm_automatic[attr->index] =3D temp;

	if (!(attr->index % 2)) {
		mask =3D 0xF0;
		val =3D (temp << 4) & 0xF0;
	} else {
		mask =3D 0x0F;
		val =3D temp & 0x0F;
	}
...
}

[Severity: High]
This is a pre-existing issue, but does this write the parsed value into the
wrong state array, and can the unchecked input overflow the hardware
bit-field?

It appears to overwrite the pwm_automatic enable state instead of updating
data->pwm_auto_temp, corrupting the PWM automatic enable state.

Additionally, since cvt_auto_temp() can return a value up to 32, it can
overflow the 4-bit field mask when constructing the register value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_th=
ermalzone-v3-0-21424d550c3d@gmail.com?part=3D3
