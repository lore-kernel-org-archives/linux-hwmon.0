Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15BA4EA37B
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560679; cv=none; b=R47vQ7hHze5y5R5Py/eOCOsTYrGxcy8hM6Ew5YpnkdCtDfKQOIYTIniHuMgx0j7D8IkJdX0hnElpOEbmeuG2T7pmHBPnqeDcbVlru9uIDSe8IG89/Qo68jygv3MhaKjrqC5+31uHeHgBgmOtpyS8CzYVm4kt80TLTxVCMuRnRw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560679; c=relaxed/simple;
	bh=H6C1CPJXWUVRiwS1P9GHfCHaUPm1IJh0HoxLDFifrAs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CVJskgLHdcfNAWZ80Zwl/MEFK0Rv57R0wAYPmIaPE3yK+onXIJhfiRJgaHsXW5CJmPQnDZGbFrEGWNipJvY4QmBEqnCHfCUu8UYstqGshDPRhcEkINhhKrVfMqVCZHVnYxrft19a3Y+AEItZ7oX+LxzZB3OiHZuLf/gIwFks608=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuzLCcy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuzLCcy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DB31F000FF;
	Fri,  9 Oct 2026 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791560678;
	bh=H6C1CPJXWUVRiwS1P9GHfCHaUPm1IJh0HoxLDFifrAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iuzLCcy0pNtgxxG6ccnwyjz/E/xtWCWbxZqZwjVE+pWdc2z14XO5DvMuxaQQNMx95
	 MQ2LWeSzS47wV1Wx1mYiJ4t2Lik+Ycwlp0zLPW7ti7TpODPbgaHU84lILpWxm/2sOR
	 /Oygf0H6rTbYKyr20nJPkzhnbmwQdp1fCU5loMQLCxsmrRZXnW7Zg8YuXVxYW20tpz
	 pX2fl104hF9QL/JRmyMjGjWdCqd6SuKhYgbzVbhxGFa73nZwVRFlmD/19YeIv/3iZb
	 mHKy2yZOXULeX/nBV34/5kjJKSyrnu9tcbAgB5qflmwmG3DN1sv9yZuaCT5MITF6q0
	 s/uz3cu+CNBig==
Message-ID: <sashiko-outbox-165790@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] hwmon: Reject truncated attribute names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <c9a2e5f5a8bf08545a999c6ab70aa058eae947dc.1791559095.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c9a2e5f5a8bf08545a999c6ab70aa058eae947dc.1791559095.git.hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:44:37 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Large channel numbers can produce truncated or conflicting attribute
> names. Return -EOVERFLOW if a generated name does not fit its buffer.
>=20
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791531025.gi=
t.hurryman2212@gmail.com?part=3D4

