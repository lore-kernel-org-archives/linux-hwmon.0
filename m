Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C244B8DF0;
	Wed, 19 Aug 2026 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166837; cv=none; b=VNqL2baUdqXi/38fjh3XvZEwXOJnpoZLcljko1IXx+ytI+BphwCP2HkvNwrd4jcFzxCjsdSFJRnapdXb2eL28/aQ9dIrg42jAniSbU26M2ZOhNN/RPQVggEw4dJ6CjOmBN9qKjx/Jjr+c6mrZ0MFxmyrO/lkUwsA72aHlZAFajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166837; c=relaxed/simple;
	bh=EP12BeSUzJbLFY9oS4uFKQrRP76fUxEv3k+4S3SBSzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SpAKEK/ycCCKLwdf8VgbvDstOsufgUNS0voYhiEjpdnyiKx/OlSeEw8kE7T8Xch7RCaBKaeab0QNPmBTGJl52bRUBP1Ldb6vlbXdlzulFWJNL1Ry9tdxoRH6bCyyGy6bc2aIi/tnZ/gHPISq61JbGpcjBRgYXUenKT8SpjYHgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwAauSMP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwAauSMP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FD21F000E9;
	Wed, 19 Aug 2026 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166833;
	bh=LzBigPmBT6t0JrLHKjptvLNyTJEc7gOLNoyrVB2bYTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwAauSMPXFF09E2bzZg/NyyiWCiqojM5uuTHtXjnDIkJxxIg62w1+JSbOnMpmc4NW
	 r88E+afUDFikSP/pIx5ES/fpLSJ92SbW7/3a0VcRXnridhpW5y8QJIKrVxL0xOvEhM
	 U3MHjDXV+VhAUFjj8USU6qH6+4nCVuUkQ18oibHV1e/tmJfLiApRT/4NcSWUasOHBY
	 HsF/0NI0djFExrZhkDsl8vwbKW7KGHRBJPtma0Q+0ChtipMwxL3cYWez4uxOxlgNw/
	 lpkFwa5eke4paS+lOH7FgqmSA3dZ+ZXL513qCwEfidNFREf014ydCRiiJmGKHIpI2S
	 KDxch3hathf7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 5/5] spi: amlogic-spisg: Make sure
 clk_init_data is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-hwmon@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:13:52 +0000
Message-Id: <20260819191352.F3FD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Severe imbalance in clock prepare/enable counts for `pclk` and `co=
re` clocks, leading to negative enable counts and warnings during driver pr=
obe failure or removal.
- [High] Missing cleanup for runtime PM and `sclk` clock on the probe error=
 path and module removal.
--

--- Patch [5]: [PATCH treewide 5/5] spi: amlogic-spisg: Make sure clk_init_=
data is fully initialized ---
commit aa4fc6e665f6f8293335c8edd96584e8cdda40c6
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: spi: amlogic-spisg: Make sure clk_init_data is fully initialized

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need. However,
not initializing all members may cause subtle issues.

Fixes: cef9991e04aed330 ("spi: Add Amlogic SPISG driver")

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index afc8af04638d3..9049a87e9d0f2 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
> @@ -636,7 +636,7 @@ static int aml_spisg_target_abort(struct spi_controll=
er *ctlr)
>  static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *=
base)
>  {
>  	struct device *dev =3D &spisg->pdev->dev;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk_divider *div;
>  	struct clk_div_table *tbl;
>  	char name[32];

[Severity: High]
This is a pre-existing issue, but I noticed a severe imbalance in clock
prepare/enable counts for the pclk and core clocks.

In aml_spisg_clk_init(), pclk is acquired with devm_clk_get_enabled():

	spisg->pclk =3D devm_clk_get_enabled(dev, "pclk");

But later in the same function, it is manually disabled:

	clk_disable_unprepare(spisg->pclk);

Since pclk is managed by devres, won't this manual disable unbalance the
clock enable count right from the start?=20

This pattern is also repeated in the probe error path and remove functions:

drivers/spi/spi-amlogic-spisg.c:aml_spisg_probe() {
...
out_clk:
	if (spisg->core)
		clk_disable_unprepare(spisg->core);
	clk_disable_unprepare(spisg->pclk);

	return ret;
}

Does this cause double-disables and negative enable counts when the
devres cleanup runs?

[Severity: High]
This is also a pre-existing issue, but I noticed missing cleanup for
runtime PM and the sclk clock.

In aml_spisg_clk_init(), sclk is manually enabled:

	clk_prepare_enable(spisg->sclk);

And in aml_spisg_probe(), runtime PM is enabled:

	pm_runtime_enable(&spisg->pdev->dev);

However, if devm_request_irq() or spi_register_controller() fails, the
out_clk error path simply returns:

drivers/spi/spi-amlogic-spisg.c:aml_spisg_probe() {
...
out_clk:
	if (spisg->core)
		clk_disable_unprepare(spisg->core);
	clk_disable_unprepare(spisg->pclk);

	return ret;
}

Doesn't this leak the sclk enable count and leave runtime PM enabled?

Additionally, aml_spisg_remove() also lacks a pm_runtime_disable() call
and skips disabling sclk if the device is not runtime suspended. Should
there be explicit teardowns for these in the error and removal paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.gi=
t.geert+renesas@glider.be?part=3D5
