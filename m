Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A31DED42;
	Mon, 24 Aug 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542071; cv=none; b=FyY36GQ66K7QcybuynnxuH/TlL/m5pznH+7A5ol8gsWAF2lUkZecosNOWbj6yAlXAoiXzysgvv7tWiB/CMJw4GdKqqLVUPP5HPfFzGSenrDAZ0BqHHtf+AQ9UV5BFRriOfuMdfmEonTyXuu9SNm6Pl/+wr0uTUaUNljIrfouYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542071; c=relaxed/simple;
	bh=WIjw1cAmyGH1VYqeek3Q08fNsvjeUv8VyDbwG8UApVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e7hedy3+4i0zmSBl5CIEvc7sfcqh0c5Rcw7YII5WWlWLvvky3noQ6DpzLtNkv4fvVjTSzIUIeABxDm9GLHV96xurkTviJFPuL8DU1WjHcCyRoPr992SCRj2NQKQTR5f2R3DIraXx7b0OxFBmTuGPoingut5qfUk0bE5/F+N6SA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIcugCZ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIcugCZ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0749D1F000E9;
	Mon, 24 Aug 2026 03:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787542070;
	bh=lUZPuROjXRJONUkWCLzmBy2YRycsR+RM+0CIp+26KwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lIcugCZ8QZjP/IUp07gVhzrYhSjMVLV5ep/44HypAjqDwWwv198em8s48mQbe7yby
	 ZZugkm2uxhPV/mzZcY30/TqLTegIBWJyZ/AgSQ3EkLp5SgqDnR3CAvgoOof2OcG8Ba
	 iy8SNLJurVV3KGxofahcWviWuw29OhNUytpRouVmSDrX9zaLwbCFDxab4k1Oewsh9a
	 fzUOmhr9PaY2jYw1fJLFh9cXfADoObFh70hTCPjC8i9ptIjR4QjVTiBEddL0Z6n9b1
	 5YKuGAp4Yl0cBr/Kqc13vwxacx2Wqxn+JaWiR9XK5z4Mfuxo8cg3EtJvnT0BksVrCR
	 8ElJqmX5ev01A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (starfive-fan-tach) Add fan tach driver
 for StarFive JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824030234.9321-3-changhuang.liang@starfivetech.com>
References: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
 <20260824030234.9321-3-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 03:27:49 +0000
Message-Id: <20260824032750.0749D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing explicit initialization of interrupt and channel enable =
registers during probe
--

--- Patch [2]: [PATCH v3 2/2] hwmon: (starfive-fan-tach) Add fan tach drive=
r for StarFive JHB100 ---
commit ea266a681c03cda9faa04f08b171c20f1e003841
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

hwmon: (starfive-fan-tach) Add fan tach driver for StarFive JHB100

This commit adds a new driver for the fan tachometer controller found on the
StarFive JHB100 SoC. It provides support for up to 16 independent fan
tachometer inputs and reports fan speed in RPM through the hwmon sysfs
interface.

> diff --git a/drivers/hwmon/starfive-fan-tach.c b/drivers/hwmon/starfive-f=
an-tach.c
> new file mode 100644
> index 0000000000000..7f56ecc87c1c8
> --- /dev/null
> +++ b/drivers/hwmon/starfive-fan-tach.c
[ ... ]
> +static int starfive_fan_tach_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D reset_control_deassert(priv->rst);
> +	if (ret) {
> +		clk_disable_unprepare(priv->clk);
> +		return dev_err_probe(dev, ret, "Failed to deassert reset\n");
> +	}
> +
> +	ret =3D devm_add_action_or_reset(dev, starfive_fan_tach_disable, priv);
> +	if (ret)
> +		return ret;
> +
> +	writel(STARFIVE_FAN_TACH_STALL_INT_MASK | STARFIVE_FAN_TACH_SLOW_INT_MA=
SK,
> +	       priv->regs + STARFIVE_FAN_TACH_STATUS);
> +	writel(priv->clk_rate / STARFIVE_FAN_DEFAULT_MEASURE_RATIO,
> +	       priv->regs + STARFIVE_FAN_TACH_MEASURE_TIME);

[Severity: Medium]
Could this code be susceptible to an interrupt storm if the bootloader leav=
es
the FAN-TACH controller enabled with unmasked interrupts?

Since the driver only deasserts the reset line during probe (and does not
assert it first), the hardware state might be retained from before the kern=
el
booted. Any read-modify-write operations on STARFIVE_FAN_TACH_INT_EN and
STARFIVE_FAN_TACH_CH_EN later in the driver would then preserve these stray
bits.

Once devm_request_irq() is called, any unexpected unmasked interrupts will
trigger. If the interrupt condition is continuous (e.g., a disconnected or
stalled fan), the ISR will clear the STATUS bit, but the hardware will
immediately re-assert it. Because the driver's ISR does not mask unexpected
interrupts in INT_EN (it only signals completions if armed_stall or
armed_slow are set), wouldn't this lead to an interrupt storm?

Should the interrupt and channel enable registers be explicitly initialized
to 0 before requesting the IRQ to ensure a known safe hardware state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824030234.9321=
-1-changhuang.liang@starfivetech.com?part=3D2
