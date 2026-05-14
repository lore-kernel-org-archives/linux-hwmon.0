Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649B1A683C;
	Thu, 14 May 2026 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719396; cv=none; b=cOulGWF7mZQ7lely6YHr82yr0aaAwjeMIWWBgmQpTJ3yquoV/bG0xzuFrI6meK+nkLUsbsXCkh9FYwLf0vfo9JeJ57l5BDJ4VOYrZtA6MlN6IUXAgHsPeSbf+QwRoJVR4ywrK2ZE8hIKRHX17PIsqtXILFfRwL3eg0Huvz5Wusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719396; c=relaxed/simple;
	bh=njUG4gtX0gjjaL4ssT35jpzwhO2AkUWQoMd2hjUQoGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X9YexGkq1b5lLdhVur0Xuzi8hKBzjExXKbREPShXSZRrlRuCjj/RrPJAjqWC2yD91P1lM71YPG+3VPFz6KaXPab7HpPa8z3Oll06qwFobKPVTCJwlx6Tz6l5GPW3+NfWy5mZJoh+uuvXe2EjmAROFcxMjqp+3+vvPOqk3/A6n64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t06+8Y3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t06+8Y3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E27C2BCB3;
	Thu, 14 May 2026 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719396;
	bh=njUG4gtX0gjjaL4ssT35jpzwhO2AkUWQoMd2hjUQoGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=t06+8Y3kZjJCJ2qeaBS72SEeCwrKe0JtKatZLYdSjTotSIbkh4kRJLZ3sXTFc6XAL
	 GskzZ3Hh/BkBdJIFVbBTtmTxIoSpozdz7FBqFx1EVUzu9eYyzlokZB0TqGEpNv+qLM
	 aCbuU8MZ0pEquuH5PkbcSLixGhZYByZdv7a1eo8uDkfSZxx+EKoQ27eCfHHlQlWmTG
	 2DCgyauILWDy6nU4D+uMOg3sjx8p7Qiy45ERusqK/1xC4ZfF/R3Pfzt5/skl22qIfu
	 97N47PBlbrI+VlB1E7OlhXfBZAEYSGq7NkFsHFpANGEEGSUyZAOrLeSem8oyTxknYb
	 RRuoMPhSue91w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-d1u74t-v2-2-431d00fbb1c4@nexthop.ai>
References: <20260512-d1u74t-v2-2-431d00fbb1c4@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:43:14 +0000
Message-Id: <20260514004316.47E27C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Brittle validation logic due to missing read length check for PMBUS=
_MFR_MODEL.
- [Low] Copy-paste errors in sysfs documentation for `in2_*` attributes.
- [Low] MAINTAINERS file entry breaks alphabetical ordering.
--

commit ec60b1738fafe62da18eefb7e9b1f9a12b6a9113
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver

This commit adds a new PMBus driver for Murata D1U74T power supplies. It
registers the device with the hwmon subsystem and provides documentation for
the driver's sysfs attributes.

Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@int=
el.com/

> diff --git a/Documentation/hwmon/d1u74t.rst b/Documentation/hwmon/d1u74t.=
rst
> new file mode 100644
> index 0000000000000..7362e56e76a71
> --- /dev/null
> +++ b/Documentation/hwmon/d1u74t.rst
[ ... ]
> +in1_rated_min		Minimum rated input voltage
> +in1_rated_max		Maximum rated input voltage
> +
> +in2_label		"vout1"
> +in2_input		Measured input voltage

This isn't a bug, but is there a copy-paste error in these descriptions?
Should these be documented as 'output voltage' instead of 'input voltage',
since the label is "vout1"?

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
[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a3865..28ca8e0353124 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6803,6 +6803,13 @@ S:	Maintained
>  F:	Documentation/hwmon/crps.rst
>  F:	drivers/hwmon/pmbus/crps.c
> =20
> +MURATA D1U74T PSU DRIVER
> +M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/d1u74t.rst
> +F:	drivers/hwmon/pmbus/d1u74t.c
> +
>  CRYPTO API

This isn't a bug, but does this entry break the alphabetical ordering? It
places an 'M' entry immediately before the 'C' section for CRYPTO API.

>  M:	Herbert Xu <herbert@gondor.apana.org.au>
[ ... ]
> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
> new file mode 100644
> index 0000000000000..3127e0e5a23de
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/d1u74t.c
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
> +
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	if (rc < 0)
> +		return dev_err_probe(dev, rc,
> +				     "Failed to read PMBUS_MFR_MODEL\n");
> +
> +	if (strncmp(buf, "D1U74T-W", 8)) {

Is there a missing check for the read length in rc here?

If a short read occurs, could strncmp() evaluate the newly read bytes
combined with stale memory leftover from the previous PMBUS_MFR_ID read?

> +		buf[rc] =3D '\0';
> +		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
> +				     buf);
> +	}
> +
> +	rc =3D pmbus_do_probe(client, &d1u74t_info);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-d1u74t-v2-=
0-431d00fbb1c4@nexthop.ai?part=3D2
