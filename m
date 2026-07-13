Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47618D636
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 19:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970165; cv=none; b=tjlMF/TkkhZosMmvkD4/Pf3ofX1N0qgehGhI0LFhoXAxK46JfJeRiZrJyPXzqtuHuh3xDZ6pRXj2UD9k05/UmpHJCdYgeEFYYFfv5M1g6GE1lU3zgsm6Sbqw93YUYkUE/r7LmWFnpRPIpoS0kWphIX/S70QKS0lxB27AhANU6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970165; c=relaxed/simple;
	bh=VCPzHy9ydY4/M/5HAZU1wTWPYwq2QEiLQmk+aATsWOo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKP/a87mLyubc6XRwqmdBvR59F1z+6HyN94WnjajEEcIXYuTU5IJwS6gm0xOzWx/vkZ3zfKEf8wJGlR4nJdSWBeIyxAb0lWwMLuCoHjk4ep8mS7B4nsUrDP1710IMv3lHWknuNZhGW8ls6M0eNcRP7IP4is5t25sd4vrKHCuVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKcoESt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKcoESt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF1F1F000E9;
	Mon, 13 Jul 2026 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783970163;
	bh=VCPzHy9ydY4/M/5HAZU1wTWPYwq2QEiLQmk+aATsWOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XKcoESt5Q0btfy9SGrl5zKFf89b0Fyx15GN4azWK0VpjqNPaUMcd/sGutoSevlhR1
	 ZkWWHgff4TUHiqlNjd5qjSkO+7MwtKs4rUGvxmsTEh1AARurIK2IKdN2j6yjWjl2tP
	 f+//Tuq/1rx59j16OJhID6yAKq3bzs4dFkUnHRCciPNtrUgV4fZAhDhV7bus5LqtZH
	 a9L1wFZrPO0qh6os6KWD1Sv/whF+VpCLTXO88px/NpyxBrMd2j2afn4vuQK3pdSmT0
	 yT8DG1K+uFp10CSkCWHBsPEI4gs6L7PjICuq+powSgWVFCHHAlMv9pYuCyRlQvAVPD
	 JxxuLAAId4hTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260713190659.4511-1-flaviu.nistor@gmail.com>
References: <20260713190659.4511-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 19:16:03 +0000
Message-Id: <20260713191603.BAF1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Replace OF property handling with fwnode API in the probe function to read
> the channels properties, improving the driver compatibility since this
> method is not limited to Device Tree only.
> Add also the needed headers for explicit include and clean up related
> function naming.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713190659.4511=
-1-flaviu.nistor@gmail.com?part=3D1

