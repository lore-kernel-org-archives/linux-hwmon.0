Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF11E7C23
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Oct 2026 04:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606088; cv=none; b=jpb6dnnnn745gqb+/l1NHODXN8wNIwvDgwusx3qbx/j9NZQXnYt4cka40guys2obWyhsu7/vITsKcquYxNVsNOsBhqG0mopyAO0zQBIJ0Igkny5aMxCMzqvfGmix9QLUhaThBBbkMp6lYJSF5ZE7uKQ37MyIbneIwOhlqmynUcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606088; c=relaxed/simple;
	bh=Vce7HUcv9tzwpzsZWgEO+lBLTV77fR9/p++N5BYz+D8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nHFmWr2fm50x1WMwJtuA5XYBNiT+ufrPuMjmhJTREfBOjdJ5ldIIaLPVkM5leO0IFwCuOHJjeYC8mWyghDxkGxWX5fZSAuj1S3VP6pYxKf4L8fiXJtYpP4IL6ALt1CkKhhAl+xBI2E6FC5hKe7Oo3Bsia6brc/jYm/srROI0vNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emBjKtPL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emBjKtPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32C01F00893;
	Sat, 10 Oct 2026 04:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791606087;
	bh=OaHy25rculwq2cCo9yOXWKyrD4F80au5kSnRpG8tZT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emBjKtPL8yCY3sGbDB/jittTVvwy8m13BsDNLsfOvIk6Rk1wGtZZLdjt3he/xYP59
	 AxkV9B8FQpv5h9jEqV+aMSK2EqqBuDQoCHV7HVTz6yW4QurvNYSpQKoZmn26EtYHxh
	 zOb7aRzy8beI9+y11EgYP8iGqB1JhbnL9EXGzIaChICK9CyuPqlHD7x2hBVHnX0IvY
	 CC7KsZJOsG4w/++phYVJIKr1sxbLUmNfKPoEnnMrMPMKP/QXoB3kIiVD/qBf9lAgCS
	 CMQzJblW09r7H+Qp2Oc9Y8CGMQHmbo0JHEE+eDCqLfaueNGWxB28lKCFnmbbBYCG+g
	 X7LjH5+/L0TqA==
Message-ID: <sashiko-outbox-166253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire 14
 52MT and 52M fan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ethan Jimmy" <duhxu0@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261010041313.34153-1-duhxu0@gmail.com>
References: <20261010041313.34153-1-duhxu0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 04:21:26 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: architectural violation of HID layering rules
--

commit fa48d917bd5280e6dd85fd709932750623717a15
Author: Ethan Jimmy <duhxu0@gmail.com>
Subject: hwmon: (acer-aspire14-ec) Add driver for Acer Aspire 14 52MT and 5=
2M fan

This commit introduces a new hardware monitoring driver for the Acer Aspire=
 14
AI series (A14-52M and A14-52MT). It reads the fan speed via an I2C HID
embedded controller that also serves as the system keyboard.

diff --git a/drivers/hwmon/acer-aspire14-ec.c b/drivers/hwmon/acer-aspire14=
-ec.c
new file mode 100644
index 0000000000000..9d100f2a0b807
--- /dev/null
+++ b/drivers/hwmon/acer-aspire14-ec.c

[ ... ]

> +static const struct hid_device_id acer_aspire14_id_table[] =3D {
> +	{ HID_I2C_DEVICE(ACER_ASPIRE14_VID, ACER_ASPIRE14_PID) },
> +	{ }
> +};
> +
> +static struct hid_driver acer_aspire14_driver =3D {
> +	.name =3D "acer-aspire14-ec",
> +	.id_table =3D acer_aspire14_id_table,
> +	.probe =3D acer_aspire14_probe,

[Severity: Medium]
Does this driver architecture bypass the HID subsystem layering?

The hardware monitoring subsystem guidelines state that if the main
functionality of a chip is not hardware monitoring (such as a system
keyboard EC), its primary driver should reside in its respective subsystem
directory (e.g., drivers/hid/). The hardware monitoring functionality should
then be implemented as an auxiliary device driver residing in drivers/hwmon=
/.

By defining and registering a complete hid_driver directly within the hwmon
directory, this bypasses the HID subsystem maintainer review for the transp=
ort
layer integration. Could the primary hid_driver be placed in drivers/hid/ to
spawn an auxiliary_device, allowing an auxiliary_driver in drivers/hwmon/ to
bind to the fan monitoring feature?

> +	.remove =3D acer_aspire14_remove,
> +	.reset_resume =3D acer_aspire14_reset_resume,
> +};
> +
> +static int __init acer_aspire14_init(void)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010041313.3415=
3-1-duhxu0@gmail.com?part=3D1
