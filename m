Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF547887A
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 22:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597751; cv=none; b=g8qtA66A0me85iEoPEWRFr60XOizeSh2LtWPhX3n6Wec4O4ZRA7b8niKwwXql2oZ/U4E+MCeMBtc7dKfqHAxnA3n5I6YzRQWRUNfdaVA7o2RKjYjLUpu/HSoa+sAOZk9xnmrPt7CXdEube/WqVPXc/+wwvzr+S/P8gL1FCpEvIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597751; c=relaxed/simple;
	bh=8r0A9NSOjNNm+WOrkbkFTMw257yJ9Sw6orb4iYRN0ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GzadvLuN4cK0NlvgrFixhBsDz1AkjZSJc1WDQ1TqU/j7ED0zWGlfSNVV9kRURXOfMUQ6OI5DLU1seDPlBhvYyAlaxFV3t+ljK95mVTyUimjeLJynnsoyEXo3aJ5HSr1xVD1MBhKHCncjizPYcoq6BvR5/nyYBO7wTkkZg6iFxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGa9UeYT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGa9UeYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1D31F00893;
	Wed, 16 Sep 2026 22:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789597743;
	bh=8r0A9NSOjNNm+WOrkbkFTMw257yJ9Sw6orb4iYRN0ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGa9UeYT6LB2dSdTTjSGOt41octoRlXjA2+tp0bvufPLGRbnYyEVy8vKFGCIw/w+S
	 2i0sOGeih+ldSroQ4HzIxZ82u5ThsLs+8HGBYgJdEGElIATlGOnK7U/Vfq17OBZTLC
	 3uRn8VxI7QB8D2YZW1PqhP64m3i7wR5Wr4v3XC9I4TaaOWOsdcs1/SuP0Nz1477Zbn
	 b5XCCDfRyXyasiX8Xhw+90NcGu6XriXKFjtss8dphlqc4KJQiqQxliW2JS+mIwVJSw
	 shtZJDsd5c5SMIwLKRIs90wBCalkTifSGiNdc7r7wypNc1aYmdtVWYs1TVEVfzSVDz
	 j63M5plIeN6Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Improve raw WMI string handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Seo" <james@equiv.tech>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260916221912.434119-5-james@equiv.tech>
References: <20260916221912.434119-5-james@equiv.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 22:29:02 +0000
Message-Id: <20260916222903.3F1D31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Commit c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on
> EliteDesk 800 G6") left out some logic for recognizing raw WMI
> strings in check_numeric_sensor_wobj(). This issue was reported by a
> user along with an incomplete and unsuitable proposed solution [1].
>=20
> Add the missing logic and properly remedy the issue. Also slightly
> refactor how raw WMI strings are recognized elsewhere to make the
> intent that they should be treated as regular ACPI strings clearer.
>=20
> Reported-by: Muhammad Bilal <meatuni001@gmail.com>
> Link: https://lore.kernel.org/linux-hwmon/20260916002907.161210-1-meatuni=
001@gmail.com/ [1]
> Fixes: c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on Elit=
eDesk 800 G6")
> Signed-off-by: James Seo <james@equiv.tech>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916221912.4341=
19-5-james@equiv.tech?part=3D1

