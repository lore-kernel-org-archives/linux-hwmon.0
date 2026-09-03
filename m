Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F7B363C6C;
	Thu,  3 Sep 2026 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425326; cv=none; b=PEEW2mbZTgE1cjYy3IqE9pyC+KHU1oUAxSawx52UJ/6zkM3cL88OvjY+7YDZ77+aDx/VdTtM29MAgWoGXjUegPefH3GwRsOsE9N5tqiO8XWbaIxPb3gJ2T4zWrvA1NR7FeMRE5P1aVeUgGBZQ8gtNvxQZYp0sEABuS42DwvP4nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425326; c=relaxed/simple;
	bh=bGYS6XisPwqR1nzJyBe36wiU9YiCp0NSqM0L5rNIMnQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZXGJfHnYqVE4NnUMA5aeo79aqsLyEA7UX+wHhD7+idZ2FIpd1Nji0i0sVqNI3ZVLklZcE3zvjf4Fs+L8VI9dLI3IWIASD36O1yV+y+vJIuf5+vptP8YxSvTX2jhJDVAgPAIk2R3h+CgcsRZoEN/8IP0/+S8QH5D+zQzK4cs4SVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7WYEdPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7WYEdPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CC11F000E9;
	Thu,  3 Sep 2026 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425325;
	bh=TWUTWJGyjUPVUGSmM7t7GB4z9LsTvPBtCuTBokjO+5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7WYEdPnY14+ekaDLiDPg/+7YwPmx2tMWX7aQsYd4NInSfKrhd1QpzzSboJfF3GVI
	 oGjxqngl/EsdI6J9H0Tv03lwmVwnNjIXjr723+Wcc1+97BdXcs5AjHUZCWUEcR2XB8
	 IILW/rNOpxh8wU9LQvgAK7ueSTj/cYip9KRDbxKkV4Vam9vU6Y4vYLQa7bRJ9/RFOh
	 iFYpezVfuXTtumUl4GKzXmoa46uTD5A0mdrr8El40leQuT55uv51ARm35SV2liuNnv
	 HeC0InxsBrFn6aAmR4DU73dQfBHo0PuTgBc8SKwhW4PGPBrKcLukcfualofpHzzEg3
	 J6cSnyESI+6wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-axiado-ax3000-pwm-fan-v2-2-ef43df46163e@axiado.com>
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
 <20260903-axiado-ax3000-pwm-fan-v2-2-ef43df46163e@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:48:44 +0000
Message-Id: <20260903084844.D1CC11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The interrupt handler incorrectly returns IRQ_HANDLED for unhandle=
d device interrupts, potentially causing an IRQ storm.
--

commit ac0edffb2c72d464c05c340c5df147fdcf10b0f4
Author: Petar Stepanovic <pstepanovic@axiado.com>

hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver

This commit adds support for the PWM fan controller found on the Axiado AX3=
000
and AX3005 SoCs. It measures fan speed via a hardware tachometer interrupt =
and
controls the fan via an external PWM signal.

> diff --git a/drivers/hwmon/axiado-pwm-fan.c b/drivers/hwmon/axiado-pwm-fa=
n.c
> new file mode 100644
> index 0000000000000..ac153afded47a
> --- /dev/null
> +++ b/drivers/hwmon/axiado-pwm-fan.c
[ ... ]
> +static irqreturn_t axiado_tach_irq_handler(int irq, void *dev)
> +{
> +	struct axiado_pwm_fan_ctx *ctx =3D dev;
> +	u32 status;
> +
> +	status =3D ioread32(ctx->tach_base + AX_TACH_INT_STATUS_REG);
> +
> +	if (!status)
> +		return IRQ_NONE;

[Severity: High]
Will this handler cause an IRQ storm if the hardware asserts an interrupt=20
where the status is non-zero but AX_TACH_INT_PENDING is not set?

Since the condition only checks if status is zero, an unexpected bit could=
=20
bypass the IRQ_NONE return path. The handler would then proceed to clear on=
ly=20
the AX_TACH_INT_PENDING bit and return IRQ_HANDLED, leaving the actual=20
hardware interrupt active and bypassing the kernel's spurious IRQ protectio=
n.

Should this explicitly check if the AX_TACH_INT_PENDING bit is set before=20
processing the interrupt?

> +
> +	scoped_guard(spinlock_irqsave, &ctx->tach_lock) {
> +		ctx->tach.count =3D ioread32(ctx->tach_base + AX_TACH_COUNT_REG);
> +	}
> +
> +	iowrite32(AX_TACH_INT_PENDING, ctx->tach_base + AX_TACH_INT_STATUS_REG);
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-axiado-ax3=
000-pwm-fan-v2-0-ef43df46163e@axiado.com?part=3D2
