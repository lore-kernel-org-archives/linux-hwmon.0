Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B7345EDF
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680287; cv=none; b=m4jHuy7loSzb4cNcDjsr0FuX2qvFTa7Zb+CPyP80r2YJlEWhjoGIgwOX4zYBxbdFC0ldZZlNPeVekJ49q2tMaPfQATQxt/BKlY0++sOrOuQrYFdxQxNK8BB2dIM2SFpo1QWDbohq3XfNCzWwKqyqGKazxoilBb0miqBjKO+6nY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680287; c=relaxed/simple;
	bh=xTNtwHN1F4KPQm0j1VIgs3U3bcnk6KnnTGm7jOw8HmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fpFjjSWjRlG8cyfi/GwAa8XYgu1myNkO8fbmFPK8LEpOO2+FgK2/497ywOZlTsdYGp+ItGhQCRWUtRXpdcYMa2rRSi41X2ALa+I5s5+yVRNFVZITpda64a3DDBrTh+g8Pz8Lq9QaKNmtdYAMqMMHpR6Vu7uhz8Bcu2FLhuDtju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SP7qeHGx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SP7qeHGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88BE1F00A3A;
	Tue, 25 Aug 2026 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787680286;
	bh=xTNtwHN1F4KPQm0j1VIgs3U3bcnk6KnnTGm7jOw8HmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SP7qeHGxHUkgI/EL0g+QMWvs06eiK2BVewgDEpfjfQsnqIomU0f8VZIDLJejzlzB5
	 wZ3OD0xSr6cMyQvzdhC795pL/eKavoaJ19NGFIPkSgiZs3EOiPOTfEz8TGXuDIkqht
	 W33eoRNivAJr7y9rtgRgttX/HsS/XkILeibO3dKCXtMK+b4bp+uuy3niynqZz8uwBy
	 93CNSu7P4QtvsNnZP+eP1H0QTZzEStEyc5AL2ga96+s8zM71jXCRo0gZDZ2W+zIZWG
	 7bFL8QgWFOjk6gFDHO8Mwlouxhn6Vi+/kdmQSz7mnXnJ9Ge4+GAPbXzZ1nYAVvD//t
	 9rH068beAyG+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 4/6] eth: fbnic: report temperature and
 voltage thresholds via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824175059.2485048-5-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
 <20260824175059.2485048-5-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:25 +0000
Message-Id: <20260825175125.E88BE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The firmware capability response carries per-board temperature
> (min/max/crit) and voltage (min/max) thresholds. Parse and store them in
> fbnic_fw_cap, and expose them through the hwmon interface as
> temp1_{min,max,crit} and in0_{min,max}.
>=20
> The thresholds are always exposed. Values the firmware did not report are
> stored as the FBNIC_SENSOR_NO_DATA sentinel in the capability response
> parser, and a read of such an attribute returns -ENODATA.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824175059.2485=
048-1-limzhineng2@gmail.com?part=3D4

