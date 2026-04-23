Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69758340A76
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943392; cv=none; b=fpZKA535NBTB1qgB3TjWKp1u9zPDPBT9DmqkpbioakXHjgneQ16zNvhfELJrAUMWGqTYvm1G8W8s1bJyVYQnWTC99JTEgXmDLtIEGk5lN/QWiSt4sxPUOaThRWMoNEyiBLJfloELKfiiFH10UhehvNhwC4RCV8L5PV97Q3Dw7y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943392; c=relaxed/simple;
	bh=Unn71Qd56iE+ghOrbezQye/v5FwzZMemPDvTVk+2aZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ibr638DsCXa+PHIRmz+UNRpn8bLcRBZW9tVQb3mrrXe+j/9fXnPsEdyWZogMIkLngkhChNiS+1zPMe4xAyVGkGggCMZ4DNWXBSPXdiX8mrb/jirD4dqexfNTOaN2ZtA/u2RYUCFWPT093U2cVMufTbpra2jB9V6HpPuFmPUVSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ubq6rjrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ubq6rjrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2902C2BCAF;
	Thu, 23 Apr 2026 11:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776943392;
	bh=Unn71Qd56iE+ghOrbezQye/v5FwzZMemPDvTVk+2aZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ubq6rjrKCdrgK2T1aP0UTR0I+50VJC+vKOOvv5A0dzuNt818hnE4TgoC9d08zWOzp
	 rkI2RsSWqrGyImCc2YPY+YGpE6EMp1Xa249e+XcW7FTx0u+WRxtsgZR1KumyINS/Ba
	 EVwfZ2wid6JMxcMtaQXc2WDXvmYWqS414dQPiMx6Nm0Jji8vlsmtfHKwgklFQe70Fv
	 iGTrezx39IEWIDC7Ym4vDQT2i8OK1DRqYBbSCDNElzRobYdEtoYyGp2KrDLEOK0UHZ
	 ozTuUl7XSC2mGoM+jwNztH6dkB3WxE7S7zwXFNkOVphaEdMmLR11bq2i+8eCrClGhb
	 u54wtkzmgeHlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/13] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-2-akhilrajeev@nvidia.com>
References: <20260423085718.70762-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 11:23:11 +0000
Message-Id: <20260423112311.E2902C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [Medium] The `mipi-i3c-static-method` schema incorrectly enforces `minimu=
m: 0x1`, preventing devices from declaring no static address assignment sup=
port.
- [Low] The `assigned-address` property description is now inaccurate and c=
ontradicts the new capabilities.
- [Low] Missing macro definition for Bit 2 ('Other CCC') in `include/dt-bin=
dings/i3c/i3c.h`.
--

commit dbfc3abafb12042fa0c42239f7ff49c55d30eb3d
Author: Akhil R <akhilrajeev@nvidia.com>

dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA

This commit adds the 'mipi-i3c-static-method' property to specify which
discovery method an I3C device supports during bus initialization. The
property serves as a bitmap where each bit indicates support for methods
like SETDASA or SETAASA.

[1] https://www.mipi.org/mipi-disco-for-i3c-download

> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentati=
on/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd7857..225844abdd1fd 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
[ ... ]
> @@ -147,6 +149,27 @@ patternProperties:
>            through SETDASA. If static address is not present, this addres=
s is assigned
>            through SETNEWDA after assigning a temporary address via ENTDA=
A.

Does the description for assigned-address need an update here? It currently
states that if a static address is present, the address is assigned through
SETDASA. This seems to contradict the new capabilities allowing SETAASA.

> =20
> +      mipi-i3c-static-method:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x1

The description below states that "0 indicates lack of support", but this
minimum validation prevents setting the bitmap to 0. If an I3C target has a
static address but relies purely on ENTDAA, how can a developer override the
default value of 1 to specify that no static methods are supported?

> +        maximum: 0x7
> +        default: 1
> +        description: |
> +          Bitmap describing which methods of Dynamic Address Assignment =
from a
> +          static address are supported by this I3C Target. A bit value o=
f 1
> +          indicates support for that method, and 0 indicates lack of sup=
port.
> +
> +            Bit 0: SETDASA CCC (Direct)
> +            Bit 1: SETAASA CCC (Broadcast)
> +            Bit 2: Other CCC (vendor / standards extension)
> +            All other bits are reserved.
[ ... ]
> diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
> index 373439218bba6..8409addff0115 100644
> --- a/include/dt-bindings/i3c/i3c.h
> +++ b/include/dt-bindings/i3c/i3c.h
> @@ -13,4 +13,7 @@
>  #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
>  #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
> =20
> +#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
> +#define I3C_ADDR_METHOD_SETAASA     (1 << 1)

Since Bit 2 is documented as "Other CCC" in the binding and the maximum val=
ue
allows combinations up to 0x7, should there be a macro defined for Bit 2?
Adding one could prevent device tree authors from needing to use magic
numbers to represent this capability.

> +
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D1
