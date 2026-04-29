Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A933B97A
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456617; cv=none; b=ovihyOBDfg0j/NafG77M+ADLMkuQAmJHbowPjKoJqoRbkh5wsN+MjgMdRt1ziB1eU/jr6g5hNVf/kqD3N/kjSC59LVP6bH5kIvtA+V+K1G4kjz1pxXYRNb9puhPpcflg/s0Hr+lsWQM9sPRbhz0wfJtNtjTt9866eWjCKjQxN9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456617; c=relaxed/simple;
	bh=jFxgogTN7ec8FUK/+pP1R4sVZ1Bikjnnpb7UN3czJII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cwVGWnkpi7VV1z6UMvrIRsOddAa6S2FEyIqHf4r0S3e+niw5jhblMo42johNDciWqnBhZQBIa7r20WTuayXMvojB/gjhW+CtUg+PxhuhiIHAT9zMvPLrRQrbrGgd9a9de5Zki6Nua7mp6FQkJ4tfds5wBB2HBWkFVKVj7iGJvE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME5pV8Vh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME5pV8Vh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2664FC19425;
	Wed, 29 Apr 2026 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777456617;
	bh=jFxgogTN7ec8FUK/+pP1R4sVZ1Bikjnnpb7UN3czJII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ME5pV8Vh5HNLq5emU43qNBRi0dTdw+rOt3ZQZZicVPpVgqHaJEyExAWIDyQ6PYM8s
	 xE6zKtRkxcNc8cJMOlWjyM+njfnYxrP6ut2oCTRaWmr+RiujfUH8W2KjOR6PFxhtkf
	 HiaHeH50Ibay5IpKOePxHp/vypuFReoHF4QCLvhEWIc0GS9baKgSLyt7u3qzi4/AME
	 KQBVMJbkmJBDb92bnEuwUsc+wkJvgJ78FKpZydYcMokwNPzZi0Fme9snoIpym6Unoe
	 LwYobed2Htlqu9DdfyYN230dREY7qqPK410bB12lz49g1VSsrHdADn6w7bqGPthCvR
	 W4XIiFEKezNhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
Reply-To: sashiko@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-add-e50sn12051-v1-1-c101e6c80bbb@gmail.com>
References: <20260429-add-e50sn12051-v1-1-c101e6c80bbb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 09:56:56 +0000
Message-Id: <20260429095657.2664FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The devicetree binding schema is missing the '%YAML 1.2' declaratio=
n.
- [Low] The devicetree example uses a device-specific node name 'e50sn12051=
@40' instead of a generic class name.
--

commit 91ccfd1047b5355c8ba1210c7c4b1e1a74f2e8cc
Author: Colin Huang <u8813345@gmail.com>

dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding

This commit adds the devicetree binding documentation for the Delta
E50SN12051 PMBus-compliant device. It supports reading voltage, current,
and temperature over the PMBus interface.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn120=
51.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.ya=
ml
> new file mode 100644
> index 000000000000..362cbbf10bfe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

This isn't a bug, but shouldn't this include the %YAML 1.2 declaration
immediately after the SPDX license identifier and before the '---' document
separator? Without this, schema validation tooling might fail to process the
file correctly or report formatting errors.

> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/delta,e50sn12051.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        e50sn12051@40 {

This isn't a bug, but could this example use a generic node name like
sensor@40 or hwmon@40 instead of the device-specific e50sn12051@40? This
would help comply with standard devicetree practices and prevent dtc
warnings during validation.

> +            compatible =3D "delta,e50sn12051";
> +            reg =3D <0x40>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-add-e50sn1=
2051-v1-0-c101e6c80bbb@gmail.com?part=3D1
