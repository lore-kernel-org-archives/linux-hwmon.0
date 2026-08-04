Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B733FE33
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874775; cv=none; b=n65HtPtpH3HCWrO8zPVnXksMkf09oTSVH+qVvwgyJblK8tMPDyhLNc6svRUDqAlZVOojcSIrIpkUQNikpGMhjy8/yRkUWmtxXNvGfVRdiIKkA3aSrfZ6tcmUuFQAAf9q6OInDxmbK+iV/iZCuuR/EvstiQfkT11/Jk4m7f3nw+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874775; c=relaxed/simple;
	bh=S47bTl1iJOlZ7reeYZB/4DHXUk+nri8TiYKCbbTxkSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KdrpL7wau5jOeyuWQO6Aq9E/KtrekjleZzX++59keTLP2H2tD12OLPwHkflhL4abCXj+RR/vH2Jm6IQhWpdd+ydWB66sBrm/UMbLrjz4T3iXm+DLm4zQJzWppQCcDHj89E8TCupsCaB8Jr7R3UGJ9YL4g8aUplwjTmqwfVB9CJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFO4akwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFO4akwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022AE1F000E9;
	Tue,  4 Aug 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874774;
	bh=qqCfkvcQl+EavXaU1pc1zerN0l+JpGlBK+cjgr+SMs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lFO4akwB0VPS1DPPd+gLodUjlKA6ZJk4G6+Ocff9q5ZttHrsXwDWKW1esUmdpbsLy
	 WujGdNqkykyvIB9g/luFNrY/1ryVWVsYUJSpF+lhZ7V+7MG/FCixatQYLU9qopPD0N
	 IBGN/TROgKyFe1IPS1QTWiWFPakTkZwKzU1J0FKl7LVXI8zHbkOUwb/sJn+OA5AGiV
	 /q+ELPjpMru0GO+5jAHQmO7oJcWG05i0ZaW6iwtU+hytwi3W54ylT613L+HMMZBr/s
	 oEDmdf9G5E/YVnVPhHKSBzCuidCc89rrOY/or5Q+3bjEqQmFwdRtE0vlHQSuo51u9V
	 hczpd4VLAY3Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] thermal: hwmon: Remove hwmon class device along
 with its parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <5094738.GXAFRqVoOG@rafael.j.wysocki>
References: <12947893.O9o76ZdvQC@rafael.j.wysocki>
 <5094738.GXAFRqVoOG@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:19:33 +0000
Message-Id: <20260804201934.022AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> The current code creates one hwmon device per thermal zone type and that
> device is registered under the first thermal zone of the given type.
>=20
> That turns out to be problematic when the thermal zone holding the
> hwmon device is removed.
>=20
> For example, say that there are two ACPI thermal zones on a system
>=20
>  /sys/devices/virtual/thermal/thermal_zone0/
>  /sys/devices/virtual/thermal/thermal_zone1/
>=20
> The current code registers a hwmon class device for thermal_zone0 only:
>=20
> [ ... ]
> the current kernel coding style to align with the new "unlock" label.
>=20
> Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia6264@=
gmail.com/
> Fixes: f6b6b52ef7a5 ("thermal_hwmon: Pass the originating device down to =
hwmon_device_register_with_info")
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/12947893.O9o76ZdvQC=
@rafael.j.wysocki?part=3D2

