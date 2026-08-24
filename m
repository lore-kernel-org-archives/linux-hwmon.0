Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DA43F081;
	Mon, 24 Aug 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586983; cv=none; b=Vyhi1+IFJaSoLfCqr7NYUPcdforZZK17OSVCsbZqeF4pMYMFlp1m5nBsR+Rn+b3L2Yv/U/5N6LAgn/z2VBFv/TLejWOyvuokRCf2TcwI3aeb2qrbdt4VmR+anSu75J+ykZVZs7SyS1VHufxb9GXKIAa6Mh09dcSUwrpEJywZOCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586983; c=relaxed/simple;
	bh=7vVgCRCHccUN3G7vCDFrvfAczHVMVD+dithT9jbnmfk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CMKJX9dOsOEsrnc+GZJYGdpH7uBqNsVuGuXvurN4h7dTgi+LqHKiT3LCvANl0T5y8Jel50Fk74V8Ci8XncHkJF645kMAw/SsXwdZBhzoXRa+wq4L9NIqic+yYzXkxKA+wF+JNSnIOQB3kvq7TkrlU9MU2l7dJE9kb6+PRAh93/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zi0gwT6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zi0gwT6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E651F000E9;
	Mon, 24 Aug 2026 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787586982;
	bh=w9rJhpDVQVCHCxhApfFKKk9Wu7P/cwhoWpvi03bF5j8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zi0gwT6N5FxW0e61cTJgAUaJazS3tOrWTOxnY9/h/OtVAaKWdY9op+oghPbP7pGCI
	 adQutIP2O/WPwNhDiKLeN3DfrSPeju0EWUql4pOenoml1J38nnMc73zCEDW0fZUXJ4
	 +Fz5wn3RNfPbZz00cfxdl/gD4TDH7oQ4dBmc54Xn9AtzMY5z5s77QVuVaPomKrs0ve
	 N3esvOSpW6jefzdIWUR2uCgwysTzLlYZviZWWFBmgLcHNQwYChk/jGtCDprBlgVD3l
	 OGAq7xIcVt+IlRej//J7tlRKIAo5fOrBP051+D1WamPKgnvuoWBBrkNaxO+nMl1uFD
	 7TA7RleJq3Oyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-supply
 and #cooling-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
References: <20260824-for-upstream-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 15:56:21 +0000
Message-Id: <20260824155621.E2E651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message makes materially false claims about the drive=
r's device tree parsing logic to justify leaving the binding examples uncha=
nged.

Pre-existing issues:
- [High] The driver fails to use `hwmon_lock()` or any other locking to ser=
ialize accesses between hwmon sysfs and thermal subsystem operations, leadi=
ng to race conditions and potential I2C corruption.
--

--- Patch [1]: [PATCH] dt-bindings: hwmon: microchip,emc2305: add vcc-suppl=
y and #cooling-cells ---
commit 2e59e1a6682ca5d565101743c080415ed986b896
Author: Vincent Jardin <vjardin@free.fr>

dt-bindings: hwmon: microchip,emc2305: add vcc-supply and #cooling-cells

This commit adds the missing vcc-supply and #cooling-cells properties to the
microchip,emc2305 device tree binding to resolve schema validation errors.
It places #cooling-cells at the controller node level.

> The #cooling-cells property belongs to the controller node, which is
> where the driver actually registers.
>
> Two cells is what that registration needs: a cooling-maps entry
> references the fan as <&emc2305 min max>.
>
> Two cells also documents what the driver supports today. The
> pwm-separate path registers one cooling device per PWM against the same
> node, and they all get cdev_id 0, so no cell count can tell them apart.
> That is a driver issue, noted here but not addressed.
>
> The examples in this binding put that property on the fan@N subnodes
> instead, which does not match what the driver does: they are left alone
> here rather than changed blind.

[Severity: Medium]
Is this description accurate regarding where the driver registers?

Looking at emc2305_probe() in drivers/hwmon/emc2305.c, when pwm_childs > 0,
the driver iterates through the subnodes and passes the child subnode direc=
tly
to devm_thermal_of_child_cooling_device_register():

drivers/hwmon/emc2305.c:emc2305_probe() {
    ...
    ret =3D emc2305_set_single_tz(dev, child, ch + 1);
    ...
}

It appears the examples in the binding are actually correct in placing
the #cooling-cells property on the fan@N subnodes when subnodes are present.

Could the commit message be updated to reflect this?

[Severity: High]
This is a pre-existing issue, but does the driver lack locking between
thermal subsystem and sysfs operations?

Looking at drivers/hwmon/emc2305.c, the thermal subsystem callback reads and
modifies shared state and performs I2C operations without acquiring any loc=
ks:

drivers/hwmon/emc2305.c:__emc2305_set_cur_state() {
    ...
    data->cdev_data[cdev_idx].cur_state =3D state;
    if (data->pwm_separate) {
        ret =3D i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(cde=
v_idx), val);
    ...
}

Concurrently, the hwmon sysfs callback modifies the hwmon state and triggers
I2C updates:

drivers/hwmon/emc2305.c:emc2305_write() {
    ...
    data->cdev_data[cdev_idx].last_hwmon_state =3D
        EMC2305_PWM_DUTY2STATE(val, data->max_state,
                               EMC2305_FAN_MAX);
    ...
}

Because the driver uses devm_thermal_of_child_cooling_device_register() for
its thermal device, the hwmon core lock is not automatically held. The hwmon
subsystem API requires drivers to implement their own locking (like hwmon_l=
ock())
for manually registered attributes.

Can this lead to race conditions accessing shared state and potential
interleaving of I2C operations to the same chip?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-for-upstre=
am-dt-emc2305-vcc-cooling-v1-1-cd3b53dfb5d4@free.fr?part=3D1
