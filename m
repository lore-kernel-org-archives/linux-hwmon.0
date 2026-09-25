Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4324D5984
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361009; cv=none; b=k1a/px4IyOGQZDPgXovrmbTn8RzyzcSpNQ5eCesrIO19xUWmanEjwpiakTGDfTfGLCgGS4z5HXlgV5EGq52MSASYXvpz/uDJqDcRGC00EMgv1Udhbo00h9AImfP/MleBv16tf7+lpur9WJ21orqS8Xoqw9WPs+q+luBkJxfU+ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361009; c=relaxed/simple;
	bh=Isso/C7b03YvYsfpahdexl/dTVGQuT264xmCRWUTXKQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MUxUu8BbYKhnxaH5wYbdSxKcOrgG4rSoKRAIgs0gCEbwIFvI7wgayxB0EE/0Jd8XbvWTZATvodhqCvs6hjM6lt6VBXjIbhaJa6ZBpYDL7Lq0R6/6W5ml0T8Ly9M9i1ngWxLNnXbaP93fUCe5fpDxSIsnhjRs45A6aBX4mTKDGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkRu/L7+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkRu/L7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B1B1F000FF;
	Fri, 25 Sep 2026 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790361006;
	bh=Isso/C7b03YvYsfpahdexl/dTVGQuT264xmCRWUTXKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KkRu/L7+C9T+GVsOAZnniYsCdJpQpKXXjdGCJDNmwaLEpDl1+y3VfFdYEVJLdJogf
	 97U3KAvcZ3IlY5Nv/sys/UK8qdBM8QhCsgReqz9zmZ2zKxDOuCSHUnclx6qK/jEOaJ
	 8hfDrwi7m+QKxq9Rld5KXiRkeqe04w5/YkJZ4gwogyaZptITqhQZlQsmOtk1DpMKCq
	 dkGJoMEBKsWTh+hL1glxYi6r1vww6TFZC4G+zP7tsOHHznuBLZMZCIaMAuEJORPNnV
	 NR9WVSoLi/OxwRSWVtfdRcHVd7ffpEap/WsRP96bL6dNHahNfB5JD70E/m1n3NiR0U
	 xKhaUSaSwyRhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (tmp108) Fix jiffies wraparound in
 conversion-ready check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tom Verdonck" <tom.verdonck@inspiral.be>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <525fa49d8c50922344fa53e22be5e6133c9bbb62.1790358356.git.tom.verdonck@inspiral.be>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
 <525fa49d8c50922344fa53e22be5e6133c9bbb62.1790358356.git.tom.verdonck@inspiral.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 18:30:06 +0000
Message-Id: <20260925183006.C4B1B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> tmp108 records a one-shot deadline in ->ready_time at probe (and resume)
> and, on every temperature read, refuses the read with -EAGAIN while
> time_before(jiffies, ready_time) is true, in order to skip the initial
> conversion.
>=20
> ->ready_time is an unsigned long compared with time_before(), whose
> signed difference is only meaningful while the two values are within
> LONG_MAX jiffies of each other. Because ->ready_time is set once and
> never refreshed, jiffies keeps advancing away from it, and after 2^31
> jiffies the difference flips sign. On a 32-bit HZ=3D100 kernel that
> happens ~248.5 days after boot: time_before() then permanently reports
> "not ready" and the driver returns -EAGAIN on every read, without ever
> touching the sensor, until the next reboot. The continuous-mode path,
> which sets ->ready_time to jiffies with no added conversion delay, wraps
> the same way.
>=20
> Store the deadline as a 64-bit jiffies value and compare it with
> get_jiffies_64()/time_before64(), which does not wrap in any practical
> uptime.
>=20
> Fixes: 66e1c9171339 ("hwmon: Add Texas Instruments TMP108 temperature sen=
sor driver.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790358356.gi=
t.tom.verdonck@inspiral.be?part=3D2

