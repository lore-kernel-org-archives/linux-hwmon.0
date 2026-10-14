Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F75221F0
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984470; cv=none; b=ehuuGlXF3Og9ZSO8wptL/cbfzT7mU+5ypwMjChlkwV2nPONJ1orZAQUmjr/PLF1YCGP/7yUd2v2jPXQ+RE8Yj3daIk4GKaj84Mkeo2tCWYRzx6AkuOTXrv/51YzBsi7W7/CrEH+HTbKksFA6ItaIFPJPciHpzhpUjTQihq7rMec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984470; c=relaxed/simple;
	bh=p3Z3RQlex8Jy2dHn1grkeh5Zm+6q0Pp/Z4kQNf9n2vo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uT9XtfbdH/rtXfvuUwMSXJ8g/R4ws87YRZ4y3h98mEEopVNIu/4fJeln+I9c0oRWC0yoeTWn6kwk4O7hi/SuYQP3dqdNv4bfbgoqkrmLA+XAYvs8cd44ylBloQyDaYdPrlm9MnC0uHMim79mHBk1clQ30CNwQIct4g73bBQ6y3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWybDeV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWybDeV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5986B1F000FF;
	Wed, 14 Oct 2026 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984463;
	bh=p3Z3RQlex8Jy2dHn1grkeh5Zm+6q0Pp/Z4kQNf9n2vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jWybDeV/leyYV8+YzHjb2wV5DgaX2m5K46hTNgvEyxqKu5Ls/falyZeevgzaMl2at
	 5Js23wX6RYnL52f6eA7jijuns2gUNWTSoPBLRkfz2U4bXPhG9G6dz9gETj2TCQKy2o
	 cg6fjGeWmkr/jeG+fHxPFHsfGZ6FrDjEWtWFUUrTeLAx/AT3THp9rfYzeWN2e7GNOZ
	 gkcb1MVwsU0s3tN9KUmLEodP4Km/x1j7T95FHyFwZVeDgrheASakL9Kz9TombXhjiP
	 Ze8HdfgRLZkvlZHIfu/W9yZkHw1Ay8B3nVkt08SQ7LcPKRcu+hzwgKXlKhKCGxgNW5
	 QH3fgDEwg0pSA==
Message-ID: <sashiko-outbox-171353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: embedded-controller: add Lenovo
 Yoga Slim 7x Gen 11 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014132315.4659-2-okerixx@gmail.com>
References: <20261014132315.4659-1-okerixx@gmail.com>
 <20261014132315.4659-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:27:42 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
> Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
> address 0x70 and is distinct from the Qualcomm reference EC that the
> reference designs place at 0x76.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014132315.4659=
-1-okerixx@gmail.com?part=3D1

