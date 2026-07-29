Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BC43B6F0
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320005; cv=none; b=Xwmy5l4trmYYV8l6+1GLWFNsGwTnlLeJruLw4vMqs6Jb0bDImmWas/fae7HAfkeNCRl0ljZPefbU7Tu8e2VzhHBNMDMwqjXKeCKmh39wu+wq8b8eaSSxIKlYfd0aSKDuETfCd8glItYdSxzUH3wE5kE2AzFrNn2CKT8gVsxvzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320005; c=relaxed/simple;
	bh=rpOjG5AYydRdL1x4fEqVfIGPDhaCHxRfdrvT38BDmd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZqtmDRkSTO4HdEPD7J587zvejXa4FI2jUZ7OIP5HErGhQVVYP3KIM4r6PKuzmuCoD4u3gwZcY5wiULC5JAFshbCx6DAkwQgHdG9xwuWD9TSd57hj2kFSxuC0W9FG4iQgHHrINjUFW7KixCyZucGGTZpg3IkMT11xK6HD95Epyzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0JW3R3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0JW3R3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FDF1F000E9;
	Wed, 29 Jul 2026 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785320003;
	bh=h8HjDs+CB3MtZDVvoUvr1paG4E6tBEwVDs7hzWu+EH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O0JW3R3aYC1r+uw5erw5QjTGGI/higcrDS8XnQ74JxlPYtIp3bdM04bhS1cPjjEpF
	 ZWeMUipNbh9CQ1g0xlddkF5h6BJsjXwPx5BZ8LBTpUaU9PZ1VcwYnBE9FIysniIX8m
	 nVeUQu//2xuXBELfWdp1jHE6SwafW6dyBvINGm29Qzv0KSuh2yqH6ldCyhble+PqLE
	 JszbbTDaAhbeEv15KKpsPJ3phYUrAKjehZZySidCTNcFloYM9wJ36M1W7vbtqp6+bs
	 CE4rorIehLqxgE/LgLIwnd1jX0IBXTOT8L8fSlrrdwkqHSzij4TZTIh80Kbs6nnekK
	 mKPbAOZt88wDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (npcm750-pwm-fan): stop fan timer on device
 detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyan Xu" <getshell@seu.edu.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729100116.790-1-getshell@seu.edu.cn>
References: <20260729100116.790-1-getshell@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:13:23 +0000
Message-Id: <20260729101323.83FDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Invalid VIRQ subtraction for module index calculation in ISR.
- [High] Concurrent calls to `npcm7xx_pwm_config_set` cause a read-modify-w=
rite race on the shared PWM Control Register.
- [High] Lockless reads of `fan_cnt` in `npcm7xx_read_fan` create a TOCTOU =
race window that can lead to a divide-by-zero kernel panic.
- [High] The timer callback `npcm7xx_fan_polling` modifies hardware interru=
pt and counter registers locklessly, racing with the hardirq handler.
- [Medium] Missing bounds checking for device tree array inputs 'reg' and '=
fan-tach-ch' leading to out-of-bounds array writes.
--

--- Patch [1]: [PATCH v2] hwmon: (npcm750-pwm-fan): stop fan timer on devic=
e detach ---
commit 2c3b8a1752b70bfe681c67583f80cad522def5fb
Author: Hongyan Xu <getshell@seu.edu.cn>

hwmon: (npcm750-pwm-fan): stop fan timer on device detach

When a fan tach channel is present, npcm7xx_pwm_fan_probe() starts
fan_timer. On device detach, the devm-managed driver data and I/O mappings
can be released while the timer is still pending or running. This patch
registers a devm cleanup action to shut the timer down synchronously.

> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-=
fan.c
> index aea0b8659f5f6..6ff2a6bc06c14 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -358,6 +358,11 @@ static void npcm7xx_fan_polling(struct timer_list *t)
>  	add_timer(&data->fan_timer);
>  }

[Severity: High]
This is a pre-existing issue, but does this timer callback modify hardware
interrupt and counter registers locklessly, racing with the hardirq handler?

Looking at npcm7xx_fan_polling():

	for (i =3D data->fan_select; i < NPCM7XX_FAN_MAX_MODULE;
	      i =3D i + 4) {
		/* clear the flag and reset the counter (TCNT) */
		iowrite8(NPCM7XX_FAN_TICLR_CLEAR_ALL,
			 NPCM7XX_FAN_REG_TICLR(data->fan_base, i));

Here, the driver writes to NPCM7XX_FAN_REG_TICLR and modifies
NPCM7XX_FAN_REG_TCNT1 without holding the fan_lock.

Concurrently, the interrupt handler npcm7xx_fan_isr() (executing in hardirq
context) acquires fan_lock to read and selectively clear interrupt flags in
the same registers.

Could this unprotected concurrent hardware access erroneously clear pending
interrupts before the interrupt handler processes them?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the interrupt handler calculate an
out-of-bounds module index?

Looking at npcm7xx_fan_isr():

	module =3D irq - data->fan_irq[0];
	spin_lock_irqsave(&data->fan_lock[module], flags);

Linux virtual irq numbers are dynamically mapped and not guaranteed to be
monotonically contiguous. If the allocated irqs are not strictly
sequential, irq - data->fan_irq[0] could yield an arbitrary (and possibly
negative) index.

Can this lead to out-of-bounds memory accesses on data->fan_lock[module] and
potential memory corruption?

[Severity: Medium]
This is a pre-existing issue, but does the probe path lack bounds checking
for device tree array inputs?

Looking at npcm7xx_en_pwm_fan():

	data->pwm_present[pwm_port] =3D true;
...
	index =3D fan_ch[ch];
	data->fan_present[index] =3D true;

Values parsed from the device tree such as pwm_port (from 'reg') and index
(from 'fan-tach-ch') are used directly as array indices for bounded arrays
(data->pwm_present, data->cdev, data->fan_dev).

If the values exceed NPCM7XX_PWM_MAX_CHN_NUM (12) or
NPCM7XX_FAN_MAX_CHN_NUM, could a malformed device tree trigger out-of-bounds
array writes during probe?

[Severity: High]
This is a pre-existing issue, but can concurrent calls to
npcm7xx_pwm_config_set() cause a read-modify-write race on the shared PWM
control register?

Looking at npcm7xx_pwm_config_set():

	tmp_buf =3D ioread32(NPCM7XX_PWM_REG_CR(data->pwm_base, module));
	...
	iowrite32(tmp_buf, NPCM7XX_PWM_REG_CR(data->pwm_base, module));

This performs an unprotected read-modify-write on the shared PWM module
control register (NPCM7XX_PWM_REG_CR).

This function is called concurrently by sysfs (via hwmon core) and the
thermal subsystem (via the directly registered cooling device
npcm7xx_pwm_cool_ops). Because the thermal cooling device is registered
directly to the thermal core rather than through hwmon, hwmon's
serialization does not apply.

Could this race without a lock, leading to lost register updates and
incorrect PWM channel states?

[Severity: High]
This is a pre-existing issue, but do lockless reads of fan_cnt in
npcm7xx_read_fan() create a time-of-check to time-of-use race window?

Looking at npcm7xx_read_fan():

	if (data->fan_dev[channel].fan_cnt <=3D 0)
		return data->fan_dev[channel].fan_cnt;

	*val =3D 9000000 * 60 / data->fan_dev[channel].fan_cnt;

data->fan_dev[channel].fan_cnt is read without READ_ONCE() or a lock to
verify it is > 0, and then read a second time in the denominator for a speed
calculation.

Concurrently, npcm7xx_fan_start_capture() (called from the timer or
interrupt handler) can locklessly update fan_cnt to 0 upon a fan stall.

If the value changes to 0 between the two reads, could the division by zero
crash the system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729100116.790-=
1-getshell@seu.edu.cn?part=3D1
