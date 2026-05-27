Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F03815E1
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895841; cv=none; b=Zg1/j2eF3evWmqY6jjeWthnBebAJh+Q0erm7wOB7b6/gZQgY3zeXYdjj7HGD7t/nVY8y9W/EiTHBVcfbZxC/eDR3R7OzIRRamVnHlV3LO0DJdATGSi8M8HCKw9Cm0nl0Bu23m5BviZ0oFvsFuZNwXrnAh7tp9EdOx+xKVIcnqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895841; c=relaxed/simple;
	bh=IGfvjIzfq17vbaAQkUVV7egGzzSP+77CdinfsSvaR/A=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWCZSAPr6witsLdTI9Zxb6cHiMWl3aofb2X9AW+AWRcwIoRk9sXKNJKBO2Da96m2/c42bnv5gFjyAru/wtp8t+PdIK40sGBPXqwtyUJNxAuFa28mTaah05cp2rQiMNsfkzbqiOmOu0yhfjPXg1yhqvAGg/L5NABNY7Rrs8x1YxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJxeCpG6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJxeCpG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EF81F000E9
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779895839;
	bh=8gnFi69cCxDDt+b/HssXsRWSan366sXdX2teMfXltqM=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=CJxeCpG6ji8WhSO/KCDe8Z+lW8REBHHrF60hQgICUCbUsU4xZyLqus3Fu92PEK0qu
	 BsxEtehsPaU6hNkCJnQ5ztRmJ2UOXUoMsqU/lsIzk1Cs302vYg68m//gPszcCmossU
	 bXITD1UzOsJW4I3iU72aj+STj1jlsgdxpJBmGOC+yHkkzpBUXP/Hh7tsKi0NPvGNRp
	 laD0WLthoOp2TLnP4NIyg3ZZGqX+AlaJsXPDqrW/+oa8bY4zDBZYvQ4+pboycA+hnb
	 TVLUblOUDQABaCeZbC5AX/+ciwV+Y7u0my5G9jkUYhb/ich+I/5FdDDlsNtm/O3UN+
	 QxF8qeFUGFX3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: Use named initializers for
 platform_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
References: <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 15:30:39 +0000
Message-Id: <20260527153039.B2EF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message contains an incomplete sentence and a typo.
--

commit e80f82a6fd801f1724dea71e8261da2d0d65c1f4
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

hwmon: Use named initializers for platform_device_id arrays

This commit updates platform_device_id arrays in several hwmon drivers to u=
se
named initializers for better readability and robustness. This prepares the
code for a planned change to struct platform_device_id.

> hwmon: Use named initializers for platform_device_id arrays
>   =20
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.

[Severity: Low]
This isn't a bug, but there is a typo in the description. Did you mean=20
"anonymous union" instead of "anonymous unit"?

> While touching these arrays usage of commas.

[Severity: Low]
This isn't a bug, but this sentence appears to be incomplete. Could the
commit message be updated to clarify the intent regarding trailing commas?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779894738.gi=
t.u.kleine-koenig@baylibre.com?part=3D2
