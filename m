Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E389429031;
	Thu,  6 Aug 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008053; cv=none; b=O7Zd9ma6ey2zcxCDb2jHyOULDEF0d83vl+Jmc0Jg4cuQc88r+Xe5L9Lw0iEkk9B6fB1Zs95WEGGCJP+/6jQIYrRDhN8QlpmlU/HvqFGBHzHKWEA/ebTmI+TSGGZPCKm+upd+IRxU0dDmyRgU9mmaOC10HD7rYBvdqrz53aTrAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008053; c=relaxed/simple;
	bh=z86ktvIzlVTI+G8oj+n4bnAvyUCeR97nYqDrvntAHFM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P01+Y3czZIZd1DkmsEHCU4+hy5ZmyaH9/eIMDSLbw1clC4Bdgmtqgb2Io4ZiojWpc8sy4UX5PRBr6t1I0SV2qgr2EHx5ZKR0sac+tu9OVm6ytEDM5/9UjEMc2S8/ADtANQrOPey0hqQ0WUWdsrX7AtBOBLtIRuxd93bunIvWYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+mZsTwb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+mZsTwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D078D1F000E9;
	Thu,  6 Aug 2026 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786008050;
	bh=4zLZw4QkGvrsi0RbOA6nUehq7phlaSJ35Ho4tyJ27B0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X+mZsTwbSnt5VJSCdarMCnBIZAJJnCjL55KFVTS87pcT5VxBloJk2S4ZuKRgD/b5r
	 +DMGIj7DgX4US8UDGLL723DgnKb5k6ZCxYEwcxk4lO6wWcMwWepM6PEeE8ehNa5cyg
	 fVSllVoB8zUX9MxALOOfIkRARM8i7uCkaJ4wypzd+whOLFYf4Jz2KbexB2c86TWzdb
	 MbD9DTJuQ/Og839vBXyNky3jPPM/uMVarhpVSOLDT2sW9vJmVcEK8UtMsoLD8EqGfz
	 fS+mhwwsd7FielBtyb7W5h7TpAxoZ9eXknGWvd7ftSo8+E29UP7p0NPwfxQcYBur46
	 TmV3IYFKs/zDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260806-axiado-ax3000-pwm-fan-v1-2-f6db4cf2166b@axiado.com>
References: <20260806-axiado-ax3000-pwm-fan-v1-0-f6db4cf2166b@axiado.com>
 <20260806-axiado-ax3000-pwm-fan-v1-2-f6db4cf2166b@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:20:48 +0000
Message-Id: <20260806092049.D078D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The tachometer IRQ handler blindly clears a hardcoded bit instea=
d of verifying the interrupt status, potentially causing an IRQ storm.
--

--- Patch [2]: [PATCH 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan cont=
roller driver ---
commit f5b1a22a2979f32a82f8a025aa241070c85d00ae
Author: Petar Stepanovic <pstepanovic@axiado.com>

hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver

This commit adds support for the PWM fan controller on Axiado AX3000 and
AX3005 SoCs. The driver uses a hardware tachometer block and interrupt to
measure fan speed, while controlling the fan via an external PWM signal.

> diff --git a/drivers/hwmon/axiado-pwm-fan.c b/drivers/hwmon/axiado-pwm-fa=
n.c
> new file mode 100644
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
> +
> +	scoped_guard(spinlock_irqsave, &ctx->tach_lock) {
> +		ctx->tach.count =3D ioread32(ctx->tach_base + AX_TACH_COUNT_REG);
> +	}
> +
> +	iowrite32(AX_TACH_INT_PENDING, ctx->tach_base + AX_TACH_INT_STATUS_REG);

[Severity: Medium]
Does this risk an IRQ storm if the hardware sets any bit other than
AX_TACH_INT_PENDING?

If a different bit in AX_TACH_INT_STATUS_REG triggers the interrupt, this
handler will see a non-zero status, proceed to update the count, and then
blindly clear only AX_TACH_INT_PENDING (BIT(0)). The other bit would remain
set, and the interrupt line would remain asserted.

Should this check if AX_TACH_INT_PENDING is actually set in the status, and
clear the specific status bits that were read rather than hardcoding the
cleared bit?

> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-axiado-ax3=
000-pwm-fan-v1-0-f6db4cf2166b@axiado.com?part=3D2
