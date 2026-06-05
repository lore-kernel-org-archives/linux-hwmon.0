Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67DF299931
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694118; cv=none; b=JvV4ny9nynG1QT84KdeIqjO3/4s4jLmaelh9vBhmYVr1vXeum/1a+EoH63vYeAidnBcpb2IHJstPaXqfDdGd9Bvr1uyQsAldXanxCt3xzWbQl9apuW5lLmBRS1mWNjLeNEY4u0i76p354iQhxG+lhI1J8qCijaYnApKlYwf2vgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694118; c=relaxed/simple;
	bh=X7feKajgLvBpSYrsZYf/+x2XdxB5SEOewvHthfZkMwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hbl3regg9NvasBPJo+5XnubU0gl+SrseMU0LYt3hOVA/SjESnQgl8NvI3vMwf0XKDWXVY7ISJBpPLfD6PytPrlhzYbNNjOcua9Dapo4+nEoGWnEAR5TrbcsIvg1eBe/p5qma8V8FurLEd65SyI3QiAaQqCvIpZJWXnn/tw3Nmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dltFKpyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dltFKpyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C331F00893;
	Fri,  5 Jun 2026 21:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780694117;
	bh=X7feKajgLvBpSYrsZYf/+x2XdxB5SEOewvHthfZkMwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dltFKpyTlZk0su2GITHSUkkIpdZcsci673wrdqzUfPGPSLfawUzXRJsm/EaSQthfK
	 Z+kCQ6pPKcqOh1g2ieAnh9QJMYWAL4TPcXVvnvYzCId4yKgnQKO0yK7CJF7obcJzNr
	 x+05JKkO4D97GWGwB+imUuunEHhhnYYe8OMcBj6p54Zc49YR8Fj3rz+p8/UtaHvspv
	 PomlWwh5C5CuRWZ5BN7mDkXFmJMRVDTHEb8CPcXE0977/Pwl73LUGO+8JZhJO+jwn2
	 +BDwmZQFaD4ViUOStjAMlTFvudT9BjYgvK+2/canF7sIMXMhZmf1QyfVSWQs3i5kUU
	 mjGEkBm+RWXuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] modpost: Handle malformed WMI GUID strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-10-W_Armin@gmx.de>
References: <20260605205937.530897-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:15:16 +0000
Message-Id: <20260605211517.39C331F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
>=20
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D9

