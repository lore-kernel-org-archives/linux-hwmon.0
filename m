Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FEE4192E5
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682803; cv=none; b=VjjqVcHbv5WRjnbJVPDVXJgmfu/zF4cFq1vN+slbdYSGFQEpXp2Y+qSztcEe9fA2IReG2DHLF2olhawpI06SpAPkZlA7KVFWUnF88RHCwceEKHjzpV3FE/of06lPjo1aR2V8ACaLIWjtUFaDDMeKHaTMOYoq+Ox+aC1nbBnT8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682803; c=relaxed/simple;
	bh=fw1yhJgH4dE10gIfVyww8+R5+pxFoaFQ6M9mGdEyGUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SK4QTiqaxjo4xVO31Zfcq7QUpYmK8HSyAZ7Wy2DWUijP6T3+RwiFR+V7/RGHJntJeXn32IaYSXSjNye/Y3gizFweaBq/nnvGNmcTPtjx9R9fRM46SEDq4VFfU11ixW9zqEJFXdqsxjgmxStD3hvW5ggcsZ+D/t/RJLERA88Upds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcIQUwAb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcIQUwAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0161F00A3A;
	Fri, 10 Jul 2026 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682796;
	bh=HX1pNP9d+3wN1PbiFe2eRyPWL95lxiSrTThlhlLo6Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NcIQUwAbO9aGh+/sTmUtCTDEQyO2xYsJbVuPEs0rvaAh5FST6FSRnLGNIoU5taN6b
	 5uI5Y+noGoDndN1wO7KLoV1euDPj/FkCDGayuF5g0E2iDHYEfIPFODo0SimdgcZWAu
	 JAPwVJyrtD9F0a6GDN/JkIr6onjPfC5N/pDSsHbGanR99hxEFb/14HmqHAuTFtQ9zS
	 JHeSjZH0IJZWJsH42Gfpxtqf67kqOAYzybEWFIobkWbolr1RWcdqbnebHGT/mQ1/Gf
	 AU1pr05D8LxzxRq855FiDzSl7qJ00dCaSPbHkeFgUe/60KCfqmBirdM8dnggK34JZb
	 QQ3agBFu37FMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/8] hwmon/misc: amd-sbi: Move core sbtsi support
 from hwmon to misc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-2-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:26:35 +0000
Message-Id: <20260710112635.EE0161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Using the I2C client address directly as the auxiliary device in=
stance ID causes sysfs name collisions and probe failures if identical devi=
ces reside at the same address on different I2C buses.
--

--- Patch [1]: [PATCH v4 1/8] hwmon/misc: amd-sbi: Move core sbtsi support =
from hwmon to misc ---
commit 00ce49f593f00850072fde683389c8cb1954ee34
Author: Prathima <Prathima.Lk@amd.com>

hwmon/misc: amd-sbi: Move core sbtsi support from hwmon to misc

This commit moves the SBTSI core functionality out of the hwmon-only path
and into drivers/misc/amd-sbi so it can be reused. It creates an auxiliary
device for the hwmon driver to bind to and adds the appropriate build
dependencies.

> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> new file mode 100644
> index 0000000000000..67d08df28429d
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi.c

[ ... ]

> +static int sbtsi_create_hwmon_adev(struct device *dev, u8 dev_addr)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev =3D kzalloc_obj(*adev);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->name =3D AMD_SBTSI_AUX_HWMON;
> +	adev->id =3D dev_addr;

[Severity: Medium]
Could using the I2C client address directly as the auxiliary device instance
ID cause sysfs name collisions and probe failures if identical devices resi=
de
at the same address on different I2C buses?

If multiple sensors are present on different I2C buses but share the same I=
2C
address, the driver assigns them identical auxiliary device IDs. The auxili=
ary
bus subsystem aggregates all devices into a single virtual namespace
(/sys/bus/auxiliary/devices/amd-sbtsi.temp-sensor.<id>), so device_add()
could return -EEXIST and cause subsequent probes to fail.

While the comments below mention that multi-socket systems provide unique I=
2C
addresses even across different buses, relying on platform-specific hardware
strapping assumptions for globally unique software identifiers can be fragi=
le.

Would it make sense to use the IDA framework here to dynamically allocate
globally unique instance IDs?

> +	adev->dev.parent =3D dev;
> +	adev->dev.release =3D sbtsi_adev_release;
> +
> +	ret =3D auxiliary_device_init(adev);

[ ... ]

> +static int sbtsi_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct sbtsi_data *data;
> +	int err;

[ ... ]

> +	dev_set_drvdata(dev, data);
> +	/* In a multi-socket system, devices that are otherwise identical do not
> +	 * share the same static address; each instance resides at a unique I2C
> +	 * client address on the same or different bus. Use the I2C client
> +	 * address as the auxiliary device instance ID to ensure each socket
> +	 * receives a distinct auxiliary device name.
> +	 */
> +	return sbtsi_create_hwmon_adev(dev, client->addr);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D1
