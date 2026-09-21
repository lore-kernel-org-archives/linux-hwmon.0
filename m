Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD74A689F;
	Mon, 21 Sep 2026 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002806; cv=none; b=GaL2yL/9Pi7psxmy5xQ+tHurqA6AdvCYkVVwjMnyCkC42fJ9L9rfcFTHJ7wlwV3j6claV/ESH61SMN3XHa038I2Ak6zsA2hlRcSQEC+OEpoDQ2AXFtwb8O8PQST41UlaUPe+WwhUBBeBCdvkMB/Z1SHe7Wt/NS9aS8E2OmV+tm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002806; c=relaxed/simple;
	bh=MgyO3hmEeIytVk3leCcQz91+iE6VmtEbpqO37oSdE/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DtOtZJ9xivgTGsmGLbhBcDf/Da+tLIwzOC8JMEa2o28yaL3xPh5c+HV0vRe2o27BXkFx3l5JM15+S0h+p6bV2J5/3OGCrNZ7c8lTIJJ3yzoojRPb5OmCQyXrvffCC4AKEHiE2dZ9IU6aoys6Dc72POZLlrUZb2DF/aigVbYhGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Za4498Lx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Za4498Lx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC3D1F000FF;
	Mon, 21 Sep 2026 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002804;
	bh=zzmFwcjzl9NHlHx1BGHTl7M0L5n7hXhBp+Df5ZcaOfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Za4498Lx1h3vVRi2G/rdpzhuK38H8iYdGyjhDVaNS6Y8OjiPd+bvjf9xH5P3EiK7u
	 TnhRQk7jsrUOANeDHztUaLMqxc9MS2P+/0CnQyMl77bolzxnFMl6AY+M4eR5E4eI3g
	 E7FU5NAB3OuU6QegRoWAjxvlw0KWBC1hpvHIxVPm3Y/hiCwY9Fy94tC9sjyBThozic
	 wq/Zhd1cF9lHE1uSIPPo1vCPitkKda51z+Aq4KxFualLkYtlOLhRe1LvEsKkqS9jHS
	 THU3xXsAHKQulhQsG0KL2/yKd6rK/Z6cpgV3E2hOmqsMq5h82Dc6i9Towr4pAsEy4x
	 8EcUEvO8aoANg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260921144953.15113-3-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-3-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 15:00:03 +0000
Message-Id: <20260921150004.0EC3D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: platform EC driver registers hwmon directly instead of us=
ing aux device
- [Medium] i2c: device ID name exceeds I2C_NAME_SIZE causing truncation
--

commit a7a9ebb5757758e9760736e7550c333cea597cae
Author: Oleg Keri <okerixx@gmail.com>

platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

This commit adds an embedded controller driver for the Lenovo Yoga Slim
7x Gen 11 laptop. The driver provides thermistors, battery cell voltages,
and CPU fan speed as hwmon channels, alongside keyboard backlight and
hotkey controls.

> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c b/drive=
rs/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

[ ... ]

> +static int yoga_ec_probe(struct i2c_client *client)
> +{

[ ... ]

> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "yoga_slim7x_ec", e=
c,
> +						     &yoga_ec_chip_info, NULL);

[Severity: Medium]
Does this code violate the hwmon subsystem guidelines?

The EC driver acts as a platform multi-function device providing hwmon,
input, and LED capabilities, but registers hwmon directly from
drivers/platform/arm64/ inside yoga_ec_probe().

According to the hwmon subsystem guidelines, the hardware monitoring
functionality of a platform multi-function device should be implemented
as an auxiliary device driver residing in drivers/hwmon/ to avoid layering
violations and bypass of maintainer review.

[ ... ]

> +static const struct i2c_device_id yoga_ec_i2c_id[] =3D {
> +	{ "yoga-slim7x-gen11-ec" },
> +	{ }
> +};

[Severity: Medium]
Can this device ID string cause truncation and matching failures?

The string "yoga-slim7x-gen11-ec" is exactly 20 characters long. Since
I2C_NAME_SIZE is 20, the string literal fully occupies the array without
a null terminator.

During module build, modpost might read past the array generating garbage
for modules.alias. At runtime, the client's name populated from device tree
or ACPI will be truncated to 19 characters plus a null terminator. This
causes i2c_match_id() to fail because it will compare the truncated
runtime string against the unterminated string literal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921144953.1511=
3-1-okerixx@gmail.com?part=3D2
