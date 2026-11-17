Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937602;
	b=FQ+ojhBw8B9AFx5ASFrXBxCV55OT7akSMoNjkOKLHsjbjhIki8c+pBwMSXgPlUeSDLCI
	 kSTbDI1mF3P5FUipxhi+ePriTjURmIB6lOdG4eDqnCsuHJt6+YYmkPHg1d0ysp0sHPPhx
	 jcnkhdsaQNOlJ0UOlZ7Aw73x28gutOP3mGFHidScCo+yQcDfTe0qp3xitQFMaNvb4RWaQ
	 xuM2bXtXdr7WAGAMzFZqIp8cGyi48u3mBB3JPNxa7KVAL6PFDtN6QxziGEke7LGzgF8EI
	 3KFmoTpggbwzTXe2EYFel+/s45d0BhpOum+YcbznY5egdVy2IlNTHBVSYXTugLxUzXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937602;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5fMvMttOCZZDM0Tt/6Jr9JjjiYyCIUwajhyX8guUbyw=;
	b=04fHin7yJftGokdo+NtcY4PoJ5gFrS+I+cRups/08ptGKG11SaavU6tF8sZQ3Zn5tfcd
	 Zyne8Oa37ljhPZ/e9uq2nSopV8HXqSjohjiHZMV3JLqGWinTlv5M1QKDNSXuk38vVCOhm
	 3QBfdE8iTxV+lOYvz6HszRWCr+D0gjmCCA3XpS7laB3D/YvqVRg1WYDGuurmJ0/usKLSd
	 XCGu4OJCmUTLe927jGEPSuWXrnxqTGGb5RA+tS93SYxtREMSBxW0Sw0dWweExuG33R9VP
	 Vg3GT9fsRpETLKE606EBa12Tse2+ZfGZKvR4Rsb79yrxsMxamM4gFn6tGJ3xro00Urw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ku+FykOU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215C606A31C;
	Tue, 17 Nov 2026 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ku+FykOU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B221F000C4;
	Tue, 17 Nov 2026 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937602;
	bh=5fMvMttOCZZDM0Tt/6Jr9JjjiYyCIUwajhyX8guUbyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ku+FykOUwKQGCr1ow/e+lW6jp518jyjilykDHhmGtRQEbuTKoQgvZWVN92pzGWoWv
	 cUt+/2eGh5nWxEAMVcTsAGYFUAIkhCJlPlEEJ2HV8SyisSsTnEJ/h5KiFwCymEaw0+
	 icIJcBpJtrL1bQ39lfBR4x3xvM/fgJIQO7hOIdP3hXR73NJPL2Rmvl7t3EzBBuwgY4
	 sH16ZadXDNCp1b7imLHnty0UWRFZT1P2MqA4XxzdraoJwKMNp9N2BAWbN7Mw9eft0y
	 nJnsLGssOkT1SUNfHIbxV0ffRKTzkOTJSx25M4iN4WUezvwhJfVGnDT+STX249p4PA
	 UoC7dDDGFPAKQ==
Message-ID: <sashiko-outbox-219260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] PM: runtime: fix stub pm_runtime_get_if_active()
 for !CONFIG_PM
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: linux-usb@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
References: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:46:41 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Frank Li <Frank.Li@nxp.com>
>=20
> When CONFIG_PM is not enabled, should be treated as if runtime PM were
> enabled for the device and the runtime status is active.
>=20
> It's a subtle distinction but the previous behavior returned -EINVAL, whi=
ch
> means "runtime PM is disabled for the device"
>=20
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.
>=20
> Analysis of all callers and their behavior with old (-EINVAL) vs new (1):
>=20
> [ ... ]
> Fixes: a71aeff3dd0a7 ("net: ipa: kill IPA clock reference count")
> Fixes: 70892277ca2db ("iommu/arm-smmu-qcom: Make set_stall work when the =
device is on")
> Fixes: 9ad65684b9285 ("media: staging/ipu7: Ignore interrupts when device=
 is suspended")
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117173738.1073=
856-1-Frank.Li@oss.nxp.com?part=3D1

