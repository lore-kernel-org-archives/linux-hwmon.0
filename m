Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B93164BA
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970532; cv=none; b=EuW4PWdTcNOZawAaBDLuINBgmwx5fTjK/91Mw2AsFvnnIRlwqUahrqY+ljFniAgfPZ/txyuMnP9ovQHEx+DUXn4qZe/8AaufRoFciKQNT9Pum3qF42jeQ42FVt+nQGAmGhcv+2JO7ZgYRnTJDfP8cktA5c1wgnPqNV3q2JNbzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970532; c=relaxed/simple;
	bh=ngklFUrgLY7ISY7oDLY/+N8oJ3kLY1JBnNLNMz+6nwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lq7YDsxq1p0/09SEso0tSW8HQHXlb6d16ST1QfYY5cKWA9aMB0/GK+m2Ko8zbT1VryOh/n9wIMf0ShOkJjrBvXovGgHeilrddUVYBpxq7uF7S4FqFy1SEUpTAsjgsKA5VJWM10DDl9mVI44JiNR++4SSp0H820KUXjo0VjofvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JILyHq0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JILyHq0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0021F00893;
	Mon, 21 Sep 2026 06:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970530;
	bh=ngklFUrgLY7ISY7oDLY/+N8oJ3kLY1JBnNLNMz+6nwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JILyHq0yRHJ+8K9MviGG4ylZNKYTl/SgqyaqaCAPhzQLBeu9j1LFHg5oujJR+VG1C
	 UXpX+gkNOVloSlpgA8ZcVPrE7BUWuaKZVJgwDbMrqqBamdaq2s3+UnUIoiNGa8YOYy
	 D+a4H4ri9oP9N4EPduOq5yfVG0zZyLMjw2spcepjQUYQR+ft8feHI47d1Qjg/Iz1ZH
	 swoKZfhSeZMmfvuVt7Sd8lxThdD2w3mMSF45QbQdYSZWe9WSiITz4sj1mDbA0gc3CF
	 KNKcrb2dXcJIlYOuPCdKUP7W6kIP7cy90aJ2W+EIbJVJQTZUXXm3TukshevVvGMvAK
	 rG/q3o/MqXEkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/8] RAS/AMD/ATL: Match AMD CPUs only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-5-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-5-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:02:10 +0000
Message-Id: <20260921060210.6C0021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> ATL matches Hygon through X86_FEATURE_SMCA and X86_FEATURE_ZEN, but
> relies on the AMD northbridge cache for its node count and F4 devices.
> The cache uses fixed PCI slots that do not represent the Hygon topology.
>=20
> The cache is therefore discarded before ATL can register its decoder,
> so excluding Hygon from these feature matches does not disable a
> working address translation path.
>=20
> Qualify both feature matches with the AMD vendor. Hygon address
> translation will use the Hygon node interfaces in a separate series.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D4

