Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58E4B1B5E
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789721413; cv=none; b=hvUZkmeGrixh6cGuIUic/pX5upMhuvXK/sO00pKte18yYUmNPxcsTe+sKL4MldKi3n5w+lSEc0tPjDKTNo/y1oWrxhQWZF1pv3VtwogUWJuhAJFcZkffgyhm3HuNyIMsyvWphiOKbgMF2iWHTwuY2w1P+F4mW4k/682MAkcA3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789721413; c=relaxed/simple;
	bh=5WhJs6kYwHudHDbntSc02Yg0sPzT98JYYcLL0ft4tVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AbK0mKp4prMyufbHxTAJGeBF5eDVphj/sJzDw7jpzB1Axs9KYPZmJa3yJC/u+7WJGo0uixSWfNwaW6BkrymJ5iJi2j5XWwrX6RKkzMbtys56q75qXf7noBxCwZhRCfVIXm792WzGeHIfj07THY7J4Tw2PozD1I8Fbqg3E3gRiPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJHr+XcB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJHr+XcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87641F000FF;
	Fri, 18 Sep 2026 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789721412;
	bh=5WhJs6kYwHudHDbntSc02Yg0sPzT98JYYcLL0ft4tVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJHr+XcBDnyicuXK5DAM+g7kYIB8ljhsy2JtnHTTX2TG7Kj8VKYavluJBSZQeBgrN
	 QGUSsixEZ7z4uSB/N+Blgcrk18OqUxG7oefrL+qM2Vi9j/Zk85q8+pMNMU3o9C/Kvl
	 VIgTE7t8ga4anURwIpp+byG4MlvFGUm1qgjYHQfGYNBCRuT4jUHM6A6XS4JQCgTdrt
	 b+/iGKxLQZ3jQUGj1b/Aj4q5BvtTYiSvX0Jm5Rm5PzMgvA5MaH0Uu0aUy77FfDcJtY
	 t6cxAhpov3JlnWSAzW04rE2djUFtrn/gJi/1UtxkePV8xq+FCCMISZuTyktTBvn8LS
	 Q82w1nx2uhMvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (lm75) Add support for Nuvoton NCT7715
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260918084042.19541-3-syhuang3@nuvoton.com>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-3-syhuang3@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 08:50:11 +0000
Message-Id: <20260918085011.D87641F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
>=20
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Its 16-bit configuration register shares the
> TMP112 configuration layout.
>=20
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918084042.1954=
1-1-syhuang3@nuvoton.com?part=3D2

