Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3904823ED60
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 00:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382133; cv=none; b=a4+q6LSZZBOzHnvcLD/1i5o0Ng1leHZuukFFPnwcGwfbKtWRbYBaxu02fmFtICSGF8zWxpirmGKDXjEWKeeMzrKV9XBR6ELhal559IW4gT5L/OmnFrtWp6savFOtha0peFcNwJXmOpLSQspWu2C/6taLaZZK55kh+2uQKQEvGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382133; c=relaxed/simple;
	bh=PhklkjK2C6IYno7e36IY1J5eIcVW8MWXzi9xPtue96o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=USv3lNCIiOVRhIuvkt75NuTPIyPxu82966XzflzEgW8I+C9H7D4pM2U/aUMLVUHirD7MJCTcMhrLpGPAxyUscOlimCsinHhszZIOM5noorfa8vxERHf8uVD8JyI8SdWpgU27SkIjUm0BSD6GN7+huff6bsMQg0EUZFbp577arw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O24Uke0q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O24Uke0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70FF1F000FF;
	Sat, 26 Sep 2026 00:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790382131;
	bh=PhklkjK2C6IYno7e36IY1J5eIcVW8MWXzi9xPtue96o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O24Uke0q/pS4Da2qXO5xeKgJeelAwmtaqXJXV7Hi5Gs4uTr9WBHDP9Di1syYzCSIb
	 7+BAKuCPRdPL5mVvvvDOxv8Abcr5uS0sZ1/4b4HQXZSnBi+2+L4IWrDhWJFSa9opuG
	 q2C5HkpNqkaPjw1HCyQYyYV2ghYe9hv1d0KBpWaEX7a0+D8P3w+4lt8qoEUKhWUwG6
	 xMZya5W1zVMnGF4tRFjmqiDVDr0Y9ZoWmTywrO/o4XIMQv/+dgckIdvO/AHy7ARgsY
	 ++0UU7SQGKevQejC8YaDTmk0ebPT2BmFS3hLsN+1ee2ZWIcLZPe8mpIp9XGr4r1+Qy
	 JBeNqFWgh5IgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (gpd-fan) Reset both fans to automatic on duo
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexei Solcanu" <alexei.solcanu@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>
References: <20260925-gpd-fan-duo-auto-v1-1-29bb670b3331@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 00:22:11 +0000
Message-Id: <20260926002211.B70FF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Alexei Solcanu <alexei.solcanu@pm.me>
>=20
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=3D2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=3D255, so a
> fan control tool that exits leaves it running at that speed.
>=20
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
>=20
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
>=20
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-gpd-fan-du=
o-auto-v1-1-29bb670b3331@pm.me?part=3D1

