Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395318;
	b=bVsyKNOK6LZzozWpKXktJfEe6JflvexEvnvH9/K3QIFlJ/I6BUlp5FnAFVoNNriatmd6
	 p8LXOPTTQgUU3n40kpV5tH8YQuS0AasVNfuSbtRbvYO3Me0mCPLdXf0neILjGbESzpG/K
	 k+cKY6uSYkvi8u0PoRSgRvBUxYUWwh+j3tKJZNs+HbsrpPFyF+CRUyCvays0jvvyA9KBQ
	 QC9julecL/6vtHSPgvD9XzXmJy1QQgSZ4kdUe0vkQrrd4VswX323KN+/tt5kxG4Hl8pZN
	 rpGJZhlK2IOYBicPjDVCctpuMVnqVWFR2bxUw3wPbuKWynG5qPsrrCf52UNm0tHGS5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XFk5qLP/c1ZGdpZacnGFjetsx1B9KvzQspyxNG8druk=;
	b=4MF1DWZA8wrBAPVbn9OwsJ5h5RmlguAyZk1HkP459IaL3+1TV1EPySgLU6D19JT/bEmg
	 vgzPG3rA1/+XZLQl1pAGpBF40Ew1b6wfRLNte4pVru0AChM5oBungEnctaTFpU0MO7gmq
	 1jFqPZY+C+9eRhpHsGbUJkhJIsnzHfhIdtz1RlBjsBvvNkkY6qpqnVIu8Ooj9fo7abXvR
	 kweosLkMYi5kXquvqUIzMg8q1TyOFKN8LmBGf4/76jCRa6FQcY8Z3gM378/FZeLyBHKxi
	 2Yc3oemDI4gNa4stERZteYJhYJZ7TuxHHAyYiSDf8fPCxV7/FMvpnMvoqCPhRgCPgsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEM+C2GW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E96606A31C;
	Wed, 11 Nov 2026 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LEM+C2GW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E054E1F00ACD;
	Wed, 11 Nov 2026 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395318;
	bh=XFk5qLP/c1ZGdpZacnGFjetsx1B9KvzQspyxNG8druk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEM+C2GWKgEx0wV7037vwdZXxO0UmNdxzXwOj7OFpAbhJ0tgc6hlJXQTo7p7NKs0n
	 GmjDgtPOff4QD2YIzHM7Oov2smEbs6T3Bu28b3jamsYsshRxCbXku2p2mERepuWIab
	 BwSoVEN7gGhivUj0tJAu6C6yd0E69vQYVDhEuTyCymrAWWBh4nFfgW2os2OSHAS+zz
	 /S3an/SO3u0X2gEIhNQhFJk/p28gL61O9JI1oy+gRlXpRdmB6XtiNND3AHZCcg2gyf
	 zF6KJkbdTER6jRrPD6pEXjmh8eCPX3+5cQUo0XnaBHboyv3wUR5PS3JNHWMUhHWzm8
	 ZX4Jo0oWtvhuA==
Message-ID: <sashiko-outbox-208849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] reset: Add BCMBCA block resets through the PMB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-5-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-5-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:08:37 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Implement the BCM6846 XRDP reset group through the shared PMB regmap.
> Assert all blocks before releasing any of them, preserving the vendor
> reset masks and ordering. Provide the independent PVTMON acquisition
> reset as well. Serialize complete sequences and hold blocks in reset
> on failure.
>=20
> Consumers must enable their power domains before triggering a reset
> pulse (i.e. the cycle of asserting/deasserting reset).
>=20
> Suppress bind attributes: it's not good to be able to unbind the
> reset driver for the SoC manually.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D5

