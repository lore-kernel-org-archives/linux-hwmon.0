Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAD752ED2E
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876542; cv=none; b=lzOhTnQnxA3UlUruCZTVUisicZLTJYG/YJuQ1YLTcI9WpZP+77l/9mUbC2whcLd25McMD7rJMrmaeaLw/lp5trexedPwV+WWBwajGo8J+s9cGPb7SsWkJ9otuhdkzWUf9mgkeRL9cAT3+b+8pJ63o8TdDcq3IBBihMYppMr3reE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876542; c=relaxed/simple;
	bh=TPEQ6sM2h1alUA0lRDHITduSvFsVaixCmmpuCwzTVUo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AY9RpO+DqfhO5+7UQCcPU2ELKxUjDRFz06qDg0pRfykDFWgWRIfuj2R5AMiZxrQvOs1qL7NQA7oTalGCKYUsZfQfV+cv7tMXH7b3l/FcnVdAZO46O9nBT+hdIYin2A7r4icUWwUKdun7D/QBjXzWLeFFjxDmlX/dXI+ZY6YHmUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229ED1F00A3A;
	Tue,  8 Sep 2026 14:08:49 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim
 7x legacy sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birk Skyum" <birk.skyum@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908135801.81436-2-birk.skyum@pm.me>
References: <20260908135801.81436-1-birk.skyum@pm.me>
 <20260908135801.81436-2-birk.skyum@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 14:08:33 +0000
Message-Id: <20260908140849.229ED1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Hardware monitoring device is registered directly from a platform d=
river, violating HWMON subsystem layering rules.
- [Low] The modified struct i2c_device_id array does not use named initiali=
zers.

Pre-existing issues:
- [High] Missing unwind for qcom_ec_sci_evt_control on probe error paths.
--

commit f56d14065bf54cf3279988ab062adb53bc90787e
Author: Birk Skyum <birk.skyum@pm.me>

platform: arm64: qcom-hamoa-ec: monitor Slim 7x legacy sensors

This commit adds monitoring for legacy sensors on the Yoga Slim 7x EC.
It exposes a read-only path for the Lenovo compatible device to expose fan
RPM and thermistor via hwmon. The strict capability validation on reference
boards is kept unchanged.

Link: https://github.com/aarch64-laptops/build/blob/2e58842f5fa2f87771c2df0=
17ae4d8c65225ef10/misc/lenovo-yoga-slim-7x/acpi/dsdt.dsl
Link: https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index 4d2ad042a7f84..3a4ca8a0de5c8 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c

[ ... ]

> +static int qcom_ec_hwmon_probe(struct qcom_ec *ec)
> +{
> +	struct device *dev =3D &ec->client->dev;
> +	struct device *hwmon;
> +	long rpm;
> +	int ret;
> +
> +	if (!i2c_check_functionality(ec->client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA))
> +		return -EOPNOTSUPP;
> +
> +	ret =3D qcom_ec_read_fan_rpm(ec, &rpm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read fan RPM\n");
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
> +						     &qcom_ec_hwmon_chip_info, NULL);

[Severity: Low]
Does this code register a hardware monitoring device directly from a platfo=
rm
driver? The subsystem guidelines explicitly require hwmon functionality of
multi-function chips to be implemented as an auxiliary device driver in
drivers/hwmon/ rather than directly in drivers/platform/arm64/.

> +	return PTR_ERR_OR_ZERO(hwmon);
> +}

[ ... ]

> @@ -356,14 +481,24 @@ static int qcom_ec_probe(struct i2c_client *client)

[ ... ]

>  	ret =3D qcom_ec_sci_evt_control(dev, true);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
> =20
>  	ret =3D qcom_ec_thermal_capabilities(dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n"=
);
> =20
>  	if (ec->thermal_cap.fan_cnt =3D=3D 0) {
>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update require=
d\n");
>  		return 0;
>  	}
> =20
>  	ec->ec_cdev =3D devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->=
ec_cdev), GFP_KERNEL);
>  	if (!ec->ec_cdev)
>  		return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this code leave SCI events enabled on
error paths during probe? If qcom_ec_thermal_capabilities() or devm_kcalloc=
()
fail in qcom_ec_probe() after qcom_ec_sci_evt_control(dev, true) is called,
it returns an error without unwinding the EC SCI events configuration.=20
Could this leave the hardware generating unhandled SCI interrupts for a dri=
ver
that was not successfully loaded?

[ ... ]

> @@ -421,14 +559,21 @@ static void qcom_ec_remove(struct i2c_client *clien=
t)

[ ... ]

>  static const struct i2c_device_id qcom_ec_i2c_id_table[] =3D {
> -	{ "qcom-hamoa-ec", },
> +	{ "qcom-hamoa-ec", (kernel_ulong_t)&qcom_ec_reference },

[Severity: Low]
Does this array element fail to use named initializers for struct
i2c_device_id? The I2C subsystem guidelines mandate that initialized arrays=
 of
this type must use named initializers (e.g., .name =3D ..., .driver_data =
=3D ...).

>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908135801.8143=
6-1-birk.skyum@pm.me?part=3D1
