Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E939FD4;
	Mon, 20 Jul 2026 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517707; cv=none; b=EbvwQgjQ4WO2AkYuqTTGDJno4W69w4GU/7lqRHsD01ffpk4oAxG9Pu1CXBU0+BtfOaQcGgWk393nZLMS8V5HVcaEnNXQrFZMXuttrOPdsj7pQ/6IcajMTUYK2kMlYJrOrgOkdanF4kHGndmQNeX+8xb9NE5QJ18SzLBvxkTfYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517707; c=relaxed/simple;
	bh=u5B6D71+vQS2p51PPpSnbwrlo+bUWBxw6b9yJ3SUuZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nHAlhsUFRpRWWWJFHyJyX7qWDOUGVJcUquV2CkXrGDqiaCewlbuXLeLVSSMdWAqoRgMW4TXFvoRo8sHIjBCJQHRuzxEkF9kXVCYcPUdvY65hYVknfAHW+sxzPQQ0HUiRFyKYv3ZTTF0VH8qKCgALgZ46tPHE7PkkS1ihw2t6qz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWROnJsz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWROnJsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A6C1F000E9;
	Mon, 20 Jul 2026 03:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784517706;
	bh=C8SNUjuo6XBjTbzqvo/BFcg1DND3PNe3OZLJ53kUML8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FWROnJszobnJPP9YcggH5qpWFv1wZmBpqzhv6wfC1Fx9dtgudLjCkVml1yTGMKW5N
	 0HMdMGjkq5dUB1LCs7j51Nrs06DuY0oIJFH2/I1LxcOj73GvFfMFIvHlY8IiCjBiMZ
	 T5wz22tDqXQRN5ZIOEUBMGPIudXWomIB6TL5wBRnRPeMaNF1Rrl6HEfOxSAdzfdN72
	 OykPN8ifNOMhUJSvDhtsle7wlWEBY95TerjzVmlRRFErHtronT2Jol06gnd0AXsnoY
	 9ipjc8lIrLgUT1DOM+xESfcAE1mubs9hkRfpivE46A0Msp2UjTPzcCQhKGwXCbfto1
	 bGLfbwLIZuLRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com>
References: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
 <20260720-dev-max20830c-v3-3-9d06d27d6da3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:21:44 +0000
Message-Id: <20260720032145.B5A6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The max20830 driver will reject the newly added MAX20840C device=
 during probe due to a hardcoded IC_DEVICE_ID check.
--

--- Patch [3]: [PATCH v3 3/4] dt-bindings: hwmon: (pmbus/max20830): add max=
20830c and max20840c support ---
commit b032b17e50351faefc688ad31e1428a3c641197a
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support

This commit adds compatible strings for the MAX20830C and MAX20840C variants
to the max20830 device tree binding, using a fallback to adi,max20830.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index 214adf1a3b9e9..b7d3b6152b582 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -22,7 +22,13 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: adi,max20830
> +    oneOf:
> +      - const: adi,max20830
> +      - items:
> +          - enum:
> +              - adi,max20830c
> +              - adi,max20840c

[Severity: Medium]
Will the driver correctly probe for the 'adi,max20840c' variant?

Looking at max20830_probe() in drivers/hwmon/pmbus/max20830.c, there is a
hardcoded string comparison for the device ID:

drivers/hwmon/pmbus/max20830.c:max20830_probe() {
    ...
    if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
        return dev_err_probe(&client->dev, -ENODEV,
                     "Unsupported device: '%s'\n", buf);
    ...
}

If a MAX20840C device is probed via the 'adi,max20830' fallback, it seems t=
he
buffer will start with "MAX20840", causing this check to fail and return
-ENODEV.

Does the driver need to be updated to recognize this new device ID so it do=
es
not reject the device?

> +          - const: adi,max20830

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-dev-max208=
30c-v3-0-9d06d27d6da3@analog.com?part=3D3
