Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABF3BED78
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362387; cv=none; b=aP4qqyYTtPvMMXRh9AgG/gWydt7gy4+bKQ6FnU3ck28kb4dDuP1tT9MTIyhWrykwevIkS2gn3D/WzoxfN9te5FTSJjdYCDebhD8KA2kBEMlqB0i1SPy7qt7RW6/RWbRK6hrE1/U0kt7c6wGVfpyto43hcdcFbbaNHJiSm51neZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362387; c=relaxed/simple;
	bh=zjqmgPQT5aMjVpYidoG4UAwfNZw2UqvKj2gNfa2ImvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BlYy6LWrB+2axOgE/FyrfPOnJFTGF3OFt5Qsvdya2ZcbDP2PKqHfa31NaIwOuC2iG3kURCFi4BOPq0VDDOzM3wTEnpGHn3sC1cZze8yyhTY9j5iLVSTuX7aj8BKRwJ9J/PjW310+VCnrJf4S+qVME0hcbCaC3C9zmwXvTam1Urg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4SHcnPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4SHcnPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969B11F000E9;
	Wed, 29 Jul 2026 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362385;
	bh=dDNs6gIdO1/Qaf6BEe/0k+fFEQTysXAesqRzCskc1Ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D4SHcnPMSoP3adx5MWGNMHphfe4Oxj7aYvl/zqLK3RTLKCphQep3fyEsColycrICb
	 9jvjNPcosAPjIGnyNEhbs4TPU7eSFYkUKTrG9ORq3E/NrNUH3in3bM9a+tSlS60bsM
	 ujqZWMbZC7UZilJVNka9L3Xj+J+3ulNHqZe+aYiq1yoCplKIQovFJ+C7HYaCbNyq/Z
	 ZOZ9EDKH+aVHlMif5kWJHbxfW7Sd8aUHPZVxKWk4/UvTnN+GAtl/20ZKWFMLoWJ7O2
	 XhxUVBHSHRKJDyILAeOQ7zqhM56rkceTUVlpiOiwJ37E2KGDTWxWFJE5sKcy9Szq1L
	 OmHz48sHxT7fQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] hwmon: remove tautological dependency expressions
 from Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laszlo Ersek" <laszlo.ersek@arm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729215436.2103380-1-laszlo.ersek@arm.com>
References: <20260729215436.2103380-1-laszlo.ersek@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 21:59:45 +0000
Message-Id: <20260729215945.969B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
> option") [1] obviated some of the "Optional dependencies" (as described in
> "Documentation/kbuild/kconfig-language.rst") in "drivers/hwmon/Kconfig".
>=20
> Namely, said commit restricted the valid/possible subset of the full
> Cartesian product "CONFIG_THERMAL x CONFIG_THERMAL_OF" to
>=20
>   { (n, n), (y, n), (y, y) }
>=20
> through "drivers/thermal/Kconfig". Numerically (using tristate values),
> this set can be expressed as:
>=20
>   { (0, 0), (2, 0), (2, 2) }
>=20
> Over this set, the "drivers/hwmon/Kconfig" tristate expression
> [ ... ]
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Laszlo Ersek <laszlo.ersek@arm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729215436.2103=
380-1-laszlo.ersek@arm.com?part=3D1

