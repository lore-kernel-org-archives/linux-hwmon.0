Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035F8F7D;
	Wed, 27 May 2026 05:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859829; cv=none; b=GJCHGyoox5SUBXh+ktQO5TYSQKJylcecC14HjJWC0ZT0OEv1QsqzZvxEy3tDxMSO2eeCtpd12e/IMUcx5U7HUH30BE5vTz3FeMBe3x4Hqkk3VINGu67jsQenGur4w6qk9DxYIsw9Cl9shAM3KfG6PalrvSWEFxr7A2RLFsqy16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859829; c=relaxed/simple;
	bh=gWRR3lFZteuSwPaDP846U+sIYk+e5paPuqAtxCkrqTM=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hN+8gMI63FaD6tv5ZMekYxqZZOf4o4y7qHyMoezb7NSqWA+tr9PLTEqAfO6/x94lGbj2Sg5AWqpyU5gDDX1RFExJfLUK/82wF7PR8x6KVLb+ImrCnCDg/yuXAsHNyQ+pm8p51M7K2M9JizNYY1wpPQtpipcXbz2cWaBTbq7N0/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSRyF5WU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSRyF5WU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B171F000E9;
	Wed, 27 May 2026 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779859827;
	bh=N12PznAmzQFrxom6G627P217T68RYNRBF6GT196WR7U=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=QSRyF5WURdNug8+a3+6Ph35MPTO18iSyOBcF2IESvxd46akOJWqRiY0iHfQTlwWtt
	 9JobSMm38p+3p0/v+D3YXj9+MQWukHiV5mmiIcQqE70DNUY0aZKbtmSOKbOzIPrcB1
	 qNIBRH9YlY0oag5ZGIedWvG71N9fKd4NgNnJHbNHUCXnYC6/8bXJLDIEm3IPCoAaZd
	 QtSeft+A9CVu6dcwe03j+5tKkd1tKAyszDAWU4NJUDbVQ40YDw+aC15xXqilqMb4rd
	 AyKpHVDFHlN4u6QFqJfO3lYj0roMs/gR/NwEqwMNYt3rvH4e7RxZTWUCasHSJry2j4
	 TsJiuJyzWgj1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527045409.9092-3-sanman.pradhan@hpe.com>
References: <20260527045409.9092-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 05:30:27 +0000
Message-Id: <20260527053027.86B171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Writing 0x20 to PMBUS_WRITE_PROTECT causes the PMBus core to lock =
sysfs configuration attributes as read-only.
--

commit 6a162d6f1757daa1f8dd5d77f833404928b847be
Author: Sanman Pradhan <psanman@juniper.net>

hwmon: (pmbus/max20860a) Add driver for Analog Devices MAX20860A

This commit adds a PMBus client driver for the Analog Devices MAX20860A
step-down DC-DC switching regulator. It registers the device with the PMBus
core and configures write protection during probe to enable configuration
access.

> diff --git a/drivers/hwmon/pmbus/max20860a.c b/drivers/hwmon/pmbus/max208=
60a.c
> new file mode 100644
> index 0000000000000..9af6888ed07e1
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20860a.c
[ ... ]
> +/*
> + * Writing 0x20 to WRITE_PROTECT disables all write protection except
> + * for the WRITE_PROTECT command itself, enabling configuration access.
> + */
> +#define MAX20860A_WRITE_ENABLE	0x20
[ ... ]
> +static int max20860a_probe(struct i2c_client *client)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_write_byte_data(client, PMBUS_WRITE_PROTECT,
> +					MAX20860A_WRITE_ENABLE);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to configure write protection\n");
> +
> +	return pmbus_do_probe(client, &max20860a_info);

[Severity: High]
Does this write to PMBUS_WRITE_PROTECT actually cause the PMBus core to lock
the sysfs configuration attributes as read-only?

The driver intentionally writes 0x20 to PMBUS_WRITE_PROTECT to allow runtime
configuration access. However, per the PMBus specification, 0x20 corresponds
to PB_WP_VOUT (BIT 5).

When pmbus_do_probe() is subsequently called, the PMBus core (in
pmbus_init_wp()) reads this register back. Seeing the 0x20 (PB_WP_VOUT) val=
ue,
the core sets the PMBUS_WRITE_PROTECTED flag in the driver's state. This
causes the PMBus core to unconditionally export all hardware monitoring lim=
it
attributes as read-only (0444) in sysfs, which seems to defeat the intent of
enabling runtime configuration.

If 0x20 is indeed a device-specific value that enables writes, should the
driver either set PMBUS_NO_WRITE_PROTECT via platform data before calling
pmbus_do_probe(), or implement a read_byte_data hook to mask the read? Or if
the device complies with the standard PMBus specification, should 0x00 be
written instead to enable all writes?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527045409.9092=
-1-sanman.pradhan@hpe.com?part=3D2
