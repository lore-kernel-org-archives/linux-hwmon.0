Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D939023A
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088306; cv=none; b=np44wbQ8+X1VVwTJDGVDzVljfnbYCViSX5or4p/IvIVV3rOv+WojKCghKwuuPzIPXtb66VhKe9JQ9mmFYnwfPG1WshuvuK+ILJX6HNKEYYx6FlGDrgmyWWPHTHj8ZRpz+zJwqmNzIL+XPT6Nw26TI5d9f96ntHaScWZ8ERn22GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088306; c=relaxed/simple;
	bh=UkstNP5vOnd6/p8cD2aQZwDVPVsHmfgWGN2fk6KYzDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1h4/G3yCWzB6EljiPsS8GRiIuNd/HzroMtYzhhnBBA7H1hSSxAi8P1fqQsSIwnpeJ3vJW5g13+OqCNo+xd3n73LUt/j107yHVzzSqQvBvh7odLQtflfcE+Zb8eS9IPO/zKC9b1hj/bud/6MjUTxPON8LHq/FE6j6wz0S1LHkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsLoEG8Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsLoEG8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D901F00893;
	Fri, 29 May 2026 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780088305;
	bh=UkstNP5vOnd6/p8cD2aQZwDVPVsHmfgWGN2fk6KYzDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsLoEG8QcAZEa7Y3gmA0yNqi6kc9fod7qNV6oc8WGxp2ZfdkcHssMdthvWiq9uhuk
	 dIb7xkZYOfz5zm2Opo79Ws6O2iLdtVnJp3vl4bNickKxxnj8p3OUpN++MPydkG8ycp
	 CzhV4QzeAxri8OdkmFQbGAcTjEs5YgLUwSqPAsb5CIP8uhf3efi1mFQjr6V7EkFx4A
	 XjtZO4GsIU0C6oqhTMLLfdMSxrAovFAJqUXUtfeIbaMawijsu1ZWTpaVuqFTkHEjdj
	 u/vEle9xDqCg8Xla84hylu2QCvPiZxha6CxT2LRRJeHqDcqx8+GRvRmA13M3tT8ljM
	 fRYOn/Nwabp1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: (cros_ec) Prepare the addition of custom
 groups
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 20:58:24 +0000
Message-Id: <20260529205825.20D901F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> An upcoming change will add a custom sysfs attribute group.
>=20
> Set up the scaffolding for that.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-cros_ec-hw=
mon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=3D2

