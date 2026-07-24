Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143E175A99;
	Fri, 24 Jul 2026 04:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868590; cv=none; b=opMXKUCgesZ2M0G5JN+w6oZh141yzhGvHYVrYCFk9jn9Bd6mAWSBChw2gWep+KqmwnDxa7r8ooZ6sm0Ufhw03zMWWXAWFlnBnEw2cOSeEgKoospc6mLwVptEcLeHzWsG7mKHdkQEQcMhBv8KjLFigM9AOFCFoBEynQTfget96us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868590; c=relaxed/simple;
	bh=ZS06XK9Eiaz9qmAIdpmDHK+oH0ick0wxWBMBA8fFs74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nzdHzF3jqAD5PEyNSYvwrVQoBjKL3gmj4ZSsDuNaX0A1KI/JHvG1LBxOOJ4+ETUmuVu97huYRZj9RAvy9XH1cgVcZhGVXm4eqxWpqC3/6ZaOrR4dOe6Ib2qrGAcgLsKlFBAtesHolQxysNsRinBFeVI0wXqc4Re97MNFrp3PF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGaCuFsf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGaCuFsf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06181F000E9;
	Fri, 24 Jul 2026 04:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784868588;
	bh=ZS06XK9Eiaz9qmAIdpmDHK+oH0ick0wxWBMBA8fFs74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGaCuFsfbsJJsddmEWAUq1aXpcE6NtC/4xU/PS31V57Te9e5f6cnwG5tVBgMe+sw5
	 luyVa/8W5DmcB7GTh1ZzNue+oltJYs9AcWckaNIicGwkzuTdTxxwYgYLjjJG84Y0Gy
	 csUb9oMOcULiUGYJqYoXe1yya5hPGcPsiXT/1r18UIqUjrLYxiSZ9q0R133p0CkEPe
	 tCi8J4ZhjHNGJj/j7tbjpxgkeiSOkd7bOoorz4ybpC1wSguRzzsff23jKIEdLQ9It6
	 jEu7C7yD0pE6rZ5ACSjus34KZd5rgJ5OjqvThOYxHZT6UtfWWG2k7i1kQ25dI7D/Iq
	 QuA16X13wVspw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: Add vendor prefix for Kandou
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 04:49:46 +0000
Message-Id: <20260724044947.B06181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Kandou AI is the vendor of the KB9002 PCIe retimer.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-kb9002-ups=
tream-v5-0-9523c3ffe83a@amd.com?part=3D1

