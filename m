Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0A73EC822
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340972; cv=none; b=Bi3j5s85iSjEDFxQRiIyyu+7KRQk4LmSEWfk38IiTXu265pvJ9wGUL8QYaJm2ts1Kmng/ZBCQ3VWwpxME0deJPHeXA0kzLmIcuy+zasoSN6BkUunZ58xSPJ6T2OP1EZ/SjZFvUqxf4QL+wFveh3+tOupqqD38k58c8tFubwdjNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340972; c=relaxed/simple;
	bh=hc1tf7InWYmKy0A7Pq9UYTIxWmUvPghMJB+7dSPnpx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJodRy1pI1+WqGOLWwsbFGRZs5qmOLvGdXd35Evn/kPfoX6mZtTiaw9R8nFhWMUwreL+xquEMu13R+0yMA/WjzAUPw83zzo517WGc00xJzym7MZpbETbqh2IOAnPck8g1PozDHmQuLsiUYRlGPTMpJ3rJomFSvgSnqhJCU7zsB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMW1xqp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMW1xqp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCE21F00A3A;
	Wed, 29 Jul 2026 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340970;
	bh=fpSi3A6DWJ1stf1zOOCgiDDNW1sKT8Vo+pDCRuAwt8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KMW1xqp0DVFIJjhkSukKAk0djP9NQ8rokNPQo4QkrR+oEyiTYTZ2HrLHfXrfaDFyu
	 K4eI6LcNNRVJA0Y2qGmxX0WTH3QclB4tfOwKXcxRrW1Faj0z342pZNqLGvtSQBJPqv
	 dAIQKdmcz+MFff9R9eaAMvXq/UZGozkkcpOcpWVunqzYIoBbrFWYGBkacNsmR1QPBQ
	 ruK2TB1U761vD1K/e6B8oiUgCl4MZiCh56vVZT5VUv8VR4QdAAL55+3OHq49zZHI+R
	 GOQRNdPzSZOOhKYt+NjcUQlKmgLlqKNtmMC3ClM5YcwiwSW8lOzSj3I11ddd9qE67H
	 giNQSxufE+r8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-2-349f7b2f1df8@redhat.com>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-2-349f7b2f1df8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 16:02:50 +0000
Message-Id: <20260729160250.7FCE21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The patch fails to actually distinguish current and shunt voltag=
e alerts during read operations, contrary to the claims in the commit messa=
ge.

Pre-existing issues:
- [High] Integer overflow in `ina2xx_get_value()` and `ina226_alert_to_reg(=
)` leading to corrupted power, current, and voltage limits.
- [High] The driver explicitly rejects negative alert limits, preventing th=
e use of hardware alerts for reverse current flow.
--

--- Patch [2]: [PATCH 2/4] hwmon: (ina2xx) Replace masks with enum in alert=
 functions ---
commit e029f17b406174e97d904910649854d150669988
Author: Jared Kangas <jkangas@redhat.com>

hwmon: (ina2xx) Replace masks with enum in alert functions
   =20
Instead of passing an explicit mask to alert/limit functions like
ina226_alert_read(), introduce an enum ina2xx_alert_type that can be
converted to a mask internally. This allows distinguishing current from
shunt voltage, which are both based on the same function in the
hardware.

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 911bf32e8f215..beb851d87f787 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
[ ... ]
> +static int ina226_alert_limit_read(struct ina2xx_data *data, enum ina2xx=
_alert_type alert,
> +				   int reg, long *val)
>  {
>  	struct regmap *regmap =3D data->regmap;
>  	int regval;
> +	u32 mask;
>  	int ret;
> =20
>  	ret =3D regmap_read(regmap, INA226_MASK_ENABLE, &regval);
>  	if (ret)
>  		return ret;
> =20
> +	mask =3D ina2xx_alert_type_to_mask(alert);
>  	if (regval & mask) {

[Severity: Medium]
Does this actually distinguish current from shunt voltage alerts as stated
in the commit message?

By converting the enum back to the shared hardware mask here and in
ina226_alert_read(), and not tracking which alert was actually configured,
reading current limits or alarms via sysfs can return the value or status of
a configured shunt voltage limit (or vice versa), yielding incorrectly scal=
ed
hardware measurements.

>  		ret =3D regmap_read(regmap, INA226_ALERT_LIMIT, &regval);
>  		if (ret)
[ ... ]
> -static int ina226_alert_limit_write(struct ina2xx_data *data, u32 mask, =
int reg, long val)
> +static int ina226_alert_limit_write(struct ina2xx_data *data, enum ina2x=
x_alert_type alert,
> +				    int reg, long val)
>  {
>  	struct regmap *regmap =3D data->regmap;
> +	u32 mask;
>  	int ret;
> =20
>  	if (val < 0)
> @@ -450,9 +490,11 @@ static int ina226_alert_limit_write(struct ina2xx_da=
ta *data, u32 mask, int reg,
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (val)
> +	if (val) {
> +		mask =3D ina2xx_alert_type_to_mask(alert);
>  		return regmap_update_bits(regmap, INA226_MASK_ENABLE,
>  					  INA226_ALERT_CONFIG_MASK, mask);
> +	}

[Severity: High]
This is a pre-existing issue, but does ina226_alert_limit_write() reject
valid configurations for reverse current flow?

The function explicitly returns -EINVAL for negative limits:

    if (val < 0)
        return -EINVAL;

This prevents configuring hardware alerts for reverse current or negative
shunt voltage, such as during battery discharge.

Additionally, if the limit is exactly zero, the alert is not enabled here,
which makes it impossible to trigger an alert at exactly zero.

>  	return 0;
>  }
> =20
[ ... ]
> @@ -510,15 +554,15 @@ static int ina2xx_in_read(struct device *dev, u32 a=
ttr, int channel, long *val)
>  		*val =3D ina2xx_get_value(data, voltage_reg, regval);
>  		break;

[Severity: High]
This is a pre-existing issue, but can the calculations in ina2xx_get_value()
and ina226_alert_to_reg() overflow?

For large limit values, such as a 200V bus voltage limit, the shift operati=
on
in ina226_alert_to_reg() on 32-bit architectures:

    val =3D (val * 1000) << data->config->bus_voltage_shift;

yields 3.2 billion, which overflows a signed 32-bit long variable. This
results in a negative value that gets clamped to 0.

Similarly, in ina2xx_get_value() called above:

    val =3D regval * data->power_lsb_uW;

the power calculation can overflow a 32-bit signed int for large regval and
high power_lsb_uW, returning negative power readings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-upstream-i=
na2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=3D2
