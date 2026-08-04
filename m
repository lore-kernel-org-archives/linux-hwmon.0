Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165E28D831
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835454; cv=none; b=Z9xLRRvQK7ZfeEjO6sTit0RqjUhiT0owj8+GwGqf9Ab8pnlOrQH267+dwTJXSJaNM9BnhyDhjOKeRbgF8Reu0y4PHXo3Lcd/Tt2+qpOS1Y/DSqeZkYGHUpQZ/elV/u+RIOitJwcDRb2UhhRX6RELFDZpDWIkbW++tL0xoh1MG3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835454; c=relaxed/simple;
	bh=F3UAZQ9u0DvUKhOd92WO9gDHmKHaH3IQ+ASmbTNwVgI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c0je5DiSP45TSDZYJteZyglpCQM8jAHXzM/wm9oh77wEaOAoGwBBP9GT7kOxCMDGp0NQaQf9wvWrombj3qTgdKNVr4GWVbyujL0yUYGEzuno7C/STeCzEW6uQBnOjuFg8LNOkY0iuZzAO6v9iDIUizXnuvB6uroutHaOhkhj/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWvvBzCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWvvBzCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EE91F000E9;
	Tue,  4 Aug 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785835452;
	bh=zc6whzNOB6n1TKwxGux7BMx+JY1mjq3tmzHb1GUKNOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cWvvBzCsQyneuuwHFyTBmkZ7eTLKt63R9levSgdc+KeKpGhXbBrXS7hobKwrByJEm
	 hWn4NCTXZ6jLmkLCN/EPGJG4Tac0TP1c7jJwYJniI7iT/PzNVH0k10iUyhr/eGsc3O
	 IXILzehL0cTnv/gNumzq7jzbbN7W8OLqvkPwfULV/u4j70gPzkbfzdNjWWRmx1BuBe
	 KFnbBSiY8DMuGh/hvTSpv51WTCKzuFLPPuKX7nL4ZZDDEML5WyMH7nZ53EedB/E7Gb
	 5WXgtXM2l5bU7JDT2WTtLfBfEY+5NQm5ZxHxWzn7LNXH6FDOE4f2n1HduFjBZw0Qjv
	 W2++Sm43+OqFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qingshuang Fu" <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260804091719.651479-1-fffsqian@163.com>
References: <20260804091719.651479-1-fffsqian@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 09:24:11 +0000
Message-Id: <20260804092412.59EE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver ignores `-EPROBE_DEFER` and other errors from `devm_reg=
ulator_get_optional()`, improperly falling back to the internal VREF.
--

--- Patch [1]: [PATCH] hwmon: (ads7828) Check return value of regmap_read()=
 in probe ---
commit 2a7377992af717bb6d251109d28baf026bc4a665
Author: Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: hwmon: (ads7828) Check return value of regmap_read() in probe

This patch checks the return value of a dummy regmap_read() used to enable
the internal reference voltage in ads7828_probe(). If the read fails, it
logs an error and aborts the probe instead of silently failing and
registering a non-functional device.

> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 149cfcec78dcc..91ef0c4a08c4e 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -112,6 +112,7 @@ static int ads7828_probe(struct i2c_client *client)
>  	unsigned int regval;
>  	enum ads7828_chips chip;
>  	struct regulator *reg;
> +	int ret;
> =20
>  	data =3D devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
>  	if (!data)

[Severity: High]
This is a pre-existing issue, but does the driver mishandle errors like
-EPROBE_DEFER from devm_regulator_get_optional()?

Looking slightly further down in ads7828_probe() in drivers/hwmon/ads7828.c:

    } else if (dev->of_node) {
        diff_input =3D of_property_read_bool(dev->of_node,
                                           "ti,differential-input");
        reg =3D devm_regulator_get_optional(dev, "vref");
        if (!IS_ERR(reg)) {
            vref_uv =3D regulator_get_voltage(reg);

If devm_regulator_get_optional() returns -EPROBE_DEFER because the
regulator driver has not yet completed probing, the driver ignores the
error. It proceeds as if there is no external reference and incorrectly
falls back to enabling the internal reference.

If an external voltage reference is physically connected and specified in
the device tree, could driving the internal reference onto the same pin
result in incorrect ADC readings or potentially hardware damage due to an
electrical conflict?

[ ... ]

> @@ -166,8 +167,13 @@ static int ads7828_probe(struct i2c_client *client)
>  	 * voltage needs to settle before getting valid ADC data. So perform a
>  	 * dummy read to enable the internal reference voltage.
>  	 */
> -	if (!ext_vref)
> -		regmap_read(data->regmap, data->cmd_byte, &regval);
> +	if (!ext_vref) {
> +		ret =3D regmap_read(data->regmap, data->cmd_byte, &regval);
> +		if (ret) {
> +			dev_err(dev, "dummy read failed to enable internal VREF: %d\n", ret);
> +			return ret;
> +		}
> +	}
> =20
>  	hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, client->name,
>  							   data,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804091719.6514=
79-1-fffsqian@163.com?part=3D1
