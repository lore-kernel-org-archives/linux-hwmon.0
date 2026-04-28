Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDCE7478
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414589; cv=none; b=AGp7RzpVVKp3kZl+E0GSM444mjvDLWWSAd/T2lKQK+z1R5IyrF7BmdSh64Ez4a20HXtVjCNQClE/PAz3EfSnCLlwCr+f24onbgZXm66qG6pBY7dkv9mQbUw7aBNgsutfoaz6JB2IKFDthaDrGjRG5E2kKgOuvH8EgVUzxpq1Odc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414589; c=relaxed/simple;
	bh=Bt/Jj09NPzvPasa8t0sfZgmLVHxCySdu8bXdOcYKr34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJyFFBrKf67CMvdYvQTkErGXJO7HnR24wKpaasDgZPF6gedl11tus6iPnZAVYYeoFgGIdcm5eg8PJJMMTB2QxPBGqRAuecBik4aByDXMmWPURWVoyGkHBqETFaIRGB8o1w4L3vlZjjgChkmQGC+Bs1oFd87UqJ3nPwJn2Ael9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc/TqbWB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc/TqbWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E7DC2BCAF;
	Tue, 28 Apr 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777414588;
	bh=Bt/Jj09NPzvPasa8t0sfZgmLVHxCySdu8bXdOcYKr34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Pc/TqbWBL6pxwHCObZdGflcouGKny9FgBAzYteQyo06VGrBPLtKnm48ycBwQqb/WM
	 /p3D9+1X4ZpWeiqd/9UegqDq3gHNPuyRs0zseDsW75+1UNl0OX8VEL/5IC5tXRJ0pF
	 R1FBr/LiZ/OvCvvkkFiXGMAgiPA1S63/2Qh7/gJS9It0ugz1I6Im4x8IHyvO9vHFZl
	 5Aba9LbyjxPLMk5A/YLq0T5nMvpWZNkLTHKM7Gs0VNmXfDMf3beKMCnfJ2bZ2f+/iR
	 TzmeNhDvEI08qoKcboWwuYN8P+LaCFZZ/ekQK5ScKSKgNKgIiueW2speDScQ6i0nWn
	 CJY15eaOQ243w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Reply-To: sashiko@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <1777374569-59233-5-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-5-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Apr 2026 22:16:27 +0000
Message-Id: <20260428221628.B8E7DC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Redundant compatible string in the OF match table.
- [Low] Missing update to subsystem documentation (`Documentation/hwmon/sht=
3x.rst`).
- [Low] Missing Kconfig help text update.
--

commit 907d39a1530eacc8aee2b5e489cdd9c94b10ce78
Author: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

hwmon: (sht3x) Add support for GXCAS GXHT30

This commit adds support for the GXCAS GXHT30 humidity and temperature sens=
or.
The GXHT30 is described as being software compatible with the Sensirion SHT=
30.

> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 6437568aaf73..f52114c13edb 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
[ ... ]
> @@ -948,6 +949,7 @@ static const struct of_device_id sht3x_of_match[] =3D=
 {
>  	{ .compatible =3D "sensirion,sts31", .data =3D (void *)(uintptr_t)sts3x=
 },
>  	{ .compatible =3D "sensirion,sts32", .data =3D (void *)(uintptr_t)sts3x=
 },
>  	{ .compatible =3D "sensirion,sts35", .data =3D (void *)(uintptr_t)sts3x=
 },
> +	{ .compatible =3D "gxcas,gxht30", .data =3D (void *)(uintptr_t)sht3x },

Is this explicit compatible string entry necessary in the driver?

The device tree binding for the GXHT30 enforces using sensirion,sht30 as a
fallback compatible string. Since the device tree node will provide
sensirion,sht30 in its compatible list, and the driver already matches
sensirion,sht30 using the same sht3x driver data, the fallback should handle
the matching automatically without needing an explicit entry here.

This isn't a bug, but should the documentation and Kconfig be updated for t=
he
new chip?

The patch adds a new hardware chip but doesn't update the supported chips
section in Documentation/hwmon/sht3x.rst, or the help text for
CONFIG_SENSORS_SHT3x in drivers/hwmon/Kconfig. Updating these is expected
when adding support for a new device to the hardware monitoring subsystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1777374569-59233-1-=
git-send-email-zaixiang.xu.dev@gmail.com?part=3D4
