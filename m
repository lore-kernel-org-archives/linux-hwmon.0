Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD72BEFEB
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 02:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833233; cv=none; b=nmDsCof9T5ywgZ8o8HZ2FJmNhYy7LsJqn6oc53o1Fx9g5skUmUxyKebw1Zf3ZKiFeHNOYN+WviHIqMIRdeDh6665jrkcOqR6E+4cWMgNtzbqSwjs7wCWQBbuUonwZqN3w1NgBFeYZwQPt7a0+soFpI1R0BzgX7dwGSiqOP/kdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833233; c=relaxed/simple;
	bh=+lNgJAcLM9dNTt9ya6R1wibB/aTJwmp6ebQQ/oU6UPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FV48MpFX+eIr4hnhhtSvLnbE7uWhabLMPvp8rueKF4JMdyviAEDNtD+P1DrZQLDpaaEI23pAPZHKVclGsnWmilQTlAMUhpBa3yZNMtLR3CggJ5xTcCwM9sAfL8P4qgisblmX0HHdb7yLQqO9PRhJoxf6Nb+IOe7/bc9M8AuwZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PemW82v6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PemW82v6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED17B1F00A3A;
	Tue,  8 Sep 2026 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788833232;
	bh=3s8dEvZZIEr/zZAXpP0wAfqqw3MZN55PfUAOp5KzaJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PemW82v6DIUt/2xP9KCFEPf+7YNMG+uDe2/ak+Sx7WwvuQh8hGFvorpTW0ZsvAEHY
	 Yr7hunXbDfKgaQdPop+YqH/Bpxy8kaIyHW+41d0tOAJ+wCBi05vO7g6dp1/MUNwWju
	 eoeVxXcYeHhUQL7lC8EQcxyG46CaLmRs3DIoCI+AdhNlQC963vudwhhSsjgxEsDMaF
	 GT7wY/uMQlkWr32TAoI38A/y3f1Sv5ehZ6z2CWvJpK/hb3RJ9KyPjnDhuRo0L02kgr
	 GtbH064wKFZAxyXAxFPkpSJjyrzPljf5C8tUvGWDreuAx2fyD8o+dKGk0pSFaB1b3o
	 5cBGKav29EDRQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/2] platform: arm64: qcom-hamoa-ec: test sensor and
 variant handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birk Skyum" <birk.skyum@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908015650.84401-3-birk.skyum@pm.me>
References: <20260908015650.84401-1-birk.skyum@pm.me>
 <20260908015650.84401-3-birk.skyum@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 02:07:11 +0000
Message-Id: <20260908020711.ED17B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unresolvable devres reference loop causes a permanent hang during =
KUnit test cleanup.
- [Medium] Hardware monitoring device registered from a platform driver out=
side of drivers/hwmon/.
--

commit 10084c21cb97238d4ea1fb5148e02186d2b75bb5
Author: Birk Skyum <birk.skyum@pm.me>

platform: arm64: qcom-hamoa-ec: test sensor and variant handling

This commit introduces KUnit tests for the Qualcomm EC driver's sensor
transactions and read-only callbacks. The tests simulate an I2C adapter to
verify RPM decoding, short transfers, and error propagation without
accessing a physical EC.

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec-test.c b/drivers/platfo=
rm/arm64/qcom-hamoa-ec-test.c
> new file mode 100644
> index 0000000000000..68868ef7625ae
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec-test.c
[ ... ]
> @@ -0,0 +1,294 @@
[ ... ]
> +static void qcom_ec_probe_sensor_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx =3D test->priv;
> +
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), 0);

[Severity: High]
Does manually invoking qcom_ec_hwmon_probe() on a dummy I2C client cause a
permanent kernel hang during test cleanup?

The KUnit test creates a dummy I2C client using i2c_new_dummy_device(),
which lacks a bound driver. When qcom_ec_hwmon_probe() is manually invoked,
it allocates a child hwmon device via devm_hwmon_device_register_with_info(=
):

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_hwmon_probe() {
    ...
    hwmon =3D devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
                                                 &qcom_ec_hwmon_chip_info,
                                                 NULL);
    ...
}

Because the dummy client has no bound driver, devres cleanup is deferred
until its kobject refcount reaches zero. However, the registered child hwmon
device takes a kobject reference on the dummy client. This creates an
unresolvable cycle where the parent refcount cannot reach zero until the
child hwmon device is unregistered, which is supposed to happen in the
devres cleanup.

This prevents the dummy client from being freed, causing the subsequent
i2c_del_adapter() in test cleanup to block forever in
wait_for_completion(&adap->dev_released).

[Severity: Medium]
Does this code register a hardware monitoring device from a driver located
outside of the drivers/hwmon/ directory?

The hwmon subsystem architecture requires that hardware monitoring devices
be registered from drivers residing in drivers/hwmon/. If the main
functionality of the chip is not hardware monitoring, the hardware
monitoring functionality should be implemented as an auxiliary device driver
residing in drivers/hwmon/.

Here, devm_hwmon_device_register_with_info() is called directly by a
platform driver located in drivers/platform/arm64/:

drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_hwmon_probe() {
    ...
    hwmon =3D devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
                                                 &qcom_ec_hwmon_chip_info,
                                                 NULL);
    ...
}

> +	KUNIT_EXPECT_EQ(test, ctx->transactions, 1);
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +	ctx->reply[0] =3D 0;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EPROTO);
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908015650.8440=
1-1-birk.skyum@pm.me?part=3D2
