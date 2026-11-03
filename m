Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733759;
	b=BidrEZNYGf8ZINpln2brIrpD+DSJH5eXIzxwWXJGl9aUIdg5mobQ5c1tGxfgcu9O1SBC
	 eGqNI+BXD6KGkMdZtDH71aafil+cfUkJqsmKuX5SmUeoAMoeREsT2hAJ6AHXexlGiyrBn
	 whc43BGbvYBWUHTxIpIrLUNyUSjScbB4LDuQYMBQjkAXgaJjnP0hIXwLeogsogCh1RgEY
	 7IJc4N+hH+YyhUh43LM8pR4dOQIwarNANQrHKSroli3YlFHJGOWanS/orMnUrlOKmJFPt
	 0fIQNfks5RL80XieMmG5Hs4Nxqgl7Y8XDM6kOK71szEFRZqfbd6/h/oqCE4qN+M/TTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FbAVYCUB2Ez2/z2EYAWQX5DukNIDLyi3BXsPBos1A8Q=;
	b=YXEaW32MWunTQ1ZQugylUGW4j5c5LFdUEAU6qfFqsoB9b632dGj5ZAEiMQAYa9fYzhbk
	 PFzjWbDpjLMC2iRJL+Jxz8EpIfxikiosczyzdETAWBmcmeDROGycBuvQhXAMV0ARJgNY6
	 qPxFTDhOM2HQLOC7UFQAg/RUiPSbmfJqSxitdbGBRtwY2dFUPVveipyIx6YZOEVTIJ4Rr
	 kT+1c72kTBWF/BkBQW4cMw/TcKXDZ9/rjHm921kx4N7U93IbgEY8V5fiLHn8sCFqQKyAP
	 akkc7IM1NbeiZVIHSmFmP9oYkLlEaT/2jWCM+K5Y15ajc3+iX/nHbrJQFeNJ0YK4FsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLdLwLPA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F5606A324
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLdLwLPA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06F41F000C1;
	Tue,  3 Nov 2026 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793733758;
	bh=FbAVYCUB2Ez2/z2EYAWQX5DukNIDLyi3BXsPBos1A8Q=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=dLdLwLPAMJL+sGkrZetW1v/MFjVsTSKX3TCvM93iJpN47ZeUb2n5GLt7GEiEVgY1j
	 i7syFnI6ASghB3OHYIC7hYAoM33KzFQotOFvVUUAjeckxsxhDU1tBseXhe1FllzIiK
	 dVXoBb7Q1G5K838kVCTs3/K/xnRH9VQCzuE8R8hV0ownlbv69bq6b4CWA0+ph9PIY6
	 RrFGCMST8a4Mt0Zi6RXkF3Cjm50daCDIa/yGC+zU56wNlyGeQBwcFA1QC9coLpcoNt
	 vKU3l/j8+PrYRgRaDbBxmwGRzAb4XZEoBmOmQbhaTL9c1gmMWbphi/nXhieki9sHAE
	 nnjlHB/P+D+eA==
Message-ID: <sashiko-outbox-195910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Serialize alarm flag
 read-and-clear with state->lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, "Hardware Monitoring" <linux-hwmon@vger.kernel.org>
In-Reply-To: <20261103191846.3132938-1-linux@roeck-us.net>
References: <20261103191846.3132938-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 19:22:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> In hp_wmi_hwmon_read(), temperature and fan alarm flags (info->alarm)
> are evaluated and cleared without acquiring state->lock, while only the
> hwmon subsystem lock is held by the hwmon core. Meanwhile, the
> asynchronous WMI event handler hp_wmi_notify() sets info->alarm under
> state->lock. If hp_wmi_notify() sets info->alarm between the read and
> the subsequent clear in hp_wmi_hwmon_read(), the newly reported fan
> stall or critical temperature alarm is overwritten with false and
> permanently lost.
>=20
> The driver-local state->lock cannot be replaced with the hwmon
> subsystem lock (hwmon_lock()):
> - When no connected hwmon-supported sensors are present (!count), the
>   driver operates in debugfs-only mode without registering a hwmon
>   device, while debugfs attributes (fungible_show()) still require
>   state->lock to serialize WMI queries and sensor state updates.
> - Even when sensors are connected, add_event_handler() must subscribe
>   to WMI events before make_chip_info() and
>   devm_hwmon_device_register_with_info() because visibility of alarm
>   and intrusion attributes depends on whether event registration
>   succeeded. As a result, hp_wmi_notify() can run before the hwmon
>   device exists during probe and after devm unregisters and frees the
>   hwmon device during removal.
>=20
> Acquire state->lock in hp_wmi_hwmon_read() around reading and clearing
> info->alarm to prevent losing WMI alarm events.
>=20
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: James Seo <james@equiv.tech>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103191846.3132=
938-1-linux@roeck-us.net?part=3D1

