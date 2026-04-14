Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF7282F1B
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Apr 2026 04:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142607; cv=none; b=u+6Y0VA/R7CyGPyyBXnBKtaQrz9vZE7UlsEFpPEs9PwtwLbmvf6cCFAd7vGrHowy3gXfAqDq57xR75j0S82dnnB3QQ/IgZmScF6sEglgaMH8kHWExdgQGXqozyPF8UsAEXzMsOLjchi2ikd8u8yba2Ekxc6ZSouy6wHxUyubhS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142607; c=relaxed/simple;
	bh=aWOdx7dUk1e3yy6C2rFPbuKL0uneU7KcDAGx0q7VEjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/i3Buhabb6cG4xlIq6hxW6nOTxkIcnfuoSmQ6dhA+VhBsKt8YJdDfkuEgSK1HIZ/N/4WZlITqNF3xY5I6pPasLVECQ1YfnK6+HA2FKVPtJlde+9j5rYrcO3jPa1biRbpSpLSqrZoKd5iU7tOqj8F6ksHKn0Gvbh7UXh/cA780g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fD0FraQM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fD0FraQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AACCC19425;
	Tue, 14 Apr 2026 04:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776142607;
	bh=aWOdx7dUk1e3yy6C2rFPbuKL0uneU7KcDAGx0q7VEjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fD0FraQM7owBVGOmdLLG0878Pj4Dc6LyTgySuwJluPva4OpuiC3odv45CGoboY8LD
	 7NycfheQzb6lQBHoeqfZw5/5l4KiZ4c9bdTYwIyliXBbVxQaaAic0oKtIIYVALlon2
	 8raZ2OdWTWKY6XJymFK7BmLYFle4cEqFpzqvNfli25bIwrlx0et6RdJvqAEnnqXfHF
	 3HWMj8dTZGfEezcwpccpckf8tMNMXJUbf/U1oOPiZB+J8O6XsNKdgmuLqJitfPOBO9
	 +504Ry9m+vIUfwZOGEVbVJmNDayqqzx24RoV88XS8AsGwrQUtUWFdHsJl7dR64rT2y
	 aJ7UZQmjsDlcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) add driver for max20830
Reply-To: sashiko@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
References: <20260414-dev_max20830-v1-2-210d3f82c571@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Apr 2026 04:56:46 +0000
Message-Id: <20260414045647.4AACCC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [Medium] The driver incorrectly uses `i2c_smbus_read_i2c_block_data` inst=
ead of `i2c_smbus_read_block_data`, violating the protocol and logging an u=
ntrusted binary buffer.
- [Low] The MODULE_IMPORT_NS macro uses an unquoted identifier, resulting i=
n a build failure.
- [Low] The sysfs attribute `in2_alarm` is created but not documented.
--

commit 62ed9b8ac37c74adac303a0ebaea8df41fde6a85
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830) add driver for max20830

This commit adds support for the Analog Devices MAX20830 step-down DC-DC
switching regulator. It provides a PMBus client driver to monitor input and
output voltages, output current, and temperature.

> diff --git a/Documentation/hwmon/max20830.rst b/Documentation/hwmon/max20=
830.rst
> new file mode 100644
> index 0000000000000..b9dffb7605978
> --- /dev/null
> +++ b/Documentation/hwmon/max20830.rst
[ ... ]
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +in1_label         "vin"
> +in1_input         Measured input voltage
> +in1_alarm         Input voltage alarm
> +in2_label         "vout1"
> +in2_input         Measured output voltage

This isn't a bug, but since the driver configuration enables
PMBUS_HAVE_STATUS_VOUT, it will expose the in2_alarm attribute. Should
in2_alarm be documented here alongside the other alarms?

> +curr1_label       "iout1"
> +curr1_input       Measured output current
> +curr1_alarm       Output current alarm
> +temp1_input       Measured temperature
> +temp1_alarm       Chip temperature alarm
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> new file mode 100644
> index 0000000000000..bcf60fd948e34
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> +static int max20830_probe(struct i2c_client *client)
> +{
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +		return -ENODEV;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> +					    I2C_SMBUS_BLOCK_MAX, buf);

Should this use i2c_smbus_read_block_data() instead?

PMBus IC_DEVICE_ID is an SMBus Block Read command, which natively returns a
length byte followed by the data. Using the I2C block read API with a
hardcoded length of 32 forces an over-read and captures the raw SMBus length
byte in buf[0].

> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read IC_DEVICE_ID\n");
> +
> +	buf[ret] =3D '\0';
> +	if (ret < 9 || strncmp(buf + 1, "MAX20830", 8))
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unsupported device: '%s'\n", buf);

If the device is unsupported, will logging the buffer via %s print unprinta=
ble
characters?

Since buf[0] contains the raw length byte from the block read, this could
inject control characters and trailing binary padding into the kernel log.

[ ... ]
> +MODULE_AUTHOR("Alexis Czezar Torreno <alexisczezar.torreno@analog.com>");
> +MODULE_DESCRIPTION("PMBus driver for Analog Devices MAX20830");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);

Will this cause a build failure?

The MODULE_IMPORT_NS macro expects a string literal. Should PMBUS be enclos=
ed
in quotes, like MODULE_IMPORT_NS("PMBUS")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260414-dev_max208=
30-v1-0-210d3f82c571@analog.com?part=3D2
