Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851F377031
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532350; cv=none; b=dMU3N3yufssr06AkztBi9y01qxA3r0to4Rm1YQoMs5TFpLJfPHCm71BKepdvpp1r9CHkhPb67C2e6HkRRDZaEA6gYfS8C/Ukb629o5FS+y2biutmi51L8M4KAo0eBH8rVO5OUWTOsM6UEh0vVYxbK0DttbaD7B5Gl3vtvxxsWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532350; c=relaxed/simple;
	bh=0TpSkqSjHm4PlPH8RpA+Y8r1kKRJ8SaGeFh+TgghSMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OUpU2cG4bYMH7akoiwXd+AY18HlONNa3nshKJchU0sjRZgWgYdRTLJBCHgnlqS+XnQTfs7OJ+kLerym7zjZb/4s2BsuG+orCaQOpNFAayfZgrgg3ZRPb9HDTFLWEQIE4iZj210KXP7ZMlt2KfYfOiu4JFW/r3dkFxKXYgElanh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+zS/lg+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+zS/lg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981EAC4AF09;
	Thu, 30 Apr 2026 06:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777532349;
	bh=0TpSkqSjHm4PlPH8RpA+Y8r1kKRJ8SaGeFh+TgghSMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A+zS/lg+NfHaSUOb2v+phjoAbHNCs//AtmU0ZGDqqW90Uf569KDz1pd0BsoQP5dBk
	 Cm6p3J0pMe5RvExXRB2om6KPxxBbqh/M++wYH+vpfIqe3n8Kxo2Nq1urn94bhzWbtY
	 nkKnjknUjThlMoccZuuxxthdOcLqyzYsXNw9xjjHnfW9/KGhlJT+B6cZX74oxRpJUc
	 fGOpJwbRLFsEAQsh6RxUO/JRRDiz9dTbeVrmo1/ZR1IXQqtcGNunqjjugI8WEQnPf2
	 AZK1dKYVXODjZljQocGviOV31mfRCz7FMiU6gr0HRcihK/hK7gfNtbU17mzFCSUXe+
	 jlzsCkpka9jMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
Reply-To: sashiko@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430-add-e50sn12051-v3-1-f6d4e043ec7c@gmail.com>
References: <20260430-add-e50sn12051-v3-1-f6d4e043ec7c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 06:59:08 +0000
Message-Id: <20260430065909.981EAC4AF09@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The binding description violates Devicetree principles by describin=
g software instead of hardware. It explicitly states 'The driver supports..=
.', which is an OS-specific software description.
- [Low] The Devicetree example uses the Linux-specific subsystem name 'hwmo=
n@40' for the node name instead of a generic functional name.
--

commit 8f686eaa80cf8986d09fe9ea7dca7debf1c51cb1
Author: Colin Huang <u8813345@gmail.com>

dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding

This commit introduces the devicetree binding schema for the Delta E50SN120=
51
PMBus-compliant sensor.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn120=
51.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.ya=
ml
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
[ ... ]
> +description: |
> +  This binding describes the Delta E50SN12051 PMBus sensor.
> +  The driver supports reading voltage, current, and temperature
> +  using the PMBus interface.

This isn't a bug, but should the description focus purely on the hardware
rather than mentioning what the driver supports? Devicetree bindings are
generally expected to be OS-agnostic hardware descriptions.

[ ... ]
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hwmon@40 {

Is hwmon@40 the most appropriate node name here? The devicetree specificati=
on
usually recommends using generic names that reflect the function of the
hardware, such as sensor@40, rather than OS-specific subsystem names like
hwmon.

> +            compatible =3D "delta,e50sn12051";
> +            reg =3D <0x40>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430-add-e50sn1=
2051-v3-0-f6d4e043ec7c@gmail.com?part=3D1
