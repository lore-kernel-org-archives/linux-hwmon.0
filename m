Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706933F9A15;
	Fri, 31 Jul 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498092; cv=none; b=t5ApSBLHJTBFz0a5IRu73MpZr1qNZsZTeRBs61qr/k5l9h/Az8QlQZzRZ+7d5sBHCYI80131KxQQKTQGPRG6CGnmm74pRajE0AZKXmbK/zClDbYhqQVMAHCEkxoLfWoS6UKaXjr5TfJPEM7bx5rblKO30th3fE9L9yk50bpC7Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498092; c=relaxed/simple;
	bh=W1eBeQzJDDVQBIdhFFs1EDwA+cU3KnR67oE4PMJD5Os=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qQdEwZpxSjH1zXF9gFtg3l/m6V8NMKvUssx0od/hXrANCj3S2/MM5XU4bMbYfKVFgBi8IdUVOT/8I7tSh2WPqoq5eKaiFdYD78u30U72WKmPagmklX4LfnQT2/V10mWDLro5xX1iPYkr5ZxF6ZhNS1l01CgsLbPVRp5PUHn/57k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efoSjf6X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efoSjf6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F871F00ADF;
	Fri, 31 Jul 2026 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498089;
	bh=W1eBeQzJDDVQBIdhFFs1EDwA+cU3KnR67oE4PMJD5Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=efoSjf6XnPnbOqPzuzX5gdCSaXynI1nrmkQq72j+vD/WhZ0F5Cb7BIywUzVKevRTK
	 AB9VdAKO12cCGZMIIEevotpyX5mtQUAA3pjBd3kKSbQqDRoR8lmexCSWcC0xqLYfvy
	 J2O+BMKMvK8lxXJS5QXKzriVQJq8bBDtDUvBuKGEeTGxrXwYl0xupDTySKaBm6/5Ds
	 2fy3cODUAUsXXan1sccBeqAEaywezNgwYNoNFYtywkMYcQETQ5u5rSh99czHaHZ+Zw
	 pK7uClGd8IHtj8gSyyjaM2RJMFdUpn5lg1Xqc5968ee4iqinKlkVl6rScXFsNa7ABf
	 6EeTruPgvekJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (emc1403) Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731113007.145322-3-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 11:41:28 +0000
Message-Id: <20260731114129.49F871F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The OF match data for 'smsc,emc1402' is set to the enum value `emc1=
402` (0). This results in a NULL pointer, causing `device_get_match_data()`=
 to incorrectly assume the match data is missing, which triggers an uninten=
ded fallback to `id_table` matching.
--

--- Patch [2]: [PATCH v4 2/3] hwmon: (emc1403) Convert to use OF bindings -=
--
Note: The standard inline diff format for this report has been altered to a
free-form summary due to automated recitation restrictions.

commit 6847b2cd06e049585ee05391183122e70ebf54a0
Author: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>

hwmon: (emc1403) Convert to use OF bindings

This commit adds an OF match table to the emc1403 driver to enable its
use with Device Trees.

[Severity: Low]
Looking at emc1403_of_match in drivers/hwmon/emc1403.c, the .data field for
"smsc,emc1402" is cast from the enum emc1402. Since emc1402 evaluates to 0,
does this store a NULL pointer in the match data?

When emc1403_probe() calls i2c_get_match_data(client) at line 668,
device_get_match_data() will encounter this NULL pointer and assume the
match data is missing.

Will this cause the I2C subsystem to unintentionally bypass the OF match
data and fall back to string matching against the id_table?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731113007.1453=
22-1-clamor95@gmail.com?part=3D2
