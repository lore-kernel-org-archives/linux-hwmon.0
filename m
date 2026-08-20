Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51487446839
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231862; cv=none; b=TiGBqmIziA/5+NF1lFwZGEUhHf/J6d89th5KTUcaeIUBs4RbnmDSf35X2/KDeSA/QufA8OtSnntC2PYNARMKBWkK3G5FK9DvSbEl4vABl1zA/68hEEIqyOwTZOVIWLKJloc48RJrzbRO3V2wOK/Zk1L54huaefZf7i+d0enIQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231862; c=relaxed/simple;
	bh=SnsxHoMnONz4PqMCzq0u0vA6AXOsQypXC5Hm9deIa18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M4ueeyLLddun8Dus+8NfDA3lhBId9YKN5FpSR58wpvUU33Kg3geMhQwRvxbs4ln/iJGfhhz+gQRtrjMFyesj+sqfwcxFQyUocZaXIl+SdvyjbsEpJXDrsZmLX3dbwxssWAEuHGUBpWNPfVWENRTG2A/gLGRu/Vt//iUSCjcXcdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A92YEeit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A92YEeit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C161F00A3A;
	Thu, 20 Aug 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231861;
	bh=SnsxHoMnONz4PqMCzq0u0vA6AXOsQypXC5Hm9deIa18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A92YEeitIMlZiYNwrFoSp31jmr0WzPTPA++NaV4Di02gkB1lYjRlaDLkuYgZl/VRw
	 /1bLDIeKI+yRdy8yezrgsrnKAWhPExS1EVYcYM8vOzKpRFTo6OMpld87qhJqDKDgj8
	 0rZHcRJYDCnDnxa+0gBLoPmwN2/qpLhY0uecanzmjDuuLAc9OigsXHWGfcfEsxhju2
	 wjNiEiR/Ils7iF3ORAkSbdq+i+IFjJIKBN6Ia1P+KZBGQED79VIso35fSWiooD65ym
	 RM40tMuqQI2ScSpnyN8n0KTI7dn3TdaiPhf/lnwpoUxI+5ATh37jEtJEf6vkL6Klur
	 jZ3jHnfGKqCQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (ina2xx) Acquire hwmon_lock in
 shunt_resistor_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-1-fdce35abc41e@redhat.com>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-1-fdce35abc41e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 13:17:40 +0000
Message-Id: <20260820131740.F2C161F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> shunt_resistor_store() currently acquires hwmon_lock to set
> data->rshunt, but the corresponding access in shunt_resistor_show() is
> unprotected. Acquire the lock in shunt_resistor_show() as well to ensure
> proper synchronization.
>=20
> Fixes: 3ad867001c91 ("hwmon: (ina2xx) fix sysfs shunt resistor read acces=
s")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260729162836.89BDF1F00A3A@smtp.kern=
el.org/
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-upstream-i=
na2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com?part=3D1

