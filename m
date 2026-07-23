Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6147D3D810D;
	Thu, 23 Jul 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790277; cv=none; b=GuzXw3U09hf6elPSc2g+6VD0QZ2Vc7j6YRafhQ0AsGJoDc+fsFgOUuQ5IQjymeUO86H2qTlHIKoywZL+deHDq/CUDJQjsTqtkkFN9Zolexce1Vs/OWGruN+AH7E9wu3qqjaC9EXcEkxh5Lx4Sf4ImlIbCm8GY6Zed8/wiP9Nue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790277; c=relaxed/simple;
	bh=e6O/jwXV0cFZ+A+Rpu7Y1iGC6zXCLWLDgSdxCYR43bo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UZTDrxM55M3H/C2Wx1Ti3PeFf/5ThZspeDgCD8iLtbjj8QdIh7s1NzFNKj3V4JwOnOOGQ/WEmZxYDFSDmO9WbAXQb60yoGxgG/Qa1CbIfxB8D1+yaDspMdzFIueeAjbmjazeD7RpuVkTtQSctO2UQ+ndFppTaX9m862E9Zj9I3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbzrDk9n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbzrDk9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142E91F000E9;
	Thu, 23 Jul 2026 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784790272;
	bh=ZcJPKOMWzIIGG24Xn3PdMWHsuyqMzhaGI7gN3Dt/UAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbzrDk9n7koIcqEzyfh3MbghVfPBW4cuidUd/LMzOiP93mJZYGXY4Va8NmKNfop7e
	 /hUm/Aae1Du//od8LN5Y321i7PTLdHNOHSBNQiHiMPQHkzXNC9kjOT/EczmUgbDZL1
	 KeXanQWCKIsmhWWlX5WrEKKYRiGgExDvQUiFAdc/v8GNvFO2FXY/uQgpZ0I2KZ/cKz
	 NoqKPIsaUmRGAY8emeLEn3cO0PnNfFx6j5TuGYMuWDlA5Ig+JbCdr1UzAnrMT0I2UF
	 7N/XgG4ZcX1QQOnrd9z7rtm6uIPMCC3y9woxOFw6CidaAzDIZhLR7ubZTAWmdPWNjA
	 xsYnage0Zbuaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: add maxim,max40080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723065036.2683075-2-stefan.popa@analog.com>
References: <20260723065036.2683075-1-stefan.popa@analog.com>
 <20260723065036.2683075-2-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 07:04:29 +0000
Message-Id: <20260723070432.142E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete DT binding schema due to missing standard hardware prope=
rties
--

--- Patch [1]: [PATCH v5 1/2] dt-bindings: iio: adc: add maxim,max40080 ---
commit 613bf10ba7af5c378c448dbcf5f6af9c11712984
Author: Stefan Popa <stefan.popa@analog.com>

dt-bindings: iio: adc: add maxim,max40080

This commit adds device tree bindings for the Maxim MAX40080 bidirectional
current-sense amplifier. It defines standard properties and parameters like
the shunt resistor value used for scaling the reported current.

> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yam=
l b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> new file mode 100644
> index 0000000000000..170bf4eff8706
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: maxim,max40080
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Value of the current-sense shunt resistor connected between the IN=
+ and
> +      IN- inputs. Used to scale the reported current.
> +
> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false

[Severity: Low]
The commit message mentions an internal FIFO, which usually implies an
interrupt pin is available to signal data ready or alerts. Physical devices
also typically have power supply requirements, such as a vdd-supply.

Since additionalProperties is set to false, will device trees that accurate=
ly
describe these physical hardware connections fail schema validation? Should
definitions for interrupts or power supplies be added to the properties blo=
ck
to bypass the additionalProperties restriction?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723065036.2683=
075-1-stefan.popa@analog.com?part=3D1
