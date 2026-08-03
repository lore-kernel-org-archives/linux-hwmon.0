Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C8381E91
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 23:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800054; cv=none; b=W9gm0xnL0PvT0rLb7fRl6nk3QS3LWZwvK+GvTot0RNJ2UBycjgu21Z+QgJ32LAGhC6UPl5+ljJYewzUYxSNqLnv+YnmY6fkdEB9khbndg4IgPQ/cfKGmMW9s3b41jAEwk7lc0R2XkGD7ZoabbLBeM8b1vKDUTIghztD8D0IIm6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800054; c=relaxed/simple;
	bh=Daw5+PhiIkwcyq/X62t9Iu9XHVDQpoO1kIw7/+GliTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gyy7NBDa+4MAHZkg9D6Zi1Cf7K4xvPDZ51ta6D4XGfEKs7hr+rFwgkj8NKO5HtzKdBJUBgbCktCrRdWTZ89L4kkVY8zpKlH9KzsnnLEa19TnAJvoEv2BbmzI6/TJejO0aGgo3awLlafCEgYbsZSzNkcy0pEgXwXnHyh180fZJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3Lye1/H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3Lye1/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5493D1F000E9;
	Mon,  3 Aug 2026 23:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785800053;
	bh=Daw5+PhiIkwcyq/X62t9Iu9XHVDQpoO1kIw7/+GliTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z3Lye1/HyNa9yd7Mry5Wm4Xn+EzqYDgHO7VkX2lyC+VvJ+1z8oPqw65tAS4Y3YqEh
	 k2duZ1xBnmeCWaz4TVWW/H4qgftoqP2nRW/f4xsmIiPR8uK0Yjps06R3tFK2GFbu8Y
	 44B9F3QeB2ntGsKfQMvbpVzR14An01ghnNZACuAsCRUbJTQKz4sZAqpQhQi2dPLEw8
	 ZEmZ8n4pkuuXrk9AuFCwqUCfzvUyt6GLRNHG99nuyN6RfYi54biqbcX2HcOcNCCoHZ
	 iknap7veyFy6HXYDjd3N1cK9I7yiu/YCb3GG1zUYpSKMp+wSowRy0BiqGIXAHlMC5p
	 cpvcucjaO1nvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] hwmon: (corsair-psu) Fix linear11 calculation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803232156.2340048-1-linux@roeck-us.net>
References: <20260803232156.2340048-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 23:34:12 +0000
Message-Id: <20260803233413.5493D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver lacks synchronization for the shared `priv->cmd_buffer`=
 and `wait_completion` when accessed concurrently via debugfs and sysfs, vi=
olating subsystem guidelines.
--

--- Patch [1]: [PATCH RESEND] hwmon: (corsair-psu) Fix linear11 calculation=
 ---
(Note: The format of this report is altered to a free-form summary without =
inline diff quoting due to recitation restrictions.)

commit 1b6cfe916e69e567bfe7403168ee73ecb94923c7
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (corsair-psu) Fix linear11 calculation

This commit fixes the parsing of negative temperatures in Linear11 format by
correctly casting the shifted mantissa to s16. It also avoids undefined
behavior by replacing bitwise shifts on negative values with multiplication=
 and
division, and clamps the final output to prevent underflow and overflow.

[Severity: High]
This is a pre-existing issue, but does the driver lack synchronization for =
the
shared priv->cmd_buffer and wait_completion primitives when accessed
concurrently?

Looking at corsairpsu_usb_cmd() in drivers/hwmon/corsair-psu.c, the shared
command buffer and completion structure are modified and sent without mutual
exclusion. Meanwhile, corsairpsu_debugfs_init() creates debugfs attributes
(such as "uptime") that bypass the hwmon core lock.

If a user or monitoring tool reads these debugfs attributes concurrently wi=
th
standard sysfs hwmon attributes, could this trigger a data race on the HID
command buffer, causing corrupted commands to be sent to the device?=20

Since the subsystem guidelines mandate that drivers must implement their own
locking (e.g., hwmon_lock/hwmon_unlock) for attributes registered outside t=
he
hwmon core, and given that wrong configurations can potentially cause the P=
SU
to shut down, should a lock be added to protect these shared HID structures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803232156.2340=
048-1-linux@roeck-us.net?part=3D1
