Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B913AA510
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137485; cv=none; b=Q9J/BHCImFAMK93gghDEUHQhHnd/8IDZQwUDrhgthrI/WEdIvWcqOM+bSR0HmUkRoKzVfMdoi9UUS09gwkWuxaop0gcqk2aq++/fc+aKyuAqod6VRHySfevuEGHbZBFyHbI3ZOGxRw40t03V8brzkn+tQbsMv2QSVvnVMngvSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137485; c=relaxed/simple;
	bh=5p0APOcfkzwDxmE1nWBgUj2hQyqVEwSUvfW1txNee5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XyGG3WxX86kETa9zCaclp2X+OFW0acQrwdThflUgmWTGAxK285HsrCLfiiWzDd3JCjCk0raN4VuiQqCZR2GHPVfDZEOKmEN5PWJFupJIRabpG7xzyvxHF+H8HktBq69Q6Th3K14teFYoxCLwcsrt+ojy0Xpd2LLtaD+CO0emJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cv5i5+Cs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cv5i5+Cs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AB31F00A3A;
	Mon, 22 Jun 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137483;
	bh=5p0APOcfkzwDxmE1nWBgUj2hQyqVEwSUvfW1txNee5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cv5i5+CsiuTCp4JmAVaXyuFsQcfSFR205xhLXtIy/HQ7TW2VxZUdaYyDIvnRJ31H0
	 hlTcJh3TFxMDZZROzFYmkXef3KYi7DcRa+BCSg5W+Vu96/u8RqqaXhwoyGXpWhIwa6
	 iIvJ/GikK+qdOlun5GU3GKgRVHQJudeMkHy79PtyQibu0Qs/L/+tjrzKUhcLn4mvyF
	 InOzUazwn9NuCr7crU34XbIEIwVsavLFb+sqlWJVYaysm+UaTycd+XfgO9M3dfOUnW
	 y9XpBa0allFFwcSQsg+ojibaHghDINteqiAAMqIqJ8Cpip55q6zIMrzQhOx/zSw769
	 BnEj0htbIBbrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] hwmon: sbtsi_temp: Refactor temperature register
 access into helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-3-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-3-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:11:23 +0000
Message-Id: <20260622141123.B5AB31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Prathima <Prathima.Lk@amd.com>
>=20
> Extract the paired integer/decimal register reads and writes from the
> hwmon read/write callbacks into sbtsi_temp_read() and sbtsi_temp_write()
> helpers. This consolidates error handling and respects the ReadOrder bit
> for atomic temperature latching.
>=20
> This keeps register access independent while preserving existing hwmon
> functionality.
>=20
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D2

