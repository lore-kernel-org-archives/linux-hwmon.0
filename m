Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D464BD7AF
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102973; cv=none; b=RBXIqVzCRuaJaAns6c7xpAOLetywl6SLXHNYLtYe+x1m0aTST1m9f4Wmgff5mDTsBCWBAPqlproTEPc7UorpjSB1MliQsHliQbBEnMRpE7w4wLNBAE8oBAp8toVWp1DNuXikZFXSAAov1ZgUVV8dqpNh4PtGUj99gZTOLTQ07w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102973; c=relaxed/simple;
	bh=PRcUIYHr5WgzC4suVopIJJ0jEJ7uHU7H90XoE3OhZm4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UFVWMsuDxhGeJkVSB6m5lVh3+h7GhY74RydIP1LkU7DyZcOq547D/uDmMKXWh0yCSwF7AV3JTsJOosPtsGGCcHfIzatF/lssRF3BCIp26219y1GYHZEDCL6IiU/WP8FwAuit7EAqFoOUaWmEnjg8SsXdC/vY7I56X9OX41B6i9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Is9vzt88; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Is9vzt88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D941F1F000C8;
	Thu, 15 Oct 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102970;
	bh=PRcUIYHr5WgzC4suVopIJJ0jEJ7uHU7H90XoE3OhZm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Is9vzt88gZP5/ilTcRfoclg+VQwF7WQK87UJpx2Qae6o5l09CDlNTeFKRdnjVROTq
	 Iqle2sVqQ9KTEf41AZm8pBY6WwF+rI34MRkWgbw0MbFgKTkd8BICwUisJdHxTliHDK
	 f19/m3cZsRzTkM5GMR2g80b0M5ZsfuMD29NsjEb7M9Qvn5h2IwF7LSRe090V0O1bt2
	 2rwS81u21Y+9CqJYtyEb3caOsn6yJZmWhi/BUaCBPqtvqkSBG+t+rhpvQRKW7EVHYR
	 o7P2Sc3qJzLvdEFabzl5ZgEo6fPPcyDgtpfPAIJa+rMU7BOXt7SOuooyxJVXosSD3V
	 TC0raKUPo7elg==
Message-ID: <sashiko-outbox-173448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 4/6] eth: fbnic: parse the alarm range
 reported by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014222225.2803660-5-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
 <20261014222225.2803660-5-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 22:22:49 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Firmware reports which range a sensor is in: normal, below min, above
> max, above crit. It sends the range in an unsolicited event on every
> trip point crossing, including the crossing back into the normal range,
> and in the response to a sensor read. Parse both and keep the last
> reported range per sensor, so the driver holds a condition the hardware
> reported.
>=20
> The range is cached from the mailbox thread in both cases, so an event
> and a read response cannot be applied out of the order firmware sent
> them. It is seeded alongside the rest of the sensor cache in
> fbnic_mbx_init(), before the mailbox interrupt is enabled, since an
> event can arrive as soon as it is.
>=20
> Firmware predating range reporting sends ALARM_DEPRECATED for every
> threshold event and omits the range from the read response entirely.
> Neither is cached, as neither says which limit was crossed.
>=20
> Subsequent patches in this series will consume the cached range.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222225.2803=
660-1-limzhineng2@gmail.com?part=3D4

