Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD9248F72;
	Wed, 24 Jun 2026 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297524; cv=none; b=M+KG929qe6TXVCPiIvszDp9si1u2VFvEQ/1oEYXKjcbHV3phBfEZVEIGsebt/HVdvKMQp6PL/A/cuTiAzK2oYqM0Cv5s4v7HMsywYLzmFcpqKCw1WTQyxjrOgzm5lBmSwNF/W5n7FsBb8OZRX/hE1vqkQVpug7WyBaEXIyS5JOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297524; c=relaxed/simple;
	bh=z3Jh5DdsxOixayV/P5ernUEaHyuGcHZeJjmYLYS9J9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cBmlA57xtYCLqppi26TdGuvTBdhTlMnd5Q5QN1A+oTMKHl8hrX146qxOVI7QppGYkf7tqgf/UoE/CRZc3FiJROgQgFG2mPO9dstP73Yb4kWvN9Dv+rKquLtJCYcx+4YYPVIaia47SD8VMyDsFXP27kC9zYMhzo14c4HPOf7KGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkguZPjd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkguZPjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7881F000E9;
	Wed, 24 Jun 2026 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297523;
	bh=z3Jh5DdsxOixayV/P5ernUEaHyuGcHZeJjmYLYS9J9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkguZPjdzfr55Zk6zR1Ryla2eImv4Y8FLHYHieOFoqAqN4ZcAYaJTeyNcDrKwnUIt
	 FRfCYlwlnGkVUg+AhzHbSxE4YC6L/4rbzT7cBqidogDlOKVwV3WcEblM6XvQWU8usf
	 lLebRdDbGNEFoikE+wyVdKOnGChn54kv/lbNk6477tPZpfs9WksxYRQo1knna7V+/J
	 VTXcu1kQLmIFyxCKx376W1vJM1pRUWzd1+hWjAcVLdQTy3QUrbrPFU813AyEUO9GiQ
	 6dCriHraK72DvNkJtRut6U0bAT+IsvCqyXLzaEibvhTJbHt28ikfWq5pk2PBHsarur
	 GJn90xPXSUoSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/12] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-4-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:38:42 +0000
Message-Id: <20260624103842.AB7881F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D3

