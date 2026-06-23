Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2AC3AA4E1;
	Tue, 23 Jun 2026 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194731; cv=none; b=JyvA0yna9WnEKCayPse9+IYf73QwTVs3Or7icZKhMu8bgQqNtlgORoViYgGqwcFsH1XSWvsl1ckQOf/KxebBWx5ZhOvTJEq2oiEBVGhxg7DKXYyydRZy0GoiHVusLkp6T3NQAn5RGPHwFmggwEX6s3i0tjjo20SgKQhJskvKDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194731; c=relaxed/simple;
	bh=r0sj/Azq0OkR6B6xr+X+vmHdEoEbwiP3FSAJbUSloAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ld5nVuVkdwMA4Pa8MdgF6iFxsEPwqzVg3/GFtFKvNu2eoTzbA9ohhWEDmPBYSRIO1IdBs52Oovndw5I8XClc9j2ZMAWkf8iOMEEdA+hSb8A06M6rWAzAQwvmVdYg0cV4W4/m0D+9otn4w1LaNnCsA2SvGbjGqwEkMTzcUsV5XZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvbTNqIV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvbTNqIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B147E1F00A3A;
	Tue, 23 Jun 2026 06:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782194730;
	bh=gFN94CbkxuKMREe0dzgKun1w9F/fKof9XWXDf5dyawk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bvbTNqIVrKLlWd2ry2MQFYVbYn6yVMkVIFYWhosgNNHPFsJKOn6Y00L5nlLuzHFD2
	 RCASxEcAk6vErOE3KymCcWjHzRaG1VeX4RuLm6RppcUkkLEYYwnN5W1YIbectdMYxO
	 GA329rkMCoO+FnEqyYUrFW6Lf2rxGuxMfvb60Sm2GifR/hKyTZwtRW0H7vkOXsZ1HW
	 bZbioaSxBgU56OY/tQYvGEiZGRLPEL2eKig/9KbOgeD9zNnZVJ7lkgugzQGTJTdQUr
	 HYoeWoKlQIMJssYTh97if0k7pN5Zu9QcPL/1WrTgrFq480zNPgXH1E2Emr5ygXNAVa
	 Ksy3OJuxY1g0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 06:05:29 +0000
Message-Id: <20260623060529.B147E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding lacks a `regulators` node definition, preventing it =
from functioning as a voltage regulator provider in devicetree.
- [Low] The devicetree example uses a specific model name for the node inst=
ead of a generic name.
--

commit 52162fef263cc41ea7598b089db89b70bb4f6ebb
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

dt-bindings: hwmon: pmbus: Support for onsemi's FD5121

This commit adds the devicetree schema for onsemi FD5121, FD5123, and FD5125
dual rail, multi-phase digital controllers.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml
> new file mode 100644
> index 0000000000000..b0453b0634f0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/onnn,fd5121.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Medium]
Since this device is a multi-phase digital controller, should it have a
regulators subnode pattern?

The additionalProperties: false constraint strictly prohibits developers fr=
om
defining regulator constraints in their device trees. As the PMBus core
framework looks for the regulators child node, would it be better to add an
explicit pattern here to allow consumers to reference the device's voltage
rails?

> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      fd5121@50 {

[Severity: Low]
Is it possible to use a generic node name here like regulator@50, pmic@50, =
or
sensor@50 instead of the specific model name fd5121@50?

The Devicetree specification recommends generic node names to ensure standa=
rd
patterns are used in examples.

> +        compatible =3D "onnn,fd5121";
> +        reg =3D <0x50>;
> +      };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-support-fd=
5121-from-onsemi-v1-0-b31767689c65@onsemi.com?part=3D2
