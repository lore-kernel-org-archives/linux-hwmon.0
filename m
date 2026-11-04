Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763593;
	b=XxciA3DiDCVF8HH04qTVSR7sIIbkKL2X48kNu2HDdWVaoMZeVlAr+79QpZfIxGL5rIXU
	 hym9JATtb1p7XVloKe5n++tH3bjlzwbcKhM2dasid85HdW37NWhc9JuQ+q7Fj4nene60H
	 eK5NMvn18j4vvORgyDxAjsFbuoduMYYlWv+3+sLoQHrCwkt/pWIh+fHJ3uEZ9hsyMVKlm
	 YVzlpUJp7XUQBg0oK47IfMdbiGokTFQkndZ/i6JUw4Ziz9khg+yBisHpR6bWB67b0tcFI
	 mHxBPyvJ5L+G89iwvXw2MKoo9rJIB8JyxPrbKJILqz/2b8BYvQClu3Qas31cDi6RZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763593;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Be1MpHVkk0EzgqPoBgUwPLOvumuF2Q0xKTl/gK0yeGc=;
	b=N4aw4a0haNxUGTa+kwiOk/duVVGypkKvzzaIqBwr0lSME+E/h1zUotH9TPwbsONIRyjR
	 eSTVPka86VdlOHP10QPMK7/Im1Yd9W+PhpL0rcr7rYJKh868HuBMSXr+0hH33D9+EmBAf
	 hB7GfX/RCStOlupqvDroHDCCm8vudwcIf88gloh9UeE7GhRCYIRBS6iASeqLHH+mWSNFM
	 mU2j0UK+8jjTx385tD1Gx+Q87oTVfGI8qZTs+HGBkD/EWuVchxXX2owGGI3lhEEHVMEQ1
	 IFMcXGBMJHIWgBCcBd+3fTmIhEt3JuEuzdf+cdLNoOOeVl+pXzvPKvPMCYEsoNNqCsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHcQO4fH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F19606A31B;
	Wed,  4 Nov 2026 03:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHcQO4fH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA061F000C1;
	Wed,  4 Nov 2026 03:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763593;
	bh=Be1MpHVkk0EzgqPoBgUwPLOvumuF2Q0xKTl/gK0yeGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHcQO4fHxAaswNBWJAebWe76Nv7T0Jy0mulr35nzW6x6aniZJ3rZ76TkQsmIgjPmK
	 VufVqnSuQ9XMQrRRa7vB5O9n1V48MTAPKpBDNdgRLGKXRPIgTp1Obhz0HnmJuGkYuw
	 uEd8+QexGvBPdRameM6t0KZbR9CoaIwzrddc8YX6daTKiycb0B8U6v7QCnFdhouMcg
	 uFyRXlOdsa/+ZbV6c5dBz+cQwDOa37l1sjUFhFARjHlxvuLKggoaZXCvef4g1K6xt3
	 DcWLI84T/BTX7WWql51mFVDKNtaKxK1FBzvQOFId4+vxUfPsLTMAvo97cu4EGTLZ2Q
	 2Hf2jnYtWPvKQ==
Message-ID: <sashiko-outbox-196618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 03:39:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: hwmon: ltc4283: requiring rsense2 breaks single-dri=
ver mode
- [Low] dt-bindings: hwmon: ltc4283: ltc4284 example sense resistors below =
min 50000
--

commit 9676b294cf2ad1168e5ce0d8de5c0cd58e68d9ed
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

dt-bindings: hwmon: ltc4283: add ltc4284

This commit adds device tree binding support for the Analog Devices LTC4284
negative voltage hot swap controller to the adi,ltc4283 schema, including
new properties for its second sense resistor and ADC resistance.

> diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/D=
ocumentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> index 05e2132ad4d86..c850390ddc4a3 100644
> --- a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> @@ -10,22 +10,42 @@ maintainers:
>    - Nuno S=C3=A1 <nuno.sa@analog.com>
> =20
>  description: |
> -  The LTC4283 negative voltage hot swap controller drives an external N-=
channel
> -  MOSFET to allow a board to be safely inserted and removed from a live
> -  backplane.
> +  The LTC4283 and LTC4284 are negative voltage hot swap controllers that=
 drive
> +  external N-channel MOSFETs to allow a board to be safely inserted and =
removed
> +  from a live backplane.
> +
> +  The LTC4284 features dual-gate drivers with four operating modes (sing=
le
> +  driver, parallel, high stress staged start, and low stress staged star=
t)
> +  configured via the hardware MODE pin. The MODE pin must be connected t=
o the
> +  appropriate voltage level (VEE, VIN, INTVCC, or left open) and cannot =
be
> +  controlled via software or GPIO.
> =20
>    https://www.analog.com/media/en/technical-documentation/data-sheets/lt=
c4283.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/lt=
c4284.pdf
> =20
>  properties:
>    compatible:
>      enum:
>        - adi,ltc4283
> +      - adi,ltc4284
> =20
>    reg:
>      maxItems: 1
> =20
>    adi,rsense-nano-ohms:
> -    description: Value of the sense resistor.
> +    description:
> +      Value of the sense resistor. For LTC4283, this is the resistor con=
nected
> +      between SENSE+/SENSE- pins. For LTC4284, this is the resistor conn=
ected
> +      between SENSE1+/SENSE1- pins.
> +
> +  adi,rsense2-nano-ohms:
> +    description:
> +      Value of the SENSE2 current sense resistor. This resistor is conne=
cted
> +      between SENSE2+ and SENSE2- pins.
> +
> +  adi,radc-nano-ohms:
> +    description:
> +      Value of the effective resistance seen by the ADC+/ADC- pins.
> =20
>    adi,current-limit-sense-microvolt:
>      description:
> @@ -195,6 +215,20 @@ required:
>    - adi,rsense-nano-ohms
> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,ltc4284
> +    then:
> +      required:
> +        - adi,rsense2-nano-ohms
> +        - adi,radc-nano-ohms
> +    else:
> +      properties:
> +        adi,rsense2-nano-ohms: false
> +        adi,radc-nano-ohms: false

[Severity: Medium]
As noted in the binding description above, the LTC4284 supports four
hardware operating modes configured via the MODE pin, including single
driver mode.

In single driver mode, only the first MOSFET path (GATE1 and SENSE1+/SENSE1=
-)
is used, and no second sense resistor is populated between SENSE2+ and
SENSE2-.

If adi,rsense2-nano-ohms is unconditionally required in the allOf block for
adi,ltc4284, wouldn't boards wired in single driver mode fail schema
validation unless they specify a nonexistent adi,rsense2-nano-ohms property?

> @@ -269,4 +303,19 @@ examples:
>              #gpio-cells =3D <2>;
>          };
>      };
> +
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        swap-controller@20 {
> +            compatible =3D "adi,ltc4284";
> +            reg =3D <0x20>;
> +
> +            adi,rsense-nano-ohms =3D <1000>;
> +            adi,rsense2-nano-ohms =3D <1000>;
> +            adi,radc-nano-ohms =3D <500>;
> +        };

[Severity: Low]
In drivers/hwmon/ltc4283.c, ltc4283_setup() validates the sense resistor
properties against [LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE], where
LTC4283_MIN_RSENSE is 50000 nano-ohms (50 micro-ohms) and LTC4283_MAX_RSENSE
is 1677721599 nano-ohms:

    if (st->rsense < LTC4283_MIN_RSENSE || st->rsense > LTC4283_MAX_RSENSE)
        return dev_err_probe(dev, -EINVAL,
                             "adi,rsense-nano-ohms(%u) too small or too lar=
ge [%u %u]\n",
                             st->rsense, LTC4283_MIN_RSENSE, LTC4283_MAX_RS=
ENSE);

The example above sets adi,rsense-nano-ohms =3D <1000>,
adi,rsense2-nano-ohms =3D <1000>, and adi,radc-nano-ohms =3D <500> (1 micro=
-ohm
and 0.5 micro-ohm), which will cause ltc4283_setup() to fail probe with
-EINVAL.

Were these example values intended to be 1000 micro-ohms (<1000000>
nano-ohms) and 500 micro-ohms (<500000> nano-ohms), and should
adi,rsense-nano-ohms, adi,rsense2-nano-ohms, and adi,radc-nano-ohms specify
minimum: 50000 and maximum: 1677721599 in the schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-staging-lt=
c4284-v1-0-49fce67ebc48@analog.com?part=3D1
