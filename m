Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678319;
	b=Pe6+kbSSe5Nl8qXjuMmnO48hzWwZDtBPYQEKCoEhIOenTzqAzXQnxGRrGVaAX3OsJLT3
	 gKz6zHLpv0D8jhMUQVtLaVQITvRvJtNXPPlt3R0xWL+rgAWKhahbuNowAu978ah0qHFpS
	 AljL3jZW1q/xyPvT/W23gntSdljVXehg/Zr9MC6cC9at3piBdNV47LFDGMWSoB1a//Siw
	 pLeQKtzb9oPkHyE1/FKPELr453FgT8w0gpKaKJL5/uee4rxZ7XcjTKEI4ZOVz/RHsRULw
	 tAHPRAQhiUE2m+gaC/IMBiIVHmSUR9YLxSX7KVfMseXUKIlQH9RDPWPD9qVxHB9krEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678319;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LkOd4wa6dj55P+4i1tp5cR9JO01Zf1YXFB9EHa/PFg0=;
	b=JmhNkry1omyn75q1NT9v54zPCd8tNwetpqF6oeuo4MAPlV/sn2+nlYrVJlMVqvjRkg7A
	 fHWQkVfYVn22fPQpZN/Af6pHCIE0IFyJhubFSKnscrnNpLWZSSJkxoq3zk6a0UuIULpjW
	 xYZI9KSvLSpxBm0MBUlHUhxm5ErbL0ADj+IYLh9lSCMNqqs8OA0adKY+5tYgHlRIG9zyv
	 EzmkNiDTl4Ia9ll3wIHDg2p3MURm6ONRBwILwKEYim3sQKLsdrB8ywnlwNCwMLJ/1DgAt
	 XPVntXO/A/GWcYDRKcED5rrlI1MHqHHtOyiCC7pSDWLoB6y3fHh3lSLzKtqC0QgNHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOQuQ142;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD63606A32D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOQuQ142
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281861F000C4;
	Sat, 14 Nov 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678319;
	bh=LkOd4wa6dj55P+4i1tp5cR9JO01Zf1YXFB9EHa/PFg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOQuQ142uiz7ycNqYjrZkJBNpIe0l6SDJPMgraSg3HN8m67evOuszJpQrGMXcBFUD
	 +Z0gdi971TTFRfhnZ3fWNMH0LcQa3Hqtu8AaH6tuHCxht0HDJzGBp5SAU3l9c9TFa3
	 sE2zpOfE8FjhRyZmXnrCKtw0uPme68aIjTqxBJuOwurCccA2GWPR80emPXGMVhJCZ8
	 QWpE94bhNABg0vJ2J4WRkIHzgsk8FFy9+q8rFlgJDqrSrnbkIAeBiIzEHqTTAE4bqp
	 qVCUSTGlGty04FCycMMVKnW8hlLjf4gyN2KO02RUApX/96PNetawAN+vptWtQF/xWj
	 xKognbk2ROs5A==
Message-ID: <sashiko-outbox-214853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] alpha: marvel: notify environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-6-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-6-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:45:17 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D6

