Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D6546D083;
	Thu, 23 Jul 2026 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821939; cv=none; b=QjYxofi+De3Y6zdgZaJivHT9g26UL+QC5keCa+xHV2bCwL1Ye5746h5yukXmL4DpcY4Ayfm8ojLTMgrxanb4QXpQ5mQDX82S5x5RYy5mlLqvvK4g/DK4cW4AbezA8CDY1LSwZaFYGRUhOq1rS59YxTVsplaxDZ8zOjXEaIqVBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821939; c=relaxed/simple;
	bh=53l02S7VWwulf2V3B2mdLrgEp51dvVsFgTLudwV8N54=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AN78zj22PhWe+BFcUSj4dEUjQ56gSNlVNaTPjUdiW1ezE0jRHxX5uKnce/zZ3fT1jxFecKv2ut72/8PQhP5URPHAP7UtYWjMjbD5LUp1uzfmuRRZt6qoO0OosP7NQQxV4AqZiFG/qEs0mutFA9pnbb5uOPp1Qex/49u4xUZJ/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+j+oCve; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+j+oCve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051381F000E9;
	Thu, 23 Jul 2026 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784821938;
	bh=53l02S7VWwulf2V3B2mdLrgEp51dvVsFgTLudwV8N54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q+j+oCveXtg4mJGYHqTfiNSxBY7j0IQxpNC41eHJoexiAwLk/5St/uFcYqh6rj2bp
	 Epjwdu1HZ5Qz82Onk3t3ZinR5Q6S2L5OPv1xiw+mxS07A2iipIIQAusFNHNShC/r1G
	 QFXVfCcBtJqQYhX7HllONXtfZZKQpdj8InEpNkJ1CgGYrn5HmHIJ/r/y2dks7fseyH
	 KFRJ4j1cqPl7RTF7eAiuR/npUcOOF9x51GhcPp/EAqnxxb7hxe6xUFS1Pdh/sPjMB3
	 aUBWUgpwGh2rq4oGJJUfe3z2tyMSqiXeK7V3gUgZOXq+W34SicnHkv00Fw01y/aMZ6
	 zPeTHgFUDIqRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: pmbus: event notification with alarms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v2-1-3c4cb71f23c0@free.fr>
References: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
 <20260723-mpq8646_v0-v2-1-3c4cb71f23c0@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 15:52:17 +0000
Message-Id: <20260723155218.051381F000E9@smtp.kernel.org>
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
-v2-0-3c4cb71f23c0@free.fr?part=3D1

