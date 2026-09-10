Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3410B53444B
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065817; cv=none; b=iPQw5qJL9iI0mMWg45i+rrjEi/CobGZkF9ohoQ0Ebws7aF84O259aMrer4ularND5TXiz+a37boKqOnlYZnDoAeUUCJgIM55zWWlTU2gtALaHPx5UZwy3rJOeM8QBffTYzQFvChGFeFRZ7CBb1MLyV+oHYdo2Kz6p2XftfNJot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065817; c=relaxed/simple;
	bh=r1XeofO9EgzdrTaxOl8NJyXp4vf9gL60GDDFioW+fc4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GMWhXt2g8QOe6UBdetdkfYQJdA4IwY1ydzJ0SC5LQRp8i1updoXfwRcygRrHtRGcpQLQS+/NAqTa7hcfZuO1GIjMchWGlh5YcfKzaT3oG7NDJZoJUB9s029Ky+ymcu0Sc+QYC5KeuHNPLabWRp3Hhgf8L0aP2UiGQJ4ycf0r1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcAR73qX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcAR73qX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792901F000FF;
	Thu, 10 Sep 2026 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789065815;
	bh=CyeJrFid+pyPl3GW9L18A0KEnKmp7vFpmHwHmKpEyuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcAR73qX9HiSgv7vbVOXTh5drkn8HHauxr/KJqs2Ss68Ya5kwys7AW/IKZ6pQlfKW
	 TT0LAnQ4BWzughno3BLOvTa72J6rlHl3Z+IrXx03QUuaw9FIo4c5qcVmcuKtVr4piB
	 fO2/b0myOEp+c/zO9LOU6jQCefvxxUL7ue9hZa7CllfPCO3WIX9qCysgG3WD96yr/T
	 pOIFjK8ARxR3RGLE3QGQYLooz/9tAR8YnPLL8IPrb0s13MFsiYMpK8BWLEJldLkvO1
	 gZKgC4AQg57jKrzsGeElXJFMRNzhSlUIs6Ljq7AtQdTTaeKZ/v0o1Cx8pZ3J2+yEFV
	 j6RBBd6s4lwpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 18:43:35 +0000
Message-Id: <20260910184335.792901F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Model 20h-2Fh are mobile processors with single CCD. For example, model
> 24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.
>=20
> Including mobile processors in the model id range of Zen5 Turin
> processors leads to bogus reporting:
>=20
>   k10temp-pci-00c3
>   Adapter: PCI adapter
>   Tctl:         +54.1=C2=B0C
>   Tccd4:       +148.6=C2=B0C
>   Tccd6:       +148.4=C2=B0C
>   Tccd7:       +149.1=C2=B0C
>   Tccd8:       +149.2=C2=B0C
>   Tccd9:       +149.2=C2=B0C
>   Tccd12:      +149.1=C2=B0C
>   Tccd14:       +22.0=C2=B0C
>   Tccd15:       +22.0=C2=B0C
>   Tccd16:       +22.0=C2=B0C
>=20
> Fix it by removing the said range.
>=20
> Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring=
 for Zen5 Turin")
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-k10temp-fi=
x-zen5-epyc-v1-1-643f5a248ae1@rong.moe?part=3D1

