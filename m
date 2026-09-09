Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074484AB1B8
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994711; cv=none; b=psLwTK/h/pY0wLOUW+DdBVqdZK3/YCi2FX9d0tukUV5OJvRKev5HGtQRB09F6czgDQndAI31Dv+oz5aUIAj4uyOE1u2omu89MVo8bl/XZa21LN3fY/dbl010KP+1HhLQHoEc6Z8TD2KLkhykyqRqNk3V1qyTx54gHHVRvVhlO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994711; c=relaxed/simple;
	bh=O1F4YiU7PYHgEpDdOM2og5WboXhaAUNRjSRZ7sqM7cA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iAgWSMvYOFyBO0bddyKuUhinFHOiuUFFIQ9i5a/XPRpyCjbaA0FBNwKWFJkTm7XXMmUSz0ukYNphzqiZ2g3dgTgr8tgXRIBiJQ53PcuzJYXr81Hsj0o5rOOxlF5gLqdGajw6c1syaqDo95GWj3F8DrtmOsVeEZ2ra/m31ZijaX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kgqvo8bk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kgqvo8bk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062CB1F00899;
	Wed,  9 Sep 2026 22:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788994679;
	bh=O1F4YiU7PYHgEpDdOM2og5WboXhaAUNRjSRZ7sqM7cA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kgqvo8bk7GosENhuCCNrDVpvjN7R03cJWwJ68zDJYcofuXMrVa0Akh9ZwCHhIRJE+
	 GmKs/AG4insdpRkMIbuXh5F/lbMCaN8/zmad81/EBmIeyXpIQrFh2wMT6LG3SUSDDu
	 jUtZUcumzKgnZLQ+iB5xqEzt/cUqM02dOIGYwN5WWrAcUrh01CYvOxjSZScMFFVhwD
	 4YIG0H613a1twO0KPGLdtM4A2YFPYKD6INy4pmEdNbk1vF/Po2F4ESqSWnI3Gi98H6
	 AqCTZL4P0IvBbrrNbntimj6KeaOAi+4JPgaimxwR4b/h9ywa/YWDxWIX1Qq/6NBh8/
	 b2z1qIS+GKh2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 5/6] eth: fbnic: report temperature and
 voltage alarms via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908225737.3034403-6-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
 <20260908225737.3034403-6-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 22:57:58 +0000
Message-Id: <20260909225759.062CB1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Building on the temperature and voltage thresholds stored in
> fbnic_fw_cap, expose alarm attributes through the hwmon interface:
> temp1_{min,max,crit}_alarm and in0_{min,max}_alarm.
>=20
> Each alarm is computed by taking a live sensor reading and comparing it
> against the corresponding stored threshold. The static thresholds
> (min/max/crit) are returned first straight from fbnic_fw_cap without a
> firmware round-trip, and unsupported attributes are rejected up front, so
> only attributes that actually need a live value fall through to a single
> sensor read that then feeds input and every alarm.
>=20
> A threshold the firmware did not populate reports -ENODATA for both the
> threshold attribute and its alarm.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908225737.3034=
403-1-limzhineng2@gmail.com?part=3D5

