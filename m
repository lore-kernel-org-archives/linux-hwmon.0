Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3587840244F
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915272; cv=none; b=VZkSaZRrDP0cEVrZfUj9lkKexq6FMkVYGA7cmV4uUYtttJ31wIjr5Pcj12tojOt9w4Kqhr2wOvXF0Ux5np9hR4HGFTg0Blsp0tL6pmxSyqJj/IBAgjd+BtrvX0e/2WnVkx9X1v1fNICUvBTS++s7K6Lgc2Rajj5fpPH7YBWWDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915272; c=relaxed/simple;
	bh=GjJ0Si00rPDQlKT4Nh33yYc8k7D3vwLAG6DjnldH6ik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bY/AcldX163dcd0IfYl2RHO5Dlrgmwyy/0Mz+W+RooRWKUqtXbDJiYBSIZeSEZLid46uN7FFUtu892F8yo9zoWtaAAemET8f1agt9zBaiXGgzJmsINbvgUg/Utxw0S49MevGiqqvnYabXC5gsSlVq1XRvg9UKn2OUnKoCsGGpeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLZPrhpR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLZPrhpR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4041F000E9;
	Fri, 28 Aug 2026 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787915270;
	bh=GjJ0Si00rPDQlKT4Nh33yYc8k7D3vwLAG6DjnldH6ik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLZPrhpRTqT5DnkZLJJfi0HqPeE8jZ+q7/XxiClo86OfdInVVz+Uw+oVJ62pfYVU6
	 qjsC4eNWp6qX9z8dErUi65Le343VSL0Dmf62u7p0g309Bzh3I+GqgfCbA0Uy7XXGP4
	 ZnMhhcY97Fzgbj9siEqVfyWC4JOorFz2HwAhi0R1SxqQMSjfYJ9fPiKUFyM8A6PaAi
	 oQH4VEKh9Sm/YOZJgQvhCkDdfY0XQzYb4tNsXvKqPimedgKpIqDyQ5wk5Y2ikelvd/
	 R2EHApUrEL1jhEh8w127l5Fy9q9Jx/gCM0czl50GdJ0OUA5MDBy5bcqsijn6muXZZx
	 e3oScFiyzO39g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (applesmc) fix key backlight workqueue leak on
 register failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260828105413.2401385-1-congnt264@gmail.com>
References: <20260828105413.2401385-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 11:07:50 +0000
Message-Id: <20260828110750.AD4041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> applesmc_create_key_backlight() allocates applesmc_led_wq before calling
> led_classdev_register(). When register fails, the error is returned to
> applesmc_init(), which jumps to out_light_sysfs and skips
> applesmc_release_key_backlight(), leaking the workqueue.
>=20
> Destroy the workqueue on the register failure path. The bug was introduced
> when the inline init block was refactored into a helper that returns erro=
rs
> directly, dropping the old out_light_wq unwind label.
>=20
> Fixes: 0b0b5dff8967 ("hwmon: (applesmc) Simplify feature sysfs handling")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828105413.2401=
385-1-congnt264@gmail.com?part=3D1

