Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6E4BE428
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360953; cv=none; b=ufLcOpHJ9r/KbHNbHwjVoyJSiVmPXbFssPID1m9HxfHDlzJELCN7rGYoj3v9OBB8BceWUGfbWF6yb2O81/dH4FP0o1MCImusDM7N1nyFsETmlS6L6ntBEiyA5tOohnmDrC4N6Oyal/GarWrMI4tLHPh+xzAczA1iyOc3JHev5Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360953; c=relaxed/simple;
	bh=iJR9mpERFheKbppP9baftmdM50DJVKmjO7NmFOa5cQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hAyqS3sddHVXCywyhBnv7MxT5L8fo3tFEibrcAOu9+h1QD6MuLJg91UP23muAL8ujkDvSsShRdouGglH7D+HH6VygvZr3cs8WG2tweH6FHEi+Hu1rUY4sog2tNEntooqIfU5HBmI8lFtOr4/uBcsB22yfkFsn0bOJH3Mkg1fNsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFLEQNIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFLEQNIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2EF1F000FF;
	Fri, 25 Sep 2026 18:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790360951;
	bh=iJR9mpERFheKbppP9baftmdM50DJVKmjO7NmFOa5cQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFLEQNIU0jfb2EG61wttrTw4jON031OPS7KxVH6O7UqoHkdkw9WbqhJHq3xlrYfkw
	 5Ub1C4zPPdPDKvx5HMNnPp8/23fqe1O4He4a5sFpRdpqokfHbWEmtX7WydJQxG3qYL
	 NZvxYcq/096Ylcyd+ApSet0fKP6Hg4Bsg2k/OS2lmpmN1D4AH+s+fFWsKRc++DQ/0v
	 7W+WEVlcxwnLgiUOZGLxk85WFGhFbGuUaxmH4yOZKL6vnMVXg7B4/3VTTxzSEmoBoT
	 Y4MWETz7qf3j2WOKJGX48KnX+4mtbRdgIQELSTO7QHvU2Jm7INBt+jW8wuRbC3E7nf
	 xoKyzz3ig9u9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (tmp102) Fix jiffies wraparound in
 conversion-ready check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tom Verdonck" <tom.verdonck@inspiral.be>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <2952f070f82913aea96eec25d28008d3b9058656.1790358356.git.tom.verdonck@inspiral.be>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
 <2952f070f82913aea96eec25d28008d3b9058656.1790358356.git.tom.verdonck@inspiral.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 18:29:10 +0000
Message-Id: <20260925182911.0D2EF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> tmp102 records a one-shot deadline in ->ready_time at probe (and resume)
> and, on every temperature read, refuses the read with -EAGAIN while
> time_before(jiffies, ready_time) is true, in order to skip the first
> ~35 ms conversion.
>=20
> ->ready_time is an unsigned long compared with time_before(), whose
> signed difference is only meaningful while the two values are within
> LONG_MAX jiffies of each other. Because ->ready_time is set once and
> never refreshed, jiffies keeps advancing away from it, and after 2^31
> jiffies the difference flips sign. On a 32-bit HZ=3D100 kernel that
> happens ~248.5 days after boot: time_before() then permanently reports
> "not ready" and the driver returns -EAGAIN on every read, without ever
> touching the sensor, until the next reboot.
>=20
> Store the deadline as a 64-bit jiffies value and compare it with
> get_jiffies_64()/time_before64(), which does not wrap in any practical
> uptime.
>=20
> Fixes: 3d8f7a89a197 ("hwmon: (tmp102) Improve handling of initial read de=
lay")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790358356.gi=
t.tom.verdonck@inspiral.be?part=3D1

