Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19003379971;
	Tue, 28 Jul 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255884; cv=none; b=vBomKXA+ETbsagsw7S1aLsDacatUyAJ22sc9fm9jVDRTDcfSQOF34F6++TCR2Qi7JSUzSnuLeNn3DgzRm+W95VHdgPi/SWkY/rWUZmd8wWGN7x81FcDl8eUaMCIjfcj2+mijRKbqCV4RZFcvBRf5Ctpuq4WNrCIdW3vFAVWEIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255884; c=relaxed/simple;
	bh=HgAtOTBUFpDM/WUPni4bx+WutWwSjwcTiZ9INlQLSUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SyVs8pffD2U7kz6D8Cu+mR6G/UwlHqVJz5KRIUy9oDSzekmYkstMkFzGWn9sZDYFiLjI1J3ZDZDTjaqXsgTLP6INqwkyq7fzbg9EZVBSKWPO5KN/srmKu0m8ykeyTHxM5h3nOAnwob+yJ2QPcSa1O3hDmVG9wrbWhVV72J2tmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEPO1j1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEPO1j1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6FA1F000E9;
	Tue, 28 Jul 2026 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785255882;
	bh=DUsJqhwiY7imLNYcqi9EnMiY4ceXmWVmgWBm7qbp31s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEPO1j1hlcUvAS6r+Bl5hyWKkHiYQNotyNUzVbfhB+y8126O3b7YMEAJum1+oU2va
	 zq1vkGusGk17duCeMSZ+nB47nNrUvStthZaBXo72lCNFi4W3rutm04f5rcTa8rdMqF
	 WK6uUY6dxqZEgziwkDFbOhLebB+FmbbES1b48fNWeKalkTTEe0yEdwVANobHYdlQgj
	 Mzut+Zmg9rHo9N5e1jkvWY/VXy8dZBLFSfacTThgGRdmUmiKEvG4Or3WAKVKB2wshD
	 2cmCBEhoDEzaBDADcqMv8oaWzcHcV6twRQVAV5SyEjcFawkMh64mC0iljlB4C8HsrJ
	 hGk28wTKa3hfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:24:42 +0000
Message-Id: <20260728162442.7C6FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Fatal NULL pointer dereference during probe for devices config=
ured in page mode due to premature `pmbus_set_page()` calls.
- [High] The driver forcefully turns on voltage regulator outputs and uncon=
ditionally asserts hardware enable GPIOs during probe, bypassing system pow=
er sequencing.
- [High] Probe fails on AVSBus-enabled systems due to a missing register wo=
rkaround during phase detection.
- [Medium] Inconsistent register redirection in custom PMBus callbacks brea=
ks power limit configuration when Over Power Limit (OPL) is enabled.
- [Medium] Global PMBus commands in direct addressing mode are arbitrarily =
routed to a non-deterministic I2C client.
- [Medium] Hardware state (GPIO) is modified without rollback if the subseq=
uent PMBus I2C operation fails.
--

--- Patch [5]: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and simi=
lar devices ---
commit 8b8b70e16f48ffac7a09e30045ceff6976a47f0b
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
Subject: hwmon: (pmbus) add support for MAX20826 and similar devices

The MAX20826 IC and similar provide a high-density, flexible and scalable
dual-loop solution for high current cores for AI applications. These are
dual loop solutions multiphase voltage regulators. Between Rails A and B,
MAX20855B and MAX20908 supports up to 8 phases total configurable from
8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.

> diff --git a/drivers/hwmon/pmbus/max20826.c b/drivers/hwmon/pmbus/max2082=
6.c
> new file mode 100644
> index 0000000000000..1b481cdd8c930
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20826.c
> @@ -156,12 +156,12 @@ static struct i2c_client *max20826_select_rail(stru=
ct max20826 *st,
>  	if (st->client_b) {
>  		/* if 0xff just return the last client */
>  		if (page < 0)
>  			return st->curr_client;

[Severity: Medium]
Will global commands be arbitrarily routed to a non-deterministic I2C clien=
t?

For global commands, the PMBus core passes page =3D -1. When page < 0, this
simply returns st->curr_client without updating it, which holds whichever
rail was accessed last. If userspace reads PMBUS_STATUS_CML globally, won't
it only query the CML status of the most recently accessed rail, potentially
masking communication faults on the other rail? Similarly, will global write
protection apply to only one rail?

>  		if (page)
>  			st->curr_client =3D st->client_b;
>  		else
>  			st->curr_client =3D st->client;
> =20
>  		return st->curr_client;
>  	}
> =20
>  	if (!probing)
>  		ret =3D pmbus_set_page(st->client, page, 0xff);

[Severity: Critical]
Does this cause a fatal NULL pointer dereference during probe for devices
configured in page mode?

During probe, max20826_setup() -> max20826_setup_vout_format() calls
__max20826_read_block_data() (as seen below). The wrapper hardcodes
probing =3D false. Because of this flag, max20826_select_rail() calls
pmbus_set_page().=20

pmbus_set_page() internally retrieves pmbus_data via i2c_get_clientdata().
However, because pmbus_do_probe() has not been executed yet, clientdata is
NULL, leading to a fatal dereference of data->info when pmbus_set_page()
is called.

>  	else
>  		ret =3D i2c_smbus_write_byte_data(st->client, PMBUS_PAGE, page);

[ ... ]

> @@ -201,11 +201,11 @@ static int __max20826_read_block_data(struct max208=
26 *st, int page,
>  	struct i2c_client *rail;
> =20
>  	rail =3D max20826_select_rail(st, page, false);
>  	if (IS_ERR(rail))
>  		return PTR_ERR(rail);

[ ... ]

> @@ -396,17 +396,28 @@ static int max20826_read_word_data(struct i2c_clien=
t *client, int page,
[ ... ]
>  	case PMBUS_POUT_OP_FAULT_LIMIT:
>  		/*
>  		 * If Over Power Limit is enabled, PMBUS_IOUT_OC_FAULT_LIMIT
>  		 * shows the power limit and hence we need to report it
>  		 * properly in Watts.
>  		 */
>  		if (!st->chip_info->has_opl)
>  			return __max20826_read_word_data(st, page, reg);
> =20
>  		if (st->opl_enabled[page])
>  			return __max20826_read_word_data(st, page,
>  							 PMBUS_IOUT_OC_FAULT_LIMIT);
>  		return -EIO;

[ ... ]

> @@ -417,14 +428,14 @@ static int max20826_write_word_data(struct i2c_clie=
nt *client, int page,
>  				    int reg, u16 word)
>  {
>  	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
>  	struct max20826 *st =3D to_max20826(info);
>  	struct i2c_client *rail;
> =20
>  	rail =3D max20826_select_rail(st, page, false);
>  	if (IS_ERR(rail))
>  		return PTR_ERR(rail);
> =20
>  	return i2c_smbus_write_word_data(rail, reg, word);
>  }

[Severity: Medium]
Will writes to the power limit target the wrong PMBus register directly on
the hardware when Over Power Limit (OPL) is enabled?

While max20826_read_word_data() properly implements the redirection mapping
from PMBUS_POUT_OP_FAULT_LIMIT to PMBUS_IOUT_OC_FAULT_LIMIT when OPL is
enabled, max20826_write_word_data() blindly passes all writes straight to
the wire without interception. Should the redirection logic also be applied
to the write callback?

[ ... ]

> @@ -451,10 +462,10 @@ static int max20826_regulator_enable(struct max2082=
6 *st, int page, u8 byte)
>  	if (page)
>  		gpiod_set_value_cansleep(st->bvren, !!(PB_OPERATION_CONTROL_ON & byte)=
);
>  	else
>  		gpiod_set_value_cansleep(st->avren, !!(PB_OPERATION_CONTROL_ON & byte)=
);
> =20
>  	return i2c_smbus_write_byte_data(rail, PMBUS_OPERATION, byte);
>  }

[Severity: Medium]
Can the hardware state (GPIO) become desynchronized with the software PMBus
state if the subsequent I2C operation fails?

If i2c_smbus_write_byte_data() returns a negative error code, the regulator
core treats the operation as failed, but the hardware GPIO pin was left in
the newly toggled state without being rolled back.

[ ... ]

> @@ -807,11 +807,11 @@ static int max20826_detect_phases(struct max20826 *=
st, struct i2c_client *rail,
>  	if (!(ret & PB_OPERATION_CONTROL_ON)) {
>  		oper_save =3D ret;
>  		ret |=3D PB_OPERATION_CONTROL_ON;
>  		ret =3D i2c_smbus_write_byte_data(rail, PMBUS_OPERATION, ret);

[Severity: High]
Does this unconditionally force the PMBus rail ON during phase detection,
potentially bypassing system power sequencing rules?

In max20826_probe() and max20826_setup() (as seen below), the driver
unconditionally requests the optional avren and bvren GPIOs with
GPIOD_OUT_HIGH. Then, here in max20826_detect_phases(), it forces the
PMBus OPERATION register to ON just to read the active phase count. While
it restores the PMBus register state, the GPIOs are left permanently assert=
ed
high. Could this violate strict SoC power sequencing rules and damage the
processor or downstream loads?

Also, as documented in max20826_regulator_enable(), if AVSBus is active
(bits 4 and 5 set), the device hardware refuses to set bit 7 unless the
AVSBus bits are first cleared. Because max20826_detect_phases() fails to
apply this workaround before the I2C write, won't the device ignore the ON
command, resulting in a read of 0 phases and aborting the probe on
AVSBus-enabled systems?

>  		if (ret < 0)
>  			return ret;
>  	}

[ ... ]

> @@ -898,11 +898,11 @@ static int max20826_setup_vout_format(struct max208=
26 *st)
>  	if (st->chip_info->is_vout_direct) {
>  		u8 vout_res[2];
> =20
>  		ret =3D __max20826_read_block_data(st, RAIL_A,
>  						 MAX20826_REG_VOUT_RES,
>  						 vout_res, sizeof(vout_res));

[ ... ]

> @@ -946,8 +946,8 @@ static int max20826_setup(struct max20826 *st)
>  	/* Let's see if there's something on RAIL_B */
>  	st->bvren =3D devm_gpiod_get_optional(dev, "bvren", GPIOD_OUT_HIGH);
>  	if (IS_ERR(st->bvren))
>  		return PTR_ERR(st->bvren);

[ ... ]

> @@ -999,8 +999,8 @@ static int max20826_probe(struct i2c_client *client)
>  	st->chip_info =3D i2c_get_match_data(client);
>  	if (!st->chip_info)
>  		return -EINVAL;
> =20
>  	st->avren =3D devm_gpiod_get_optional(&client->dev, "avren", GPIOD_OUT_=
HIGH);
>  	if (IS_ERR(st->avren))
>  		return PTR_ERR(st->avren);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-hwmon-max2=
0826-support-v1-0-224766e0acd1@analog.com?part=3D5
