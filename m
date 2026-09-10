Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EB39A06F;
	Thu, 10 Sep 2026 06:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021555; cv=none; b=ADMHOJgRnPyhkhRewZFNeY0a/yNylb9K4iYioL2Zi3vMBqSUNlZsr9oA75JMSjVEJX8mEtqfE0aODcgQSDTBQIfrBtXg0c+GL2cr4KaGEeMFrytq1F5gVtjv76gdrXBlE0O6FADw6mScaMpLNA0Yqhn0vrmp0qtSykaIViVn0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021555; c=relaxed/simple;
	bh=Efye9OFJlK/JrofQrCM/Kca8C56PLZV83plKkVo4Fmo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rdHttMF3noMi64H8cXQbhuhco/xuRgopOqe7pKV58IrEosLenwKImeXTli29aQ+m5KVbxVp+/dYHMpBYAgfhDYclSkB+x051pLdFSrhG6MB6nGahHagFOWwQ12K/7xGGeQYmBkupDSNfft7k1RzJbglQjKm1eP7tSVtXjH7m39k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn4vCQC8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn4vCQC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB651F000FF;
	Thu, 10 Sep 2026 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789021554;
	bh=ywYRRoiOdrGMZtEtwBjh7zih1QoZ/Wg6rByq7kymUKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dn4vCQC8qmigXWohYCwlf7Nky0C+qeutJHCTmN7KqozURqNWCKCRPMyIQpuBOqRNY
	 0zX0x/sEwunevcuYP7NCiBRkpKUIYYxk62La9lUuQECF1ZtirNsXWwnlkeGCelrcnL
	 WDEBUFBdA3uPp01y7RArwVFeTV+x5lTUI4R0MNyUsHsDAxfgiXrhzwfng6w5rYRLP3
	 xDnNmjdaM2VlYUmdUZTuBgMZNNNeBs0NmGzxY60agbbH3XomElavy6bGMStvqfrARl
	 IHjSr642wyuNd+Ex4NKV/aaHy3Fy/Ar6u+saoii5stE8LLiFe1JDNhm7Vp38fdaJP/
	 g1KVegXHS7HjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-1-3e87637da3d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 06:25:53 +0000
Message-Id: <20260910062553.CAB651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `compatible` property description advises violating Devicetr=
ee hardware description principles, and the schema incorrectly restricts st=
andard fallback usage.
- [Low] The generic node name in the example does not reflect the primary f=
unction of the device.
--

commit 082d97c0bf8403a18b54faadfc2b22f3ff1da139
Author: Colin Huang <u8813345@gmail.com>

dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
   =20
Add devicetree bindings for the Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators with PMBus interface.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38=
740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.=
yaml
> new file mode 100644
> index 0000000000000..28e6ff9d9d9c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
> @@ -0,0 +1,87 @@
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: infineon,tda38740
> +      - const: infineon,tda38725
> +    description: |
> +      The Infineon TDA38740 and TDA38725 share the same PMBus programming
> +      model. Use infineon,tda38740 as the preferred compatible string;
> +      infineon,tda38725 is kept as a compatibility alias.

[Severity: Medium]
Is the guidance to use infineon,tda38740 for TDA38725 hardware correct?
Devicetree typically requires accurately describing the specific hardware
present.

Also, does this oneOf with const restrict standard compatible string
fallbacks? If an author tries to use a standard fallback like:

    compatible =3D "infineon,tda38725", "infineon,tda38740";

it would fail schema validation because it restricts the property to a
single string instead of an array.

Shouldn't a simple list of allowed single strings use enum instead of oneOf
per dt-schema rules?

[ ... ]
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        sensor@40 {

[Severity: Low]
Does the generic node name sensor@40 reflect the primary function of this
synchronous buck regulator? According to the Devicetree Specification, the
node name should describe the primary function (e.g., regulator@40).

> +            compatible =3D "infineon,tda38740";
> +            reg =3D <0x40>;
> +            infineon,vout-scale-micro =3D <1071000>;
> +        };
> +    };
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add-tda387=
40-and-tda38725-v3-0-3e87637da3d6@gmail.com?part=3D1
