Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847847;
	b=b9Wztwezz+7GeVs6mVhx6nD9g3UsdTHHC/W8eMw2GX7weT6k5dBnjhSxpYd3U/6uOrWU
	 gVVpIrwPbdMmEnieJHwGMgTTN8a70Qew+V9ixgr/bEzNr2JVHPmly53WFU8g7+DkDP0YH
	 w+qud6h0QJqQ3Rtw9+PinpAEvIMCJNDcYqQd4XPOkRONwvzJ2Nude8AeqzTnftDy3iWQY
	 Ke5ePauqSOIv/g/nKxkPF50Y7L+M4FMSQQmealQqPPHTBpxcusJ0HhunBHN0IonJbX+ci
	 +BmfDO4tFhEHxqoPOvE3q2USjVjTZdjYZ84UA8f8vtYkGnERc5ojAk7C9VqHKoB+4lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847847;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4Bo6iO+FgO6hU2FYWrMOtqecnUaiQ7/lsrijAlSNXIE=;
	b=ZcO0tET14dcYRoI65YJScuNzYOcRQPQb9XVZdYuXwlpvPi5fa9BfWQbJko4n33zo8j10
	 yK6aUAS2h5tvb1UqkOoTNIo/P66jiBx0kqbbFXlRpXrCfA9YeoniejEJHZy8D3yzmri2U
	 gxIeRgRvksz/E0A7+XZ+cK6fOD4K9zuetkQkOyOkCFv9jMKvRMSQtrk9dyPZPa+ihBnwR
	 wpOVVV195yEL2Wxou96GePwslOrz6yLlNf5+9Qb1WnsQLhXAM0DXYZWBWhQ7rVZ4ttOBK
	 1ybh5hXd4/ef69fvSeWOdpBzdYGLUJDaAdIqKg1IQ7KURh0Ambp8o9HTJccGdIzjKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJpsUNqC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC99C606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJpsUNqC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C101F000C4;
	Mon, 16 Nov 2026 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847846;
	bh=4Bo6iO+FgO6hU2FYWrMOtqecnUaiQ7/lsrijAlSNXIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJpsUNqCQHUwW4P2ei6jDvJzQCu5l/grDzlVEbF22u6zVf2k4GjDwhG4dDsDK6xjr
	 9C/rjYCOexhGSNtLc4hyAPezmSkMLBmlji36BOX/0RknbGjs9DfVQ64GDkVhSZHU/e
	 3gNyENd/qm9s3Uw+AgOjJ69L1GzsHTqk98dn0m9tO+C9dE2t//xc7W7bkhHhN+0Qs9
	 Kwx22INYP5FfPsjVk7uXNnyugu2ow41zsUy6XL7ceEvNIqgJzIN72DgSMO4dCt8rPI
	 7ttMpM3k9/GRWlB8rlkLBn+a7+QJta1UyHCQiMCFxiXRjMJXggq/O//XQ+7fqagEGS
	 zs++cXRKZzdUA==
Message-ID: <sashiko-outbox-217386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116163257.1303207-2-benedikt.niedermayr@siemens.com>
References: <20261116163257.1303207-1-benedikt.niedermayr@siemens.com>
 <20261116163257.1303207-2-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 16:50:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] hwmon: simatic-ipc-ec-sensors: temp limits exposed as *_alarm
  attributes
- [High] hwmon: pointer-sign mismatch passing s8 * to ec_read() in temp
  read callback
- [Medium] hwmon: premature s8 cast before clamp() in
  simatic_ipc_ec_temp_write()
- [Medium] hwmon: u8 truncation in simatic_ipc_ec_fan_write() bypasses
  range check
- [Medium] hwmon: uninitialized reads on ec_read() error in temp and fan
  read callbacks
- [Medium] hwmon: devm buffer stored in global struct in
  simatic_ipc_ec_hwmon_probe()
- [Low] hwmon: unsanitized and unlowercased chip_name in
  simatic_ipc_ec_fan_probe()
- [Low] hwmon: simatic-ipc-ec-sensors: missing Documentation/hwmon/
  driver doc
--

commit 830c0088242b1976cce59ca2195a3aaabae749d2
Author: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver

This commit adds a hardware monitoring driver for temperature sensors and
fan control on the embedded controller of Siemens SIMATIC IPC BX-54A
systems.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccbcdc0799b9f..8e567b60f6487 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25763,6 +25763,12 @@ F:	drivers/media/mmc/siano/
>  F:	drivers/media/usb/siano/
>  F:	drivers/media/usb/siano/
> =20
> +SIEMENS IPC EC SENSORS DRIVER
> +M:	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/simatic-ipc-ec-sensors.c

[Severity: Low]
New hwmon drivers require a documentation file under
Documentation/hwmon/simatic-ipc-ec-sensors.rst per
Documentation/hwmon/submitting-patches.rst.

[ ... ]

> diff --git a/drivers/hwmon/simatic-ipc-ec-sensors.c b/drivers/hwmon/simat=
ic-ipc-ec-sensors.c
> new file mode 100644
> index 0000000000000..690da5dde2bf8
> --- /dev/null
> +++ b/drivers/hwmon/simatic-ipc-ec-sensors.c
> @@ -0,0 +1,568 @@

[ ... ]

> +static umode_t simatic_ipc_ec_temp_is_visible(const struct simatic_ipc_e=
c_temp *temp,
> +					      u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0444;
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_min_alarm:
> +	case hwmon_temp_crit:
> +		return 0644;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int simatic_ipc_ec_temp_read(const struct simatic_ipc_ec_temp *te=
mp, u32 attr,
> +				    int channel, long *val)
> +{
> +	s8 value;
> +	int ret;
> +	u8 reg;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		reg =3D temp_reg(temp->base, channel, TEMP_REG_VALUE);
> +		break;
> +	case hwmon_temp_max_alarm:
> +		reg =3D temp_reg(temp->base, channel, TEMP_REG_ALARM_HIGHLIMIT);
> +		break;
> +	case hwmon_temp_min_alarm:
> +		reg =3D temp_reg(temp->base, channel, TEMP_REG_ALARM_LOWLIMIT);
> +		break;
> +	case hwmon_temp_crit:
> +		reg =3D temp_reg(temp->base, channel, TEMP_REG_CRITICAL);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}

[Severity: High]
Should the low and high temperature thresholds use hwmon_temp_min and
hwmon_temp_max (with HWMON_T_MIN and HWMON_T_MAX in
simatic_ipc_ec_hwmon_probe()) instead of hwmon_temp_min_alarm and
hwmon_temp_max_alarm?

Under the hwmon ABI, tempX_min_alarm and tempX_max_alarm are read-only
boolean flags (0 or 1), so exposing writable millidegree Celsius limits
there causes tools like libsensors to treat any non-zero limit as an
active alarm while missing the min and max thresholds.

> +
> +	ret =3D ec_read(reg, &value);

[Severity: High]
Does passing &value (s8 *) to ec_read(u8, u8 *) trigger a -Wpointer-sign
warning (and build failure under CONFIG_WERROR)?

> +
> +	/* Degree Celsius to millidegree Celsius */
> +	*val =3D value * 1000;
> +
> +	return ret;
> +}
> +
> +static int simatic_ipc_ec_temp_write(const struct simatic_ipc_ec_temp *t=
emp, u32 attr,
> +				     int channel, long val)
> +{
> +	/*
> +	 * Millidegree Celsius to degree Celsius
> +	 */
> +	s8 value =3D (s8)clamp((s8)DIV_ROUND_CLOSEST(val, 1000), (s8)-128, (s8)=
127);

[Severity: Medium]
Does casting the result of DIV_ROUND_CLOSEST(val, 1000) to s8 before
clamp() make clamp() a no-op?

Because the first argument is already truncated to s8, writing a threshold
outside [-128000, 127499] wraps modulo 256 instead of saturating (for
example, 130000 wraps to -126 C), and values near LONG_MAX or LONG_MIN can
also overflow DIV_ROUND_CLOSEST(val, 1000) unless val is clamped before
division.

[ ... ]

> +static int simatic_ipc_ec_fan_read(struct simatic_ipc_ec_fan *fan, enum =
hwmon_sensor_types type,
> +				   u32 attr, int channel, long *val)
> +{
> +	u16 value_u16;
> +	u8 value_u8;
> +	int ret;
> +	u8 reg;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			reg =3D fan_reg(fan->base, FAN_REG_SPEED);
> +			ret =3D simatic_ipc_ec_read_block(reg, &value_u16, sizeof(value_u16));
> +			*val =3D value_u16;
> +			return ret;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +			reg =3D fan_reg(fan->base, FAN_REG_DUTY_LEVEL);
> +			ret =3D ec_read(reg, &value_u8);
> +			*val =3D value_u8;
> +			return ret;
> +		case hwmon_pwm_enable:
> +			reg =3D fan_reg(fan->base, FAN_REG_MODE);
> +			ret =3D ec_read(reg, &value_u8);
> +			*val =3D CONTROL_MODE_GET(value_u8);
> +			return ret;

[Severity: Medium]
When ec_read() or simatic_ipc_ec_read_block() fails here and in
simatic_ipc_ec_temp_read(), does assigning *val read uninitialized stack
variables (value_u16, value_u8, and value)?  ec_read() leaves its output
parameter untouched on error, which triggers KMSAN uninitialized-memory
warnings when *val is computed before checking ret.

[ ... ]

> +static int simatic_ipc_ec_fan_set_control_mode(struct simatic_ipc_ec_fan=
 *fan, u8 ctrl_mode)
> +{
> +	int ret;
> +	u8 mode;
> +
> +	/* 0: full speed, 1: mannual control, 2: auto-control */
> +	if (ctrl_mode > 2)
> +		return -EINVAL;

[ ... ]

> +static int simatic_ipc_ec_fan_write(struct simatic_ipc_ec_fan *fan, u32 =
attr, int channel,
> +				    long val)
> +{
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > 0xFF)
> +			return -EINVAL;
> +		return ec_write(fan_reg(fan->base, FAN_REG_DUTY_LEVEL), (u8)val);
> +	case hwmon_pwm_enable:
> +		return simatic_ipc_ec_fan_set_control_mode(fan, (u8)val);

[Severity: Medium]
Does casting val to u8 before calling simatic_ipc_ec_fan_set_control_mode()
allow out-of-range values such as 256 or -255 to bypass the ctrl_mode > 2
check and change the EC fan control mode?

[ ... ]

> +static struct hwmon_channel_info simatic_ipc_ec_temp_ch_info =3D {
> +	.type =3D hwmon_temp,
> +	.config =3D NULL
> +};

[ ... ]

> +static int simatic_ipc_ec_hwmon_probe(struct device *dev, struct simatic=
_ipc_ec_sensor *data)
> +{

[ ... ]

> +	temp_config =3D devm_kzalloc(dev, (temp_count + 1) * sizeof(u32), GFP_K=
ERNEL);
> +	if (!temp_config)
> +		return -ENOMEM;
> +
> +	simatic_ipc_ec_temp_ch_info.config =3D temp_config;

[Severity: Medium]
Can storing the per-device devm-allocated temp_config into the static
global simatic_ipc_ec_temp_ch_info.config leave a dangling pointer on probe
failure or unbind, or overwrite another instance's config if more than one
110A5004 device is probed?

[ ... ]

> +static int simatic_ipc_ec_fan_probe(struct device *dev, struct simatic_i=
pc_ec_sensor *data)
> +{

[ ... ]

> +	if (fan_name) {
> +		char *p;
> +
> +		snprintf(fan->chip_name, CHIP_NAME_MAX_LEN, "simatic_ipc_ec_%s", fan_n=
ame);
> +		for (p =3D fan->chip_name; *p; p++)
> +			*p =3D tolower(*p);
> +	} else {
> +		snprintf(fan->chip_name, CHIP_NAME_MAX_LEN, "simatic_ipc_ec_%s", label=
);
> +	}

[Severity: Low]
What happens if label contains uppercase characters when fan_name is
absent, or if either string contains characters disallowed in hwmon chip
names such as '-' or spaces?

The else branch skips the tolower() loop, and neither branch sanitizes
characters rejected by __hwmon_device_register() (or via
devm_hwmon_sanitize_name()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116163257.1303=
207-1-benedikt.niedermayr@siemens.com?part=3D1
