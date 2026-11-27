Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765980;
	b=kyRJA0ZdNMpfAw8vgNXB49o5CbrppMwfH9A2EOKwhayL2JgYBorEfByie9v/2uLHD+zH
	 JlSHh7Nf305+zfvgS2hCfpHvGYExf8G0f6QadfPXO3MY7xece2eZHwB3U3utjTD+PCm9K
	 cw94SpZiAC/BqTVC+Ny+mfmHn6RwTiCvJlbWIDxERBC8Msvj+/8Smj/2kn3OGR1DgGwZz
	 Vu+9ep1WQyfqd7JP4T2J5TlOjn21rZYgP3MD71pWk8Q+qkLHZfVRIdfknpc1VYLSoo1W4
	 lqOW6kVBs+aczm2Mrh1OXinRZOV7sBvAZt2u/6FvZVjcYndamWOPjTSNuGN5UgvMW4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765980;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pnO4e7U560clFTrIUQUugeOhkwSGtyfjyZagNBRcbX8=;
	b=j0swz3SZLp2BTyIFsz9j10JI38iZ66ip9xIFd7wrtei1qd1+j9fy70GqSdweA+SG1czL
	 2odFmtt7SGDdKEDbdo2feaUEqY61jnHbdEdyELLDoIsx98/zYkyKWV9ye58QUGTB//WhD
	 ZpqqlonNOf8ju3hCGci0mAd6lscmZSB73hbYwQNwEuIPMryjSJRtLApnwZ3Fj1nblkKwY
	 WFxUH/JTK7ql3fPvetpY2ifUpCp/KozQRC8YHau18Z84/mteO7AMLnSFI1SK4nDNCSg1S
	 ac4AdpV8ZhY63NLPcjDrv/Jrlbp4UAwSHcegmcQHpz9wBElx4cKrMvibo3Pk0F4qe6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsaEnCaP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3352606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KsaEnCaP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5376F1F00893;
	Fri, 27 Nov 2026 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795765980;
	bh=pnO4e7U560clFTrIUQUugeOhkwSGtyfjyZagNBRcbX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KsaEnCaPRfSquV9UCcBMPyTKZj0jL4j984z9B2luj13pppF4Ptg92Ga9jHSWBFJng
	 dBAmWwwR2mYjL4pnvuRlfUkJmDQaXa9T55s5uL96GYuth04mZe9Lf5nxS/GKOE6aW4
	 eCtciqAnzshfDFQqtiYwRrrV8JgxtTMfk9CDhmFjeZsiS3Dymfhir7ufM7UhU8kZxn
	 yuJ2LNOHEcTtqYheMyNeItM19VFwtrppX8NbRT3V1Z+Hk1R/iWbdePSXIQ+kum6yKX
	 s7U/bgccDjS/mhvIfxcKInfh9BO8wlQGnbR7JXYYBv2SR2nBFNTO2pcH6utM42E40Q
	 QGgtguHhzyWUw==
Message-ID: <sashiko-outbox-236840@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/3] platform/x86: dasharo-acpi: Add fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261127074518.3244152-1-filip.golas@3mdeb.com>
References: <20261127074518.3244152-1-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 07:52:59 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 1 and 2: no issues found.
- Patch 3 ("platform/x86: dasharo-acpi: Add EC fan curve support"): 3
  potential issues (1 High, 2 Low)

A detailed review has been sent as a separate reply to patch 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127074518.3244=
152-1-filip.golas@3mdeb.com
