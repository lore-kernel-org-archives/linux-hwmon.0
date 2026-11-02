Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631364;
	b=32cZ5AN+2th4nsiMCpq6/osEKqeXBYC4WZOrPb3V9ma8BEH/hpXjGbyDDgwaGYc1qDGf
	 YjJw1tKlPFZHv+hjJbHmMofjh25tJb5bzOOTCvSPwZpBPjXZdAyp1L7DEbXMyJPfUHpoV
	 oVXgrD3boIqu2IlP2fMRVRxOrQAGM8RDV/t0Nkh6saycL+QvT98EDUSyqhyrY2Ylgt+XV
	 /GUq6CdGR22GgDAg8N7gvZfE+wpPsSePM8upoYKMA9bCm5CL316bJbm7hrNFMSYKjCELs
	 RNvZcv37e3rKWS1Rl2SuChzo1XcIp4gFTIWhY5jm5G/pMrICin8egzMQDdjDd7skSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631364;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LQEwADjzH2iDQW3l4RttcDCqnPt6i0xytDhJlAKuDt0=;
	b=TsyCP37Y/ZCTvBO6lcw8m+5p3MFe9SthSTSSzOowCNaab500MmaWGBc7+dzEROvstY51
	 zzs6mDEUIDIpJyVABlv//v+wqLaKdogAtGyZVdAtV2Tjz9JfrySQ64nbdftWKZpQrIGCW
	 hZ7dV5VJjWBEe8fC8mEC396rhKOVQAe6v7gXEema4hB8rQbCgpeCwS799KprSXLkR/89I
	 3lI7JRVZK8+RJg9Odjbp8KcctsYSK3mdcwCFHveroJl+V3vg5sK8SrkeOsUtJp/KM/ID8
	 Pwlnkof7W3z/16VFvtOk8OFPJUi9uiIVOKdeIK3od2mtowLY5NgklXC3nRdou4BG2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJPLL6gB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF343607BDDE;
	Mon,  2 Nov 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJPLL6gB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D131F00A1F;
	Mon,  2 Nov 2026 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631363;
	bh=LQEwADjzH2iDQW3l4RttcDCqnPt6i0xytDhJlAKuDt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QJPLL6gBGHFUNdipV+bzR8Au68jrr/McYroIbFlpgUA9mC1BIZUoWRJu9pa+P/Y5a
	 Ugc8KF8nfpFwIzcLWrJ+qfy5ATrjhP+bGpsE35bcqWHTBeHTqjQq2giAJwxBq46n9l
	 GKZIVTvTPAZirJjFjfK98reEIb5PX9/vDvamr5Z+RdgMUmYKaNF9Igb3lESYLENDii
	 2n4bahzGQ/l/BH9opsrB95+WZymkYLBelV6RBV8RkYRgDJD32WVupFVSZW47Lxeyrq
	 vmpT73bNiVKhmB+9as0fO4S8dbSuxEy24pEwFoXGay2mhSTKQNUe7u4g3X/IxUuhOm
	 UT70v7E5dUDlQ==
Message-ID: <sashiko-outbox-193619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-topic-sm8x50-iio-max34417-adc-v5-1-0ffa5e5f2d5c@linaro.org>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261102-topic-sm8x50-iio-max34417-adc-v5-1-0ffa5e5f2d5c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:56:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: adc: adi,max34417: inconsistent indentation in DT=
S example
--

commit a9428a6f2a12de2abe990a839ca0d1e5820c2ceb
Author: Neil Armstrong <neil.armstrong@linaro.org>

dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Rang=
e Power Accumulator

This patch adds a Device Tree binding schema for the Analog Devices
MAX34417 Four-Channel High Dynamic Range Power Accumulator.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
> new file mode 100644
> index 0000000000000..700bc3ca7d7cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml
> @@ -0,0 +1,103 @@

[ ... ]

> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sensor@10 {
> +              compatible =3D "adi,max34417";
> +              reg =3D <0x10>;
> +
> +              vdd-supply =3D <&max34417_vdd>;
> +              vio-supply =3D <&max34417_vio>;
> +
> +              #address-cells =3D <1>;
> +              #size-cells =3D <0>;
> +
> +              channel@0 {
> +                  reg =3D <0>;
> +                  label =3D "ch0";
> +                  shunt-resistor-micro-ohms =3D <5000>;
> +              };
> +
> +              channel@1 {
> +                  reg =3D <1>;
> +                  label =3D "ch1";
> +             };
> +
> +              channel@2 {
> +                  reg =3D <2>;
> +             };
> +        };
> +    };

[Severity: Low]
As reported by Krzysztof Kozlowski on v2 [1], the DTS example in
Documentation/devicetree/bindings/iio/adc/adi,max34417.yaml has inconsistent
indentation that fails scripts/dtc/dt-check-style --mode strict.

Inside sensor@10, the properties and child channel nodes are indented by 6
spaces relative to sensor@10 instead of 4 spaces, and the closing braces for
channel@1 and channel@2 are misaligned by one space relative to their openi=
ng
lines.

Should the example use consistent 4-space indentation throughout sensor@10 =
and
its child channel nodes?

[1] https://lore.kernel.org/r/20260929-heavy-intelligent-guillemot-da269b@q=
uoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-topic-sm8x=
50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org?part=3D1
