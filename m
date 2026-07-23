Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AA3A6B99;
	Thu, 23 Jul 2026 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840697; cv=none; b=EdJY026NoIfjmfbPhHOSYcpelRun2wMH84HiHdg7c75I0cLe0ftloGroaN0tJeQe3El99+OyEoqEJE7nW5ztlOPvxY5ajpE5Zat0dm6pt8xKa1fV8InTpxHpECZC0hY95+zmw1WyvbcmL5yVYLUq+mv5l+39Jk2A7SiTZjesCX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840697; c=relaxed/simple;
	bh=WnlceG7cKky+NDIidw78jWRGs5sQTtn7vwEG6EA31vA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sDnaVh7YQQ2C1M+cX4GhQrOqln2pwRTCAOuMov7v1vsPGu74Qka2MU+iz520rUPIDk4Drtg1zxv85TkS4wCjx2jneGYA2H8lt5+6zCPXbk/I7S2mwoT5uizWQ66e2T/pdj3d2ki/QcJ6h0Pwa0SQThU8haAdTpv8DdiT78YJWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKnI/U2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKnI/U2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D011F00A3A;
	Thu, 23 Jul 2026 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784840687;
	bh=WnlceG7cKky+NDIidw78jWRGs5sQTtn7vwEG6EA31vA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKnI/U2RdF/zwk89izQ8oG3aXnbTpIVkYFz+xHytbqdEs5kZ7077uZW31GUVAzk6j
	 bZiUyTK33hukhMPhkdWp1wNjyRCfIlIBjIQK3/IaP7d5vliJLT+pi/3OB9eIRCiBBO
	 XxP5939wZszuCm8jPeSTg8Kb7IjvrEY45b+I0Yb4LlMBWk2Do1yBc01+Itkc97a9fG
	 Q9FsPXypamseMWbGScYrn85Qsdns5BD8FwWoDiZU3pEqAOaTvk/9qtx4/ZeZwgrL0w
	 OHXRk94lTXKaLFJI1UBWNMwmPwMh8gDrwD5BGhj0VNiinMUNDQCVrZZmgenQCMhaey
	 yC4eIQM+Q4OFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: pmbus: event notification with alarms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v3-1-1af1f3d38848@free.fr>
References: <20260723-mpq8646_v0-v3-0-1af1f3d38848@free.fr>
 <20260723-mpq8646_v0-v3-1-1af1f3d38848@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:04:46 +0000
Message-Id: <20260723210446.C7D011F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Let's add an accessor for the hwmon class device the pmbus core
> registered for an i2c_client. Export it with PMBUS so chip
> drivers can call hwmon_notify_event() on per-sensor *_alarm
> attributes from the driver's work items.
>=20
> The needs: for boards when the chip's SMBALERT# pin is
> not available for the CPU, pmbus_irq_setup() cannot deliver
> poll(POLLPRI) wakes or udev change@... events on the inX_alarm
> files. So the drivers can install a delayed_work-based polling
> fallback (like the lm90 driver) that periodically reads STATUS_WORD
> and calls hwmon_notify_event() on 0->1 transitions.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v3-0-1af1f3d38848@free.fr?part=3D1

