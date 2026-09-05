Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C851A680E
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2026 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595529; cv=none; b=qE5f3UJPGtDMw0LybnF0p4CLTAL3YwArH0nQ7JHRCyh7jgww+eBTA5P5w2fOPeh1cUTi3IWrMHFIowAttJW9/Jc7qSXZTNUMft5ztBiSrZt05ypYC+MxDDxp16UyNcYDCUFpFFIEeiRC3dMxUuab8eYbH/QjsBdcq96/8S2y6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595529; c=relaxed/simple;
	bh=3ojR5Xhqj8YZYDLXbL6A6Z+EoRUo2z4reRf5EGcvqNk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WNLcJBcv3ywxjBHiKFxk8bNhwqrdClOpM/0cvxzL2TX7gh0o1p1wXKSLPIg+P/TWV8a3R9//6zsIBzZOJ1zH5FYAercfNaHWJcTzuzr6XJY5kADbUnpGqWu41B2DDnUs96cMZ/q0CoAzs4Uv0BM/2K37BdYGPaA9tAmYBf0WxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+IWj2TE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+IWj2TE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E641F00A3D;
	Sat,  5 Sep 2026 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788595528;
	bh=3ojR5Xhqj8YZYDLXbL6A6Z+EoRUo2z4reRf5EGcvqNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+IWj2TEk4kjMxqMynEgI2XOW8fuiOGrHQ0Gpt9FcPyb6l275cs5/Emg8dCMBy35o
	 YR00snIzORnCL/G/cOPrwkIgdyS1KqZb6waS129PqFel0Fc9RBrJamIrNBA+5LMURL
	 YGUiAFgn+imXoeAVcyq95ITM8JwKHswG193b0iDpYKfb4nudrF21ILBDWLsLm6VHag
	 4fXTpNn4Y+DC2zlQ7FpQTMYS7oldf38pFq1+0s/3iXXEUlkaKHusEzf398cvO8wc0G
	 d1306JJysq5KszaU68SjuT0sepGu8pcMaXGX+BlEdmQcZVfKmvJBNuf0hzaNdKhOOa
	 1QMf5dFdHvWYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
References: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 08:05:27 +0000
Message-Id: <20260905080527.C6E641F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Mario Nuevo <marionuevo@gmail.com>
>=20
> The ROG STRIX Z490-A GAMING and Z490-F GAMING are essentially the same
> board apart from the F's onboard WiFi module, which isn't wired through
> the EC, so they share the same EC sensor layout. The Z490-A exposes the
> same EC sensor set as the Z490-F (chipset, CPU, motherboard, T_Sensor
> and VRM temperatures plus CPU_OPT and VRM HS fans) at the same EC
> registers, so reuse the Z490-F board_info for it.
>=20
> Signed-off-by: Mario Nuevo <marionuevo@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905080346.1957=
380-1-eugene.shalygin@gmail.com?part=3D1

