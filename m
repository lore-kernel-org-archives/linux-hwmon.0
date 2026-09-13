Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE53E6DCF
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299133; cv=none; b=kV9vb2Pmb3zy11xXyKLtME61HMVcAZN73daIh+iXF45NUq+Iw/VB4x332iPXjUr/2LvhTKS1uQN1akUQLGx5JejWZ0abOXyeARj+n/EiREhoiCPDO9hF9MIsOcmqiCafYYfYGLwaQGGneSiZ4BQlJhMauCbitI+FyxDKJ0BkP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299133; c=relaxed/simple;
	bh=nc/v1brPBirOZZTz/rbBrQKDiW2GkmhhY/QUHo8B5Vg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uOcCKaEDgRkoADd5aztgyQZ8D3chjtDJ5pb7WCYkuflTV7SiF/eVvQZZCna09B7mQ0QYWnSpT1UTA7ET9GqIqJSIhVc7U2PXU4QAtgajS4mpXq47ONqvr1SUL/lqNnpJQneI93XUJqWGqU1FGSZQx9LdkUjFGM6JsEbNyL9f+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB1pyjE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB1pyjE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308801F000FF;
	Sun, 13 Sep 2026 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789299130;
	bh=nc/v1brPBirOZZTz/rbBrQKDiW2GkmhhY/QUHo8B5Vg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gB1pyjE+4+fdwJrfV+GIteOArspV77T8IdIHQNqVhPwtqamZ5W9eqG9G0qhoZ7K0A
	 QRxUgKo9/sulnmPx5cbHxQowNc0CgmDuXGQrSxp4BoyBabFKvCy1WRm5UI1TPf0hey
	 mxdKqn1u92QwRrsLAezFvTPt7/q03T0DzHImYs1yxsR4iYFbEKH9Ke3ekzcmpn1HLZ
	 PjUg8nEVnMt/NZez+Yxyd/AVuoXMrHxUAqY/CqKsYuiFTX80ft5QJUQbiFzeo5G27v
	 /Md+RkGqbD7XME0slNWB/bhYhouK12kjQUJCZYxCSTcG41PD0XibshEDruV1I7fF9q
	 vslcYfQY6OT2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Precision 3650 Tower to fan
 control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Pepin" <patpep@me.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260913112925.11393-1-patpep@me.com>
References: <20260913112925.11393-1-patpep@me.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 11:32:09 +0000
Message-Id: <20260913113210.308801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
> automatic BIOS fan control is disabled first. The same SMM code pair as
> the OptiPlex 7000 (I8K_FAN_34A3_35A3) works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, all three fans (CPU,
> front, top) accept the three fan states and report matching RPM.
>=20
> Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).
>=20
> Signed-off-by: Patrick Pepin <patpep@me.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913112925.1139=
3-1-patpep@me.com?part=3D1

