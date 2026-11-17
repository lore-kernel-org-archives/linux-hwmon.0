Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940019;
	b=g/CxJVUTwt66mgUfmbnSyXbd8rqyU6TPJ4z0t7Orm96nGnZouERFmbfiCDjO/tRt/rae
	 JnNgWKHPTicw1S7dTtNwqaxqsdo7C5hydviZHtzRl4gRRN4redLBd30iMuL+ytDliZ0+8
	 iKuLNUFdy87XSj1yy0+x/6xKWDUFuugcpBfoCJyrbE++iS/z+e8zO3GU2n0yisf/1J+A6
	 zko+zJLYjAFbeRiQPInLv2iCuAxc96Sr7S2P+yf1IVVAWVkn/chzXWn3AfIBXiD6aybFL
	 OYX+AE7jROUtZQFsAhirwcQNv9ERJlvyhUxokjUUFjQ+F/oJtkmtc2NQfxn9ALE2d7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940019;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0pnEOV1EbyxJjyyQ7Etl2g3opZxYrvrrQ98OBefThac=;
	b=w8Ei9TZHt5St52y9b0x6BVOi2MdCi9MoK0Hm2FIt45CcWLn1iuz0dY1kEf8ccrt2jhNH
	 Xk/dKoUYm1G4UxbKYgULQttWxgY7rdTe7dQN83/RT0ttRXIkfkcbIcVxL4QEDdrCbyF0R
	 VhJIgFm66i3plxnCn34meP8W8RO5CoZYYQmTW+RL1fjHvTG4J8YXez9pVZsgiBUo+e0IK
	 WdMJQBu8s9hLCQ42xpM0PiK4cyXO3FetN7bl0cH0Ma05MG7W1NXjT2y21EiimsY+AcCZ1
	 Sf5tZXAZtW3h/25xuzi9ZFFtWYsO4lL0T/odPSpgm/SIIcwWiBLaWKCOmXmCt58do6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Z/2gmyQQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC8606A32C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z/2gmyQQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497301F000C4;
	Tue, 17 Nov 2026 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940019;
	bh=0pnEOV1EbyxJjyyQ7Etl2g3opZxYrvrrQ98OBefThac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/2gmyQQmm4v0jO1dNLQETYFqOOizYyhHKPmy6kl8vdpBQZit6vKb2F5pj6YpaDr1
	 96xBKbiT76xb5FmWhELfpsZ2Xz/Sd2GbJTxzqirk+bk6R7O7jAd645FPdAII81VmIL
	 u8u3ct52VKXuOQdThGe9aLsDXPmJB0O2bCka08aa12hG+4/kLmYaGCrRaV/EkOzr8y
	 G1fMfbUlB/52DOPYfYfpL14Wr2ziD6TKb4n6khV11Dv5ymsSW8CIUhf3ycLUVE1O6D
	 jCY1VkToFcq0H7K0WjFu9vjGEqKoYSTUWdrb4dDizr0j1g9GM8jMAh5pEMktBdIltT
	 4AuCDAqAg2HoQ==
Message-ID: <sashiko-outbox-219340@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-7-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-7-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:26:58 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The firmware reports each change of a sensor's state as a system event
> machine check. On one, reread every node from a workqueue and notify
> userspace of each alarm attribute whose value changed. The notifier runs
> in machine check context, so it only queues an irq_work, which queues
> the work. The work takes the hwmon device lock to serialize the refresh
> with the sysfs callbacks.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D7

