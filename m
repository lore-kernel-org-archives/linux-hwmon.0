Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7135E2FE060;
	Tue, 22 Sep 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096803; cv=none; b=MHXsHIlnWY2/5O70audxCAwxjVatWL5zm73HxA2EJMldJwyVZC5YUg5EuSmQ6enH2vncEAous20CxFXfGJxbyaNDEAHQJNkASv1JayBJzyosNfiaZpD9bEAjc/ZZGeGv/qAE6OhP/UvZjspXEYvaPfXXm6ACIFwWrgiPDY5nuXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096803; c=relaxed/simple;
	bh=Ov2b86dC507G6BGRsSXQE6BgR/Y21isTMrUWiliPpwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gkqwHEIHyl8y/fZ2N/FqpJFh0BJJ8bEiSC1zk2w7eEGvnERjGugYOP+23+CjU8WSIb6G61oVtbJpj5EBrPRgIgseh9bpxawaJI18i1USaGrwCwsoRHgS3VSug6lfCX7WBtq2qKfySkM4ToSQy+oXaJAY0/X60MflojZVH4mVsOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxkbwLoV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxkbwLoV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E8B1F000FF;
	Tue, 22 Sep 2026 17:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096802;
	bh=TBChUqzt80rAa+G5CpFUfu65jXW29h6Fg2OgGocDwT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxkbwLoVuWulUxgEcn2zGg8jd5POpvVtOxWgEK72FVm7XCr7fzxn1A8EW6+LysAON
	 PX+TqPZtajf4y9wi4sjkholmQBu2aQET2nd1seDcHLQz5MurfXPlz9C3GHIhpripsE
	 TsTiH3YX1DyURGydGgGGm9ionQvcWuJXvgk/I0jyCaHzoQnHJumqDQzrWQKR3HTpRL
	 8PH4uANvwi+uAzbXeId2Gf6YPw0dSsDMKH+xtAPjaFiDWxh1c+7Ylftigoikxxlq84
	 n0zLovXymn1TRiiuSyMkSWo7gnjJOZjethnC+9gRWmBgPdATT/2ptErqole4UgSil7
	 6e+y019Cgckag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922165737.260443-3-okerixx@gmail.com>
References: <20260922165737.260443-1-okerixx@gmail.com>
 <20260922165737.260443-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:06:41 +0000
Message-Id: <20260922170641.B9E8B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: subsystem layering violation by registering hwmon device =
from platform driver
--

commit fad2a849321ec9af59f9a8420c3cb98f8ed6865e
Author: Oleg Keri <okerixx@gmail.com>

platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

This commit adds an Embedded Controller (EC) driver for the Lenovo Yoga Slim
7x Gen 11 laptop on the Snapdragon X2 Elite platform. It provides access to
thermistors, battery cell voltages, CPU fan speed, and keyboard backlight
control over I2C.

> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drive=
rs/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> new file mode 100644
> index 0000000000000..a16849877dd7b
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
[ ... ]
> +	if (!ec->temp_present) {
> +		return dev_err_probe(dev, -ENODEV,
> +				     "no thermistor reported a usable value\n");
> +	}
> +
> +	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", e=
c,
> +						     &slim7x11_ec_chip_info, NULL);

[Severity: Medium]
Does registering the hardware monitoring device directly from outside the
drivers/hwmon/ directory violate the subsystem guidelines?=20

The HWMON guide dictates that hardware monitoring functionality in
multi-function devices should be implemented as an auxiliary device driver
residing in drivers/hwmon/, and that registering from outside this
directory bypasses maintainer review.

> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ec->kbd_led.name =3D "platform::kbd_backlight";
> +	ec->kbd_led.max_brightness =3D SLIM7X11_EC_KBLT_MAX;
> +	ec->kbd_led.brightness_get =3D slim7x11_ec_kbd_led_get;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922165737.2604=
43-1-okerixx@gmail.com?part=3D2
