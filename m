Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098434;
	b=QXwQTFBKcQdHs/+kUtlVf1WAgEbKhG7mw967WblyLCVWfhpQCTgfP9Qm/M4/tz3ePJIo
	 n1iCisBG6nN7Wh1T5EMkXJMUjzkAASohKpy8NXeZ238BQu4r5db5NuWJtn/iX/P+G9dgS
	 Da1UlEd2tV3cjLJS3n+bgdbXQ341Dmakl0823m1yTJxQ9YZuv50XR7h4/gT99yYvQAAG+
	 /H02b6mOT9c1wK6OJon4fdTgIbibqcpwaMLoyt61ND8zcF805peTt2b5BXj11yQo8UGWT
	 AsGOaw4BMQNrDnpPjfCsViS//JawqzMWKERfNEhkbMniwKQHJhCq+3qfzUc2Q7wssuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2uKRAXtYbOQqD4O44fgKLHJ/stlhfnW3lwDAq4A1w38=;
	b=axHPX3wslrMTVcUHY8YjqiOhAIXid0Yd4MjrlUTEnlRwn/jReOGDuV88qatZCaSq9Zlf
	 L+4LvWwW62Pq2plsI1appYPKRRIQQQSjXK722J9uXtS9aLKH32MLLZeq6MIr5H/uRAHnl
	 OCpfug3PLRxA2V3cDYxZ7dB/Qv522cDO/o3OAuiwihjVoPmzO3WFIzuTL8rpn2cwox61z
	 L3U1rcw/YNzsgsKMa/PYmzmXMDjnYiwtLxqMg1wi4TaZaPLAn15ZhqzWX+TNG1I1NRRGf
	 KRXIVnCwi4rq4V7VkovcipDhaBQVIIApDjHH8eulGBBRp5dHUd6EVL9+c3+eRnP6nbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogf42iWE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22B606A335
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogf42iWE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30311F01200;
	Tue, 27 Oct 2026 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098433;
	bh=2uKRAXtYbOQqD4O44fgKLHJ/stlhfnW3lwDAq4A1w38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogf42iWEzk6HQgy1P7RxiE3a/n4BxBsvPynHGQhinVf9HlhQrHJCfNLyNfAFuSjZH
	 QKARbasxNbX4cc5ZxrMOYMPL4ZSTDkR5jAxs6OFH4BrO1lvBIt0C1B1FRK1IIREAUd
	 RjZ4JlqrR8+go/S/udQhchZuxoyCysozu40nVGeUwcsNcgYJcliF+yJL9vBmzDpDd1
	 D/CV/oVjy0Snv/37KHCTmxL/URBrdydjmosiUTEEoaOIVfjhzX/O1MSsWUR/LdGmvf
	 yZYiXF/EGLnQmBKn4cLfEmeqvDKEzCg29jlrcr808u64WeBl+EK2xMvfUstq5RFX07
	 fbtBzhDCkZUYA==
Message-ID: <sashiko-outbox-186390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/23] gpio: Use named initializers for
 auxiliary_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <ec269df979b1e0a7df04a20eb19505c332679428.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
 <ec269df979b1e0a7df04a20eb19505c332679428.1793097104.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 10:53:53 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> auxiliary_device_id that replaces .driver_data by an anonymous union
> (though none of these drivers uses .driver_data, so this patch isn't
> strictly necessary for the plan, but still ok for consistency).
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793097104.gi=
t.u.kleine-koenig@baylibre.com?part=3D13

