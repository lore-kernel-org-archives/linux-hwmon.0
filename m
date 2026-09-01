Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096548D874;
	Tue,  1 Sep 2026 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285215; cv=none; b=dWYDEFuYZCnCfkbPZ+lVRcF3wpeiYdPnEfPpRKqOiahZnvg+KdAxU9qkbKun9JlOj9FWY6VYrgPysHYmT3/xX0t1usWmJTBZBJ/3RUjAua3WLdhHLbtVoCnmHRxNT+YcEKK7DijvRPzZ0ysv2DKATWo3U2GhC0x2nZywxo9wNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285215; c=relaxed/simple;
	bh=hJxYXAROYJsW8CtWiK5QifUwENXZo4+Pq3G8Dsxv8uM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LDTgG2kvFZ3eNNUGy8MPO1l2D04iMS/ArfCgpgM4k4bZz5B5S/WHAHX4H3ABqCyNGp2SW0Rx6hMWg1t4igt48/fKT+seTbD5NK5xRCZhLq0JSQmRUHcyzLyi8H6p9IuRR8Nb8g76Kx4J73GM+2cYdwDELUNcOsWT6++tCArj6gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZ5s2Jrk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZ5s2Jrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F741F000E9;
	Tue,  1 Sep 2026 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285214;
	bh=hJxYXAROYJsW8CtWiK5QifUwENXZo4+Pq3G8Dsxv8uM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZ5s2JrkEdOekfc501rjUl2duRsylrfsYt0OakLTkr5nMT1OWs8Gf1lEzcGci2W4c
	 vyEFXEBx57/ITQT6JJslOEHIWoSwXsALMMeOhX7uk0fgU/q5DfrIxD5u0z1Cppehfb
	 raUJi5A3AyiaRZcEWfyAe8/Dlcj1fxatAJY2YU+TjbXBK2rwvf+sLI4Jedp4d4zU83
	 hB+jp3FfaYc30fdfUw7Yidxxn9IFpS61fEeBjF3gqy5EoyGIttpNhgiR301Jea3AyP
	 sUx8xtrS+qp566edmsQ+Sa71Ub8HWgrDGIfPb7ciN6F2EPlQgH7DOcQxgeezKM9VI7
	 aZPmO6pXgRARA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: tmp102: Fix up TMP103
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901174847.97261-1-marex@nabladev.com>
References: <20260901174847.97261-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 17:53:33 +0000
Message-Id: <20260901175333.E0F741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TMP102 and TMP110 are backward compatible, therefore the valid
> compatible strings are "ti,tmp110", "ti,tmp102" and "ti,tmp102" .
>=20
> The TMP103 is not backward compatible with TMP102, but it does share a
> schema now, therefore the only valid compatible string for the TMP103
> should be "ti,tmp103" .
>=20
> Make exactly those three compatible strings valid and everything else
> rejected.
>=20
> Fixes: d67ec24d3f07 ("dt-bindings: hwmon: tmp102: move ti,tmp103 out of t=
rivial-devices.yaml")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901174847.9726=
1-1-marex@nabladev.com?part=3D1

