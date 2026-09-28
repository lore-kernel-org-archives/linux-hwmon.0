Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24584B4026
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596062; cv=none; b=ad+zcQcGyUlx0a73he097py0fziEsk4fSO0D9fdLqwhxlKEJzM+oXgNtbK4Gz1ee1yGr6hEwmEWBRFltH6ElWpx8vomNNvNDMUakAQItPSyFGkNQe1BtjOa4PhhJO5Jp5F9RtijFxKHmBh+8Mkt2pZ6uJyWhF/zRlQRTP0H1wZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596062; c=relaxed/simple;
	bh=/FA5p0+kSZWSsSwFJD0Dk1Yrdz23/BPHlwnlGJfSw1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KtcUUUE+bEgTbYsJbd5JaR+MS5oVxGtqwmjjRZKc0bY0H9f7br3hBPQ09yrQLKbdUpm9A60bjey92ZWyPItM/1ufrEZmLdvG6Zu4qMVc0dNUiyzlCqY71monznmICc76OpQ+72QrXdKzUT2iKY8noBWSr6fQIIJP2dilgmw5quo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVCdxKWo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVCdxKWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781071F000FF;
	Mon, 28 Sep 2026 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790596061;
	bh=/FA5p0+kSZWSsSwFJD0Dk1Yrdz23/BPHlwnlGJfSw1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVCdxKWodX7PxAQvVf1ORxtMudfxJ8OYjObeDSSR8qj5f/IKhjlgqWmrt7DKt6k0m
	 rCpe+59Rkc8dUdfVga03mqBsy9OMGP6iJ/wRiPk/uvj7UKPz3CQXNp7JvaoVbM5yMA
	 pjMlXf/Pe1ymDd9avyLdhgX3sRhaYDMTd3uc81rXkVSKCNwRI6b9egVC/ffqSPtnlC
	 AqFrwWKKJq9mR51bgMCtJIKzP0z/Wfy+Ec/FHDfS5NdTz1MjRCqnwq9HizCfPZtguS
	 /HvLZ3FP5AKx1fnT/8KF8YgIUl3ZI+msrhoDzeqfTGHgRyURyKPMfG+vGYQ1R9DjbQ
	 ZJTnckPSGU5WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (asus_rog_ryujin) Fix pump control source
 on the Ryujin III
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zac Lanzon" <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
References: <cover.1790512964.git.lanzonza@gmail.com>
 <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:47:40 +0000
Message-Id: <20260928114741.781071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The RYUJIN III pump has a 4-pin cable for a motherboard fan header in
> addition to USB. Byte 2 of the set cooler duty command selects the pump
> control source: 0 hands the pump to its internal controller, which
> follows the PWM of the header its 4-pin cable is plugged into, and 1
> makes it follow the pump duty in byte 3. Byte 3 of the cooler duty
> report returns the current source.
>=20
> The driver fills byte 2 with duty_channel, which is 1 for the RYUJIN
> III, and a pwm2 write re-sends the reported pump duty with the new fan
> duty. So writing only the internal fan duty takes the pump away from
> its internal controller.
>=20
> Measured on a RYUJIN III 360 (firmware AURJ2-S750-0108) with the pump
> cable on AIO_PUMP and the header PWM set through nct6775, after loading
> the driver with the pump on its internal controller (pump rpm):
> [ ... ]
> Closes: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/issues/12
> Suggested-by: Edward Blair <edward.blair@gmail.com>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512964.gi=
t.lanzonza@gmail.com?part=3D1

