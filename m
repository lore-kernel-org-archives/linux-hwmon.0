Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385972;
	b=BaFbkfRzYZANnZjN1abVxPSCgSCzma2SRctDTBanlnZoY0XmsvVpKRTuQNU3q2QxsGjt
	 MjSV9cJ++8q8WoGlLFIcBsMbyGYWDl2SElZlOgIWEBhoUCUHwLvUP4bJuJZaW66IXUnVS
	 z9wa8l87KDaYlhwL8lhzwCL7qEqleI5Z4RXwF+XL1e5rsxMmb59nPbIkqKXQ3llReRHgh
	 +zKKIwaBefa6gTuA7DZ6XjIRDcdv7PbE1dRt3nCcVaaVU87BqquX8ZKmv97apRFJiPBCR
	 Sw8ycZVjH9ltuj3VB3L6PSvwhji7rUDxV2BsR4wxZSpMrEiKHIsf9P96xurH+OUkToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385972;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hok/2kpOqcp+kI0OUn7TtdqH1jg+sIt52BMmm31ZOq8=;
	b=cmcj1vt6POviPjpXJWA4DY+XHxnN3r4d2FZN/ANrH2aTSWTr+aLxdlrIoVgo67cj1iTP
	 sHA6SiHqyy1An8Nm8fiT4yLMCMUY5zwI0eYRGg5oZV9d+xCEOUd7hUQ2tRO9mtRc6zMp7
	 emprBoH316qdCsYqS0Y38dipRcJMgFgVyKLRD3S5hUh9VK9pipgCE5/PdvnMj8KG/aR1Q
	 yi0uxK7xxnUf65LZMpMpXAm9V0PBU4oW7Li9ht6EVmictq1mulD8OTsgEWyllcfLqOjln
	 BQZa6B+vPuPsQbr9IQ0ZMToabZFIHceSLuOTLAUi4gZUWF3dOiUDUPtrMkzW+nk30ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcnYHcwX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707F606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcnYHcwX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9887F1F00A06;
	Wed, 11 Nov 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385971;
	bh=Hok/2kpOqcp+kI0OUn7TtdqH1jg+sIt52BMmm31ZOq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hcnYHcwXv0VHQNfuxGPqsDgv07Ml2KpOqgfNh90steL9rrNg/X0qa0FrrKEGH/N+a
	 WQ4cryB8RPEHmMBOIgDMwWe0S8m6cOUWUely7YqZqdEF4DDPRl+38MoNfJmVw0Rgg+
	 kxv59tfYyeeP0l00/aH8mO7ut9RD1DmHXhsIMIeTPvKEBi3FO4BRDxzjQcRm3U3Zge
	 vfQZGtxPVKyfVeLCG6VehXU73C5Nd0ouu2HLTn3Sci7y86lRKRC5CVYcYBViszJJTz
	 swak+pALJ3rgXc2eghale2+iPKrTP8v6enhxYdgF30GJHjlVrvCEnd3UCF4u5Iq07/
	 2cAxrT2/Z/KZg==
Message-ID: <sashiko-outbox-208611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] hwmon: (nct6683) Enable fan control on ASRock
 B850 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-4-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-4-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:32:51 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The NCT6686D on the ASRock B850 Steel Legend WiFi (customer ID 0x164a)
> uses the same fan mode register and configuration phase as the NCT6687D-R
> on MSI boards.
>=20
> Enable fan control for channels 0 to 7 on this board.
>=20
> Tested with pwm6_enable set to 1: pwm6 written as 255, 120 and 60 gives
> 803, 577 and 342 RPM on fan6. Writing 2 returns the fan to the BIOS
> curve, and so does unloading the driver.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D3

