Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08287344031
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536943; cv=none; b=mwnGZj3M5hZzHEJCIUIqriCiNSb27MjgdB3U8HjkkdxSwrNju642KBszWqZdeSaLB1m4Qa9D4h1pRhVv11REMCxgB1kmyBfnkrhCOYVFOgYz1umwM1Gwd5meSfZ+WD7i9nuErL6W+kdvJrRbt6kfEVoPOhy7WBbspoKV8cCzvk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536943; c=relaxed/simple;
	bh=Lhe2rybyK7Pwq8CKNFn3M+uEGJQbaBS6kP8a4wqpPkQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GDGojItKI228oWFbUAopXPeZsV6sH0Vvm5CVEuspWQtFQqMcACbGBPcHviLMA++y82ODLDylrdcPwB0xedxtTNDymyFMXNBYzOjEdz689m1OSglsCA7yU+ITjCEvvXHTNVu4wi48AYyDjmQcz3zprUQvVaVhVFCvLRfS4+UyN5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJZCDYn0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJZCDYn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACAD1F000FF;
	Sun, 27 Sep 2026 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790536941;
	bh=Lhe2rybyK7Pwq8CKNFn3M+uEGJQbaBS6kP8a4wqpPkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJZCDYn0davSMpPUn0biH7jrLQDwRHG3iew+KJsfylTLCTThek4AfnCyN3I+VOvhj
	 SQkY8f86uEcIP2VK0gAiTHpZQNEY+wCkarXnPy/tmjO7njPf/xZ6cWGIrJDebek5XN
	 nNrEuVUJUzHUuTAogZH+h+/p6MkrbJCo/bJdj+yQJXY5b1Z6VvEYdHyQVLm7JI5S+E
	 4XW6WVe2eUgOc+iZF8hArxSetMSnKxopbu6aIOA9Qc64vW66sEmyNK4HEmQgEzVigk
	 p/L54dzoU65ySmxqsg7UGpYPIFCdwS8xAQemwFR/zDh9oeg78ZoVGrrKacJDDZhIGY
	 mLvpo5AEFA+oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] hwmon: (aquacomputer_d5next) Add AMPINEL
 telemetry support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927191316.4137752-6-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-6-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 19:22:21 +0000
Message-Id: <20260927192221.6ACAD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add read-only total power, total current, input voltage, hotspot
> temperature and six channel currents for the Aquacomputer AMPINEL.
>=20
> Decode its 544-byte input report through the existing serial-number,
> temperature and update path, with power, current and voltage handled in
> the device-specific switch. Store all readings in hwmon units.
>=20
> Select the telemetry interface in probe by its vendor collection and
> input report layout, following the existing Aquaero and Leakshield
> probe filtering. No match callback or HID core change is required.
>=20
> The separate keyboard interface is not supported. The driver rejects
> it in probe, and stock hid-generic yields to this driver's product ID
> entry, leaving it unbound. This intentionally limits support to telemetry;
> keyboard support can be addressed separately. Channel labels follow
> report order; configuration and alarms are not supported.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927191316.4137=
752-1-contact@vasily.cc?part=3D5

