Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571884;
	b=1HN2yv1m7t1telkxvy2K5Sw25SQN2kjZcn24LOj4WK/aAxjjWhQ8DLltKMH3MZqjF+ZW
	 kuuOaw/wjo1AM1Pv3S5zJib27Fc/pnZhBpcnHAhSXgrlnG/LHvq2x00eVr7Msq7xhFNJ0
	 2Cs5ZKiKatvKRsCNIXSvbZrCr/bVwYYnamnA5h7T9yvRHYHdhoDTH2BN+QdWYUxYn0AwC
	 23qcDIhxmwqP7LXhE6iiuhCOhGdF+EcnSF2MmGUg6Anq/Fny62x0axrOZQv6t8C97x76s
	 avOhI59NU3J6wYlWLufHWavkloFczGtHJLoiygN9cJOqLyL4yMjIF0x4xZCpWKL/w9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571884;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EKbi8jrqoQwFGPzDmvjh8kIwRvTdotgtU7HnVsX5eis=;
	b=0+eTL6+s+86dTWmI0Pca6Cp1uBNWf4ltMUb3n0RaAlAQK+EJqqHMzojS8ZKMkGnqXsQR
	 Er3XTW/lNf2AeHHctlBVYtzdepBt8AfY6jVqi877iRSHUT+76a8Qf6Wt+hkoFltO0xZeA
	 AqLvkAivCPE1YdYrGD2Zxp5GZ6KuZaKd5C3SiA6KoGAWc1EGXXlOFFJC6U7J+5aQnbc8E
	 /T1wg90Urylu5093AjLkvqgSZzAPObbmMU3wHJqGGzPj7a9oiMLlq2vxBz5Fab4ozYxi6
	 gVyo4qZLJoG93NBox2hl2ylYWUeUE7wqu65lh8eVznMgGUjMKt3kckHSvjpNpTifDeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLBkpnPg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548D606A333;
	Sun,  1 Nov 2026 22:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLBkpnPg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515401F000C1;
	Sun,  1 Nov 2026 22:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571883;
	bh=EKbi8jrqoQwFGPzDmvjh8kIwRvTdotgtU7HnVsX5eis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLBkpnPgsryNbyoi3DU9f6Y3JhcTDJxTH9wO8OVj1wP//C0B/Cg9AcKrrC/thAERz
	 2hTpJ1tfclZv25YjIo/GOj/Sj8hK+TOtcc0rewYaTsdt7YUdxRDOTrj8/DuWOGZ8tB
	 nTiZT3JVmoU0AOkfPkn38N9qgKradfd5r1DAzKdr6LVUFogszNYwkpHOLBScevmD4C
	 ZSeEL/U+OW6egnxgKkkYn/vbaGxoUpwgiSvxpwCvcQOB7OZ2vnXvZwGZh65P+0hci+
	 ZT+Jfm2zm4Dd3jUbChQEt2RA54HfGTJwAOUejzCE4askhsKLYuGsdlaWNjpj7ASRZ8
	 1mU4v4NHxFgoQ==
Message-ID: <sashiko-outbox-192711@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-1-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-1-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:24:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] dt-bindings: mfd: brcm,bcm6846-pmc references files added in next p=
atch
- [Low] dt-bindings: mfd: brcm,bcm6846-pmc example child nodes out of name =
order
- [Low] MAINTAINERS: missing S: status field in BROADCOM BCMBCA PMC3 PMB DR=
IVER
--

commit 39aa42d4e944629fc1763b294af564d34ce88b86
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: mfd: Describe the BCM6846 PMC complex

This commit adds the Device Tree binding schema for the Broadcom BCM6846
Power Management Controller (PMC3) complex and adds a corresponding
entry in MAINTAINERS.

> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> new file mode 100644
> index 0000000000000..78aef68bc3183
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
> @@ -0,0 +1,82 @@

[ ... ]

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
As reported by Krzysztof Kozlowski on RFC [1], does running
make dt_binding_check fail at this commit because patternProperties
references /schemas/soc/bcm/brcm,bcm6846-pmb.yaml# and the example
includes dt-bindings/clock/brcm,bcm6846-pmb.h and
dt-bindings/reset/brcm,bcm6846-pmb.h before they exist in the tree?

Those headers, the referenced schema, and the child compatibles
(brcm,bcm6846-pmb, brcm,bcm6846-pmb-clock, brcm,bcm6846-pmb-reset, and
brcm,bcm6846-pmb-pvtmon) are only introduced in the subsequent patch,
commit 44e16c21f8b2 ("dt-bindings: soc: Describe the BCM6846 Processor
Monitor Bus"). Should that patch be ordered before this one so that
schema validation and example compilation succeed at every commit in the
series?

> +
> +    system-controller@ffb00000 {
> +        /* Broadcom BCM6846 Power Management Controller complex */
> +        compatible =3D "brcm,bcm6846-pmc", "simple-mfd";
> +        ranges =3D <0x0 0xffb00000 0x21000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        /* Called PMB Processor Monitor Bus in vendor tree */
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

[Severity: Low]
Should the hwmon node be placed before pmb_reset: reset-controller in
the bus@20100 example node?

For child nodes without unit addresses, DTS coding style requires
alpha-numerical ordering by node name, and check_child_name_order() in
scripts/dtc/dt-check-style --mode=3Dstrict warns when hwmon appears after
reset-controller.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065d..eb4b3b631e82c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5444,6 +5444,10 @@ N:	bcm[9]?6856
>  N:	bcm[9]?6858
>  N:	bcm[9]?6878
> =20
> +BROADCOM BCMBCA PMC3 PMB DRIVER
> +M:	Linus Walleij <linusw@kernel.org>
> +F:	Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml

[Severity: Low]
Is this new MAINTAINERS entry missing an S: status line (such as
S: Maintained)? Without it, scripts/get_maintainer.pl
--self-test=3Dsections reports a section without status warning.

[1] https://lore.kernel.org/r/ddfe83b7-d4b8-4d56-a295-fde63519bdde@kernel.o=
rg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D1
