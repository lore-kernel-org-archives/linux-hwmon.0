Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B13451DA;
	Thu, 30 Jul 2026 01:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373865; cv=none; b=LTk4p1MT/8BWNuDCthAJDA4Mzg9Oc7uceVyqC004fOtRkKcj9mjpM/4WRVb6zDB7fNFC2IYTe1JX/eKSrgd//mRWc2gVdUgR4osbREcqm0GU/oc1g+M4Gg9DRy0qA1V4P2Yt2qy/OqGVxdkWCoqYDtW3yRew4K+Aus8vmGh0xH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373865; c=relaxed/simple;
	bh=Pfykq9KYY6nH7DmG2E1dViCHmtOtjU3Y5RNH8HIqDDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NWTh5aUKFnHOEW9VcWqukr+AXlzmd+B/Mvylv9bx5ShsM3uKOew8spN0l2w0O9BO2JiFHp1SVqH7+P6TVG85LNfVA2YmJjYTt/KdRLjZKaMJlwSOZ0uKPY0f6JTdG71y3EdA/qF8WZLyFiwVY0fVqHIKscCGho22YrreUCzBj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/+FrQph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/+FrQph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC7B1F000E9;
	Thu, 30 Jul 2026 01:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785373863;
	bh=iq8UgmGJbcuaK3dfW7kwBk7s4BhogddC79UulyjDcgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/+FrQph0bF8L3mF4r43g4cg0OBdUA1DkvibsucB2ibAp96FTL+H5RDpQp56jnpOr
	 O2fcbIQwrTaM1ah94QJ95AsmihbK9J7EcJMRO3LUFJWUmsIEjlmymo7nIPpDrgcrHL
	 Xer4CrKY5GZ/Tn7vLqmiXrUzklIL5Jq4wvE0ILhPEShs3ftV6ETEXPA19RJkj5s1c/
	 Bivl3+FMLpmcsIiYmpynthJnGfCyDAkbIMxtNq5DHk336P160xhL5jvcHaek2RmVgU
	 0EDiGsB/MJDreEPdDPEVhWQRaONvUI1CSr15ioU8y22s3nsGL+bhxgNPNu6JJ0FtMY
	 7U3jWaQiY7C5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260730-dev-max20830c-v5-3-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-3-a7553f84ee74@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 01:11:03 +0000
Message-Id: <20260730011103.5BC7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dt-bindings introduce `adi,max20840c` with a fallback to `ad=
i,max20830`, asserting compatibility, but the existing `max20830` driver ex=
plicitly rejects MAX20840C hardware during probe due to a strict `IC_DEVICE=
_ID` string check.
--

--- Patch [3]: [PATCH v5 3/4] dt-bindings: hwmon: (pmbus/max20830): add max=
20830c and max20840c support ---
commit 6c40a5eeb4c4be3695032dfafd53c9b3d0333b47
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support
   =20
This commit adds compatible strings for MAX20830C and MAX20840C to the MAX2=
0830
PMBus hardware monitoring driver bindings. It uses a fallback to adi,max208=
30
for the new variants.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index 01b7275f5b341..cc50a4ee44a27 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -22,7 +22,13 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: adi,max20830
> +    oneOf:
> +      - const: adi,max20830
> +      - items:
> +          - enum:
> +              - adi,max20830c
> +              - adi,max20840c
> +          - const: adi,max20830

[Severity: Medium]
Will the existing driver actually be able to probe the MAX20840C hardware
using this fallback?

Looking at max20830_probe() in drivers/hwmon/pmbus/max20830.c, there is a
strict device ID string check:

drivers/hwmon/pmbus/max20830.c:max20830_probe() {
    ...
	if (strncmp(buf, "MAX20830", MAX20830_IC_DEVICE_ID_LENGTH - 1))
		return dev_err_probe(&client->dev, -ENODEV,
				     "Unsupported device: '%s'\n", buf);
    ...
}

Will this actively reject a MAX20840C device since its ID presumably starts
with "MAX20840"?

Additionally, the commit message mentions a longer IC_DEVICE_ID, but the
I2C block read in max20830_probe() hardcodes the read length:

drivers/hwmon/pmbus/max20830.c:max20830_probe() {
    ...
		ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
						    buf);
    ...
}

Will the longer ID be truncated before validation?

> =20
>    reg:
>      maxItems: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dev-max208=
30c-v5-0-a7553f84ee74@analog.com?part=3D3
