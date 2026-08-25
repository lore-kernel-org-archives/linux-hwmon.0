Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E9B3DC4AB
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650084; cv=none; b=scariYwBKQl85CaD5hdVg7/qOFExOOdKppIfD8xNj04U1CgWXdnsKK0AdsNhm+n2rhjeXuw85QZuBWV62Sf01x81h/yIsdI16g2mdyu6ox4ppJlE5vZ1ii3hll7Tc1mLhRjoNWDLVfKe56kW7chRzStNwrj7OMCzmSkV2v++y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650084; c=relaxed/simple;
	bh=3U3Y1fFIc0ymTl4nOPeDtkZeCAEfWnjT03EaM977NRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H4YNfxT8bfZYovRE3HhyOCEpPs817EhSwqB5XxwtxzmRVlDMva4gOMRUMKJ44RXLy4Y4Aw1KqNZanGvRCBydi/ZTJ26lmUgq8IuTwn4kWxcNSP6H45UT+ER753Lncv3w0iDuv7UwdebTXvd8xGNha7qSp6DIAa1KHHVYZlTIcDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS8Fb9Ip; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS8Fb9Ip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34441F000E9;
	Tue, 25 Aug 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787650082;
	bh=3U3Y1fFIc0ymTl4nOPeDtkZeCAEfWnjT03EaM977NRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cS8Fb9IpgJUFvlpb86wP0I3ZF/G9LDw2UhofPW3ig7QYh10gMqpAupt13OWOAd5WX
	 XNia0A6NX32Wehba1D5QAzzgzgvZdBjumxsdNSU6x0Vu3pZq6DNEUwKLb7FE783US/
	 FCvQ/UmMxLRXVGHMGfMNOGNn26SMAHO/L5K8J77B4c10X3qMxVtlhyMBHAQ5lYI/kX
	 85ypBpKJCJtbyfo2VS5Ucl+SaNuYa5yxdKr6vaDuGNkP5CvtSnVekKEUlfItS2WALG
	 Do9RZ+WHpidCNpxuUoANxVk/sIjEUMWi9Pt+Kysp7jpkfjeGkXOavChXsEL8WRNpq7
	 7mwpTD4zMyrXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: (nct6683) Add customer ID for ASRock B850
 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260825092546.669450-3-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-3-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 09:28:02 +0000
Message-Id: <20260825092802.A34441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ASRock B850 Steel Legend WiFi uses an NCT6686D chip reporting customer
> ID 0x164a. Without this ID the driver refuses to probe unless the force
> module parameter is set, leaving the board without hardware monitoring.
>=20
> Add NCT6683_CUSTOMER_ID_ASROCK8 and handle it in the probe function.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825092546.6694=
50-1-jdahlin@gmail.com?part=3D2

