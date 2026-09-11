Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD682E6CB8;
	Fri, 11 Sep 2026 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135759; cv=none; b=RrZkxkBXU91j2LWEjIYBVN4rcNbzYV9qT2oZvtbrA+unOuGQng6uqHyTz4lWj2SqLt7He6KOu3fCqG/LluELyCbKTBIBt9h/vjiRvYW20HziZH7N+Ncj4ZMt/i7jNetyrQm8HDSwfhU6EDjukp8m93CytLx7x+dMdylap41OjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135759; c=relaxed/simple;
	bh=zNol7FmjPS9rmxjCnBxr4opONpu1HajbU2ctnS/MWNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MH7j8FnkkOYqbdPNqcD2xUmocEzeV/ZQYeMA1Z1kVL0fgKofz30N2KgwcizZo2r+lIEAPCSZ7qcWE+6hj5bHRQjOEHwhqLu+e5CoOe3Ix8cVJjkAawuRqHiD+c87GU06y9bBvdcWHx7HVCOiDzyJrgbF+W4cOGRyzjBbQeLf7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwVXGBKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwVXGBKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D3A1F000FF;
	Fri, 11 Sep 2026 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789135757;
	bh=m4nY13lYhB54YcSfy4Sgq3Pndtv5xCgpqKPmcotpGak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TwVXGBKRZ/sVnnju6I6eL9EYcCdGDVtr1dAkBsqFCXhS4YfIJiphbRLS8aPne/5j2
	 g/i9AwfWm8smjABzjLJWaue+/qgLi5cqp464YaFwR8xl/ow5mrcnxGopGBNyS4ROpW
	 mVGjtCsm02NNMmR/zVk7E3ecVhsKs74CClH5KZg5CdWtWIxLTBjmEsU9oFAa6WRqKK
	 2O7Rfy73zJ7LbJRerMSA96fvag+qKp5Ytk6ZpQNq/OdSiX4R2Zjcp6qMbM5GctD1k4
	 lB6l/7hfGm8QPqrV0GBg9egntC7r2thqF9rpYpFqSkbUFCVZiemKjkKtSNs+1iH4EM
	 Kf/BXhsoAbH0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (pmbus/core) increase number of phases
 and add new mask
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 14:09:16 +0000
Message-Id: <20260911140917.49D3A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PMBus core driver iterates over `info->phases[page]` to access=
 the `info->pfunc[phase]` array without verifying that the phase count is w=
ithin the `PMBUS_PHASES` maximum. If a driver configures `info->phases[page=
]` to a value larger than `PMBUS_PHASES`, it results in an out-of-bounds ar=
ray read.
--

commit f0d55dee29cf753f56d794471093af9c4d34634d
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

hwmon: (pmbus/core) increase number of phases and add new mask

This commit increases the maximum number of phases per page to 16 to support
a new upcoming device. It also adds a new mask for controlling the source
of the output voltage.

> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 2cd3216b3cd95..920c1102ab6df 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
[ ... ]
> @@ -386,7 +387,7 @@ enum pmbus_sensor_classes {
>  };
> =20
>  #define PMBUS_PAGES	32	/* Per PMBus specification */
> -#define PMBUS_PHASES	10	/* Maximum number of phases per page */
> +#define PMBUS_PHASES	16	/* Maximum number of phases per page */

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a driver
to configure a phase count larger than the new PMBUS_PHASES limit and
cause an out-of-bounds read?

In drivers/hwmon/pmbus/pmbus_core.c:pmbus_add_sensor_attrs(), the loop
uses the unvalidated info->phases[page] as an upper bound to access the
statically dimensioned info->pfunc array (which is sized to PMBUS_PHASES):

				for (phase =3D 0; phase < info->phases[page];
				     phase++) {
					if (!(info->pfunc[phase] & attrs->func))
						continue;

If a driver calls pmbus_do_probe() with a pmbus_driver_info struct where
info->phases[page] > PMBUS_PHASES, it could result in reading past the
array bounds.

This might lead to a kernel oops during module probe or the creation of
corrupted sysfs attributes by interpreting adjacent memory as functionality
bitmasks.

Since the core framework explicitly validates info->pages > PMBUS_PAGES to
prevent similar overflows, should a similar bounds check be added for
info->phases against PMBUS_PHASES in the core API?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-hwmon-max2=
0826-support-v2-0-5e30cbd97d84@analog.com?part=3D1
