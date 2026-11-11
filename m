Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415893;
	b=dtSPZLa0i2xrTYAv0Aoo4VlWlHXQy17FuPcGC+5IJhvz+bEJ/bRdPdDBBs8ElmXaDILp
	 2kFUql0HJHTJMKmItr/5Tgs9epCXbE0FmPfUIhVXE1b1jhVbjqtgj3Bm50Xwe1enUc0CI
	 xfO2BZHGD4m/tySliiQD7y+XEcyWO1DnDZ2Eit2iTHOVCqaVm1Dc6x4d9mFia4iguJlKT
	 F5WpFrLjI97Z+3jO+rXMzT1oaySNwJ1H9jyJxv47LrZWpdOjEr1PuUR+xNSttw7zuPulF
	 vpxT31e+26i/BfVhE25oMkN1BqrRyNKYPFluzSy8L0C4MgXQ3iAfWWgPBsQ/9lXazpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6rUXEd1YfhqmGM76L8N3C5HBkeLK3JVMf/Xxpe84k7Y=;
	b=w19wVhtV3c09GWzp+M7ChbR98t6ULOsoKqgOEgiKls4s1Z3Xb5zbwBhZDV/Id3VuF3U5
	 t3/S5WY3YBXGe9CtfosisdAMJL5LnqPZphiHXm0ZDlqvJhHhINd7Sasm2S3Pw+A+On8Mb
	 gp/6nUZ77DXYMOjoaIFSSZsxViwYUaCnSoeOk942M76q4/x60rJu+jtf6O6BYJ9Xd0Tck
	 Ydd8o+4mizJOdr1KSvTH0lmD+vspLUCXwIiwQITchyoumG2Grlgi1U9EJDtft9esrIN1n
	 YUxqK7XBLG9ogzk7gNjtg3K74WwT74avCRAQxBgwLvwnBlFZtAo4GABh94BQAoe5F/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekTKrlUS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F7606A321;
	Wed, 11 Nov 2026 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekTKrlUS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8713F1F00A09;
	Wed, 11 Nov 2026 16:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415892;
	bh=6rUXEd1YfhqmGM76L8N3C5HBkeLK3JVMf/Xxpe84k7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ekTKrlUSQRBh85WA8c/Zn6Ph22ARbS3HMDGUKDxVWY7SIwIPySQtEZ7qc66CBTqSd
	 HN/ctKsCOm2X1TsIE/pB8qkSwWHfZSy17KRsTXXahk2OTFFz7Axb4H/nUsk3DfHFJW
	 v9bAFNCqHWK9kUPLY+n+scrLi62AQ3UwjZyiCX4km0Glko5pY6dbmfl4yQsqt003Oo
	 HwVJdxnApGHjhGnUHOMGi70HrAFXDm2D6l7+1AyGguN+4jl+Ar4mToWxOEKe0RINyj
	 3dCO8xE1esgRx3BUJoZeACQ3PVr70M87Ax29GhbGXj7ZrYaGLmVXfNCeazV+VtIZpi
	 lCZTrJF2lVaig==
Message-ID: <sashiko-outbox-209333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] hwmon: Add Microchip LAN969x fan controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111161619.232141-3-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:51:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: lan969x-fan: separate __free() declaration in
  lan969x_fan_probe()
--

commit b2df768159182a27301144a0ba71d10e45a494fd
Author: Robert Marko <robert.marko@sartura.hr>

hwmon: Add Microchip LAN969x fan controller driver

This commit adds a hwmon driver for the Microchip LAN969x fan controller,
supporting tachometer input, PWM output, and thermal cooling.

> diff --git a/drivers/hwmon/lan969x-fan.c b/drivers/hwmon/lan969x-fan.c
> new file mode 100644
> index 0000000000000..fae0248658818
> --- /dev/null
> +++ b/drivers/hwmon/lan969x-fan.c
[ ... ]
> +static int lan969x_fan_probe(struct platform_device *pdev)
> +{
> +	struct thermal_cooling_device *cdev;
> +	struct device *dev =3D &pdev->dev;
> +	struct lan969x_fan *fan;
> +	struct device_node *fan_np __free(device_node) =3D NULL;
> +	u32 initial_pwm;
> +	int ret;
> +
> +	fan =3D devm_kzalloc(dev, sizeof(*fan), GFP_KERNEL);
> +	if (!fan)
> +		return -ENOMEM;
> +
> +	fan->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fan->base))
> +		return PTR_ERR(fan->base);
> +
> +	fan->pulses_per_revolution =3D 2;
> +	fan_np =3D of_get_available_child_by_name(dev->of_node, "fan");

[Severity: Low]
This isn't a bug, but per the cleanup.h conventions, fan_np should be
defined and initialized in a single statement at the point of assignment
rather than declared initialized to NULL at the top of
lan969x_fan_probe().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111161619.2321=
41-1-robert.marko@sartura.hr?part=3D3
