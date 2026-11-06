Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954626;
	b=iO51ytfFT7DnVgieV8QOC3AsYZ2Hm00/eXZl3h4QBOSQ3lwsQ8bvptu55t+/t4Qik3qK
	 R7Mog6gmyOY4ieZHi4inRmKl9y0iAh1POkVvzaQJlGdU5dmJUgiGVAMMT2unehVNpjGNj
	 OuGFAuakfJ/CO5SA9kNWUBaj2vaNt55q7QVJec4FOjqQaabyqnsKnBmzP1Nny12yK+O1U
	 SWVOUw1TobPUA50hKtBpTN5cDTFPl2Ytd/eHmCiT0BD/xPPUh7bK9y9/Vn6uvxAy158B2
	 qhSXPLERq/4BnF2B1S9/AdzBvOe46TgS2lt+RCki2eRkmHVLH5j7WYK3QtR67JAY+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954626;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HyGKIigqdSLl423M+2chQYvAFa3Ss1JLLb2uMO2fNSc=;
	b=XYRzy+kiVFpsmqAp1SgVG1tfxk2kC7E58AfzIXHAmPFMtT9H4ub2WRyji3SmMNvftieS
	 MMfE34joOLQk54UIYu4r0u3TPEaicfomTJJHnQRFdxtCLG847Ibg8umaXUDEZw4BptRTK
	 UgXssQVvNhYNmpIkKHzclA4pYOAVvAv+HyWrHlRr/BVCZxvu1QhuSgKM+BoHTimXty6BL
	 IUh3+ruWMvEOC3ua5bIif/NWQqrPFFjUBX3TyDHuGr9/X0IzK2TIHL7cCYscIeQ6r+mNM
	 PfMyAIvMXsYGsvIbMNIPckhXDzaQUswxstzOf8C1gCJW6NCbG6RaVYzaQ5jOEWp4vYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkfUEY8i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4100606A326;
	Fri,  6 Nov 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkfUEY8i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09E91F0089F;
	Fri,  6 Nov 2026 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954625;
	bh=HyGKIigqdSLl423M+2chQYvAFa3Ss1JLLb2uMO2fNSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dkfUEY8i/AScvuLID9+umPJImGqvKmczriKploG6xeK/XKneSrc9duIDZG2lHmDGu
	 /tpvMGdXOQzyQcR8v65zS5AmEThOg4LJUjUJ+cz8oClMsqCRNWJMYVtOEew1U37Bp8
	 /FEZlaS1is1q8t9gn06gaQuUB2bYlug/YbFMoEVTLSlWtgSNqSFvGpQBoCjwwh1ZIp
	 RoR2qfDjvrIEIvT7Tbea+QDfQ03mF3mS6JIRyVCaGDb5VamzUnaNanO2WAA0ITMf6F
	 umYWesoN4wL274VnViOR0AAukAqic7hNyN1cw9lqO83PXrmlgNEiJ5zekrXft42pDJ
	 DU9MxLRaHB+fA==
Message-ID: <sashiko-outbox-201085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-2-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-2-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:43:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Low] dt-bindings: hwmon: brcm,bcm6846-pmb-pvtmon uses
  additionalProperties with $ref
- [Low] dt-bindings: soc: brcm,bcm6846-pmb ordered after dependent
  brcm,bcm6846-pmc
- [Low] dt-bindings: soc: brcm,bcm6846-pmb examples violate
  dt-check-style strict rules
- [Low] dt-bindings: soc: bcm: driver-model child nodes in
  brcm,bcm6846-pmb
- [Low] dt-bindings: soc: bcm6846-pmb: expand PMB as Power Management
  Bus
--

commit 6ce40c3812dd052e5e8e3945888002592aa196c2
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus

This commit adds Device Tree binding schemas and header constants for the
Broadcom BCM6846 Processor Monitor Bus (PMB) and its clock, hwmon, power,
and reset child controllers.

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
Should this schema use unevaluatedProperties: false instead of
additionalProperties: false?  Because it references
/schemas/thermal/thermal-sensor.yaml# via allOf, additionalProperties: false
prevents properties defined only in the referenced schema from being
evaluated cleanly.

> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> index d4c927cabb3f4..77fbf92926ab3 100644
> --- a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> @@ -60,6 +60,11 @@ examples:
>              compatible =3D "brcm,bcm6846-pmb";
>              reg =3D <0x20100 0x200>;
> =20
> +            pmb_power: power-controller {
> +                compatible =3D "brcm,bcm6846-pmb-power";
> +                #power-domain-cells =3D <1>;
> +            };
> +
>              pmb_clk: clock-controller {
>                  compatible =3D "brcm,bcm6846-pmb-clock";
>                  clocks =3D <&osc50m>;

[Severity: Low]
Should this commit be ordered before commit "dt-bindings: mfd: Describe the
BCM6846 PMC complex"?

That earlier commit introduces brcm,bcm6846-pmc.yaml referencing
/schemas/soc/bcm/brcm,bcm6846-pmb.yaml# and including
dt-bindings/clock/brcm,bcm6846-pmb.h and
dt-bindings/reset/brcm,bcm6846-pmb.h before this commit adds them, which
breaks make dt_binding_check bisectability at the parent commit.  In
addition, the commit message here still states that it describes the PMC and
only mentions the power controller child, omitting the clock, reset, and
PVTMON schemas and headers introduced in this patch.

> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.y=
aml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> new file mode 100644
> index 0000000000000..134a8a676dbd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6846 Processor Monitor Bus
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description:
> +  The Processor Monitor Bus (PMB) connects the third generation Power
> +  Management Controller (PMC3) to the control registers of miscellaneous
> +  independent hardware blocks.

[Severity: Low]
As reported by William Zhang on v2 [1], PMB stands for Power Management Bus
rather than Processor Monitor Bus.  The commit subject, commit message, and
all five new binding schemas in this patch still expand PMB as Processor
Monitor Bus.

[ ... ]

> +  power-controller:
> +    type: object
> +    $ref: /schemas/power/brcm,bcm6846-pmb-power.yaml#
> +
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/brcm,bcm6846-pmb-clock.yaml#
> +
> +  reset-controller:
> +    type: object
> +    $ref: /schemas/reset/brcm,bcm6846-pmb-reset.yaml#
> +
> +  hwmon:
> +    type: object
> +    $ref: /schemas/hwmon/brcm,bcm6846-pmb-pvtmon.yaml#

[Severity: Low]
As reported by Philipp Zabel on RFC [2], should #power-domain-cells,
#clock-cells, #reset-cells, #thermal-sensor-cells, and the reference clock
live directly on the brcm,bcm6846-pmb node instead of using four addressless
child nodes?

Neither power-controller nor reset-controller has any DT resources of its
own, and the power, clock, reset, and hwmon drivers all access shared 32-bit
BPCM zone control and PVTMON_CONFIG registers over the parent PMB keyhole
interface.  Folding the provider cells into the brcm,bcm6846-pmb node avoids
encoding the Linux MFD sub-driver split into the Device Tree ABI while still
allowing the MFD driver to instantiate child devices internally.

[ ... ]

> +        pmb_power: power-controller {
> +            compatible =3D "brcm,bcm6846-pmb-power";
> +            #power-domain-cells =3D <1>;
> +        };
> +
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
Does this example (and the matching example in brcm,bcm6846-pmc.yaml) trigg=
er
unused-labels and child-name-order warnings under scripts/dtc/dt-check-style
--mode=3Dstrict?  The pmb_power label is never referenced in the example, a=
nd
the unaddressed child nodes under the PMB node are not in alphabetical order
(clock-controller, hwmon, power-controller, reset-controller).

[1] https://lore.kernel.org/r/CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9=
D6YbKg@mail.gmail.com
[2] https://lore.kernel.org/r/f1c24a603964302ec1462b1cea790a2a7079fb3d.came=
l@pengutronix.de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D2
