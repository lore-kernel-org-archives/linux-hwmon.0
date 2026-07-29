Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4141A51D;
	Wed, 29 Jul 2026 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362757; cv=none; b=MNG+HvzrK4qC6VRVWJWEb/kcdIwBObmypDDluXDnIXMtB/P6D91Dp4/O3QnOlA/qJjd6Ko335xhaUx+ZiDu94YSvtJPHvKzPVj4BIBE4pgxFpcOzzDqzjkMThB3f/fbIk/iEniFPqJEggfJ5vDX7mTf+9TNtNHgOcgVsHqurMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362757; c=relaxed/simple;
	bh=9xYwVl/HFFUcw/zl0f8aiebqC6PtJ/aI5+PhVcywE58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hweketkE983SPKktAILcF7cIeM23a6+7X+4LtIH2e/dn07wKylPBIVLs0r/UFDJs6eQJQqQWhZYvknlFkkvFccNGsDsu5dpuQPjQk9v7qcg/0mjv8MiPAr3OIe6NKeiIvpzuqO6g788KRCwxOgUYUIanvz8M3NSkR8xQkD4SInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9spi8CD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9spi8CD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24321F000E9;
	Wed, 29 Jul 2026 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362748;
	bh=lZF0bGQ29qzcgnuE+i8cSsa18GokpmYB+ijUgk4t9bA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l9spi8CDSQ8KYeH7rNL2yiq31x6mNkDsFkP5AXBtD6c+aiaimfkrB7gX5D7aVnuON
	 w/x1Qg97HMQvxNlOhq01rwcDWFvLjIPH+xyccj6eduAqwCBJGafeS6ZWixvXbn2AR4
	 3BxoYLGrYeuQxtwpbHwVsytQGhN3JKAK0QV6F2A4m1624+ba2WtdRbCNF7fP+rYJl/
	 onQhL46jx4FH+MyWp6z8gGbbyOgOcf95FvFz58G+cz/tkgSRYOiTDQkxbJziWDUoIO
	 PJFwBjSW1fxLtMgA6S6+4GjGyHR6tzmEK2l2AR2CtzkAi/YeHYQWaG+S0c2UbkA7Po
	 kvrImXvvIo/TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mpq8646_v0-v6-3-98848151cdb4@free.fr>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-3-98848151cdb4@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:05:47 +0000
Message-Id: <20260729220547.C24321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing named initializers in `struct i2c_device_id` array.
--

--- Patch [3]: [PATCH v6 3/4] hwmon: pmbus: add MPQ8646 driver ---
commit 63fabec4213f8ada1bf01d09967620e66fc9f459
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: add MPQ8646 driver

This commit adds a new driver for the MPS MPQ8646 PMBus device. It provides
basic PMBus telemetry, alarm acknowledgement, STATUS_WORD extended bit
decoding, NVM-backed post-mortem data, and an in-driver alarm-poll fallback.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> new file mode 100644
> index 0000000000000..1fd41d89e5bef
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpq8646.c
[ ... ]
> +static const struct i2c_device_id mpq8646_id[] =3D {
> +	{ "mpq8646", 0 },
> +	{ },
> +};

[Severity: Low]
This isn't a bug, but should this array use named initializers? The I2C
subsystem guidelines specify that initialized arrays of type struct
i2c_device_id must use named initializers, such as:
	{ .name =3D "mpq8646", .driver_data =3D 0 },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mpq8646_v0=
-v6-0-98848151cdb4@free.fr?part=3D3
