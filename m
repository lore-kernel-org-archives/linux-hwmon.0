Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0BC173
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 00:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777421035; cv=none; b=gkPjS0/GF1mpRNWS3ZaMAMNeDKoM+75MrkW89cHKbl0u42/B3vcupkVGhVvaV77d8YwRVRWI/TkdXNQeL+E5hu3uT2wICk27G07VuDSoS7uSGxvv90Qw5xPwfQoQhno2EN0hcRrLlmqXfcibjUubYzKtEWeJqbQkVOoOgzYAv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777421035; c=relaxed/simple;
	bh=BpARQeFy1lhm8r//51QFLn48/Ix95s+gJSZXnmXAcD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RT8aak33wZ4aX6lzIfobbm7jEm9m1tU+XtKpaPFjNgRVtVQ+n09i/+eLMSIoWKUpFUX3DaKfSUdf8eogSN5iUjmYdnISoDEkfPEnfKvZoivxsnSXJFbZFk6thuyKTmJYDB8Yjd3GEIzrTXXza/NSfYdDXxoPgqmCtxm07duiVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5Jxb6da; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5Jxb6da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EB9C2BCAF;
	Wed, 29 Apr 2026 00:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777421035;
	bh=BpARQeFy1lhm8r//51QFLn48/Ix95s+gJSZXnmXAcD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=N5Jxb6da3ltvk3HKg206ktqvOzpO+1wbC6BnsiP2OzKR6ovavO4FI+LDasAhTqSOE
	 hK6aUsf16UK8/porNsRJ/TAAL6oNF10NCG9xDKyEGrRS8Pf6ALUbdZ6WRWZnrN60dx
	 u9HzW8U9cEZYAsyUQv3CMnmZg+epcMyY/gTWq1Mteq6lBOeJXcZWugu/8wzViWSBp2
	 a6eWxttXSd1K2/aHzpKEEDbFby2AYgfEiAwQNrsvwJwwcuixBkyj8zWdIiZAQVtEE/
	 9qDvhS1CAFtWGM2fDXGFqx8k7ZYRzgHmC7juh/Z3u0wT/Syw109Jo04MfwLL+PXyMB
	 T2MPls6yUkv+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] hwmon: ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260428-ltc4283-support-v10-2-4f26f46491c3@analog.com>
References: <20260428-ltc4283-support-v10-2-4f26f46491c3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 00:03:54 +0000
Message-Id: <20260429000355.28EB9C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Debugfs entries are not cleaned up on probe failure or driver unbi=
nd, leading to Use-After-Free.
- [High] `ltc4283_read_in_alarm()` incorrectly uses the `LTC4283_VPWR` regi=
ster macro instead of the `LTC4283_CHAN_VPWR` enum when checking the channe=
l.
- [Medium] Time-Of-Check to Time-Of-Use (TOCTOU) race condition when cleari=
ng alarms and fault logs causes hardware events to be silently lost.
- [Medium] Invalid string values for device properties are silently ignored=
 instead of returning an error.
--

commit bd4cadd06bf8b8a849bcb4a4612ec0b3c5c91910
Author: Nuno S=C3=A1 <nuno.sa@analog.com>
Subject: hwmon: ltc4283: Add support for the LTC4283 Swap Controller

This commit adds support for the Analog Devices LTC4283 Hot Swap Controller.
It features programmable current limits, adjustable inrush current, and an
I2C interface for monitoring board current, voltage, power, and energy.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 000000000000..9b492a8b2227
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c
> @@ -0,0 +1,1795 @@
[ ... ]
> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> +			      u32 mask, long *val)
> +{
> +	u32 alarm;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, reg, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D !!(alarm & mask);
> +
> +	/* If not status/fault logs, clear the alarm after reading it. */
> +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> +		return regmap_write(st->map, reg, alarm & ~mask);
> +
> +	return 0;
> +}

Could this non-atomic read-modify-write cause hardware events to be lost?

If the hardware asserts a new event bit between the regmap_read() and the
regmap_write(), won't the write overwrite the new bit with its previous 0
state, inadvertently clearing the new event before it is processed?

[ ... ]
> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel =3D=3D LTC4283_VPWR)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  BIT(2 + max_alm), val);

Is channel compared to the register address instead of the enum index?

LTC4283_VPWR is defined as 0x44 (68), but channel is an enum value where
LTC4283_CHAN_VPWR is 1. Since 1 will never equal 68, won't this check fail
and cause it to fall through to the DRAIN channel logic, reading the wrong
hardware alarm bits for the VPWR channel?

[ ... ]
> +	ret =3D device_property_match_property_string(dev, "adi,overcurrent-ret=
ries",
> +						    ltc4283_oc_fet_retry,
> +						    ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	/* We still want to catch when an invalid string is given. */
> +	if (ret < 0 && ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "adi,overcurrent-retries invalid value\n");

Will this actually catch invalid strings?

device_property_match_property_string() returns -EINVAL both when the
property is missing and when it contains an invalid string. By ignoring
-EINVAL, won't the driver silently accept invalid configurations instead
of warning the user?

[ ... ]
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret, id;
[ ... ]
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	id =3D (client->adapter->nr << 10) | client->addr;
> +	adev =3D __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> +					      NULL, id);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> +
> +	return 0;
> +}

Can this cause a use-after-free if the probe fails?

The debugfs files are created in i2c->debugfs with the devres-managed st
pointer as their data. Since i2c->debugfs is cleaned up by the I2C core
only when the client device is removed, if __devm_auxiliary_device_create()
fails, st will be freed by devres, but the debugfs entries will persist.

Would it be better to explicitly tear down these debugfs files using a
devm action so they don't dereference the freed st pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260428-ltc4283-su=
pport-v10-0-4f26f46491c3@analog.com?part=3D2
