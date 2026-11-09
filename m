Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219994;
	b=zK+YNIv95D2vJum4JzPxLX31zcXGKjWGRXWcqdY4CrgwzJSWO36eWM217V4Mbyt7TdIa
	 dKXd2v2CVEbS6ffmv45txiZNtpwF3ZN4o1NNjOKScVRAq8wU7Uk1htm+eRW399qz+NbUy
	 UkLIj26gNJ4tIo0NnK69medpOXRtxwHBHV6VzIEDk18sqX8LV39hpRzuCrp13N1y3W+4N
	 IdlZZKXLYsZcwf8BJdsF47gJtjMoSx54LGb5G9dpCmtUS0FhJYrHar81IGOJHWj/Oljxn
	 A1Y0WKnZYW71pSSXksb8xHiDR6PB7dlB7f2FJ+IYLmqK2rb0h5litArSwvasemNyf+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219994;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jf2PmCdh5nCDVNle6T3NwGMShNDRukw2FgWKzuDbISg=;
	b=eSCnnkMuFuFmgS2kiOG9oL/6CH7yPvbG/E6O0GOYjxPhJkc5rTq9c5n1KqkM5MqooHD5
	 rsZ3QkNGv2YfObsz3U2zWhp33t/xMcKBcGDFDYtcR/Csgk9JpNBO09+c+kHm8gu5X1JLn
	 ofEWxQ3sEKdnMAIQCsA/yVOtXQqDPp9y9hyW1r643Dr8Hyu+nU9GGVIxoG7Xv9usJCCza
	 dXTK5n0nV69vg32PsnxJDc2R6ryBsCLztGG2H6BtY4nhPm5Yeki/jUqZqIC4kyIZGyFRW
	 bLe3RHwqLPaHo7oJYXcNFZYyiio/N7aUgPzPgT+GrodOmxb6ouMWbs8/C04XPVhcNjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DY6VRtG2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F391606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DY6VRtG2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA641F0089F;
	Mon,  9 Nov 2026 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219993;
	bh=Jf2PmCdh5nCDVNle6T3NwGMShNDRukw2FgWKzuDbISg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DY6VRtG2JpL9vwcUiFQY1WQ22z8HZ2vvYby3QmYC3TVPM+4RnRuf7Ls/npB6qn5uQ
	 a38JYLPqc37JxpwHyvidloFHh29WHFk7nMRw8x+o7OPpjNd/MQBrvRZ9LUbe5CDk/O
	 Wu35W2ZF2L9NbKYLd3eXhYMgHcv69gYtLDtIBuHlxkCdxb7NgbXbKNW8NnK94g9dPF
	 HE/8T0SGe/U2P4RcNQFK8nftTdLT+Q/lDdnb32Qp3f4p9hq8z9YsmxRsRrOiwEki1m
	 zxN7eZEf+C/ofSHpcpF0IcasGd4EujlGyPF0Wvy6byaVy5QAwxjFFwnj8Cb1xprKRn
	 rlaP1F0GQmCeA==
Message-ID: <sashiko-outbox-204816@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm85) Bound fan stop temperatures before
 subtraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101936.17430-1-zhujun2@cmss.chinamobile.com>
References: <20261109101936.17430-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:26:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: (lm85) ambiguous 12-char SHA in Fixes trailer
--

commit bd3942e6e0ab99093810924c7c557da1e1780136
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

> hwmon: (lm85) Bound fan stop temperatures before subtraction
>
> temp_auto_temp_off_store() subtracts an unrestricted long from the zone
> limit before clamping the resulting hysteresis. Extreme inputs can
> overflow this subtraction and select the wrong end of the hysteresis
> range.
>
> Bound the requested stop temperature before calculating the difference.
> A signed 8-bit zone limit and a maximum hysteresis of 15 degrees require
> only the -143..127 degree range.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

[Severity: Low]
The 12-character prefix 1da177e4c3f4 in the Fixes: tag is ambiguous in the
kernel git repository and cannot be resolved cleanly.  Should this use the
13-character prefix instead:

  Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101936.1743=
0-1-zhujun2@cmss.chinamobile.com?part=3D1
