Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D925224AF9
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226195; cv=none; b=htpgvEv1P53CnvJCK6gLkviQY+67jMQd+oOPUQ7APKhW5Ofwcel7dlmSQ5KH+DYxKHIeEYF2y88GUEQbzFvbBmDbXJwzEe3dMCb57FD0QBrZt1Rpmgq+pLSUb37Dp0Q1KlZO3VNijLbvlW3XNoweBZfUtlkgfzp60rr3jxG2Wn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226195; c=relaxed/simple;
	bh=mSoApiZtiVditK2ISbavvGqcaL0P8GFgALg0zLaKA4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eb1pbM5/w0347d8hINjCgplcEQ3HClnm3qIKwYnImRIE0aFR+RK3WgEcr17eJ2MZy3D2FuV//FzvQ34i+CAyBt2h90/tcoHnRkUkWqV/d1XkmqeZm+QoI9oBX2z3q0O1oY/fICDp2SrRWwoQfaUaL7R4VTYg+XeFKYA2j7bRJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXzIn/wU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXzIn/wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B681F1F000E9;
	Tue, 28 Jul 2026 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226193;
	bh=rrXjMwUDlEOu668FY9QRlr+/hcVSr3kInZtT1SdSqSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AXzIn/wUtMICs2/ZquClDNr97zLTUPH9xHgeUJxyd4TQiI0iQ62i4WEOi5wN8h3Cy
	 /fbGsio1pD4FxfSOEWcUYZi6HgFSiTYIziVVOzZoJO/Jpt4/iou6mDIIJ6kfjWfcQL
	 UxTLRJYcG1W6u/6J3gbZHHyyc74g7D6xE1ovic/Ow73YQJd2nGIGIMT2l+mm0Y/UbC
	 eSVgEwsTguRvf/2oZmGixQUvlUUXZpXJijUd723O/xWKJjYutS+kBZUhdPRFnVRjV6
	 OEkohwuGfTXcxEG130o5xzR+omCski+j/X2KiaUJsgu+KbGic+8drSzUgj1mykVNRX
	 GotT757so9vzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (npcm750-pwm-fan): stop fan timer on device
 detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyan Xu" <getshell@seu.edu.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260728075535.251-1-getshell@seu.edu.cn>
References: <20260728075535.251-1-getshell@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:09:53 +0000
Message-Id: <20260728080953.B681F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Stack-allocated string used as interrupt name in `devm_request_irq=
()`, leading to a dangling pointer and use-after-free.
- [High] Unprotected read of fan_cnt causes a TOCTOU race leading to a divi=
de-by-zero kernel panic.
- [High] Unprotected Read-Modify-Write (RMW) of PWM control registers can c=
orrupt hardware state.
- [High] Missing bounds checks on Device Tree properties lead to out-of-bou=
nds array writes on the heap.
- [High] The interrupt handler incorrectly calculates the fan module index =
using physical/virtual IRQ assumptions.
--

--- Patch [1]: [PATCH] hwmon: (npcm750-pwm-fan): stop fan timer on device d=
etach ---
commit 2cacb36d0828241791acb61238fb537a2260d7d4
Author: Hongyan Xu <getshell@seu.edu.cn>

hwmon: (npcm750-pwm-fan): stop fan timer on device detach

When a fan tach channel is present, the probe function starts a polling tim=
er.
This patch adds a devm cleanup action to ensure the timer is synchronously
stopped when the device is detached, preventing use-after-free issues if the
driver data is released while the timer is still running.

> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-=
fan.c
> index aea0b8659f5f6..6503d28ed7b04 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
[ ... ]
> @@ -1016,10 +1023,16 @@ static int npcm7xx_pwm_fan_probe(struct platform_=
device *pdev)
>  	for (i =3D 0; i < NPCM7XX_FAN_MAX_CHN_NUM; i++) {
>  		if (data->fan_present[i]) {
>  			/* fan timer initialization */
> -			data->fan_timer.expires =3D jiffies +
> -				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
>  			timer_setup(&data->fan_timer,
>  				    npcm7xx_fan_polling, 0);
> +			ret =3D devm_add_action_or_reset(dev,
> +						       npcm7xx_fan_cleanup,
> +						       data);
> +			if (ret)
> +				return ret;
> +
> +			data->fan_timer.expires =3D jiffies +
> +				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
>  			add_timer(&data->fan_timer);
>  			break;
>  		}

While reviewing this patch, I noticed a few pre-existing issues in this fil=
e:

[Severity: High]
This is a pre-existing issue, but does this code leave a dangling pointer in
the IRQ core?

In npcm7xx_pwm_fan_probe():

	char name[20];
	...
	for (i =3D 0; i < NPCM7XX_FAN_MAX_MODULE; i++) {
		...
		sprintf(name, "NPCM7XX-FAN-MD%d", i);
		ret =3D devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr,
				       0, name, (void *)data);

The local stack variable name is passed to devm_request_irq(), which stores
the pointer without copying it. When probe returns, the stack frame is
destroyed. Reading /proc/interrupts later would trigger a use-after-free.


[Severity: High]
This is a pre-existing issue, but could this cause a divide-by-zero panic?

In npcm7xx_read_fan():

	if (data->fan_dev[channel].fan_cnt > 0 && ...)
		*val =3D ((data->input_clk_freq * 60) /
			(data->fan_dev[channel].fan_cnt * ...));

The check and subsequent division are unprotected. Concurrently, if a hardw=
are
timeout occurs, the ISR npcm7xx_fan_isr() -> npcm7xx_check_cmp() sets:

	data->fan_dev[fan_id].fan_cnt =3D 0;

Without READ_ONCE() or locking, the compiler can emit two memory loads,
allowing the value to change to 0 between the check and the division.


[Severity: High]
This is a pre-existing issue, but does this lockless Read-Modify-Write
corrupt hardware state?

In npcm7xx_pwm_config_set():

	tmp_buf =3D ioread32(NPCM7XX_PWM_REG_CR(data->pwm_base, module));
	...
	iowrite32(tmp_buf, NPCM7XX_PWM_REG_CR(data->pwm_base, module));

This modifies the shared per-module control register without any locking.
Since it can be called from sysfs and directly by the thermal subsystem
concurrently, updates to different channels on the same module can race and
overwrite each other's changes.


[Severity: High]
This is a pre-existing issue, but could these missing bounds checks lead to
out-of-bounds writes on the heap?

In npcm7xx_en_pwm_fan():

	ret =3D of_property_read_u32(child, "reg", &pwm_port);
	...
	data->pwm_present[pwm_port] =3D true;

And similarly for the fan indices:

	for (ch =3D 0; ch < fan_cnt; ch++) {
		index =3D fan_ch[ch];
		data->fan_present[index] =3D true;

Untrusted Device Tree properties (reg and fan-tach-ch) are used directly
to index into the data->pwm_present and data->fan_present arrays without any
bounds validation.


[Severity: High]
This is a pre-existing issue, but is the fan module index calculated
correctly here?

In npcm7xx_fan_isr():

	module =3D irq - data->fan_irq[0];
	spin_lock_irqsave(&data->fan_lock[module], flags);

Virtual IRQ numbers assigned by the kernel's irqdomain are dynamically
allocated and not guaranteed to be contiguous. If fan_irq[1] is not exactly
fan_irq[0] + 1, the calculated module index could exceed the bounds of the
data->fan_lock array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728075535.251-=
1-getshell@seu.edu.cn?part=3D1
