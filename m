Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CD32B13F
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900138; cv=none; b=Vw3M9YhAgNF9sty2C9ea196KffxNB+a+Q+dHO5gD762mEVpJm+UoL/IVqSQOHHGOhxtOy+k1kwEPtoHigd1pZdb4mBMmeu3j1GE2WSRz6rAEeGHssJw46eStJLwKBN6sSIFriFujC7G/YgV7Y7Wc0E4g1XvxNAYKIYrk5r4un9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900138; c=relaxed/simple;
	bh=EISU7SkhGWYHhbyTyDLPBh2fT5W6qdRz+p+cKgFX+wE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U2arkbcekyuIQrnUxwOyhik0HbQ2rT7aWeZNndELHS7TpsDjQVWaTIacWSzlNnj4iPrq9UQu/TIqzUp98bYxtzAsYXFzhH7zVBHF2K+udBHfBVRoFF9YOKZPNWh+poq/crwixMKRYf7ZNpgPVz126SpEI2cBD8k5ilHs7tNMwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guGAfgEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guGAfgEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D2B1F00893;
	Mon,  8 Jun 2026 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780900136;
	bh=EISU7SkhGWYHhbyTyDLPBh2fT5W6qdRz+p+cKgFX+wE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guGAfgECWds3c6XfhZIJUZe9106DoRMrOJ9jMnsDbU8/f4j0v9dLbEBzzTxLMnOoT
	 AvRpMSUek+kP0vkKvML8piU8HJVCFgJuVb9PwGy+3m6irqHL9LRXM7dIOsZLGuRW0s
	 2mL7U1Auc5rDdNLpIil86tCTqa/a8Qm28svvbCDv4ldTzXKML8GTKRRy3cT7VlbmEU
	 qMHWOP9u63za82G214E8ewku9lfhhk+9Wxs5hWgmh1rp4UQ07mviC/BJlZHbGyNM0y
	 wv0nZAkwHTCZgcAnV4PcfEnIIQ2b6vW6QdzVZhZlELesXpWI5Tr0YgfdzU7yLeZlJJ
	 Gvqni60r3eVCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6.6.y] hwmon: (pmbus/core) Protect regulator operations
 with mutex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Wang" <32840572@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_53D6CAB7A20BCE168EA9DF22F0E78EF14509@qq.com>
References: <tencent_53D6CAB7A20BCE168EA9DF22F0E78EF14509@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 06:28:55 +0000
Message-Id: <20260608062856.21D2B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Guenter Roeck <linux@roeck-us.net>
>=20
> [ Upstream commit 754bd2b4a084b90b5e7b630e1f423061a9b9b761 ]
>=20
> The regulator operations pmbus_regulator_get_voltage(),
> pmbus_regulator_set_voltage(), and pmbus_regulator_list_voltage()
> access PMBus registers and shared data but were not protected by
> the update_lock mutex. This could lead to race conditions.
>=20
> However, adding mutex protection directly to these functions causes
> a deadlock because pmbus_regulator_notify() (which calls
> regulator_notifier_call_chain()) is often called with the mutex
> already held (e.g., from pmbus_fault_handler()). If a regulator
> callback then calls one of the now-protected voltage functions,
> it will attempt to acquire the same mutex.
> [ ... ]
> Cc: Sanman Pradhan <psanman@juniper.net>
> Fixes: ddbb4db4ced1b ("hwmon: (pmbus) Add regulator support")
> Reviewed-by: Sanman Pradhan <psanman@juniper.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Fang Wang <32840572@qq.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_53D6CAB7A20=
BCE168EA9DF22F0E78EF14509@qq.com?part=3D1

