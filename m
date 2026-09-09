Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027453CF1F5
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 22:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994691; cv=none; b=fYVUPi23BsrHwgAd/cGT+OVDx3mEYcLasFLDlqMXB7VO3VeRe0onRB06baQ3jTy4af4yo0FtRehKANOxpeGwlTZZ3UwZLLfWaPkyWCtjq1uxP3q5SzjW4plyNIXS+SfFOYfBF4jgTX8tz8bP8q9acuJ2Y/B5KzZahuTsu+a02Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994691; c=relaxed/simple;
	bh=+tQlfMAcyFR2W4n6d8F91zFb/h0j6E1cLeKGcFd9JXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CcHX2NN2+bBJjMVCQYZl4kN6R6i9M4Av3W6tUzs5KebWDs1741EcE0ztHAh+cnQyeuNR/AIVpLvlvA+ly/gni/1kdX+bazXmAcTg1YV6o6K7g6++VG2MJyaKqGdB1fo1FVBv4iu+stUGniUVzouph07vhnjTVPzCjQV+0wHPKL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKwUHs+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKwUHs+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17041F00898;
	Wed,  9 Sep 2026 22:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788994678;
	bh=+tQlfMAcyFR2W4n6d8F91zFb/h0j6E1cLeKGcFd9JXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aKwUHs+YrZj6JHoxsOXNeKviDMS1RDFEKHNybRMtI1YGdDWOukx6Mn2ax3lFBKyIN
	 zVq5vKp76YKPoaVsAKi6Ts/Jn3sQ3IHukCLgrZoPbudrgnsviAocBoEGHRA/nHhDte
	 5+L0ft9cEiEoxI7bYuVJ9q5p54pcuQhFsYD+nXvpq8EWaPvyV9KqG6dsHsMcVl3DzD
	 n3nF2l2Pn/9haxeyZjC87Z0v8x7U7+5N48egN6BcK45/hoP3+cMuQEuUZ7D2lNwETj
	 P1XW3++Mj9WXDaHZdUBtvCEcKEAnyXVnlywllRmwsq842M6eypGDQXauv/K5kNgHIx
	 MAFtmo2gm/IzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/6] eth: fbnic: expose all hwmon attributes
 unconditionally as read-only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908225737.3034403-3-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
 <20260908225737.3034403-3-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 22:57:57 +0000
Message-Id: <20260909225757.E17041F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> All fbnic hwmon attributes are read-only and always present, so
> fbnic_hwmon_is_visible() can simply return 0444 for everything
> instead of matching on the sensor type and attribute. This also
> prepares for the threshold and alarm attributes added in the
> following patches: they are exposed unconditionally and reads
> return attribute values.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908225737.3034=
403-1-limzhineng2@gmail.com?part=3D2

