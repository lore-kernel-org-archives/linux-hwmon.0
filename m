Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F653911A8
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650478; cv=none; b=Le1HDf/DU1CsrebMlDP10LxxcQgEbRAKmTdbz+u5g6rGMbZzqTYinktlsmNcOgY8SO/KzWUPWiV+1OonLtROGDaDz4ChaZgMyyYAvE/W2DJ7MZ43Y54TF2pkeJ1lkLOacLHVK3kjuBO+he8t0SAfs3NvS+nc+ph9e/ap15XUsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650478; c=relaxed/simple;
	bh=4TAIGisGK5zkUQb6awaYlenHs+ZR6IOVnnHco9qo9Ek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=REH0Ck2G2ksGqYXif1tAnubF9aFOB/05iPnYsJP2WRKdAqsoh8Tu3iV88pgw4+xTPfnC80yZP4UlGYssuYTLzEQKYWpImyU0ObzlPZGVbkfaxlle8+FksSlyf80u+Utjl3981f91keVHXwJ6xRzpqkoO8H3P9pCGGik1J7qTKQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RakVTO11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RakVTO11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E931F000E9;
	Tue, 25 Aug 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787650477;
	bh=4TAIGisGK5zkUQb6awaYlenHs+ZR6IOVnnHco9qo9Ek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RakVTO11fkssI/wOIkp46OnOMed1w2J1ENwI+rcF0URZSjtSJPYonVuwO1wnON30y
	 0Mrs+wPzXoR529ULDtEVLupyDpWnX11iPMDLN0UmyT9oTBL/ZDS2nPZ8179SbvF4I4
	 0YNWZcQyWI1SeVH+ahDPo2gMjw9AL64YWzRh1lP+LUGuWtNmb+GMFmb5RXjpX6Bb1D
	 L8Mq8Me+uXAGSgeBXnJ1bwMDVBUiwStp3okPUK2iIO14SqdLlkTK2EutGD4vR/ZjI3
	 gdwcfIJkqdnijeIONrX59OktabjMXdVf176Y/uRkSUtg0Z7NjkKGvE30AC57b8R2qr
	 uzr/Bc1c0i25Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] hwmon: (nct6683) Retry pwm writes until they take
 effect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260825092546.669450-2-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-2-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 09:34:36 +0000
Message-Id: <20260825093437.16E931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> store_pwm() waits a fixed 1-2 ms for the EC to hand over the fan
> configuration registers before writing. That delay dates back to
> commit 91918d13eb17 ("hwmon: (nct6683) Add basic support for NCT6683 on
> Mitac boards") and, pwm being read-only elsewhere, has never been
> exercised against other firmware.
>=20
> It is too short for at least one of them: on an ASRock B850 Steel Legend
> WiFi (NCT6686D), two of six consecutive pwm writes were silently discarde=
d,
> leaving the fan on its previous setting.
>=20
> Read the value back and repeat the sequence when it did not stick, waiting
> longer each time and reporting -EIO if it never does. Raising the delay f=
or
> everyone would penalise boards that work today, while a write that succee=
ds
> first time issues the same register sequence as before.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825092546.6694=
50-1-jdahlin@gmail.com?part=3D1

