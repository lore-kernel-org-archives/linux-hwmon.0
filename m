Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB234CFD3
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613452; cv=none; b=pZ5heXcvNrPBPg3q7ONntVDpaEhIJVZMENYn1kPHkuS/1HQOPLuFiZ2Ku52l2jA0zu/0oU0UFBb5XEGbhlm/LZCyZ1CYVAjGlCshlX1FFmpMrX3gbwlepsNndpAzBvBTUn2GWODk0JgpeqnNdoYgsOVD5CkDxgIS8UY1fRMG/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613452; c=relaxed/simple;
	bh=xOwtDV1nVduU/Hvhrdgy+SE0owa5qmC3YAFxfue51ro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lD7+2H6P8jMJRhbce5Rf8b6xlD04WTdqHiTx7kbvjRXmN/are5n8rvGWFvxiDJu8LIHdoEgX294HhK9cKnJ90i/HShy5qhqVOEpUcFCwCqMHdpiVfIMIeP8EfYS3KeeDkqNk5V29u+0x2mf+lqD5cO8/+XK6VBEt67o1QbDK/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEcRX7AZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEcRX7AZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4578B1F000E9;
	Tue, 21 Jul 2026 05:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784613451;
	bh=xOwtDV1nVduU/Hvhrdgy+SE0owa5qmC3YAFxfue51ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bEcRX7AZn0u4RkCf137FUMTBuDJay4FqdJRsk8QHsyWzfdLIBWotBFG/aFK0A7lyI
	 nCRVlC2Kv3FA+MUJ56LAYPE1aZrs4+j0FP2Fmbk9RMDZd/FQKfMuVLiLdLO1jzsLwu
	 6UEhklh1L3b6D1XDP0VlGFDZVg+N+VbRwMBfUZFdunTXQNmWDVYFY/A8AeLSod/Pwq
	 WNf87mSzdKNemMuybCMtp5+tvvkevEORsF89PUPHgHe/Wlxi01flvr36iCsZie5R8K
	 849gsef4RgaDCIOiLUlPTekxXOV6WGFtL+vFwqFZxg6U4mKS1XOf4ClGtfgbfftqI3
	 ruG32xqJcNAAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: add missing MODULE_DEVICE_TABLE for OF
 match table
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721055022.34629-1-kr494167@gmail.com>
References: <20260721055022.34629-1-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 05:57:30 +0000
Message-Id: <20260721055731.4578B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: surendra <kr494167@gmail.com>
>=20
> The driver registers ltc4283_of_match as the platform driver's
> .of_match_table so the kernel probes the device when a DT node with
> compatible "adi,ltc4283" is present, but the corresponding
> MODULE_DEVICE_TABLE(of, ...) call is absent.
>=20
> Without it the module alias table (modules.alias) does not contain an
> "of:N*T*Cadi,ltc4283" entry, so udev / kmod cannot auto-load the
> module when the DT node appears, breaking modules-based deployments
> while built-in configurations happen to work by accident.
>=20
> Add the missing MODULE_DEVICE_TABLE() to fix module auto-loading.
>=20
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Co=
ntroller")
> Signed-off-by: surendra <kr494167@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721055022.3462=
9-1-kr494167@gmail.com?part=3D1

