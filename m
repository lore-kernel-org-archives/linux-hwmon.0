Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803770;
	b=P6kFUTpu9VH59I9Ge/5PIh3X0Wik6CBVvQthwpYWXWtN/EXBoKpX2zqGj25a6GH+reJD
	 3ltHpZzxto41YQkBbrpQp3kN7SFhCkf7E3kn4FXspfVzmuK7b8bat0ioywXfvtnu782/U
	 NrTnEpFa6OT+WjTvwkMMQV2vWvbIl66/fqO3l1ePF2SimRK8fMwwODgijy6DJ37wU3hE3
	 PDWt248BID+Nl3IgS7DMBSMZiXfQvVS6/Al0SnwxIMYiagG4+iNFlxuz/VpBlaAq7AR/U
	 42BIGlo/c1JoDNuAgCO8e3madk0Xa1AI4TgNmc+JHKbuoBQgrj6dd+Bq/tc6wedulQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803770;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BzaIA1QAXQk+b682jS1xCvUxWA/zNROlEAJM197Ql3U=;
	b=EhI9iigQPfs5rcvskUlhC9g6f3r1SXchhweObRg8oovWiuday8oM6C2hZhSJnevlE+IO
	 ta+Qj6Fb6UZVMXHvgAuljY820tjii0E+6F9AU89RSe6ExflduLFgLYMNWjMZI+QxD8TYd
	 Ud42KzjXbuc8P4qRCP/yh09iVciTm3LzJzkbccMhxWhj+zeeVVpKEtM61hX/xw4j8iE89
	 5/i2cvtlKa1jeHxP3HUvKYJnCasL8EAx7Z19IyLJCAu+xM8ojC7sxI5LFDml4DYlPQvBx
	 0tAZLCBPIhMeDInTIQfczlL+dty1UyjE3G6UPFls8SgQi7fFVk8NeqJA8Gdv+HjgTJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6qErety;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF11606A339
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6qErety
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0D71F00A17;
	Wed,  4 Nov 2026 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803769;
	bh=BzaIA1QAXQk+b682jS1xCvUxWA/zNROlEAJM197Ql3U=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=c6qEretyvb8iK9TIqAOaOanjAPUAbBYrVE89ERwhLQ0r/bpIcb/7LJnyUNKuFZDit
	 QbyaAhpczUTisZHOQBwY/dOttPC0iHFCmlONk0EpK5AZ5PXUKVcOFVDRJ3915D8uzV
	 enOH9fj2YXRdxbob9qMoAfQ7+CvXF7YG3xCQXhfvev1euqRtATX9QOxxeBqJ/kg97R
	 A/bTHoNhU5jfxd+vWySoS95zB3kEhCcuQiF3J0aOZJldDUFVG1810vDnK1Ce5emxog
	 Zjd49jCrACxI5Rz3uVil82L1PsEiLORWWUPP3EGfuN8lQZWj8JwETm/1yh4Ag9p3h8
	 psmp/Ov7kasEA==
Message-ID: <sashiko-outbox-197466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_rog_ryujin) Fix timeout when reading 0%
 duty cycle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261104144432.3199070-1-linux@roeck-us.net>
References: <20261104144432.3199070-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:49:29 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The device uses the same zero-duty report format for both legitimate 0%
> duty GET responses and SET confirmation ACKs on cooler and controller
> duty channels. To distinguish them, rog_ryujin_raw_event() checks
> !completion_done() on cooler_duty_set and controller_duty_set, assuming
> this is only true while a SET command is awaiting confirmation.
>=20
> However, init_completion() initializes the completion count to zero, so
> !completion_done() evaluates to true from probe until the first SET
> command completes. Likewise, if rog_ryujin_execute_cmd() fails to send a
> command, times out, or is interrupted after reinit_completion(), the
> completion remains uncompleted. When a valid 0% duty GET response then
> arrives, rog_ryujin_raw_event() consumes it as a SET confirmation and
> leaves the pending *_duty_received completion uncompleted, causing
> rog_ryujin_execute_cmd() to wait 1.5 seconds and fail with -ETIMEDOUT.
>=20
> Mark all completions as done with complete_all() after initialization in
> rog_ryujin_probe(), and complete status_completion on error in
> rog_ryujin_execute_cmd(), so !completion_done() is only true while a
> command is actively awaiting a response.
>=20
> Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO co=
oler")
> Cc: Aleksa Savic <savicaleksa83@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104144432.3199=
070-1-linux@roeck-us.net?part=3D1

