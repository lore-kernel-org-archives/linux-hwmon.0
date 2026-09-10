Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C1492522
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047914; cv=none; b=sHJc72DdPR3L+Xvg1/y/VigRe8m/wsa5tsYD8KWUPrkBJqSedd7msqsCzcPxy12ts9CRnpJZEwTtedhUAuWQ6schiyJgFdPtZNysvAMJtKW+cD3679Bd6kL7IJseTC3tSPRZQhl+6l5CA8Lu23uTLsiQ+dWPIziBD8N5Xw4ILMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047914; c=relaxed/simple;
	bh=6pLCdRYSxisOhYzwF89zvXvwMGNH0bY+SlawEle3qwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LdrD+Z4vGhlodKVz5mwQSwNy5ccYwXuZQJWSwqDPcmBsq9OYAk3epliiuD9WQosDQuXY+EHvDIsOLaMp2Qp4DvZqVe8KERWTOxYXcs8Wpvrq4D0UIvffeVOIqNkp7+3Fx8Oq1iPHRWPS1h+kfenbA/wRJa0FSHdnTYRBgvyXQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGV5xuSs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGV5xuSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8DE51F00899;
	Thu, 10 Sep 2026 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047913;
	bh=UI9okO9D9V5Ch04qUcruP4yPzx268MPo9BsgAHge0Ok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGV5xuSsmcVBki+ayfcc8VikJTrGKcJs5W2hPPzWoVshPQ1MDXJYwr6fEr9LH8o0L
	 cXncAUF4/iOZRtyV7s93usDPdzsIT2/4SNh4fxcOaqcv404c7AwXvMMhVA27GTK2cF
	 63qbzoQqyEzAIzdOPwY1aRhDOfTnUw1+e41Z/qEcgIbzrsWKRtpdoolGn33e9Z5urI
	 A0qqczLigedVIl3eDG9Nwl7/Ct+1qQLv//Gl9c9oGsMo9nbd/ACyeE3SOJOXEqz9VS
	 Z3T+iWLXNNOugSa8hJ+1zNSVFZClngekUCkrJtwMvFCJ4m2vWqjjhD84/DM9txqyF3
	 7W/jCJx+a7Z9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:45:12 +0000
Message-Id: <20260910134512.C8DE51F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Current sensors on the Congatec Board Controller don't use consecutive ID=
s,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
>=20
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=3D2, channel=3D17), i=
gnore it
> After:
>   Board Controller returned an unknown sensor (bc_type=3D1, bc_id=3D11), =
ignore it
>=20
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring dri=
ver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-cgbc-hwmon=
-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com?part=3D1

