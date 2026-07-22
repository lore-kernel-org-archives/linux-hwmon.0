Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1F4322FB;
	Wed, 22 Jul 2026 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737430; cv=none; b=HpVQLnInQQ4EAjix+ehc7wNo4evDM2EqqWzqI+ghsmusQ1FbH1ogguGN4IYa5i1YR3Gw8ARs/t91u7sv9PVzhPX3xrwz6nep2nQ5INpgi177ZCq6zucsyzu9Zme4s/dA0/RwpaR09R/1LzOtbKX9z9K9+TsRXGiWlP3WzSQoZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737430; c=relaxed/simple;
	bh=yH8/TQOgk9rWguhIzk23RzygW1k3miM8Gp2zQdd+QvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fqOJYf7NZMwD470zMgXPVfJbSX26JPDZGSwfbtpc+VItU3xJr7Qw9jNvmg+xSUj3ZX+sI3IwE+g711skJ71tl9d6f6SgN1zlVCU5d/KgvRkYzA9OW5x7nQDIgELD0liUkdua2sYaTQKtlSYkOkeiSF019wgKmzvI/r5MTfFCzok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TynmL9C5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TynmL9C5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7A81F000E9;
	Wed, 22 Jul 2026 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737429;
	bh=oahPzUP4r3EVE6KSw/KSsnSdDBhVSWorZjIMdlchN9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TynmL9C5GEYfoY919EzgKtU7Kij3Ei34g21hnpSs4kPIKD99n7cAolEHyLt6VAZNn
	 P5rpaV64y/e8xUB7B0HbT2s8bkog12zTyhUBxVtXUKKf7f77Edb4ZMu4mFIncdmIbQ
	 iGWUDjz5RXC1IGGNIdV+51u+jP88fbaMKK2n7CVGYwECMqnqfSHEGqYaIJDCX3EF46
	 gf2Wyhn9Ggwi501tG3o2jVs3mTT5x8BeqMdnFULH25RESFNFV4CceUJmMiaKgYOwxv
	 bqgAdmyUsVF0Z43/B5Ycupft8Oo52G/cJ9WrSp/FCe2KFpmBj5gRbZ7cV3McOPfJc9
	 vieVYt9pQdiDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722150324.164799-2-sanman.pradhan@hpe.com>
References: <20260722150324.164799-1-sanman.pradhan@hpe.com>
 <20260722150324.164799-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:23:48 +0000
Message-Id: <20260722162348.EA7A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `adi,ocp-severe-filter` property exposes raw register bit va=
lues instead of standard physical units.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices MA=
X16545/MAX16550 and Volterra VT7505 ---
commit e93633b9753ab840614d58e40b8f32b35288cabc
Author: Sanman Pradhan <psanman@juniper.net>

dt-bindings: hwmon: pmbus: Add Analog Devices MAX16545/MAX16550 and Volterr=
a VT7505

This commit adds device tree binding documentation for the Analog Devices
MAX16545, MAX16550, and the Volterra VT7505 PMBus controllers. These
controllers provide voltage, current, power, and temperature monitoring.

> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yam=
l b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml
> new file mode 100644
> index 0000000000000..286c88eb7be8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,vt7505.yaml

[ ... ]

> +  adi,ocp-severe-filter:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Deglitch time applied to the severe overcurrent-protection compara=
tor,
> +      programmed into the MFR_CONFIG[15:14] field. The MAX16550 and VT75=
05
> +      expose this field; it decodes as 0 =3D 0 us, 1 =3D 1 us, 2 =3D 2 u=
s and
> +      3 =3D 10 us. On the MAX16545 the severe overcurrent delay is fixed=
 and
> +      these bits are reserved.
> +    enum: [0, 1, 2, 3]

[Severity: Medium]
Should this property use physical units instead of raw register values?

Device tree properties typically describe hardware configurations abstractly
using standard units like microseconds. Exposing the raw register bit values
(0, 1, 2, 3) rather than the actual time durations (0, 1, 2, 10) creates a
non-standard ABI that leaks internal hardware encoding.

Once merged, this raw-value ABI must be supported indefinitely. Would it be
better to define the accepted values as 0, 1, 2, and 10 to match the physic=
al
time delays?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722150324.1647=
99-1-sanman.pradhan@hpe.com?part=3D1
