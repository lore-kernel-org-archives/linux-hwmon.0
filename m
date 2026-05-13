Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E720357D1D;
	Wed, 13 May 2026 03:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642120; cv=none; b=ExBWHkSNrE7YtL+WTgolcw8yydxR27ee6cxgIk5DAlxHAXou6n4Oz17SOg1hBJmJvlw5h+Ra1ogk9AmuEsUtpnYincpJIDCTNrUxFPrBbg8naLDnQ1ik38+Q6J/BAvCzYzMr34B16+amv4VxyT5Xbo4awZB/QqV5tcmuMXFp1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642120; c=relaxed/simple;
	bh=qjZxk3NJIUkHcbSaUwjIgtOxePWeZarJZ949FKDuPzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tacb4GIf995mfM+3Ox+5RLfyJjZsvINkpb1DJ2r4W4PS3UhkhTF0LCcLZbLElV+Q3UT+fNHgT3EhNmc4HJrooR788JmmQdAMMERQV5kaRVPvgOgslehotPyf4VHHTg3uRlsZbt4So2PsNjrgtk8xxMeKI442ELnegtPgv+Mw0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV1vHo4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV1vHo4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55BCC2BCB0;
	Wed, 13 May 2026 03:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778642119;
	bh=qjZxk3NJIUkHcbSaUwjIgtOxePWeZarJZ949FKDuPzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oV1vHo4LTHmuu3s6hLPqYyAXuxjBXqS17g8d0hhYYUSq9Xg+SyY/DTB5ia18aPxlw
	 5a0ey3zQTVRwKLVn0QwnGI/77udcad6BRhQ/oTrjIjYJ73VluJCEEm46T4vj8OMXFp
	 lkkR0102W9k6+W2/rER3oBU/dnvewCgZdMhHjAsVQgwAKRpIj9JjG0aHJ3wuR/yi7s
	 TrlAgV8rZISrfOV7dx1TwfbtBIOEg0xhOdB1KIRIHOHPbPeZuH2pEVJWpmEeA0KO1G
	 7FynHPwvwM346V9ADAmN+m5+xjcPLjTzzOi504aLSCtLDSvLr/M67FXtnKvNdh1kGE
	 6uIZ4G0IkZAMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260511-d1u74t-v1-2-623c2bc1532a@nexthop.ai>
References: <20260511-d1u74t-v1-2-623c2bc1532a@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 03:15:19 +0000
Message-Id: <20260513031519.A55BCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The driver fails to verify the number of bytes read (`rc`) from =
`PMBUS_MFR_MODEL` before calling `strncmp(buf, "D1U74T-W", 8)`.
- [Low] Copy-paste errors in `Documentation/hwmon/d1u74t.rst` for `in2_*` a=
ttributes.
- [Low] Inconsistent error handling styles for failure modes returning `-EN=
ODEV` in the probe function.
--

commit a76e770177dc6ee5472b638d5e12f032fd0a5cd5
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

This commit introduces a new PMBus driver for Murata D1U74T power supplies.
It relies on the core PMBus framework and checks the manufacturer ID and
model string during probe.

> diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.=
rst
> new file mode 100644
> index 0000000000000..f7786ebba0b47
> --- /dev/null
> +++ b/Documentation/hwmon/d1u74t.rst
> @@ -0,0 +1,97 @@
[ ... ]
> +in2_label		"vout1"
> +in2_input		Measured input voltage
> +in2_crit		Critical input over voltage
> +in2_crit_alarm		Critical input over voltage alarm
> +in2_lcrit		Critical input under voltage fault
> +in2_lcrit_alarm		Critical input under voltage fault alarm
> +in2_max			Maximum input over voltage
> +in2_max_alarm		Maximum input over voltage alarm
> +in2_min			Minimum input under voltage warning
> +in2_min_alarm		Minimum input under voltage warning alarm
> +in2_rated_min		Minimum rated input voltage
> +in2_rated_max		Maximum rated input voltage

This isn't a bug, but should these descriptions refer to output voltage
instead of input voltage, since the label is vout1?

[ ... ]
> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
> new file mode 100644
> index 0000000000000..3127e0e5a23de
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/d1u74t.c
> @@ -0,0 +1,85 @@
[ ... ]
> +static int d1u74t_probe(struct i2c_client *client)
> +{
> +	char buf[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };
> +	struct device *dev =3D &client->dev;
> +	int rc;
> +
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
> +
> +	if (rc !=3D 9 || strncmp(buf, "Murata-PS", 9)) {
> +		buf[rc] =3D '\0';
> +		dev_err(dev, "Unsupported Manufacturer ID '%s'\n", buf);
> +		return -ENODEV;
> +	}

This isn't a bug, but could dev_err_probe() be used here for consistency
with the other error paths in this function?

> +
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc,
> +				     "Failed to read PMBUS_MFR_MODEL\n");
> +
> +	if (strncmp(buf, "D1U74T-W", 8)) {
> +		buf[rc] =3D '\0';
> +		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
> +				     buf);
> +	}

Does this code evaluate stale data in the buffer if the model read returns
fewer than 8 bytes?

The buf array isn't cleared between the manufacturer and model reads. If
i2c_smbus_read_block_data() successfully returns a length smaller than 8,
strncmp() could end up comparing against leftover characters from the
previous Murata-PS string since rc isn't verified before the comparison.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-d1u74t-v1-=
0-623c2bc1532a@nexthop.ai?part=3D2
