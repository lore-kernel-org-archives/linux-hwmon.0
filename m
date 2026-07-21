Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB492E7BD3;
	Tue, 21 Jul 2026 04:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608327; cv=none; b=PQEUM5WvNzBpMcd3T+WNQoT6JOtYYK7yeZWMKIZKYAMsWRTZ+kD2NOmTtgGL0HoedTWOyssxHFtrv5rzSAR4jmyioys2qT60IQfuy/fX7Gk4xwfd+qvgQgmPATu186vhrfeCZByk8h/5WlipPpNO0jzWtEPYKm99WOy2kUc3QfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608327; c=relaxed/simple;
	bh=gchuhNX3Cm3qEU9s8NSnllvg2K6FBI7zaHk54DYmSU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m4gaFAzT3IlfRJjODjLCFqS3CF9qcm1zHoAurfxvZaHloNHdlOMyQ55H3yAs9JvkjJBOvpRhJrK/7P/zMiKPgMHaM1PEk/aOsBSIC45T02sBCAquROp/04UGGDwgyCGt/stiOPPuVwksKnbvWa1dZDfuTB9corQOKAHttsE4LPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zv7rlnYr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zv7rlnYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD641F000E9;
	Tue, 21 Jul 2026 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784608325;
	bh=gchuhNX3Cm3qEU9s8NSnllvg2K6FBI7zaHk54DYmSU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zv7rlnYrLtRmkNYiFtgMhvMxkjczpc3Ey/qubOapQUjZNydYxNeavpS+/N2/1iXqA
	 bcFroxpVZ8eE6IymgDnQ7kUeBznVh7m9smdFqOepdsiXPyPKI/pyo9wfAIu5DDeVKq
	 EuWYXrrFIazg2Iu7uhvuOGGAP9CosuETx5IuSh3rwdQuHIqU87Pt4W/1lnjGt5uHAS
	 9gDGprWCWwQi+ldW9yTVJseRH35hAr38WBYhmmFUf+xGt3DjOfaj2uuNdY7plazQax
	 VFP/d96ANZ/WIaT16R6ZI+c4cDAB4zITqgGzkNXiJhQIi0m6l1ZA+8LGVAYJdVLLlW
	 Dlco/68hsA+/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/12] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260721040805.1696503-4-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:32:04 +0000
Message-Id: <20260721043205.4CD641F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D3

