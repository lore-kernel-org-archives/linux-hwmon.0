Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC93932DC
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764275; cv=none; b=f3Z+LY199VmgVEm80ev0ydnCjM1dSCxh0KqLZ8hR9AKMmmIKEKGUyQ1lYOBqWrtyYLUcFNRsCtP/0Ukh3DD6ZoIFWLgJ4h0m656LkCfLCPpxNjjmZbaOJy20Cbv1hbRvcq+eJqMDkmVQv5UTwcMeP3LTaiBbZLSpsGEO6ihk4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764275; c=relaxed/simple;
	bh=0JLySWnX1bhQ3BGczxKfTvLvsGw6MCF8AIzq+KTunQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aeMvD3OyLkU8dtEsjyXyRDyA5O85ANlTKO61AFVfr2ZFJ9IOzzpgh1gDHdGd6PWIkhK8Jfg3T8UOpqBgOECnqDUNHXUav7qKajj8n6v10rk0agxAq2Aq6PH6jObOa1qyHzN83oyFUTAh+f29t6LXfGgfLa6CQkVMtwnwv98yGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdKTdTB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdKTdTB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB8D1F000E9;
	Sat, 11 Jul 2026 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783764271;
	bh=0JLySWnX1bhQ3BGczxKfTvLvsGw6MCF8AIzq+KTunQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZdKTdTB094ZGQUskruMYrhJ8HwsawWYvaHCBuB/GLLNeIA9YlBv2Ffy8chpAIqDH+
	 vjQRO62PBEWioaBLYI7p5MlGNDqAzdytlmZ8oYxv0+Av74m9po8TM13J6Vp2NJQUNH
	 /1gkDUSMLiu0ib7I4MLMypd10j59QgUH/Z/tBEemqQIOEXb/siCkxw3ruLYpq3iPcS
	 899VX0S1ruLXrkeA8GT3JrgbgGTfoeWYAIQCH9RfKlq1MsPbNbkXqI4h8Qhogt1pOF
	 C9okvZyafWUhOBjaI66HoJLId8MyjVS4zU+Oy9b6PjUJM/RHWaDqwq2M+nXB3zExCD
	 LZT/5Zs1UpjUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) Synchronize EC access from the
 thermal device callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 10:04:31 +0000
Message-Id: <20260711100431.ABB8D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> To guarantee consistency for the read-modify-write access in
> cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
>=20
> Use the existing hwmon device lock to do so.
>=20
> Fixes: 5798b62867b4 ("hwmon: (cros_ec) register fans into thermal framewo=
rk cooling devices")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-cros_ec-hw=
mon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net?part=3D3

