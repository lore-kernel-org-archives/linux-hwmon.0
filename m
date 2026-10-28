Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175705;
	b=sj7eJ+4PBcb4JBhjVaRRXR/tVHAiR1cUHbZfFKPnFm97LCx8zRCfHRbfY+5J34FkwogO
	 42fYqqppAzesTF7ZzHncXyu5ek7a2PdQTHZxYhmh7QQBYIVBniZtH5r4oc7c9tMpM4PtQ
	 0vZAb3zJiW4Clb/pZGI519g7d4CDmFQWzlxpf6gM3pAm15NvRSm5GSr5CxZ6V2MNxxz9M
	 iD+E9H8cw2CzVISdXe9cJE9CWdaURfhJGBzGFKCMV1/D6I/pb/e/zdn1hj2+gCCWkEDVW
	 9Y5rvPRQx2m4jB4rpxPuUfsosadMqnQGjKf3GZGz/onjR5gPYSYRTOPV0oMmd35+iJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rNhCQxeQj+sCQqv5sMKvibvpqIn+yQuUQTJKA9TK4S4=;
	b=0OQjtpWwqZEvhRrAgYGRPdWP7FkSyEnt+PLw34dsjUf1RM1iKmwOCEmcXB0RMgB2PEig
	 7TGNHtt2xEs96FyegX6l4a7D6U9ftKTzplGo5/eNltHH/0UOLNsL1GTnDO/xHzw4ia8aH
	 a0g898k+/iHxo6rHmT+j0kKtCO+0aLfR7NNO9hP8dxWqKdQPP6Rg+X/4DORE1nQg3CFOk
	 F5u4B97mxCALzw2NzCUCfqEPtPxm5qolMUwpXV8SDb9b7pUi07NOB63h/fFTICgQmbhEe
	 GIyeXIAQbRzYeyIHL4WdbqNcge7OvLB+DS+uZZNZaRYzQRfVI45Ey9sqLmTtR48eKAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0ooZBvP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B416606A31D
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0ooZBvP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E401F01825;
	Wed, 28 Oct 2026 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793175704;
	bh=rNhCQxeQj+sCQqv5sMKvibvpqIn+yQuUQTJKA9TK4S4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0ooZBvP69kRItsJ+eF27Z/2kU1T1PA1U85bCTdbv5PctDXKmXVIswfSF8r3zJSyd
	 KtDQKwun2kfc5WBJWWA1FjpnZMTR490VSa4MDINhKgrdU3MKMzOFoOLK0TD+QEQTxO
	 PGPJ/AVtdpSdzSJB5+59r0DdoDyS7y6O2Wl2YswYdrGP4WXAjJdOe165n371IKZThT
	 Q7HdWAgUjBpqvdROaX+P6VVIhRUu1iVv6VK7PvYnQ8/Cv0SWJHWuez2iFeddrg2jqM
	 BeV0KdA3NVz4PcM8tgHHnLlooWc1pPrNGj8LG0Rir+3FhkLN4OYnRKfNL3B/5Micwm
	 jv3j3O7ptW/JQ==
Message-ID: <sashiko-outbox-187611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: Fix minor style issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "himanshu bakshi" <himanshu.bakshi478@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261028081504.127535-1-himanshu.bakshi478@gmail.com>
References: <20261028081504.127535-1-himanshu.bakshi478@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:21:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
>=20
> Add newline between variable declarations and executable statements
> to address the checkpatch warnings.
>=20
> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028081504.1275=
35-1-himanshu.bakshi478@gmail.com?part=3D1

