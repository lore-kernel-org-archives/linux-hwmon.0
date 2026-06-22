Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D735028D
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137895; cv=none; b=O0uOHSp8UXgSvmYD9WrzRVDtPldGD2uCsjlbj/z+4yIaYIEUTApqzJJg1N9P55tmTfL+srBowaebNBdsVvyKVJZqKCoMLW1tKuchm9zOn/CfGVqNeYfsag4YZfSJVGWGdTmw9+wZ4Y89dyn/KxcDxOqglyrfM57AGcg25DOSSTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137895; c=relaxed/simple;
	bh=sA2Wx9zyMGOSPHR+PCepL19Hk2zrkNi1gllpoKp/SbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SuT0u3zPIHSQqMS0eT7gHnYTv6rlB8AMLD3yisA1Cx1YsjFnpxnz+cH/27p1xBVL4dU34a8Q3IFip1nubWY0gnI+UzAQII5yqbCF75x7xbjzG0G6byy8NwP6mYYRTwwMqSQjPjVWtC6rLvWeq5rXEuJAd+JUeYJkNDNmAe1gRtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZOq/x43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZOq/x43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0701F000E9;
	Mon, 22 Jun 2026 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137894;
	bh=aMvdsXdmsdrORRcygA6pXHT5vX92NBO53oYL+5tV6bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZOq/x43KsVxFW4G4JpJS0z5J4ZuLyS+lfIf89mt3rKDMNezOTKv9MRnnc8uOWQ5D
	 URIHI3Hn6S/kSwsyqglRbeYf6vL6yvQTLMHBPr0So6jxHj5JiV5gjaQl/b/YT9aNVC
	 il2bhsxhJAtHB5nHj3+pm8ltpVXTjKzdy4yWoMBplPY+rToFVUtwV/p6EvkBUHufMp
	 bO8T8P0L1cCvBFRaV30lE/tKAvjb44GH6XW1UETxbRFGwVZJ/Rsi1Y9pnaIYpTxuq+
	 0NAyImMnHDQEdnrGNeHxRd/ysT90TK9Sl357LWZT8buW5wgIuFTZ9LnvnK5BT7Ueh0
	 qXOQo8BTwP6aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] hwmon/misc: amd-sbi: Move sbtsi register
 transfer to core abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-4-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-4-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:18:13 +0000
Message-Id: <20260622141813.EA0701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Using `select AMD_SBTSI` in `CONFIG_SENSORS_SBTSI` bypasses the de=
pendencies of `AMD_SBTSI`, which can cause Kconfig warnings and linker erro=
rs (Build Failure).
--

commit 244321241d8d6647a9adc1fb143dcedb41e11593
Author: Prathima <Prathima.Lk@amd.com>

hwmon/misc: amd-sbi: Move sbtsi register transfer to core abstraction
   =20
Move the I2C read/write byte operations from the sbtsi hwmon driver into
a common sbtsi_xfer() function in tsi-core.c. This decouples the hwmon
sensor driver from the underlying bus transport, preparing for I3C
support in a subsequent patch.

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> new file mode 100644
> index 0000000000000..6ef1831515bbb
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi-core.c
> @@ -0,0 +1,30 @@
[ ... ]
> +/* I2C transfer function */
> +static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 reg, u8 *val, bool=
 is_read)
> +{
> +	if (is_read) {
> +		int ret =3D i2c_smbus_read_byte_data(data->client, reg);

[Severity: High]
Will this lead to a linker error (undefined reference to
i2c_smbus_read_byte_data) if a user configures CONFIG_SENSORS_SBTSI=3Dy and
CONFIG_I2C=3Dm?

The Kconfig option SENSORS_SBTSI uses select AMD_SBTSI but fails to
mirror the dependencies required by AMD_SBTSI (such as depends on
I3C_OR_I2C and architecture restrictions like depends on ARM || ARM64 ||
COMPILE_TEST).=20

If CONFIG_I2C=3Dm and CONFIG_SENSORS_SBTSI=3Dy, Kconfig forcefully sets
CONFIG_AMD_SBTSI=3Dy. This triggers an unmet direct dependencies Kconfig
warning, and since tsi-core.c is built-in (y) while I2C is a module (m),
it breaks the build.

This problem was introduced earlier in the series, but it remains
unresolved at the end of the series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D3
