Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884766;
	b=TKV1PKW4fyAEdII9ZYebkjIbpeMgaUd09Da/cuqSOEBhszv0MEbrphMmu5N9tNZKn9DN
	 lSgQp8DSjw2g64dVm9WHuzihXqVjW+g18ad4WAjLqqt2LO5yOWJ1CMAfrnUCGZ6D9w5z3
	 vrWaq9f6ItO1JlfQWTMQ0UYx4VJf85UnYc2XkBHRrUhzJ8emXsNaW5xsKyTJhm7fj8Dfj
	 UDb6ReZ6EA1uhBnjJoI4NJ0wPzU5cjHCRUgKIZQu9R42Is5rvgFpt14mwPrnMuQ5oXytg
	 PcJU+LRnJK183+ZmKM5Md1T+ckZ3wdXC8956rak4OsxUR5P/9V/SXLGka53zJZWw8Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884766;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aOZlm08Opo1awtn27R9OqY4uJPO/oM+W+F4iXr1KgTw=;
	b=Y4KdUdBBB6QKArp+2d27I5I22NmujgU+fRDt7ty6E8lgqbf8nd7sHjOnd+0fi6Huc78l
	 8wtsOJWtpZ3N6cwFIrIqgjgMF+ckQ8E8g5ntJVyT9hnkx4l4kOUZyGSh1BG42Ua/NjLdy
	 n49EMdoetDDdkYTC9Kjhmbxg4LAjYeo2Y4uRlzIbVLDShyPEhNC1TPO68yIeLjOXgjC4E
	 /GzIJkL7+SYGMJVJpiyZRD3h1MV+HSc4QPVieyZ7f1XKX+x6ldysRNfm1tKEL0uC+B7uj
	 UPm5En2ZM0DsaFMmfzkYmn07TwXwfcOKI+hqAbGZRuly2Gri6AOaP06z1FCb64M9cUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnJGcAGF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404DF606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnJGcAGF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23711F000C4;
	Tue, 17 Nov 2026 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884765;
	bh=aOZlm08Opo1awtn27R9OqY4uJPO/oM+W+F4iXr1KgTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RnJGcAGF/47d5V/M4ET0mwSwrWBjOWlFdqFKdA8rVCdPiaXByqTbAsjYQwjgZaDtr
	 vuq/yRcAB97VfTsQEKTRjGcs0xmTwzlprz0W/t9ZvsJPFqjOfBpWrj6qv5gD65CXzE
	 529J7SKpHqrS1FSDp1xPgun0dbXkHCBdwW7iN/zaL8c5iaObSJpwfiS3a4Htn0QRZB
	 4X/HQHXIW2AyGtpKMclgyOEyhJ3jcb7OQw+qtyJ6c64bbumvoLDO00bEpka1VGG4bF
	 cT9/bbhMw7MhB3Yw5GshUDMWX1ne0Iwf1xMVjFSTt2kIp89qswJqRt4ybSDKbvZD13
	 EHsg5vh9Gy0jw==
Message-ID: <sashiko-outbox-218122@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket
 layout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:06:05 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>=20
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>=20
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D1

