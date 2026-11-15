Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753665;
	b=Tx8A3+aFd6ybuhnHK6UptmERPjbDLSUpGWn9yVtK1q7fd3y/V3291LC3U6IQ1hhVWC1U
	 yGSulaylFjReBax51c6wyUXltlUwIAQj7P4v7+ln0d3BHDL/6zW4/CKE5rTBNuiz3Pqeh
	 T7MsaNzCLhMadc41WuZXmfFs+e3gE94L3N3np6yw42wa5/4xN4hOTDfLdL8xqn1WD1cPH
	 6UhDwVlQ8cDPOIUOWeRj4B8wrbbkT+Cmz4LPbKE37xkePfMEY3WfV24Tp1NbYzdChFHeh
	 oo8owd2A8OxNr3bqSPrMtyMW1KW6k63iB+a69pMCEANEKaP1hKRIezKBJ4l+m0SvR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753665;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RaY0e8Izl3BmEW/esELXhTOqJfxYUBAX8ldwbxhT+VY=;
	b=Qr+ejt5AWwbColRS+knftJpP7h4/CFtOaj2IWuM8LOPdkr8t/EBqXXru+Z7yS8gr6jIt
	 bedxfQNM2MbzFtl8KppW92P4q0+8/CmLG0xOJxTtit3GL1jAx1ET20CRq3qhRTZZ0ThS6
	 WGP4kZ6r9bFk5HcJz/M6hmJcAqujr7wsMkizx1fr74beZ40dFwDAOmxchD/hWa32GrKcw
	 kh0th/SK3IgCIsM6SdNWlZBmki10Hw9gqh/YQLkw5vcuM/CD2sWIhC+P4AG9Mccd2GoP8
	 pQw6yZN94lnNPrLsfkcZg9k4Gw4SqhfK5MY4uLbsvry0/lrtrdQvLRXZrrxkFS0TBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoxIDEe0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B02606A32D
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LoxIDEe0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061901F000C5;
	Sun, 15 Nov 2026 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753665;
	bh=RaY0e8Izl3BmEW/esELXhTOqJfxYUBAX8ldwbxhT+VY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LoxIDEe0vaFoq+aGOx5pJz8oiox4u2DQ0//gtl5K266P4qlg5jCQxdYctKr+GYIhD
	 NFBAL8BpWQNe6E00Arui9W+ZoXsVttgj0vPyBNXWmg24aSq8I9uH/m+sDxkcyRuAhP
	 RrLtysEc4kE7LLygG7RBZOx9FJsvPwumyHJme4r4hOkFJn1YdY33CR7d7rjkxbUPx3
	 7o6L1dhthpb1ahX6KNpFBcSBQ4P9nutfFofybavjmuNt7eFpZ76IzEBccpAuE+KxTJ
	 Ix0WZ1cFEKRwGI+ug0iIi9v4dUgBbeMmc6/4eNEeZa5IrDak335n1B2R2TszD70tvs
	 8374zxmn3ks3Q==
Message-ID: <sashiko-outbox-215586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E
 DARK HERO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115143708.492883-3-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
 <20261115143708.492883-3-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 14:41:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add ROG CROSSHAIR X870E DARK HERO board, which provides the same sensors
> as the non-DARK version.
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115143708.4928=
83-1-eugene.shalygin@gmail.com?part=3D2

