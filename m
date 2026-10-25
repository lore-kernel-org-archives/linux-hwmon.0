Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901925;
	b=WZfs97ijrSFa60NziKdsgyhajGpPtrY5yUeY2yYtSt0wCGrs56Odub8aOP1zn6uSxZxU
	 EYxnTUvR9OrGUhVwHoSF2PxjAauzjAcXjSowdILqSCqqzhsA8hW+I04A80ixP8JA+rRkd
	 q/9gs+hS5o1CWw2tuHzy3MY2TnEK0hpKAixx+Ml1P8JQDF9oVctqBZw6Ri5WAmxMPWVMd
	 8wY853JvlsEK1CHtNFHvaeSRkTJaW1+4M4QMPtEhtgccdEbMac7LF/DGPh5pWGB6D9H7D
	 WQuQBcDNBPZst3lUkxmShvXK4+V0icwlR6EAefGw0rM9tHzCB3XvE408Y01ISwfNm2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UiJn/lhGmFfPWD+9oFgK8GftK9ASbb2LglIpCuCewNU=;
	b=XeLBZJqi1+iOLJ479fe2flCPVw7z/C3B4sb+0NF5Nm7zp/LYwDk/z4F/wcSxnskfUEmg
	 rsYtXDwngLtiLtcS/sMF4gs2YKbO9N/XW6N1Cek+6HJg8APB8ru5uEv3qZCNa0JbenzqQ
	 kjEhJMkNlKqoJoiWgQDl9TToXtDKh+VJzSmnzkqWWvuQElf7pn3Sizw1oR1GHAP5bRk+j
	 hXsCTgESEJZpWXShMisJv0li8wbHPJJmnqXHqCYLqVQzROGnOsVgUuYx5FPDqUt+ekW5/
	 dluudeBgGNwQMvFvquUJVEYpNiJJAO9isuupz/mO3TsIXrKuZzqVnGEE2WEnAwcDxmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exjjBSTi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0F1606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exjjBSTi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785731F01825;
	Sun, 25 Oct 2026 04:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901924;
	bh=UiJn/lhGmFfPWD+9oFgK8GftK9ASbb2LglIpCuCewNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exjjBSTi54ERY+A8VZF8JUD7xSiADc4n9Iv1CGzJopLJq/adQgxGN5JJ6YiZ/C4a/
	 7c3mivMar3cAJ5IRqxq3h67YDAhBcXEgXJOKFRykKgog1J13XNjMKG06+cDFJmUM+1
	 QkyOe9MaRFyS7OyXihDSQTD24hj50exqgFqFXnQzl/zyjHOAZBtW3KYAZSj2W6Uc8+
	 jgMXCKJp9edr9jkCr34lYkhWS83KVquj5KDxkR3gkqTKBxnJYuZSqKXdsfR9zMVC/N
	 CjsJ2gz7gFarDYvipv1dZGVb0hvasd5X1o6hkfM3Gbl0VN9Mnpa0R2MbaXLXgyTXao
	 qRpsY+17waLLA==
Message-ID: <sashiko-outbox-184058@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/31] hwmon: (pmbus/mp5920) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-22-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-22-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:18:44 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the size of the receive buffer to i2c_smbus_read_block_data() in
> mp5920_probe().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D22

