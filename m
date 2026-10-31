Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793486030;
	b=EtboSH6uWMy8nRLCryf+YKfrUGegIuCMBRnc5xZ3wIVlOXjptEyC85YuOMTurmgRjOvg
	 rzkKRR0WWnAF93z4ykX4UUHc8/D/xY3E3IY11qxnJH/X9MZbI1bOpz0v/UKlylcd3WdpY
	 Rodz3jMY20/zg7t6jGjawhZn9TuCg+E6Vjcqt0aesjdqUil74Aa3uY3QLeaPBOcfpCmMQ
	 hxHIBEQMLo8PVnCgTzHKAeRUxz3Y5E71f3WTovPkCSTvIEz42q8lgtq05fy7+erUl0ScE
	 Ad7U0KvkYdhejAzTn8WqFu0bDNfnWJQha+KwJuNPeoJ2XkN1YYJfsr18uQU4UzBH/CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793486030;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d34Ro2HtfMMY85jaAzsmJzaASaoQd0+y8zju1KkNboM=;
	b=M97iF0ET4iyQ4dghnk+u9Suu1BImP4A+hIhU2ibx386lPEgXaexiTTKZS0Xyoz7yVwkP
	 GoLfHA4CAiyR6uIPBiYlsdnY10qWIZ/ROou1LTdh1x1LVO8hVQvpMe9OuddsLUMxs8ch0
	 cHxr1htupbi/vkjUW1TA8RI0xKBzp+5LMoL8sfvM8jD98sff3M5ZrandCESRVjZuWhtOR
	 hi9seAkEQOlzj/icnPkYJxJBiFucKEj9QTXoA8KpPJi9wswy6Y+ipchTpb9Gi+ckixqVM
	 l4J3VP0kRfbNtaztEhHXZvxdcYQRxG8xvXz+7hCDaBXyAcFvRFiPLCC4gkvlSkhlpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csWfseVO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3D606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 22:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csWfseVO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989261F000C1;
	Sat, 31 Oct 2026 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793486029;
	bh=d34Ro2HtfMMY85jaAzsmJzaASaoQd0+y8zju1KkNboM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=csWfseVO6VAQ0liy2lWr3x7xjxvx4Jk8cQ2L7A0VbfM9gnfHYYj536/arvwBAD3nW
	 nYG8AfZxLx1XPHG6gUknEUw1JFJI2jkVlPQyWIhU3/8zre2iRUt/PzDVOXrSgqvyb4
	 ne9pzrFkddnUB+AWyDw9ggrZG7a+gfhY+b4W+6SpjnsNosXFgBme35fbdyi9dUJWol
	 AW1/5huUJfyTcxNB5x8EtohpOT8jMhBJoAwXBtDG0FK3UKcUh0XKJsvsrvzpfDUHT/
	 Po47mHiWIeMcQGz2UPFIlezneZ7iQewrJWk6b1dtu4tuwtRpEgXoCFxQs8rvk2sJWR
	 jtpCTTqWkv9uw==
Message-ID: <sashiko-outbox-192206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (gigabyte_waterforce) Make
 status_report_request_lock IRQ safe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, "Hardware Monitoring" <linux-hwmon@vger.kernel.org>
In-Reply-To: <20261031223131.1855967-1-linux@roeck-us.net>
References: <20261031223131.1855967-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 22:33:49 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> waterforce_raw_event() is the HID ->raw_event() callback and acquires
> priv->status_report_request_lock with a plain spin_lock(), while
> waterforce_get_status() acquires the same lock with spin_lock_bh().
>=20
> Depending on the HID transport and USB host controller driver,
> waterforce_raw_event() can run in process context (e.g. via uhid with
> softirqs and hardirqs enabled), softirq context (USB HCDs using HCD_BH),
> or hard interrupt context (USB HCDs without HCD_BH, such as OHCI/UHCI).
>=20
> Because spin_lock_bh() in waterforce_get_status() leaves hard interrupts
> enabled, a hard-IRQ URB completion invoking waterforce_raw_event() on the
> same CPU will self-deadlock on status_report_request_lock. Likewise, a
> plain spin_lock() in waterforce_raw_event() when called from process
> context via uhid leaves both softirqs and hardirqs enabled, risking a
> self-deadlock if interrupted by softirq or hardirq raw-event delivery on
> the same CPU.
>=20
> Use spin_lock_irq() in waterforce_get_status(), which always runs in
> process context, and spin_lock_irqsave() in waterforce_raw_event(), which
> may run with interrupts either enabled or disabled.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 41c71105a845 ("hwmon: (gigabyte_waterforce) Mark status report as =
received under a spinlock")
> Cc: Aleksa Savic <savicaleksa83@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031223131.1855=
967-1-linux@roeck-us.net?part=3D1

