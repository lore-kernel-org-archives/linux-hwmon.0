Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD1B3C3F41;
	Thu, 30 Jul 2026 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447262; cv=none; b=pcboczKrKjce/r3SiJsp9mCItGS8cegRWk+KiAMmNSvQTOq7DYPKYwY4oB+TofmGfflsC68B5ReYhebpfZ0yL5PIov+qYrAW2pbwKzvbbtTGAYv9iB1Q99mgo9JRsNfskxdutvdR1PFE2rug0LEQVsZ7pgROl7oHll2A0ixP7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447262; c=relaxed/simple;
	bh=Xof4ElR8+OMdie8I1S+cO4hmeWl54Ft6xtPWU3rpBBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aYMIc8OjbdteYZWzcc21A8S2I9AhwC5nNc1J1Br8IRuhUDobzZFdJ2njJbQ7wqNiPkrapH/8hj4kPXcQHMlNuBUZgpd6HAA2wbBbT5p9AIp613WJrAC5y7TA7E2IZsTHct/wncrr6aOvFUpCtubrS63hhge3AIzTLWZAtZa9GaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Slm2yF4J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Slm2yF4J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81981F000E9;
	Thu, 30 Jul 2026 21:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785447261;
	bh=YwLk4ZhmnjUCsrzqv3VdexZCzk5AuXVwtlE0ge+3kM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Slm2yF4JKvSg2mhQJIaIjEQHISCwBQJLypZJCH8FgJVpR2oOtxCoSzyjkJXs4Czm7
	 gTB1O/9ANQQbEiiVa7oHbW4SqVD6dwJf9x66QyWSdzh0rXLaNGCiZe+iZ6/99Q4PS2
	 wfleJ6f+f85BECrJPVwbYT4HfftGoji6A612qnUUq0Tv/ptNHFSas4rUwwYblIm0ej
	 5de2XBu12Bfyhx6+YkGQsG/EPRYGbR93kzCmAp5qVg3kOOsShilYTjpFYquz/9U8+4
	 d80UmSSvvoEh1W8Ge9ZJVIhlgBn7TVrzYoYqcnwoAk03AuVYQNMaW/3hvLpN+94ccz
	 rHvy96fJYrKHQ==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v5 1/4] dt-bindings: hwmon: add adi,adt7470
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-adt7470_thermalzone-v5-1-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
 <20260730-adt7470_thermalzone-v5-1-42995a6bb8c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 21:34:20 +0000
Message-Id: <20260730213420.C81981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The provider capability property `#pwm-cells` is omitted from th=
e `required` list despite the hardware functioning as a PWM provider.
--

--- Patch [1]: [hwmon-next PATCH v5 1/4] dt-bindings: hwmon: add adi,adt747=
0 ---
commit 5105b0d67f8fd87224b8f539a86af2d5d3710517
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

dt-bindings: hwmon: add adi,adt7470

This commit adds device tree binding documentation for the Analog Devices
ADT7470 multichannel temperature sensor and PWM fan controller. It defines
properties for thermal sensors and models the fan control lines as PWM
channels.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> new file mode 100644
> index 0000000000000..f653a06f241aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> @@ -0,0 +1,58 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: adi,adt7470
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  "#thermal-sensor-cells":
> +    const: 1
> +    description:
> +      Valid index values are 0 to 9, corresponding to temp1 through temp=
10.
> +
> +required:
> +  - compatible
> +  - reg

[Severity: Medium]
Since the device acts as a PWM provider and defines #pwm-cells, should
#pwm-cells be added to this required list?=20

The device tree bindings subsystem guidelines state that when a device adds
provider capabilities like PWM output, the corresponding standard properties
must appear in the required list. Without it, incomplete device tree nodes
that are missing #pwm-cells will pass schema validation, which could mask
configurations that will fail at runtime when dependent consumers attempt to
use the PWM capability.

> +
> +unevaluatedProperties: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-adt7470_th=
ermalzone-v5-0-42995a6bb8c5@gmail.com?part=3D1
