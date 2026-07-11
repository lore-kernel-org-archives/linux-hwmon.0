Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672E76025
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762925; cv=none; b=YTYMr10orzywf60xIjwqGAhFnG0MkUNPoJ2sOLOY18FDyocJBOdOkVW7wm4pw+aS+mFivV/eZv/6IeTkGc+wR4+OHIHCO89peC/chxvLLZ+SUBR+ufowx6zQaqLD0LQr4Newmx466pM41CsKZ8WkR5m4SDFC7z5xFMqFShaQAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762925; c=relaxed/simple;
	bh=d9PIgy3NmygDunqrdbAi/Q7iqGa/X1Xj0/2uX210g74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rIe4uvgQeYJoJWO3AJKSi7/2iWbti+0sHEN+zXKj3QxUeXJJwLkiBeG1uwM+JX0qFL00ZvF+FbTFQR2XD7mvO4pBmxgUQOwot7w4n1aN+pACOtx6D97ZSkU/KqMR6n7Kfm8SHse4Ym8XJFvlOJLmDETpx95BL8XGPyasY4GRGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZu6AKeY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZu6AKeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DD21F000E9;
	Sat, 11 Jul 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783762924;
	bh=lKWxCDCwMCIS6QqfqsrGG0VK2cUIUuoPu2FvWcpppg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZu6AKeYW1+qWtZvsGDy4KBrucPLYEx+u+BMe8oGOIk3/KGbyLOQ2z/qd2yVlx44n
	 Vf4pfG5wr7iD0xCDf3BK8Kr9Dx4iXLeBwbcOTfWBLFD2a1iDegiB9st3QyWQhBW+mS
	 90TgcHjwYhLfanXgxKl7+lRY0JUCDmfSm5Kgq6LVTDjwqhnYY9INz2iGgBiIsTOa8z
	 Q43wvo0V4TlPkWinUGBWfP2aCNmEmMXgfG5frUCPKAjA70c2DMlG7JNA1pU7uOsHao
	 TYCvc2uLjJC0WjG4Gf8vmvMN1kUPhro1QqIKigGMjCz/3qjm7rsHtlnAfKyBPaix8a
	 ZXWTYpwb02kAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711093323.14529-4-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-4-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 09:42:03 +0000
Message-Id: <20260711094204.02DD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The legacy hwmon_device_register() function is deprecated and triggers
> warnings in dmesg. Convert the driver to the modern
> hwmon_device_register_with_info() API.
>=20
> This conversion does the following:
> - Dynamically allocates standard HWMON temp, fan, and pwm channels.
> - Configures HWMON ops callbacks (.is_visible, .read, .read_string, .writ=
e).
> - Standardizes attribute naming to match the HWMON ABI:
>   - fanX_output -> fanX_target (HWMON_F_TARGET)
>   - fanX_manual -> pwmX_enable (HWMON_PWM_ENABLE)
> - Dynamically registers non-standard fanX_safe attributes under the HWMON
>   class directory via extra_groups.
> - Cleans up legacy sysfs nodes, groups, and unused show/store static func=
tions
>   to avoid unused symbol compiler warnings.
> - Avoids recursive mutex deadlocks when writing to pwmX_enable by lockles=
sly
>   resolving the entry and invoking the underlying raw SMC read/write call=
s.
> - Avoids UAF race condition on module exit by using unmanaged registratio=
n and
>   explicitly calling hwmon_device_unregister() as the first step of apple=
smc_exit(),
>   guaranteeing that HWMON nodes are destroyed before static structures ar=
e freed.
>=20
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711093323.1452=
9-1-fourdollars@debian.org?part=3D3

