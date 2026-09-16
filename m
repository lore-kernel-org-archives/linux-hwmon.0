Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0D282F15
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 00:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519135; cv=none; b=ZwWyiz61DTwcRaQwroJKWsX3m0qht8J3rK+mM7N2Dl/mnJ6Ujdp5lFGY9zesFYpJkourZ9VZ3qDuKr4wcxV8Gv9kMWphXbwAJuKHaEayA3PQ5ygNtK+yFgVvBT0xjCiAfSQ3+ub3jIuoE9bVLfOq2QVVbWJioNBfXK+YdiExuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519135; c=relaxed/simple;
	bh=u19dS2fpN5uJuOV/lVKBlsxmCA/GguRbt4YrxSi+DAE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s3KPamXOsowJE3AQgR2a64qJ/i79J6HAST+uSG0spHGzzNr8LR+R0JgPR8iSkqdbTjJIBN4R7ikXrFBRpsUmTWiXbzGaiX0DSKkfq3a153/6I+EkioQqmMkquKnEeM+xpLLmmZ0Vf+uvyuypIdVXpoHfqTUVjpCWH6l9pUEF3fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgPJdG5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgPJdG5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AF61F000FF;
	Wed, 16 Sep 2026 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789519134;
	bh=XtmSr+JYjKIWd+1FrPnC80P5mwsKCnn6O1LAD1JdBEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgPJdG5k680TdMpWLcWmZNGC2KXj/OX7sU6YQKkBrPj19zWtomfnmLibPYJrNdueE
	 /kRDdFFyjIyw+d5x5Uo+zgNslp9dMyE5XqMD8ee3LgUNnc/y+4qyP5Jc8+YMrIJ73v
	 /wfHhNyz7eIdjN7MYVHtdHk21Yyfdat/nBerXVrKo5VqVyGNOJj02NGr8dUScbH4iB
	 DLQCBOWTQgJsLe6OCp96vDsGXZVlbmTYLTrDJFTnL4jgikUqsNFGfeFjQJp6Pae0/N
	 KzqfnMuAAjdQWoLvTPDcmzrwJiAdnpbAileTxGLEf9NpsHE8w+FntuaqGsxqel7eE2
	 5mfXqORKXAHrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (hp-wmi-sensors) Fix use-after-free in
 fungible_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Bilal" <meatuni001@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260916002926.161595-1-meatuni001@gmail.com>
References: <20260916002926.161595-1-meatuni001@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:38:53 +0000
Message-Id: <20260916003854.26AF61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> nsensor->current_state is dynamically replaced as the sensor's state
> changes. update_numeric_sensor_from_wobj() does this by freeing the
> old string and installing a new one:
>=20
> 	if (strcmp(trimmed, nsensor->current_state)) {
> 		new_string =3D hp_wmi_strdup(dev, trimmed);
> 		if (new_string) {
> 			devm_kfree(dev, nsensor->current_state);
> 			nsensor->current_state =3D new_string;
> 		}
> 	}
>=20
> This function is only ever called from hp_wmi_update_info() while
> state->lock is held, so the free-and-replace itself is properly
> serialized against concurrent updates.
> [ ... ]
> update_numeric_sensor_from_wobj().
>=20
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916002926.1615=
95-1-meatuni001@gmail.com?part=3D1

