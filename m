Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954189;
	b=t0fDVF/5rCWVOeuRD/lmUjE2EICZtBmOM2cE2L/3vsydf/4WW2aJKx+3EtwOpd2RbwnQ
	 N2zFvSeDEalYPEGMuybrT3TUJlppOISHjQUm6ALL0xWWEX3ko4+ktxz5QMbc3QrMfGfUI
	 JEFD+RZUdC2tsEnQ3cpoeHfUO0LQLA9lk/JbxGOXAc/qXqEn+YD/W8EQuDYFsByxd7EOB
	 Vi+EUOAE7+X//M53COdPTgIhlBAKOGPlXOd74zCfwXok7zqm7CzX+0o7FxU/vS3Mdn44I
	 GEb1GCz4KYc5nlyoRc1hpG+oF8KSgtG5Jo34RaQP/YtTTq8abD/SSJu0Sb9F12l/H6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954189;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ff5g0rVHgO8K6/WwRSi43lmxO0Rst8xnR2vm/YsaX8I=;
	b=DD++L+kiTZGsUqJAOclxB8A1TOaXvdtKGZ0nsREmZikxgIU1bLgg2WM4eEAsbXiPkEJ5
	 VlpQWs/hBdEjTOTAR2CqJNGx1RUk6eSPcj34BLhszUCEgDJdffL304QZKJNyV2bET6Pde
	 m1v7FCUlyGhHN1bG32vWmqtRKTgqXkWOeAqzLFpC3Z29QeZBkVBPDqmGjVGdce31+JZ54
	 EV3LFZtkNN6lihcTzoFRFzGc0sCQ7w9cjxk6EkqS0T5AZf9nT1yozYpNwWvqFG9+W61kp
	 YK7dGrzTj9RQrcozfr6GzkKNaCjyCdbPFxU+uuiMB9h3iY88CeR7k5lj0o9pRf9/edQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZ4+FseY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C51606A329;
	Fri,  6 Nov 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZ4+FseY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD201F008A5;
	Fri,  6 Nov 2026 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954189;
	bh=ff5g0rVHgO8K6/WwRSi43lmxO0Rst8xnR2vm/YsaX8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZ4+FseYggLwpzZwYZcq/w43wqpbqjDo36X8qW0NoIAMP/1r1MIsy7kdoQyKh0P7U
	 UxGCjFWKYUoR035VBNl8joQh6uVfN6qOUxnLKK++jKPdPVDw1qGIO5UGb8pdDkznoq
	 f+5BmF94Mcr1KbIEpRMbx7piVFzUCYjVXaMojbUs+rWxZhwNb/9rExy4UyupxJlUZS
	 pmyJ0ZF+SUUr/IhnGygGMWcbb/96bs2kVq6d1wxRZBF+v6x09AS/RnllywoBpj0Q/0
	 E9iIwfr1p5HTLfULF07W3ocy34jGYk4sWuSJTehuNUbytOltlch85/cPfDB8h4Qre/
	 xBF2AOCtrp5EA==
Message-ID: <sashiko-outbox-201075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-1-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-1-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:36:28 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] dt-bindings: mfd: brcm,bcm6846-pmc references files added in
  next patch
- [Low] dt-bindings: mfd: brcm,bcm6846-pmc example child nodes out of
  name order
- [Low] dt-bindings: mfd: brcm,bcm6846-pmc expands PMB as Processor
  Monitor Bus
--

commit 843b048574d4c45f386b5f401c61ae92d14a122f
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: mfd: Describe the BCM6846 PMC complex

This commit adds a Device Tree binding schema for the Broadcom BCM6846
third generation Power Management Controller (PMC3) complex.

> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> new file mode 100644
> index 0000000000000..d4c927cabb3f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,bcm6846-pmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6846 Power Management Controller
> +
> +maintainers:
> +  - Linus Walleij <linusw@kernel.org>
> +
> +description:
> +  The third generation Power Management Controller (PMC3) contains sever=
al
> +  register banks. This binding describes the Processor Monitor Bus (PMB)
> +  interface within Procmon. The PMB child owns its register bank. The pa=
rent
> +  provides address translation and does not own a register bank.

[Severity: Low]
As reported by William Zhang on v2 [1], should PMB be expanded as Power
Management Bus instead of Processor Monitor Bus here and in the example
comment below, matching Documentation/devicetree/bindings/power/brcm,bcm-pm=
b.yaml?

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: brcm,bcm6846-pmc
> +      - const: simple-mfd
> +
> +  ranges:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  '^bus@[0-9a-f]+$':
> +    $ref: /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
> +    description: PMB configuration, keyhole and address mapping registers
> +
> +required:
> +  - compatible
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/brcm,bcm6846-pmb.h>
> +    #include <dt-bindings/reset/brcm,bcm6846-pmb.h>

[Severity: Low]
As reported by Krzysztof Kozlowski on RFC [2], does make dt_binding_check
fail at this commit because /schemas/soc/bcm/brcm,bcm6846-pmb.yaml#, the
dt-bindings/clock/brcm,bcm6846-pmb.h and dt-bindings/reset/brcm,bcm6846-pmb=
.h
headers, and the child node bindings used in the example are not introduced
until the next patch in the series, commit "dt-bindings: soc: Describe the
BCM6846 Processor Monitor Bus"?  Ordering that patch before this one would
keep dt_binding_check bisectable across the series.

> +
> +    system-controller@ffb00000 {
> +        /* Broadcom BCM6846 Power Management Controller complex */
> +        compatible =3D "brcm,bcm6846-pmc", "simple-mfd";
> +        ranges =3D <0x0 0xffb00000 0x21000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        /* Processor Monitor Bus */
> +        bus@20100 {
> +            compatible =3D "brcm,bcm6846-pmb";
> +            reg =3D <0x20100 0x200>;
> +
> +            pmb_clk: clock-controller {
> +                compatible =3D "brcm,bcm6846-pmb-clock";
> +                clocks =3D <&osc50m>;
> +                clock-names =3D "ref";
> +                #clock-cells =3D <1>;
> +            };
> +
> +            pmb_reset: reset-controller {
> +                compatible =3D "brcm,bcm6846-pmb-reset";
> +                #reset-cells =3D <1>;
> +            };
> +
> +            hwmon {
> +                compatible =3D "brcm,bcm6846-pmb-pvtmon";
> +                clocks =3D <&pmb_clk BCM6846_CLK_PVTMON>;
> +                resets =3D <&pmb_reset BCM6846_RESET_PVTMON>;
> +                #thermal-sensor-cells =3D <0>;
> +            };

[Severity: Low]
Should the hwmon node be placed before reset-controller so that the child
nodes without unit addresses under bus@20100 are ordered alphabetically by
node name?  Otherwise scripts/dtc/dt-check-style --mode=3Dstrict warns that
child node hwmon is out of name order.

[1] https://lore.kernel.org/r/CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9=
D6YbKg@mail.gmail.com
[2] https://lore.kernel.org/r/ddfe83b7-d4b8-4d56-a295-fde63519bdde@kernel.o=
rg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D1
