Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC03246ED
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785960476; cv=none; b=XHRHRm8532Y2glx2+pd7rUzhU/Qvvv9twRhIx5of++v97Nh/BmGIUdVgaDZk7P7Kp6i/42N/e0YwOCtj3li3vIh+Tc9S2zykJnciJCN2wl0ABPrM3s0T8CJ0k1JUpsBIKRYnauPRjQOGAcmi3L4KkTmVCuzTti3puo5ukuzRoXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785960476; c=relaxed/simple;
	bh=NsaHOY8LDai59Df5J2gB1bnqzflYCABIYtkua5vh7Nc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IIzjIeP/gR4800ScCeOkR8b974qiel2mpOHWpT0bFdex4x4tDkRvcQ+Y0wINix4M++9w7HCPrbXxgoC6+YNpOyJ6p/S+znBAaTxgZHA0z/vXRuPlT1h9q+OgMfK+xBzIULnJEDl0YUzkpfoiILVMDLvKA1840YTmuu7usmYtPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTkuo+EA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTkuo+EA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588371F000E9;
	Wed,  5 Aug 2026 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785960475;
	bh=0vXOxhB+dp00kcduWvbuo4Fxcco+IGblbakaae9gBpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RTkuo+EASDDJgf11zgC89e01+c2iL3MtPR0b+A3KIcyBseQC6TAy2HZejCF5yLdmi
	 1weHiVEeyEdMYiFrRcCBlMkSoWMMkelSPi2XEesybrrxN2La01texdKQwLpaXcmz67
	 sirWS4p1dxI9ZQvcDn0uLNgGX1wFGqpie393kUV749BRfUIEFgh3DD8w90i0bVIi/8
	 stR5I6lCAaBOqaCGAUX4APo08Me2oNvh6dXNMdqyjKKbScdoNqif4H9M6MURGqaUwx
	 fxy4u8mLGNpwAMtQfWh8wyqUW+0VjONv1K+Vc/u4suPNXstZobZKEkOjY2wrFg/dJS
	 aDlLBHt8TAzQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (sysfs) Allow drivers to register const
 attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805-sysfs-const-attr-hwmon-v1-3-4c0cb2b290a1@weissschuh.net>
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
 <20260805-sysfs-const-attr-hwmon-v1-3-4c0cb2b290a1@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:07:54 +0000
Message-Id: <20260805200755.588371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly states that the patch switches to th=
e `__DRIVER_ATTR()` macro, while the code actually switches to the `__DEVIC=
E_ATTR()` macro.
--

--- Patch [3]: [PATCH 3/3] hwmon: (sysfs) Allow drivers to register const a=
ttributes ---
commit 91e4cdd2e4ad9f4eaa7572f21133759d5e925d9e
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (sysfs) Allow drivers to register const attributes

This commit updates the hwmon-sysfs macros to use container_of_const() and
__DEVICE_ATTR(). This change supports callbacks taking both const and
non-const attribute arguments, allowing for a step-wise migration of driver=
s.

> Switch to the __DRIVER_ATTR() macro which can handle callbacks taking
> both const and non-const attribute structure arguments.

[Severity: Low]
This isn't a bug, but the commit message states the patch switches to the
__DRIVER_ATTR() macro. However, the code actually switches to the
__DEVICE_ATTR() macro:

include/linux/hwmon-sysfs.h:SENSOR_ATTR()
    { .dev_attr =3D __DEVICE_ATTR(_name, _mode, _show, _store),

Could the commit message be updated to accurately reflect the macro used in
the code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-sysfs-cons=
t-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net?part=3D3
