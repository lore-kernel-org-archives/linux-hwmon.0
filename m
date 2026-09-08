Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B57F5452AD
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877218; cv=none; b=nMA+a7+pz6rAqQi4GBaQHJuSHIFxWQ7O3DLID9+PVRUBgpCcynGPqgorab67FZBipNE3T4FpO5c0mi0Yy/vqwHRJsaCH7baB+YC2nCZrMVTlJSMVlheN78wcitL9zF+zeGv6BYUTHHWLtD44CcoT4dt56LGyfifHiEFcZTRVGq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877218; c=relaxed/simple;
	bh=G5LWDnFkmsMEW/IQlzwvDx/d1GaVJS4DtcifYttNjOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XrXwQF22AFox+2cqTu/dfQTCiffK+vZC0Vgsf7eJpcqhIWIln4QNNJ/C0OiIsOFJAoJs8+d62avOrxfNVsieJboZKz8zbPGVj6x33yAoHbt3+gixLw/KxXpvUguu0VGeKbHykP+owmF/Gqi/VDWrINrFsWLjecWp6GSDZos/qe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4EqT8u2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4EqT8u2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AD51F00A3A;
	Tue,  8 Sep 2026 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788877203;
	bh=he9SCXNtp9B+zkDZUF9AbrNjSfH+Dh6MqrTo9yNJdLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4EqT8u2Z8kl2MI/tJo8ZsJcvcHV4AgmcXidAJlEjVRRlIQZtDZK0jfBBvC9dMOgx
	 8baKr2VSDYQes6F8qrQ+9rPQ0UBynr05NRyVsNi7m0+Mas07Q/Z0At5d+8zQvL40lU
	 eiFso4yW3FKVtvK5BMi2WlgTuMisaXxK6dhT3kgg/KW6+rmnc12/Xs3BNS2s6EelKF
	 FThv0hSOc8b++5kE36g2SYJ7WETMd3J2mBglO66ar33SDgZ7/1jIxJnADRIG3Dzvn4
	 1JCPGTxPKIeUfIQnssFHi7uqpH3ItwkuvSf4V70LvxdqmqBn8tELCi7tosNz8Lgoyd
	 WzxmXcGsWDFEw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/2] platform: arm64: qcom-hamoa-ec: test sensor
 and variant handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birk Skyum" <birk.skyum@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908135801.81436-3-birk.skyum@pm.me>
References: <20260908135801.81436-1-birk.skyum@pm.me>
 <20260908135801.81436-3-birk.skyum@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 14:20:03 +0000
Message-Id: <20260908142003.B5AD51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Assigning string literal to `void *` may discard const qualifier un=
der strict compiler settings.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but if `qcom_ec_prob=
e` fails after enabling SCI events, the EC hardware is left asserting inter=
rupts, leading to a potential IRQ storm.
--

commit 90290d681747d36fb1644086aa165106f32f7e12
Author: Birk Skyum <birk.skyum@pm.me>

platform: arm64: qcom-hamoa-ec: test sensor and variant handling

Exercise the sensor callbacks against a simulated I2C adapter. Check
little-endian RPM decoding, short transfers, malformed byte counts,
the unavailable-temperature sentinel and propagation of bus errors.

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec-test.c b/drivers/platfo=
rm/arm64/qcom-hamoa-ec-test.c
> new file mode 100644
> index 0000000000000..68868ef7625ae
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec-test.c
> @@ -0,0 +1,294 @@
[ ... ]
> +static void qcom_ec_variant_test(struct kunit *test)
> +{
> +	static const char compatible[] =3D "lenovo,yoga-slim7x-ec\0qcom,hamoa-c=
rd-ec";
> +	struct property property =3D {
> +		.name =3D "compatible",
> +		.length =3D sizeof(compatible),
> +		.value =3D (void *)compatible,
> +	};
> +	struct device_node node =3D { .properties =3D &property };
> +	const struct of_device_id *match;
> +
> +	match =3D of_match_node(qcom_ec_of_match, &node);
> +	KUNIT_ASSERT_NOT_NULL(test, match);
> +	KUNIT_EXPECT_PTR_EQ(test, match->data, &qcom_ec_slim7x);
> +	property.value =3D "qcom,hamoa-crd-ec";

[Severity: Low]
Does this assignment cause a compiler warning? It places a string literal i=
nto
property.value (which is a void pointer) without a cast, which may discard
the const qualifier under strict compiler settings.

> +	property.length =3D sizeof("qcom,hamoa-crd-ec");
> +	match =3D of_match_node(qcom_ec_of_match, &node);
> +	KUNIT_ASSERT_NOT_NULL(test, match);
> +	KUNIT_EXPECT_PTR_EQ(test, match->data, &qcom_ec_reference);
> +}
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential proble=
m in
qcom_ec_probe().

If qcom_ec_probe() fails after enabling SCI events, the EC hardware is left
asserting interrupts, leading to a potential IRQ storm:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_probe() {
	...
	ret =3D qcom_ec_sci_evt_control(dev, true);
	if (ret < 0)
		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");

	ret =3D qcom_ec_thermal_capabilities(dev);
	if (ret < 0)
		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
	...
}

Since SCI events are enabled on the hardware here, but there is no cleanup
mechanism (e.g. devm_add_action_or_reset) to disable them if subsequent pro=
be
steps fail, can this lead to an unhandled IRQ storm until the kernel core
forcibly disables the IRQ line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908135801.8143=
6-1-birk.skyum@pm.me?part=3D2
