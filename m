Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5033C9EE7;
	Tue, 28 Jul 2026 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223121; cv=none; b=h1BXoCNSK+gzE1d30yu29xTWHnMwoaBuGrZDAvEhEvP9CJOdMCO26DTTuTAuphyHlkVZIyXZbtm+QjrgwEKxRft/iWgL1Z/iKzrtiwlWUEVlYOHPO/f3mESUnfev09UmTlXY3BE38PkKOT7sj646EkK5i2LfZIevnuA4qXJ8PX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223121; c=relaxed/simple;
	bh=hQSdTh3f4tOoyz2oPeQYaEE3B8p1fK14q4HDb4elIYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LT8rC9ZV+I7+hlGQaXGwLagV0A6N5RiBbYG2kpH4jVLcf1YtgXI/XHPPaG79uS4uBYPomGQnMn46ATxDVloaQq0mjP5iklRXFbiCDEGP5Mcey158eChTCrlOSIOPbDyeJfcw20kDrYNGPx9IAgcvBpyfV9wIKeNKxpOFgbtfDhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsTBzTOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsTBzTOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA531F000E9;
	Tue, 28 Jul 2026 07:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223120;
	bh=hQSdTh3f4tOoyz2oPeQYaEE3B8p1fK14q4HDb4elIYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsTBzTOZ8iVFh+KX18BidekoVii0lLIaUtdgnw4F3DybpTbV7C4Cg4QmDuwpB60M8
	 UCA2PlXrQgYbKTcJH0M0khThxLKKaIIOMFgd/KaejmF/wQkaf9tdVJgnme4pmgmVOt
	 M7VhTAWa29mCIn8UorgVdwfUOHbeah5FlDPtBkPoOsIYv5xDicCjIkDnCT+fcIDtXs
	 grFWBLil8TPAyIWAMm1cdglSIJhaXRSrmhxm/7q9vC9nnMUDFuBcgBYTEBMu/wjS6F
	 CG7Rc9lrcqRnCAl2gOWEg3hp4GAAhZD1WJfDD4j0En8hAoGwAgzQKUxeMwwcaQbHxx
	 2Y9uHKbrk76xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/12] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728065955.809445-4-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:18:39 +0000
Message-Id: <20260728071839.AEA531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Although the existing subsystem allows host controllers to register
> through the ACPI table, it was not possible to describe I3C or I2C
> devices when using ACPI. This is because the driver relied on the reg
> property to retrieve the PID, static address, etc., whereas ACPI uses
> _ADR or serial resources to describe such devices.
>=20
> Read _ADR and LVR from ACPI resources and extract the data as per the
> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
> per the MIPI DISCO specifications [1] to get the static address to be
> used.
>=20
> Enable describing I3C or I2C devices in the ACPI table. This is required
> if the device uses a static address or if it needs device-specific
> properties.
>=20
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D3

