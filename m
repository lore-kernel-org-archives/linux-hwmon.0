Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811C2DC331
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 01:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288449; cv=none; b=hIv1bYGQjAE/FTWSp+M4jqAt9gernVOL18JA2ycrRYcpf4fSWMt3Tc9YtDMG0SYJV6ct6D6pDNkqbSzq5v/0AWEdTcFawgtiDdoA22mLNvZILCMB0TFsujTOMNF9jg1OP1uRZs2YEnDSJXxUO0y731kixlL5o/rwsywbqJ89+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288449; c=relaxed/simple;
	bh=IeMBlOhssqdC4H1HgvZqKAKnBupYDOEuHWE+jpIr3ZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fr649R+6dbuuqTdJHwnZUmgg9fX+Zd3By3Sxe6RqtAhRYwZOCjKVEwe9DWF01uwRQOcrkpOolJrFiuSQ5JlzjcE9NM/Cu2AON/YxNggfPnSq38mclN2gA5boIBJDiCWnmbPEgef4hNb5NvhGWfSRnozyRlD3HH+fNhmD1dsd8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZihClXm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZihClXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED5F1F000E9;
	Wed, 29 Jul 2026 01:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288448;
	bh=IeMBlOhssqdC4H1HgvZqKAKnBupYDOEuHWE+jpIr3ZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TZihClXm4khl9fMFPkIaIjgkA7eOmT4g7NCxTtP+nZAVEYRtqepyqB4SC2sz7UHQo
	 RGnkoLzi+Nm5+a9X1f7jzmBCKGspYte6G/8DjroAh31njggBbUl5/VtK2nXS9U9NJ8
	 BJEzpQ+6hvKmkqS7tTLhr0228hVDx1gMgY19/7AJW29QIGLrzFzLpgxFHd0mO31pfB
	 MGezuBNS7GuM9emnX/uycTLcZEQfrq1lOZ/c6TiIj5LAVAxKH0I+1gqU08O1zK+DZy
	 8oJZ8s9mU8ugfmt53VukZ22uKklvsxU9mp5mCO/Rxg4bLQzpmhlz2i55wBejnFs1PM
	 HU1gja+M/jw2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Let PMBus drivers report the supported
 PMBus revision
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729011914.4018703-1-linux@roeck-us.net>
References: <20260729011914.4018703-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:27:27 +0000
Message-Id: <20260729012727.EED5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some PMBus chips do not support the PMBUS_REVISION command. Knowing
> the PMBUs revision supported by a chip is relevant for PMBUs core
> functionality, so add support for letting chip drivers report the PMBUs
> revision.
>=20
> Use the new capability to report the PMBus revision supported by MAX20830.
>=20
> While at it, add definitions for PMBUs revisons 1.3.1 and 1.4.
>=20
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729011914.4018=
703-1-linux@roeck-us.net?part=3D1

