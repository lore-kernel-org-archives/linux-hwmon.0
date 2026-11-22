Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795379971;
	b=rC2O/hPQD3J5dqUmi5UcJ1ReSBXPSnH8g/hI4kW2vKTbUyP9ewbgwPKAH71eMJ1u5xUf
	 FOmMPX+R6FgWxbfo7vEMridkdTrUDM1KtFhvsSgODgFWYJfXSdhB2WhfxET849M/Qghaz
	 xPGq9LUBEwX844vGsTWbKhjmK7YbqrhwH7/B0+ymca/r45AFqxiKyzgAvvx+MRoXiv7q4
	 cyKOVPTKhMAXqM3DWd0xcmzgtvoVGLMduaU6Kb8YvJNy22YGh7LrCTgIjSLeAcYWuthe0
	 P++SB1QyL+NQSSkWEPfP70DAWjS0LIIl4Zve58YwV25MyALLXKuycZA+0QxyxBQSoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379971;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pbsetNUyXquqkt6TnG1Gt9unyMrLxkhPFjn8BJXPPcU=;
	b=u0xNSQjh6KW/VcPpiH0y550lRZHFoOE28yrw3mdDW3jhVkMMiNkZQV9HcnhR849Ws7qg
	 UCMm0ngydzxwwhimkrd7aPehi0gE/WgoWLzYqdCc+ikW1NHkF3Ry3jM8fOpPioOXXhWkr
	 thmcCch1YvYSAF39J8yT+SYqeMwx+sqmbNG8bGmnNiNiRY2jRsh74hJAA/nMh4pZ34hqc
	 1pSjliQWLtrho0B6DjX6zDTkTvMf3CydK5w7ZW7FTWc0QnaaitvIMtRpvxBsjSkOe6PNq
	 yl0x2UJlalhT+VJOIyYy1iYJ778m1l7A7g/G5oekRg/+AwmB/E6f7tM5WHm5upcjGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kT/iyQXe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848E606A31E;
	Sun, 22 Nov 2026 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kT/iyQXe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228831F000D0;
	Sun, 22 Nov 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795379970;
	bh=pbsetNUyXquqkt6TnG1Gt9unyMrLxkhPFjn8BJXPPcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kT/iyQXeALfNgDH8nwSLZMqjAbusXKBvqCfmSlddH9PIBIWQ7KGOmdeIh5FRo5csq
	 i1qy6HmTKtuhr2a+DdbA/edKwRh15T670tQwupQQ7dCdwPu9kJDL1kNTGAkdyX2ywB
	 xmil5Cv851qcWfFDhWOxGNcGrLFDlslXvisVgEA6/nIQv8fJuFuV0HxY07ZOYQcaTW
	 tysOOps9PX0m0WQEYspAmdfULeTzuRiofoLlNAvQse8F3GipSrW2VxI7wao1/DDueT
	 heH76w/t6hoJZRoq3krtJq+/14UBttR/NOrnr+foRxZR9H/eqbzIzCqW9DyScdR7aJ
	 p1YCy09701y5A==
Message-ID: <sashiko-outbox-228332@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 0/6] BCMBCA PMB power, clock, reset and hardware
 monitoring support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 20:39:29 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 2-6: no issues found.
- Patch 1 ("dt-bindings: mfd: Describe the BCM6846 PMC complex"): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-xg6846b-bc=
mbca-xrdp-reset-v6-0-bf2104a25095@kernel.org
