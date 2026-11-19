Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125788;
	b=nSCGH/MU68mvY2koHVEJ+svJA209ay66MDwHKUF18HkbnR4SAJUvndWmKJxMpnd+UOok
	 WKAbW84FkOZxHNYdUfdkNIUAV8DZPxYP5bmpx0MZmDl3VZy6R9e0gzWj/XL+dHB83n25u
	 49ViMOuwb9s38aAYZQzeZ2W//B6i/zGmFx7vk2ysEhsjrru+fFJHfx9gFAyiFwDmFxc4l
	 sR0IQCT5lQ/+FZ9uS63cHqGiEgELdxucBetA/t9IJAZeUViLxOdWsuf7UcJj5+00tpkB+
	 fSHlBJpMjqNINIhz6l7267ADIlDQzUPaC6Ro2/G5jSZv1L5vk/fyYm7DdtNcbnIMFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125788;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T+BtotFk6Muu6kDXeywZntoBMZw/Y8waxgnegrAb+ms=;
	b=YRFWKt9QGRwf0dbDV4LjVrY8ti7OCh285UShcvjMxnZQFYR9NiUIXYTU3U4TgMghbdQt
	 Bd8Ky16rK2BmKW6+0ljmLnXqk/yJrNxgdhAOUOgwXnTqgWX26ID07JCLPCAVqqcU0Z0U0
	 rQjI330eRD3MXtucDzvP1k+Q5o4F9YJzs8YDp97xAVaL01AzMUZYd7olbgKa7H4R0o7HE
	 lwxYoJsQhrchk/8feafheTjd7XiAA3VGbXpDPRc2xV/UQeJj7P9lLpP25sEu/jvFnLJLa
	 RTWdOAbxDu/RJVPP1hjPzxI/qtZQzCJHblaGmM4yLsJw237lVXZT8dyESRncUYFB32A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLVHs6Oe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08616606A325
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLVHs6Oe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543C61F000C4;
	Thu, 19 Nov 2026 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125787;
	bh=T+BtotFk6Muu6kDXeywZntoBMZw/Y8waxgnegrAb+ms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CLVHs6OeQRw0hz5JS4KK3dsmdUgHTXKxhq8oSFv6+5nwLuBwLxd9Isq1L0c9Pe8gH
	 kDvH035viQ8ccAQbHFWpdxtQrCwA2CcFPcQKiQFvUa+IZ1OQ/cuHyXBI3Ahv4YEWBI
	 HIzu1tyMPMDftQei++ndHHXJtGU1/dTSsXEItnQFKQcbzMFzJFMqKJb5Uia35Jm9zg
	 kboF3mBJSvaVLgmi8Y72GUixgPOX1p4M5wk8rw/uiV7rEyOFLsP+S54CEYywo6birL
	 kH3Qr8hYMbrLJKNoSL79xaWOelIHXd/N5jm27f+1bSyYtyrZXU1JtkoJvOUsqPESlZ
	 Isl+XoLIy2lzQ==
Message-ID: <sashiko-outbox-224116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] hwmon: sy7636a: read the temperature only while the
 rails are on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119215405.20596-1-pmazzini@gmail.com>
References: <20261119215405.20596-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:03:06 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The driver enables VCOM at probe, which keeps the panel's high voltage
> rails on for good. Read the temperature only while the rails are on, when
> the chip samples it, and return -ENODATA otherwise. Read power good with
> it in one transfer, so the value can not be from before the first sample
> or after the rails went off.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119215405.2059=
6-1-pmazzini@gmail.com?part=3D1

