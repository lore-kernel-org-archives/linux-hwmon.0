Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551924;
	b=ywYkgIBMUiCbKOpyreJI7zs77ah+RxV6Ta3yfb0BPcGFQ8Nj5RLShOeEu/6XVkGcLJBs
	 xTSI/KczEu/cQ+D9jGiJirMiONBwbBsqmTPqX9io9B1KsUZZWrGPv7dq1OKs5HVtOqCoO
	 wZ2r6tz4MCpIuW1A3JWrtYN38GntNJEqHOW3si3QR5FO5HELDSQC7Yepzms4K1i5FBh/l
	 zsnnddCA8UXlltFgKODWpky8xbg3C0voCPrfKOzTfBWYefUou67pSfxjuMHL1tI/jFlZO
	 1Oy+yxuGI8voVmlLmk4JKHMzmnV0/fktAfoicEoY+ak8VLfmtNAWGlthdvI3xgN8maw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551924;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vkAVI28LrlWLSmw3ak6JOd+vzprWP+v/5KBvBA2pFO0=;
	b=GutITmldrg8DbqnieECiXEC6tOTINm1DETOLjsvUPavvGfDxO5058QbSOJugyIQDa5I0
	 FMWfNm+srU7SL+zr+7bi7ANlrj/lr+pawGPfftvLfoJdZcezWW/tIJODH+bHihbMtGPbC
	 MlYeb0oKWVW1drozhNoLsUBBLiE73YouaWfn11J2GMPXn/t/TKyVsvF3a40JjerHh5cbQ
	 mALookZTZdotnKxf1LumOnQIlUs4xCtMMSWMuKa1Pv3Z6X8gcr+nQa4JQBwI8HB6o78Jp
	 IQ/zObCWO1CZIdVzD95BEsQWQh46NtNhs17n3+VpvCw7lv/RekxgWM8lZYMY2OBNDSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVWy8rxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83E606A31B
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVWy8rxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71F61F000C9;
	Wed, 21 Oct 2026 03:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792551923;
	bh=vkAVI28LrlWLSmw3ak6JOd+vzprWP+v/5KBvBA2pFO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DVWy8rxDRX3gKNpB6VQnxT1K8Ejl8U+O1tTwlNbHrG2t4pJHEehYclln5iqfGA2Tw
	 cyTVQju8ZynFnq3jhTHDIPtAD6XX3tT1TfNM5+cYTvEBX7VHMub2JnW7tRRViUFeE0
	 iUcLEtiPFoxvHRx1WKkKQWIZaV16M2rPfZTzFwflLHZp79cJYrYpdIsqtbbKFimpg3
	 1CvGsDdWkMmfgK69Ul89DPizV9LZIPvKv924ObNSVA8NT3vZSsmcLvtIBQqVlirAhb
	 4LUG8SKJmgZtCPih5ME8yb6KCxht3A0oL1YanHkEBHUv5GINMnt3kXBe6NoWnO0ApR
	 S/ySNrbI3Hihg==
Message-ID: <sashiko-outbox-179740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 03:05:23 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v4-0-27ece4e43d04@nexthop.ai?part=3D2

