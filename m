Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60635346E51
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136156; cv=none; b=oXA4cQnRYdyt8Y5oCxOyX7wAUP+vcoLpU24LvESIoa4FKFiM8GaMIaa5+98H7vSNz3vMHl0GkIqYvNcKeMDQFXIaXUL29E1GoseQhUHHuWB2rR76od9hFkf84YE28o0GcBkB1kCgQAfmpaBdaAn8qx7iE+lYXVz02v5BpgJGdPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136156; c=relaxed/simple;
	bh=/46M2CYYJU0R/H2rSKaLG+vaEmBI6UK/yCzEytCcpos=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OFtiCS3tcwP35op9vxboL9fm2IGViw/Z4zeBKN6vt4Z1ahEMGAvTNV+C8A2MPZmyUHPLc9HCJ/SKM0aJihgy5Bze1cfxtjljGGxu7ZDy7sCOzJrqpMI1dSKv/tq8KESxAN+m6GiZ6BdHswEmjvNPqOw8rgEsuqapLAg5jB9Iak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Npo56CBq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Npo56CBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87581F000C6;
	Fri, 16 Oct 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792136155;
	bh=RURG27krgOjGNFD+Dd22158CoSY2hpRGbRyKa8+iTEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Npo56CBq6xfBaxCoFpw4imHLqndjJiCE3IBQiH2Q4wydF0K3nGFXyesCXN7E5pgHQ
	 SJoZnFNknZrxcAlF8108t9Uxnn1VgtJk33B+R2mrzgjI0TEdLoVZZOgmw0RtDv2rac
	 XM4gRuMP1SkDyMCwpBGWWzV4CPw/opb/V9QvrwJ15ozPaibmhug2Z8eyUg+4Y8UQ1z
	 dOl6depeoDTp5N4sYfvpf+VIGlyCfWBYCAMtXkIc5G+XtBszQ+r91/0c9KDVlcP0VD
	 ojrXNxcFDfiHbOBzeJKDrBD1C6PtO61TajE1E5p1Yye2+qmoHBHCnKlYrz0jwnvIZx
	 /QPbIgo3cez3A==
Message-ID: <sashiko-outbox-173940@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp108) add Rust TMP108 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: skxby <2374604267@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_EF01D718C016C6E011BFDF39B38933C0A807@qq.com>
References: <179213545522.40444.8748988877722946371@qq.com>
 <tencent_EF01D718C016C6E011BFDF39B38933C0A807@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:35:54 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] hwmon: tmp108: panic via arithmetic underflow in write_update_inte=
rval()
- [Medium] hwmon/tmp108: missing hardware initialization in init
- [Low] hwmon: hardware monitoring driver registered from outside drivers/h=
wmon/ violates layering
- [Low] kconfig: SAMPLE_RUST_TMP108 tristate config depends on HWMON=3Dy pr=
eventing module builds
--

commit 78120c93b1be27841c1bf9909b41399a14b830f6
Author: skxby <2374604267@qq.com>

hwmon: (tmp108) add Rust TMP108 driver
   =20
Add a Rust driver for the TI TMP108 temperature sensor, mirroring the
existing C driver (drivers/hwmon/tmp108.c).

> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 31d62533ef25f..18df4282756c3 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
[ ... ]
> +config SAMPLE_RUST_TMP108
> +	tristate "TMP108 Driver"
> +	depends on HWMON=3Dy
> +	depends on I2C=3Dy

[Severity: Low]
Does this introduce a Kconfig regression? If CONFIG_HWMON=3Dm or CONFIG_I2C=
=3Dm,
this prevents the sample driver from being built at all, even as a module.

Should standard dependency strings like depends on HWMON and
depends on I2C be used to inherit module constraints properly?

> diff --git a/samples/rust/tmp108.rs b/samples/rust/tmp108.rs
> new file mode 100755
> index 0000000000000..a070547f29ee4
> --- /dev/null
> +++ b/samples/rust/tmp108.rs
[ ... ]
> +fn find_closest_descending(x: c_long, samples: &[u16]) -> usize {
[ ... ]
> +    while i >=3D 1 {
> +        let mid =3D (samples[i] as c_long + samples[i - 1] as c_long) / =
2;
> +        if x <=3D mid {
> +            let left =3D x - samples[i] as c_long;

[Severity: High]
Can this code panic due to an arithmetic underflow regression?

If userspace writes a large negative value (e.g., LONG_MIN) to the
update_interval sysfs attribute, it is passed unmodified to this function.

Subtracting a positive sample value from c_long::MIN will underflow here.

In debug builds or when CONFIG_RUST_OVERFLOW_CHECKS=3Dy is set, this
triggers a panic, crashing the kernel. In release builds, it silently
wraps around and sets an incorrect hardware conversion rate.

Could we clamp the value before subtraction, or use saturating math?

[ ... ]
> +    fn write_update_interval(&self, value: c_long) -> Result {
> +        let idx =3D find_closest_descending(value, &SAMPLE_TIMES);

[Severity: High]
Is it possible to pass an unclamped value here?

Since the value passed from userspace via sysfs is not clamped before
calling find_closest_descending(), an extreme negative value can reach
the subtraction above and cause an underflow panic.

[ ... ]
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
[ ... ]
> +        // Registration failure path: if `Registration::new` fails and `=
?` returns early, the
> +        // already-created i2c client is never unregistered. Such a left=
over client keeps the
> +        // bus address 0x48 occupied forever, making every subsequent in=
smod fail with EBUSY.
> +        // The failure branch must therefore unregister the client expli=
citly (cleanup on the
> +        // hwmon side is handled by the hwmon core itself).
> +        let hwmon =3D match Registration::new(parent, c"tmp108", Tmp108:=
:new(client)) {

[Severity: Low]
Does registering a hardware monitoring device from outside drivers/hwmon/
violate subsystem layering rules?

The HWMON subsystem guidelines state that hardware monitoring drivers should
reside in drivers/hwmon/. While this is a sample driver, directly using
the hwmon registration API from samples/rust/ bypasses this architectural
layout rule.

[Severity: Medium]
Are we missing hardware initialization for the TMP108 device during init?

Unlike the C driver, this code registers the hwmon device without enabling
the regulator or configuring the CONF register (e.g., writing
TMP108_MODE_CONTINUOUS and clearing TMP108_CONF_TM).

If the chip is in shutdown mode from the bootloader, continuous conversions
will not occur, and accessing sysfs attributes like temp1_input could
return stale temperature readings to userspace.

> +            Ok(hwmon) =3D> hwmon,
> +            Err(e) =3D> {
> +                // SAFETY: client was created successfully in this funct=
ion (non-null,
> +                // non-ERR_PTR) and is not yet owned by hwmon (registrat=
ion failed), so no
> +                // in-flight callback touches the pointer.
> +                unsafe { bindings::i2c_unregister_device(client) };
> +                return Err(e);
> +            }
> +        };
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_95E7F9B5CE2=
94CA4027A0CD4C550B454050A@qq.com?part=3D2
