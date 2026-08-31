Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A314B048E
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185360; cv=none; b=Bv9GzLAYSJUtq/2yyUVWeclp9HDdFa8sdJpCesOjSAlipRTPYYIOu6CmOLw7GZfS5vVKP5955rE+cDWcCW68ogEFTWnaTQmkEyd3TxDvB36dnofFL9id6jVTEi6XXTOJKguE6a0QfurZReK5UOlu+Q7SUGIsgFZctARul2tT1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185360; c=relaxed/simple;
	bh=M0rRFd3AZbCMQbvZzx9X/bkKXR0eDRj1uqhi9MsVPG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ym8ZyPxMXCIrimEO5xq+MaeHWFNzzi5gIOwe8GQrvED3krrZAFdkQx92/QlGDbLdkwvFSINaQQJ7ejloEIKjPolyKlZCtJdIaKzNTj1QCoOmIG71lEe5Zh2XkrU2hAnGdSGN47TyrbrhgPCJKvbqiC3vOI+p11Y0BbRjJzarVrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=impxTbkX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="impxTbkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40A01F000E9;
	Mon, 31 Aug 2026 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185359;
	bh=M0rRFd3AZbCMQbvZzx9X/bkKXR0eDRj1uqhi9MsVPG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=impxTbkXWH34jsd4pMIv/cePYwsYXf3le/WcVrlfbHS0sXY5JYIZ7HgJGj/Si2GC6
	 8gKCV5AILYhW1sEGpkHJ0J3epJMzSJWrR3enzTyuwUAfE3wWdma/096yTUG+CZ1QaS
	 6lJb26hJS3aaGMMOhpm5eIcvpBDMW3huTxn+Ta93ENgCaJCfrMqWbkqLAZRPuzskzs
	 ipa139ClaZQLjgFrE4eHuOl2a08NcR4KzFkEEUziF9Ub3QHz6HmMaOu1ADXLzreGEn
	 5e3P0hv0j3Nai+ABduu9u4bV8y4vCBbV6sP7DtzumGlv8GnDolI8fepogBjHkSiVGQ
	 /4D/gFLTNAFTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.12] hwmon: (raspberrypi) Fix delayed-work
 teardown race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-65-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-65-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:09:19 +0000
Message-Id: <20260831140919.A40A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>=20
> [ Upstream commit eb0d491e2787aa359f0d930151ff6e5e5df70fb9 ]
>=20
> The delayed polling work rearms itself from the work function, so use
> explicit delayed-work setup and cleanup instead of
> devm_delayed_work_autocancel().
>=20
> Initialize the delayed work with INIT_DELAYED_WORK() and register a
> devres cleanup action that calls disable_delayed_work_sync() during
> teardown.
>=20
> This addresses the concern raised during review about the polling work
> being able to requeue itself while the driver is being removed.
>=20
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Link: https://lore.kernel.org/r/20260517080445.103962-4-chakrabortyshubha=
m66@gmail.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-65-sashal@kernel.org?part=3D1

