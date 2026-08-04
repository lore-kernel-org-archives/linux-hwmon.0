Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39B483817
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785879864; cv=none; b=BBN8ofmhABHHweTkUscdA/wVyJNFGSnTpfJAaBHUGAq+MiRJV0RCFGqk2SfIePZNTdMxJN11owQK3N66dd1Q8bdEnIOzUFe4ykOg7sFz6wPMV1Gq7VBIEVXtJ3gMjTAlvnUKltMIZSqcT0i7jUItAxXbSCWgbtv7rBYBjOuayaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785879864; c=relaxed/simple;
	bh=kjuINqu5GFvtnvBRsvalJAyIHcHidkQEwNFQk2De2/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WmmtqWs+UpT4LcizJhS0kb6jQ6dLRkIen+ifCdGAXzpbwtkQ0Hsi0KR4T/6qC4xEDlEVzGMPWoTtSYWJV61U1ILYa670m9FpTgVrnSACHxFK+mq12NExHpPHuf57pQQ2vrEJfQ6UPSQTPxQd4IcXnGIEe7ICm9C/1bFuPMvF2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IajG1Hde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IajG1Hde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E851F000E9;
	Tue,  4 Aug 2026 21:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785879863;
	bh=YjZkg92IYMCXHBjUNiRravmL7jrGEO/yb/x4ZpyyQbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IajG1HdeT3FAESO9UHuiasInpkpyxnQ3vii/Z1nuiEu+0VyHBWo8QVCUKm1MfSOaQ
	 nXxa2gi90Et5+mQ3O9ZC779+mpAvDHZz5S6pt6klXvOqjgjpdAfxm+sdB6x1DcYzfT
	 k9oUUAFSwX9TDhJLiX+nT9yX3HwJIj3oVWEmEJ7AgqQ89M3yEM8D0VcXWvHrgRkMkO
	 erDzLXjAxbHfI7ti6CRLLhrI9YEGXz5pV1TQ8vaS6pTypiQSLLzI6dEgpEO/njvWM9
	 Mdn1K4OW+llcTtD8tR7AzTARC8xb4IpnE65SFfiVTUFGIh+s2J7bLU694gl71147ql
	 pfRHtuTzXp3Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Fix PMBus coefficient
 calculations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260804213627.1522664-1-linux@roeck-us.net>
References: <20260804213627.1522664-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 21:44:22 +0000
Message-Id: <20260804214422.E7E851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> In lm25066_probe(), the PMBus coefficients for current and power are
> scaled based on the shunt resistor value. The calculation evaluates the
> multiplication using 32-bit arithmetic because info->m is an int and
> shunt is a u32:
>=20
> static int lm25066_probe(struct i2c_client *client) {
>     ...
>     info->m[PSC_CURRENT_IN] =3D info->m[PSC_CURRENT_IN] * shunt / 1000;
>     info->m[PSC_POWER] =3D info->m[PSC_POWER] * shunt / 1000;
>     ...
> }
>=20
> For large coefficients like 26882 (LM25056) or 15076 (LM5066i), a device
> tree shunt-resistor-micro-ohms value exceeding approximately 159,000
> (159 mOhm, which is physically valid for low-current applications) causes
> [ ... ]
> shunt resistor values.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 94ee5fcc240fe ("hwmon: (pmbus/lm25066) Support configurable sense =
resistor values")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804213627.1522=
664-1-linux@roeck-us.net?part=3D1

