Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B65F234973
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508705; cv=none; b=bGPVAeeXNEOyiavPDK3XDPdveuIS2crXEpcwzKosjTzpUor+ZN6brbS0xHMRhEqIWIrzZi6JEZaj3UGNK+HSIc3uIBrczJCmWXG/y453Xlo2tWK3wT3wRzdhoWd/VLTMHD6+0WHin0YioiH2/lniL0NJR8qc/iZZefYnHB7Y45w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508705; c=relaxed/simple;
	bh=PyoKseSvTJ2MifvNV5C2OvzMiG2uJZEGnuq9p1ed6lU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qf31gHOsFPq0PTymLuK2go1c3H2Hcpiy65bGuOTL/EEAvT7ZgkM0KfIi4dAyC04mTxTYNO2kW5Tl/KfEnOe/WtNZR7czMNPPf9SwHjFnllpR8bPbjypfcIaKh+hS/VaqRpU/Ppi7Izh7ljM0SBiwcqzXfZhPPXdgR6jUM1efskg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbfD8oZh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbfD8oZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32B11F000E9;
	Sun, 23 Aug 2026 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787508704;
	bh=+LzF+nrI1Q7iWkVB1af0nrztFsLaDZwBpImWcVdyxiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TbfD8oZhdZmg1juNTMF+TWJh0RAJmt55LqGRfh6EG4KQW/l9Wti4PhVDPaJhsiUi+
	 Z3OBoqKL0aIbobelmUkuMRX6jhnb/hzOKF8xEjrDmRoK1/aQexL+wLiVUM5kKEyNcb
	 V+oA7f/XbzV2L6wkLBxmJYEoQqHTRlvnLZecGp8q+fcrFVnVlQGSfXMi0IHY4rM5ST
	 hAyz8TfCSo7Y5FQGC+tevOOMW1iLclG09hvIz4smwH2A0NbxTTXrldNe4yTQncSaRN
	 /Uan5l38g73D2ySKcTXT2exbuEucnP8qs++wI/A3VRhDZnDHMljzAHfWjS98zPtbFB
	 FBdtLkPsRvnuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: chipcap2: enable IRQ processing when
 regulator is already enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260823-chipcap2_locks-v2-3-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-3-6a26c8e9e2fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 18:11:43 +0000
Message-Id: <20260823181143.F32B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Bypassing `regulator_enable()` but calling `regulator_disable()` l=
eads to unbalanced operations and kernel WARNs.
- [High] Incorrect endianness conversion for I2C SMBus word write corrupts =
data on Big Endian architectures.
- [Medium] `regulator_is_enabled()` can return negative error codes, which =
are improperly evaluated as true.
- [Medium] The early return path skips clearing pending completions, potent=
ially causing stale reads.
- [Medium] Alarm configuration (command mode) fails unconditionally with ti=
meouts if the regulator is always-on.
- [Low] `try_wait_for_completion()` is improperly used to reset the complet=
ion structure.
--

--- Patch [3]: [PATCH v2 3/4] hwmon: chipcap2: enable IRQ processing when r=
egulator is already enabled ---
commit d7e6228cb08396bc9407928fe3b3e28aa4aaf084
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: enable IRQ processing when regulator is already enabled

cc2_enable() returns early when the regulator is already enabled.
This can happen if a previous regulator_disable() failed or if the
regulator was configured as always-on.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
> @@ -119,8 +119,10 @@ static int cc2_enable(struct cc2_data *data)
>  	int ret;
> =20
>  	/* exclusive regulator, check in case a disable failed */
> -	if (regulator_is_enabled(data->regulator))
> +	if (regulator_is_enabled(data->regulator)) {

[Severity: Medium]
This is a pre-existing issue, but regulator_is_enabled() can return negative
error codes. Does this condition in cc2_enable() evaluate to true for negat=
ive
error codes like -EINVAL, incorrectly bypassing the enable sequence?

Similarly, in cc2_disable(), this check incorrectly tries to disable the
regulator if its state check failed.

[Severity: High]
This is a pre-existing issue, but returning early here bypasses taking a
software reference via regulator_enable() if the regulator is physically
enabled.

If the regulator is physically always-on (e.g., fixed-regulator),
regulator_is_enabled() returns 1, and cc2_enable() skips regulator_enable().
Then cc2_disable() calls regulator_disable() without a matching enable,
triggering a kernel WARN because the consumer's enable_count is 0.

Should this code ensure regulator_enable() is always called to maintain
balance?

[Severity: Medium]
This is a pre-existing issue, but does the command mode retry logic in
cc2_command_mode_start() fundamentally assume regulator_disable() guarantee=
s a
physical power cycle?

cc2_command_mode_start() calls cc2_disable() followed by an msleep() to pow=
er
cycle the device. If the regulator is always-on, power is never physically
removed, the 10ms startup window is permanently missed, and the START_CM
command is ignored, causing alarm configuration to fail with -ETIMEDOUT.

> +		data->process_irqs =3D true;
>  		return 0;

[Severity: Medium]
This is a pre-existing issue, but does this early return skip clearing the
pending completion?

If a late interrupt from a prior timeout leaves data->complete.done > 0, and
the regulator is already enabled, the early return in cc2_enable() bypasses
the reset.

Subsequently, the wait in cc2_read_measurement():

ret =3D wait_for_completion_timeout(&data->complete, timeout);

will succeed immediately, potentially fetching stale data prematurely before
the sensor finishes its measurement, returning -EBUSY.

> +	}
> =20
>  	/* clear any pending completion */
>  	try_wait_for_completion(&data->complete);

[Severity: Low]
This is a pre-existing issue, but is try_wait_for_completion() improperly u=
sed
to reset the completion structure?

try_wait_for_completion() only decrements the done counter by 1. If multiple
interrupts occurred, done might be > 1, so the next wait could succeed
immediately.

Should this use reinit_completion() instead?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the combination of cpu_to_be16s() and
i2c_smbus_write_word_data() in cc2_write_reg() write swapped byte sequences=
 on
Big Endian platforms?

On Big Endian systems, cpu_to_be16s() is a no-op. i2c_smbus_write_word_data=
()
mathematically sends the least significant 8 bits first. Thus, on Big Endia=
n,
the original LSB is sent first, whereas the sensor expects MSB first,
which corrupts the alarm threshold configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823-chipcap2_l=
ocks-v2-0-6a26c8e9e2fc@gmail.com?part=3D3
