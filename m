Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0DD17A2EA
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Apr 2026 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776141521; cv=none; b=pw6vNODBEo0mX3uRI8SeJm/KcFIJCnxtPsdQHVXs5Sib1MlLGsNvhVQumvRm55gY1IpeIpwGSshQKNGt02WkqxGX87vyeZ5zB/vAD1RCFe7bk7/25F9n73lsXEuR/AJRLAm6/aDVgKDsvn1sI9czXlRKLpn0Sfw4HpIpHgzZR5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776141521; c=relaxed/simple;
	bh=o6dQDXELEqI9laN88jG5mZwBaHOTM82Y02egtZQQ4sU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eyr/DkB9vW3XSAbTDdI3/qa+Oqj2vCWXkuBcGLeXKA/EjHsBsRbWYeKbq3rw47wS4wt3SGWjWQMGvtV4EM4EQTQ+UEgYsWE0atwqpdMhzqgQekXw5Pr3blq/2iFg7BKYtjf0Exl8YLs+Qa9NtPkRwJ8ikUuK/oiYtdEoceXsT80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=takrNhHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="takrNhHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED2AC19425;
	Tue, 14 Apr 2026 04:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776141521;
	bh=o6dQDXELEqI9laN88jG5mZwBaHOTM82Y02egtZQQ4sU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=takrNhHKLun+fgGUCYC08VstVNIK+gSjaOg9igvKHPJSUIqEfMQaKd9sz0od0mdBd
	 QGTC3WQEdAM09oOCszU/XdBsf1fAoG3jTejRulh0PoA3F1HapVWjYT+e0ekP+Tddq2
	 D/6lmUT23SCeY7NH0mmzt0iWghg9rSS/e+LE3m5/ffFkRteXDEmD/OmBRsqj4hsMwL
	 13sb0uogDahXYVoK4Dbn1xvpICNhA6NJWzg5v6wZmrSHGgkCCr0S7i4vXRxNSSFMTM
	 Kmkybp5uMpaUiziD6e/u5CEc9U3fBK9Sb4uMUl+KGS6PcAQd4OrhZqvEjlE8bXVFcY
	 EzVBqD/L3MHgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
Reply-To: sashiko@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
References: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Apr 2026 04:38:40 +0000
Message-Id: <20260414043841.1ED2AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [Medium] Incomplete Regulator Schema
- [Medium] Missing Hardware Capability (Interrupts)
- [Low] Devicetree Best Practices Violation (Node Name)
--

commit 20a4d8dcd2f3344ac22d7d2e974bae1ef57874ed
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

dt-bindings: hwmon: pmbus: add max20830

This commit adds device tree documentation for the MAX20830 step-down DC-DC
switching regulator with PMBus interface. It allows monitoring of voltage,
current, and temperature.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> new file mode 100644
> index 0000000000000..b20f3be176615
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: adi,max20830
> +
> +  reg:
> +    maxItems: 1
> +

Since this is a PMBus device that typically signals hardware faults to the
host via the standard SMBALERT# pin, should the schema define the optional
interrupts property?

> +  vddh-supply:
> +    description:
> +      Phandle to the regulator that provides the VDDH power supply.
[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - vddh-supply
> +
> +additionalProperties: false

The commit message explicitly states the MAX20830 is a step-down DC-DC
switching regulator with an adjustable output, but the schema omits any
reference to the core regulator schema or a regulators child node.

Because additionalProperties is set to false, does this prevent board
designers from describing the hardware's standard output constraints,
such as regulator-min-microvolt or regulator-max-microvolt, without
causing a schema validation error?

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@30 {

This isn't a bug, but the device node name in the example uses a Linux
subsystem name. Should it use a generic functional name representing the
hardware, such as regulator@30 or power-sensor@30?

> +            compatible =3D "adi,max20830";
> +            reg =3D <0x30>;
> +            vddh-supply =3D <&vddh>;
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260414-dev_max208=
30-v1-0-210d3f82c571@analog.com?part=3D1
