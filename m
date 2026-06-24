Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A8248F72;
	Wed, 24 Jun 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297609; cv=none; b=KWqly2lXBzU3swzVThVpRblufgKumr3vN6XGXUFSqfIwCkwV3IiL9wZxvfOFivL0cMzt0FGmhYpXrnHYxh7wCMy70OGUtmYZoP4OPiblu7eJc57ybejKTBGPIdQowNCWQr5y1R0eNVtW31CnV1LJ9UVe+3+Gm0Fc+DXDKkqSFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297609; c=relaxed/simple;
	bh=sNQcbU9jq5Q1C6M1igkTJ5uH7ZYJRL4v9cEDKjSD9OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ebxw4KUeVCSgoxsBeIlPtad1mB2RomnjCmFQFbfvIS2B0RxGiCBbYRt84fatFnkNwRPFHevTnSS7EFkK98GTUouqrAnuzM3BCCEoaOe+bKZ1YmUJNxx8/X4PsiWCtXCT3JbK+1MGna1vz3kv6cEaQfLFR8O11Ib0vsJ8GxxxUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBYRqqK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBYRqqK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF551F000E9;
	Wed, 24 Jun 2026 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297607;
	bh=sNQcbU9jq5Q1C6M1igkTJ5uH7ZYJRL4v9cEDKjSD9OY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hBYRqqK4Py7lbVR8sfHSxd0B4z/6WhrVHwKK+G+vk+O20tKctY5qrdHPqtaXsiokb
	 GbYdK0pSjYW6JLTvgikEs3317Tsmb4MO0gdNl1cJNK7ra8ZI89NLoOiXSC7EXpYq4v
	 cr1y238BIWg1PPIkoSLccboAsEHkvu9OpwkAKt5pgGYZnfbaZ9iGIdYeRu7qy5eJD2
	 JpZp64tJarvaiKGTmESWO5Ph1+wZ3wDUGTs+fHoGKL6C/tBZloQDrYtrwulHksGBs1
	 JDLerw8uqzNHz9ojzfIFQPbuKPtKckDenmbOltP0pJesiS73J10XXVITNRhg8kpCcW
	 lucylv3i8AmkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-13-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:40:06 +0000
Message-Id: <20260624104007.4BF551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
> (DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
> as modules.
>=20
> The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
> SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
> accessible over the I3C bus through the DesignWare I3C controller present
> on the SoC. Enabling these configs allows monitoring memory module
> temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
> platform and does not use device tree.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D12

