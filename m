Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193F5964F0;
	Tue,  8 Sep 2026 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892908; cv=none; b=XT4+qqqghMQkrHFANjbZCdEC2BleyJK2wOd6/Z+kbCM58/euKNbYlo1iszptZYXP2LyN8n+p9Qg8TIendImQrwPoJ9VAKFvdDnfDiCLDAuAf+T2AbUn4MkbVYtRYbEVgzUi8wmiQG0hKAY1JeefhfODtRVnVGnxGhGshLZgHPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892908; c=relaxed/simple;
	bh=1+osHpM7F+GzLbAD5Ui/A1TJGShV3gcjsIx3ZeZpkZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tkIwH+uk/XjHwkS0/WcfgecfarbhQEX8h+mHrz46yPzGd1E2DsbpBRB/zngf9XTV8S+3W/W8TNHlC0Cb4DtcQ/ivVEa0MQW1iiW1DUc51YerVwxEGXaxSGTBgyktHib5V+Sv4AXUR1WXeOH11pB/uzyNws9Bv111lJYm8wfw5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQwGLwzG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQwGLwzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946C91F00A3A;
	Tue,  8 Sep 2026 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788892904;
	bh=cdDPu99+fYDI6hHUgiE4AM0DAULGbVpTw9Hh/ZFlDhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQwGLwzG50XtxN3cW/9SVNHUj5Hl8symxvv37PBuTt7wS60PGpSO4nsQp/0oiAJtT
	 6P92OOkbZ38T+VBIF4ktRot8uLme6Xsd2DemyIXXIOU9DKuhZDdWiYp+6fVAG7o2xD
	 XJqIwWpOgrwnQHsCXzgMiJgn7jafmCb3tjKRuftyZbYPQdZOj39hzdyfiO0Um5B1z1
	 x7X3LO/UUlmFBpXMMSTwmwXDJm4XqSGPmJzqLZYSROCNbbgHi6tPvVLGQjiymtYTAw
	 TmzQ1lXHttI2Qcd+vITPRB/I6y4D40ZkGQPhtEKv8BiO7PYudLFkF012DWMhKNOy3W
	 j0NiaC68APChg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908183403.2107-3-okerixx@gmail.com>
References: <20260908183403.2107-1-okerixx@gmail.com>
 <20260908183403.2107-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 18:41:44 +0000
Message-Id: <20260908184144.946C91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver registers a hardware monitoring device directly from =
the platform subsystem instead of using an auxiliary device driver in drive=
rs/hwmon/.
--

commit e4cf7bc1c28af5add49d271e2e8e75723c9146db
Author: Oleg Keri <okerixx@gmail.com>

platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

This commit adds an embedded controller driver for the Lenovo Yoga Slim 7x
Gen 11 laptop on the Snapdragon X2 Elite platform. It exposes hwmon channels
for thermistors, battery cell voltages, and fan speed, as well as an LED for
the keyboard backlight and hotkey input events.

> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drive=
rs/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
[ ... ]
> +static int yoga_ec_probe(struct i2c_client *client)
> +{
[ ... ]
> +	dev_dbg(dev, "thermistors present: %#lx\n", ec->temp_present);
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", e=
c,
> +						     &yoga_ec_chip_info, NULL);

[Severity: Medium]
Does this bypass the hwmon subsystem maintainer review and violate subsystem
architectural layering rules by registering a hwmon device directly from a
platform multi-function device driver?

The driver registers a hardware monitoring device directly from the platform
subsystem. Should this hardware monitoring functionality be implemented as =
an
auxiliary device driver residing in drivers/hwmon/ instead?

> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ec->kbd_led.name =3D "platform::kbd_backlight";
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908183403.2107=
-1-okerixx@gmail.com?part=3D2
