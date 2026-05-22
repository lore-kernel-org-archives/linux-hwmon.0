Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612625B08D;
	Fri, 22 May 2026 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441174; cv=none; b=ZiA30erRNr8qY3Q8EXclnMx4wnMCUIeHdGmH6qwesxGB7liaddYPYJHryz1hK8tSgAxnNFUMe4qqVN+g6A7IIQPPa9q/uFGwuJhZ//4Rk/U3PXucClQej9I88eYCjzv4qIcGnTXJNA4dgCdB5dHZOCQnXW2PQqq8A3K8G8HUD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441174; c=relaxed/simple;
	bh=H2bZ1dQvQYpEz/hg/ad7YrjkgKlsPzepBdAWRwmzFKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kqSZEme1YWpKNrreMHZAapz2KzDFdUojNY+o4eBLf3Gs7RVcQnUy2GEqw/35kT+jMFtmpsYl0lUdBnimb8puAF3DjBj3Y63TkFDpV433BkTxBv+zh4Q/afK9hiPNBFWquIAYDsvAZ6bAxb9Bl9cdwKKtDTiG6HXKUDWDoNTsA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4HdLIp5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4HdLIp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5C01F00A3D;
	Fri, 22 May 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779441172;
	bh=quCsoYTJlN3FxCdDmcbPKA52kZIR/8JqUUCsjXBhtGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P4HdLIp5HtVavbuXDX5H/MZ4JzdxSCCcqiySYY53qB3dS7+C0EEWBy8Vfz8+1l/en
	 z0dw0mYVC2ORlF8aqRgtuYJedDBpcsOT4ojXwqymJM1zzgP7P0+JeFzRE234Xfp8Bg
	 mwjaYhfCbYoLdgz8i1SBq/xJVc+poKxyJvVb3tRL6WC5/nYlwjgJTG9QlNqZDieDg6
	 R2xtRP3abkCvm/yNrLh5P1Q4zGYlBhANnrOA0sKZXdhvaV4EErKTtiRM+uhrY/9jzd
	 qiicLrFW4nB4VxNq6UhogdFPnQKAyvTSlRzPw5Peht0gvrE0AWJpoJmwMb4zHZeFvh
	 BMgZxl0mmLBYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/tps25990): Rework TPS25990 direct
 conversion handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522082349.2749970-3-sbogdanov@baylibre.com>
References: <20260522082349.2749970-3-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 09:12:52 +0000
Message-Id: <20260522091252.9E5C01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] The custom conversion functions incorrectly retrieve I2C clien=
t data, leading to severe type confusion and out-of-bounds heap reads.
- [High] Replacing ratio-based math with direct conversion helpers inside `=
read_word_data` and `write_word_data` introduces a double-conversion bug th=
at completely corrupts sysfs output and configuration limits.
- [High] Calling `pmbus_reg2data_direct_calc()` directly with negative `R` =
coefficients and small register values leads to a total loss of precision d=
ue to premature integer division.
- [High] The patch silently drops the correct translation ratios for the Ov=
er-Current Fault Limit (`PMBUS_IIN_OC_FAULT_LIMIT`) and bypasses dynamic re=
sistor scaling.
- [Low] Spelling mistakes in the newly introduced `tps25990_parameters` enu=
m comments.

Pre-existing issues:
- [High] When setting fault limits, an integer underflow on low user inputs=
 leads to an unsigned wrap-around, causing `clamp_val()` to clamp to the ma=
ximum limit instead of the minimum limit, dangerously defeating hardware pr=
otection.
--

commit 11131ea034ce953233470df60e4f6a1c34cca609
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>
Date:   Fri May 22 08:23:37 2026 +0000

    hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling
   =20
    Rework the existing implementation of direct format conversion for
    TPS25990 non-standard parameters to improve code reusability and
    integration with the PMBus direct conversion helpers.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 05c6288ecafcc..1e252844217b8 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c

[ ... ]

> +enum tps25990_parameters {
> +	TPS25990_VIN_OVF =3D 0, /* VIN over volatage fault */
> +	TPS25990_IIN_OCF, /* IIN Over currect fault */

[Severity: Low]
This isn't a bug, but there are minor typos in the comments: volatage and
currect.

> +	TPS25990_DIRECT_VALUES_COUNT,
> +};

[ ... ]

> +static s64 tps25990_reg2data_direct(struct i2c_client *client, int param=
, s32 raw)
> +{
> +	struct pmbus_driver_info *info =3D i2c_get_clientdata(client);
> +	struct tps25990_data *data =3D container_of(info, struct tps25990_data,=
 info);

[Severity: Critical]
Does this correctly retrieve the driver info?

Looking at pmbus_do_probe(), i2c_get_clientdata(client) is set to a
struct pmbus_data * object, not a struct pmbus_driver_info * object.

Using container_of() on the wrong type calculates a 0 offset, but improperly
casts the pmbus_data object into a struct tps25990_data pointer, causing the
subsequent read of info_local to fetch completely out-of-bounds heap memory.

Should this use pmbus_get_driver_info(client) instead?

> +	struct tps25990_local_direct_value *info_local =3D &data->info_local;
> +	s64 b, val;
> +	s32 m, R;
> +
> +	val =3D (s16)raw;
> +	m =3D info_local->m[param];
> +	b =3D info_local->b[param];
> +	R =3D info_local->R[param];
> +
> +	return pmbus_reg2data_direct_calc(val, b, m, R);

[Severity: High]
Can this result in a total loss of precision due to integer division?

For TPS25990_VIN_OVF, R is -4 and the raw register value is a small 4-bit
integer (0 to 15). The generic pmbus_reg2data_direct_calc() handles negative
R by dividing the input by 10 for each R:

pmbus_core.c:pmbus_reg2data_direct_calc() {
    ...
    while (R < 0) {
        val =3D div_s64(val + 5LL, 10L);
        R++;
    }
    ...
}

Dividing a small value like 15 by 10000 via integer division would truncate
it to 0, permanently destroying the underlying data. Does this need
pre-scaling before the calculation loop?

[ ... ]

> @@ -184,9 +230,7 @@ static int tps25990_read_word_data(struct i2c_client =
*client,
>  		ret =3D pmbus_read_word_data(client, page, phase, reg);
>  		if (ret < 0)
>  			break;
> -		ret =3D DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
> -					TPS25990_VIN_OVF_DIV);
> -		ret +=3D TPS25990_VIN_OVF_OFF;
> +		ret =3D tps25990_reg2data_direct(client, TPS25990_VIN_OVF, ret);

[Severity: High]
Does this introduce a double-conversion bug?

The driver's .read_word_data hook is expected to convert between the
chip-specific raw register value and the standard PMBus raw format (Y_std).
The PMBus core then converts Y_std to physical units.

By calling pmbus_reg2data_direct_calc() directly here, does it return the
physical value (e.g. milliVolts) rather than Y_std, causing the PMBus core
to apply its standard conversion a second time to an already converted valu=
e?

[ ... ]

> @@ -246,17 +288,13 @@ static int tps25990_write_word_data(struct i2c_clie=
nt *client,
>  		break;
> =20
>  	case PMBUS_VIN_OV_FAULT_LIMIT:
> -		value -=3D TPS25990_VIN_OVF_OFF;
> -		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_D=
IV,
> -					  TPS25990_VIN_OVF_NUM);
> +		value =3D tps25990_data2reg_direct(client, TPS25990_VIN_OVF, value);
>  		value =3D clamp_val(value, 0, 0xf);

[Severity: High]
This is a pre-existing issue, but does this lead to an integer underflow
that defeats hardware protection?

The value parameter in tps25990_write_word_data() is an unsigned u16. If a
sufficiently low limit (like 0) is converted, the mathematical result could
be negative. This would wrap around the unsigned u16 to a large value
(e.g., 65530).

Since clamp_val() compares using the type of the passed variable, it would =
see
the wrapped value as much greater than 15 and incorrectly clamp it to the
maximum hardware limit (0xf) instead of the minimum limit.

>  		ret =3D pmbus_write_word_data(client, page, reg, value);
>  		break;
> =20
>  	case PMBUS_IIN_OC_FAULT_LIMIT:
> -		value -=3D TPS25990_IIN_OCF_OFF;
> -		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_D=
IV,
> -					  TPS25990_IIN_OCF_NUM);
> +		value =3D tps25990_data2reg_direct(client, TPS25990_IIN_OCF, value);

[Severity: High]
Are we losing the dynamic resistor scaling here?

The original code mapped TPS25990_VIREF to the standard Y_std format,
allowing the PMBus core to dynamically convert it using the PSC_CURRENT_IN
coefficients, which are adjusted in tps25990_probe() based on the
ti,rimon-micro-ohms property.

The new tps25990_data2reg_direct() call uses static coefficients from
tps25990_local_info which are never updated by the rimon logic. Will this
break the over-current limits for boards using a non-default rimon
configuration?

>  		value =3D clamp_val(value, 0, 0x3f);
>  		ret =3D pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
>  		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522082349.2749=
970-1-sbogdanov@baylibre.com?part=3D2
