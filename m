Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164A3876CD;
	Thu, 30 Jul 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427207; cv=none; b=LrDWxooiugv85nv9jnIoJl9tr3nbkQLe9u6Dm21JhoFU9uZc97Pw7oGGko13VQveNs6hrG9sz5CeCYLbUtasSEvM/EuPjO/L5askj2ihixIN7ql8xNNaivhGrlXqhpXoBcvz1hSZXdjMTHU+DLaHM8e1V8QtWT3iQRdWIK8uBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427207; c=relaxed/simple;
	bh=jP1wnEyfk6yNg1QKqwsyLq6gHKbvUaJJu+/aULM656Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Djm9zirDLslEL0UD+YaNq+LOyep/Dei0Gkvatb2pBoHrFaNFmIkU13sIGYayZQ8PIJ4fwCcgAbTI+ZSpvxSW/ITBYM38vGVPLbYL1R229H+8PaAZ/67Kj5PiEtnqM0HRXk28S4WAh6AlrlCzY1h1ADNjyiy9jQBBgQx4M3b433c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHCRVgt0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHCRVgt0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEAA1F00A3A;
	Thu, 30 Jul 2026 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427205;
	bh=jP1wnEyfk6yNg1QKqwsyLq6gHKbvUaJJu+/aULM656Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHCRVgt0TA7x5Au9sVcBpLySgYaJkHthkEvOXTDHXrEBGSYOlAgwEuab5KiHGr+zd
	 kOBrWYk1RXqTWOfQ/DV1dz4hBoYn9+xnqff8tbM5fSy7TqLy38Q0uWi+KXYSeCQ+0n
	 m2XiA3DX7KjSDmCJJKXMdE1vFQuduyVp5RNkYsQ1ZfJMfv/mkVFwtQ02Xye5wuuaon
	 FkeutOy6exOeELnOIsrjqzsBWG/ezxVl8GlIB49s/08Mlm8HS8zLAVLCAuCgpQ861O
	 yTGooSMRpDaYSA+orylpdW1QULQeRbCnM/30R71CoAmiFB6FihdbOucLjBHMvo2HHk
	 nrvSLK7jaVtnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] hwmon: pmbus: mpq8646: gate the writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:00:04 +0000
Message-Id: <20260730160004.CCEAA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> The write cases of debugfs entries are provisioning and bench
> helpers. By designs the MPQ8646 powers the CPU core rail,
> so a wrong write can brown out the board or persist a bad
> setpoint into finite-cycle NVM.
> Said differently: some wrong register writes can and likely
> will physically damage or destroy the chip and/or the board.
>=20
> To be safe, it is disabled by default behind a
> CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE and we print an explicit warning
> banner at probe time when they are built in.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-mpq8646_v0=
-v7-0-e7c7ad768d5d@free.fr?part=3D4

