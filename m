Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572338;
	b=g3B3KBlsPH4BWNzC46AkcFvvQng2BWF59tkH7PPLLV5+SXPfq0bUi3OvILRspORPE/oA
	 kI5RzvzHgNFmDUcY/mm8EPCnruWZF4DWpWVNHIKuQOMX4BdKQHWYEBSvgNZ2pCY/5cmv3
	 DyEqxJFzyJLOoSZaONLlYTk76oHoJ007c5djFhz2wh+tIPqr0/XM8ofk736Z+ml8gg/QH
	 /aYNbxBLuY3oJrvS4hr5sAVDqdFVK2VMdY/zM26VpNHwabbiWYLAP1a3JUngTYyTnDHKX
	 f2XN3Up0AfJsDyoqvBT4ckAUrjBmaqFx2EMrG9/2KjTpsNgzv+hWr/z00/gVD0GFgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572338;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jw2ZdFoQ6ZM9vaYuZ7JP56kRgCq/+vpMvmfDEsQ1Dtw=;
	b=gdkpkbNBsQZTERcY4BolP7imlMmNE5hIvKj4CiPcg3xFHse68qabfOqdCFjWjlMuQoxW
	 WFbBF/OT6vzu5lCsGRu8sF+VbZ9iZ60hs5iZ85VExDoBcbo6w3dcJV1B33amqwulIyFCw
	 9hK60U/5NMtTYnOChEkFfW3cuq3sMwNLS/sfftVTC49vMSXLHombX3IMaaA2CFYYUMz3r
	 uaSCzuGblFIpyu756l+I6ROPVb4KdBrhla5+pt1MmIG/rP0sFr/TMPNflkeaEpHgAXPAa
	 Qjy4MvuQz1Uu/qfuSKRvHO4HrmTwFgof+Xv4ZP4DgiPUk8AgpLDVG9XEmlrsQIYXV5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqXreblo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8167F60A2602;
	Sun,  1 Nov 2026 22:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqXreblo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70DE1F0093A;
	Sun,  1 Nov 2026 22:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572338;
	bh=jw2ZdFoQ6ZM9vaYuZ7JP56kRgCq/+vpMvmfDEsQ1Dtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PqXreblo5xC8j7BeMqGVoA0hKJCCMPEl8b0czNO/r8ZjYFb09njIHZOdQlR/TIwQ3
	 Qmg0Hjspodh0pJMcx7dIQ3ukWmO9uW1g9vKi1H5nN7K6hFImBMP0hmDxINUyh1ll8I
	 nghpAzjBPtoo4X0vpJepvbMG9PVgVlfQEKG9dMfFYeI4WQboywQwpNLZRbeEj0ewsb
	 9XywfsA+TU53nn1PIx73/gPoElKY4/3q7mB6FYjKukGvAFrdWWCNVm31oihRT3HB+t
	 W98a1MwapoF6bQzi34ah+HYUwI9ABXoDLdPFNgkVYor6oR3dST0Q13x8QUuEhLJQSp
	 8vyTy4ALIqy9w==
Message-ID: <sashiko-outbox-192714@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-2-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-2-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:32:17 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Low] dt-bindings: soc: brcm,bcm6846-pmb ordered after dependent brcm,bcm=
6846-pmc
- [Low] dt-bindings: hwmon: brcm,bcm6846-pmb-pvtmon uses additionalProperti=
es with $ref
- [Low] dt-bindings: soc: brcm,bcm6846-pmb example child nodes out of alpha=
betical order
- [Low] MAINTAINERS: missing S: status tag in BROADCOM BCMBCA PMC3 PMB DRIV=
ER entry
- [Low] dt-bindings: reset: non-contiguous reset IDs in brcm,bcm6846-pmb.h
--

commit 44e16c21f8b2ce99a2b8f758565676392f84eec0
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus

This commit adds Device Tree binding schemas and header files for the
Broadcom BCM6846 Processor Monitor Bus (PMB) and its child clock, reset,
and PVTMON hardware monitor controllers.

>     dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
>    =20
>     The third generation Power Management Controller (PMC3) accesses SoC
>     block control and reset registers through the Processor Monitor Bus
>     (PMB). Describe the BCM6846 PMC and PMB.
>    =20
>     Signed-off-by: Linus Walleij <linusw@kernel.org>

[Severity: Low]
Should this commit be ordered before commit 39aa42d4e944 ("dt-bindings:
mfd: Describe the BCM6846 PMC complex"), and should the commit message drop
"PMC and"?

In the parent commit 39aa42d4e944,
Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml references
/schemas/soc/bcm/brcm,bcm6846-pmb.yaml# via $ref and includes
dt-bindings/clock/brcm,bcm6846-pmb.h and
dt-bindings/reset/brcm,bcm6846-pmb.h in its example before they are added
here, which causes make dt_binding_check to fail at the parent commit
during bisection.

> diff --git a/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvt=
mon.yaml b/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.=
yaml
> new file mode 100644
> index 0000000000000..9bf52cf097a32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
> @@ -0,0 +1,42 @@
[ ... ]
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6846-pmb-pvtmon
> +
> +  clocks:
> +    maxItems: 1
> +    description: PVTMON acquisition clock
> +
> +  resets:
> +    maxItems: 1
> +    description: PVTMON analog-acquisition reset
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - resets
> +  - '#thermal-sensor-cells'
> +
> +additionalProperties: false

[Severity: Low]
Since this schema includes /schemas/thermal/thermal-sensor.yaml# via allOf,
should it use unevaluatedProperties: false instead of additionalProperties:
false so that properties from the referenced schema are evaluated properly?

> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.y=
aml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> new file mode 100644
> index 0000000000000..a4a77fed94d05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> @@ -0,0 +1,80 @@
[ ... ]
> +        pmb_clk: clock-controller {
> +            compatible =3D "brcm,bcm6846-pmb-clock";
> +            clocks =3D <&osc50m>;
> +            clock-names =3D "ref";
> +            #clock-cells =3D <1>;
> +        };
> +
> +        pmb_reset: reset-controller {
> +            compatible =3D "brcm,bcm6846-pmb-reset";
> +            #reset-cells =3D <1>;
> +        };
> +
> +        hwmon {
> +            compatible =3D "brcm,bcm6846-pmb-pvtmon";
> +            clocks =3D <&pmb_clk BCM6846_CLK_PVTMON>;
> +            resets =3D <&pmb_reset BCM6846_RESET_PVTMON>;
> +            #thermal-sensor-cells =3D <0>;
> +        };
> +    };

[Severity: Low]
Should the unaddressed hwmon child node be placed before reset-controller
in the example so that the child nodes are in alphabetical order and pass
scripts/dtc/dt-check-style --mode=3Dstrict without a child-name-order
warning?

> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb4b3b631e82c..fa95f2dec63c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5446,7 +5446,13 @@ N:	bcm[9]?6878
> =20
>  BROADCOM BCMBCA PMC3 PMB DRIVER
>  M:	Linus Walleij <linusw@kernel.org>
> +F:	Documentation/devicetree/bindings/clock/brcm,bcm6846-pmb-clock.yaml
> +F:	Documentation/devicetree/bindings/hwmon/brcm,bcm6846-pmb-pvtmon.yaml
>  F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> +F:	Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
> +F:	Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> +F:	include/dt-bindings/clock/brcm,bcm6846-pmb.h
> +F:	include/dt-bindings/reset/brcm,bcm6846-pmb.h

[Severity: Low]
Should the BROADCOM BCMBCA PMC3 PMB DRIVER entry in MAINTAINERS include an
S: status tag (such as S: Maintained) so that scripts/get_maintainer.pl
--self-test=3Dsections does not warn about a section without status?

> diff --git a/include/dt-bindings/reset/brcm,bcm6846-pmb.h b/include/dt-bi=
ndings/reset/brcm,bcm6846-pmb.h
> new file mode 100644
> index 0000000000000..6b1a6baac1c60
> --- /dev/null
> +++ b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
> +#define _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
> +
> +/* XRDP packet engine and its three Runner cores. */
> +#define BCM6846_RESET_XRDP	0
> +
> +/* Process, voltage and temperature monitor analog acquisition reset. */
> +#define BCM6846_RESET_PVTMON	3
> +
> +#endif

[Severity: Low]
Since these reset constants represent abstract logical reset group IDs
rather than hardware register offsets or bit positions, should
BCM6846_RESET_PVTMON be defined as 1 instead of 3 so that the IDs in this
new binding header are contiguous starting from 0 and
bcm6846_pmb_reset_groups[] in drivers/reset/reset-bcmbca-pmb.c does not
carry two unused entries at indices 1 and 2?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D2
