Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2413033E1
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410651; cv=none; b=W2hRHm/fJG+DZAd05xSKqr9D2tfd35o38qpe8Odh7en+AxYAsQtDPMYbPuQcn3wa/wU05SxhlNlt+6Rk2zgJXzhlVvBfjOVsmmOAAVUqBxY//C5YRD1g6aL8ZaG7QJdlaqRLRxp6OLlq+IX2fi39c7C7oRePrs77ktC6BHHrNbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410651; c=relaxed/simple;
	bh=Cr9NDnK7XWJtx0lREewv2sTkSB4r0tFwSXr3UZnnlJ0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aSBW5FxULR2KvxnUDwTuTreQWbGx/MHXNz9a25U52SVdzK4fx0+/mBZhCKihNreU4zRDsuGHgLE2DLT2deAfCJNAKK18zBD0y54KBgOYvakmURtL86Xm52gQXEL5HahYCnIb03jJtGHMQ5BnIXB/clnGEma8s9n9bwSPYAANAIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4CpFyzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4CpFyzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB561F000C4;
	Mon, 19 Oct 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410650;
	bh=Cr9NDnK7XWJtx0lREewv2sTkSB4r0tFwSXr3UZnnlJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c4CpFyzVc+46zWm7Q3gZRypahPtyTiPDndcYIigvY60uZALm6E5gpylaRvFnYaweK
	 oFUOjpXQVC71jfF7Vk4W3d3lHsLoWUiYZn6IIfUdZZW/apioTaGByQrz/jEpa6ZQpX
	 3CkYYAm4hwoOzWjPCL1B97dfyp3a8o1d7+W3F0u6lFcCXe2TsnCY/E0UkMFOk1a1gH
	 ls5gYdfomlS2zDi9fOqFMvmfgPVv6H8PePLwdoEfx2vfHAR35FtS82tyqY6oZ3fpMV
	 W8OZ3u9XWs+4qRT+b2DvEJV1sYxolsn3ffrT3VXqS6BGpBDel/+kDH/0WG8dL+bj+r
	 DviyLrbnbzm7g==
Message-ID: <sashiko-outbox-177055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019114502.55307-7-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:50:50 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
> monitoring driver.
>=20
> The GNR platform has different DIMM topology from previous generations,
> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
> channel. Define these new constants and update CHAN_RANK_MAX to use
> the GNR value since it represents the maximum across all supported
> platforms.
>=20
> Since the current peci core does not support domains, accessing GNR's
> DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
> and return completion code 0x90 (invalid request). To handle this, the
> read_thresholds callback is not defined for GNR, and the visibility
> logic is updated to skip exposing the max and crit temperature
> attributes.
>=20
> The minimum PECI revision required for GNR is 0x42.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019114502.5530=
7-1-changhuang.liang@starfivetech.com?part=3D6

