Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD54EC66C
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102974; cv=none; b=HsmtiKxbtYotA1rv8ALaaMVNELRMD1VSw+BwAqCKL9GS6tNEPSFYOAlVXztRo43UbamdutbxEdz7gsEr8du5cWRn6h9QS8Ywq0K1pDKinDvDwAR+2cEHOMX6TnYEgxj1cblAe+G3Dn3XBxsLr4mW5m08N6GDR8vUR1iU9ZBYsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102974; c=relaxed/simple;
	bh=uXCA0FAeiCTlCtvBQ55HkMgBlVtSVeYHsuRAVYvOvqM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=c3xQhtnaTgfxYSxrbWN0dRjxTXeXMflYC29fTonUi4tR77gw1qC9DSbxLt7cpM1P9HoDKUnRtGZDWY/0MJyUUCuEzWfwTRa08/+gZzZTgNduSOzrIEUpi+cocWvPojHhfQKBXSSlsoIXkt28Cihfuu26hBr+qp4EG9DgyZeY/kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=As00gsYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="As00gsYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD731F000C9;
	Thu, 15 Oct 2026 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102971;
	bh=uXCA0FAeiCTlCtvBQ55HkMgBlVtSVeYHsuRAVYvOvqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=As00gsYxIV3e8zal7dNkWuUNucB4EAD1oJc4YTV52t16bgtIgbshvA5jTABOuYAWJ
	 usVWsYzr4rj2SLc7CLGTI0FJw5SLepyoPcc8Jo3HUURZwST7iGWLlkqrLOALldmpo1
	 8h9SB4sCmdeI8ubmPCqW8tmKC58rvLCD0XfZpzUFDOMJiNcAvDQ/tiyK7Y3ovotODj
	 i1tTp/ErR4wforRVbFWzoT2//YkynkIyfkAWV4GrfGF28VnAUhSX7KPYj8iSlosY0p
	 Bg53WJKR2PTEk66upWggtbrJ8wKSOw6p5RWsfpvTgsZK5v4p9b6jvya2qxkqfcq4cC
	 3iYP5n2H/jx5w==
Message-ID: <sashiko-outbox-173450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 6/6] eth: fbnic: derive the alarm range on
 older firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014222225.2803660-7-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
 <20261014222225.2803660-7-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 22:22:50 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Firmware that predates range reporting uses the threshold event to flag
> that a limit was exceeded, with the attribute hardcoded to 1, rather than
> reporting which range the sensor entered. The range enum reserves that
> value as FBNIC_FW_TSENE_ALARM_DEPRECATED. It does not indicate which
> limit was crossed, so it is not cached and the alarm classifies a fresh
> reading on every sysfs read.
>=20
> Such firmware re-arms the trip points around the range the reading
> landed in, so every crossing interrupts, including the one back to
> normal. The event carries the reading that tripped it, so derive the
> range from that, against the same capability response thresholds and
> boundaries firmware uses. The alarm then tracks crossings there too, and
> wakes anything polling the sysfs attribute.
>=20
> An event can arrive before the capability response that carries those
> thresholds, since rx messages are parsed while polling for it. There is
> nothing to classify against yet, so the reading would come back as the
> normal range and stick there. Leave the range unknown and let the read
> path derive it once the thresholds are in.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222225.2803=
660-1-limzhineng2@gmail.com?part=3D6

