Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292257;
	b=xVfFAF9CIuUDeyFmCkf1cxlCfN6iPKAMl+kXj2yQfqPU8zIU6l/9raCLQUyo1XM2zUxg
	 Mjdpx849W4O3Z2MH+VVD8N6sSrNhE8FeJJShszLuvnziMmAb9t7KxblRtdTc8zU75iW/v
	 pEnxtYcxGGDQg+1gHj2Fte3Fr1X5cEM1Fw2gkGWyoh5EhgomLf9PnuME7+Abon+GFUgDa
	 9xHriL6alL/t4Ij1bDc6A6BKRyNrCGTNQMLtUXsG59emAn9DEhbOrC7OcOtxpyTr1UWHK
	 60Sri3/a6i/TIeM0XHedzND5TCsoGKCw/zcubHoM7M15UBDwmf0XxImFXds302xXQMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292257;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kw2Pxpqk2n2DD7b29qBbVOgp+an3jDurpLcMZm4KHk4=;
	b=EmDMVxq0uq1Nw546T850HS2XvW2GZnBi2RMq3JKRsffAW6KfGjLu0rVEtwOCOoTCLyWv
	 r+Gonwbz9N7BlC3yBZSDJ1dLPGbp0jYtB3vEV0g/R39gR7SjmcSglsnyU8f6kmSk57PRG
	 EmTipYFgHriOPMnW7ehu1mcAzs/t+U9gQsDMBPbFjJP3vWysjp1k1QuhteSAZjzS/ljvu
	 Ru8TOnJ6OGxxdJOzolaBGS9E332v4ObD9EpKH2CYdvG+DKVoaad3Sd8ZJtXODlJrcnfqr
	 RdLwoGMFivF7ITUXAINDsfZUPpxDtalMfBwVrAvblgkHjmw7169foU8rWp9qgvWa04g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KbYhIm/K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C55606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbYhIm/K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9496E1F01816;
	Thu, 29 Oct 2026 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793292256;
	bh=kw2Pxpqk2n2DD7b29qBbVOgp+an3jDurpLcMZm4KHk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KbYhIm/Ku7KehDKYTrEqZwaKH/zj5JPnWMAxwQRH4E+HHELWQtF8UZdS4FDunCaW8
	 o2d9Fla7yTZYpxVr+cU6xga+coWEz1dXU6TpBZqF+Ykx1xxcwfURK6EDdPOJJGNlrs
	 3Wrsq48l/p5EU/8wKXla2o4MHAhYmEXEAu/3D0cxgaXElB/l3pE6fiqngmm5f9Yqnz
	 LnlFG2CraazFTyhaUS5GHiLh8Y7kebhjtaMlfYljCDwjnK0/n32UIQ0c3aV70dfGNE
	 mSUgBMPdz97OBb7hQFk3ga/4SgHgztsRRch8cyiVt2I5OXY95iNsU5etwO3Nr4mTbL
	 uHFq9Thg8tK6g==
Message-ID: <sashiko-outbox-189671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (lm87) Propagate sysfs write errors
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261029164016.338450-2-pocj8ur4in@gmail.com>
References: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
 <20261029164016.338450-1-pocj8ur4in@gmail.com>
 <20261029164016.338450-2-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:44:16 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Check the I2C result before updating cached values for writable
> attributes. Handle both writes in fan divider changes separately so a
> failed second write does not hide the first one.
>=20
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029164016.3384=
50-1-pocj8ur4in@gmail.com?part=3D1

