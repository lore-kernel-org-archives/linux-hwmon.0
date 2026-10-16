Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E233DA5A0
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140390; cv=none; b=s2cW8vsikH8WjMBN/GfYNx+q4DRMLe+7WGReupLdH7+tNfdhwoZrjX6okYJR0dAAl+pYHOMMIr8r/xqNP3BuGBrCHDWefPyivaG/7vXVSFoLUxHwMfWIBV2k53k4HtQ894iV+NImn/1UH3eKgPnrfKyai9i7kcL/wyVyswKIFs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140390; c=relaxed/simple;
	bh=KbWZN3t5bEm3rgNhmXHSzd1LXLf/RNYjIKN2B/gJbp0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AMFcvT92fWUO/aJAHSIQbFl3MVk/qeNY9fFPQhbDN5ueoIyIV2P6IdRIPsWSUP7Z+NfcAUxdPrzvDB4tkmPvozJoW/BDNsGlVlLkmvb2whFY7KVChldR93dJGUlQ7XuX2+0fpocPUOybhJvJ0dsSNLalpff0vHywc7DJ9nw9/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqcTcCyW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqcTcCyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E011F000C4;
	Fri, 16 Oct 2026 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792140386;
	bh=KbWZN3t5bEm3rgNhmXHSzd1LXLf/RNYjIKN2B/gJbp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AqcTcCyW8dtZbq7t6R51uCyVCLccl1YPmZHWgUFDybGuodzMuhpnlAL2NaR9rPy2G
	 daoy3cHthTC31Mie2N0mE0uCOHOXhSVIjApaEt6A0IHkw/3BbRL+MWw2P2DwX9Ge+5
	 u//O3Py1o9jitO5OQ3IhwVP3psHu7I1K+4O4VxKWWi+9BJTA4w61FtNyNofVTECMBA
	 /Zw6VjFScNi1l836Sk2RCoCEQG3pyy+OP++Uy+8gDR9Gmq5Av1ZhW5SbRbJ9NEtWfD
	 mZbGcRrylBN5q/h3lDoLHrcVBi2DM2ofPPn0Tq6DBkD/sxgyx08ltMFjVb+8hA3fE9
	 YP1Zo7S3MUnKg==
Message-ID: <sashiko-outbox-174032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Fix handling of isolated SMT siblings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ximing Zhang" <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261016-codex-coretemp-housekeeping-v1-1-96618c5676b2@gmail.com>
References: <20261016-codex-coretemp-housekeeping-v1-1-96618c5676b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:46:26 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ximing Zhang <xzhangjr@gmail.com>
>=20
> Commit 0f8b916bc5b5 ("hwmon: (coretemp) avoid RDMSR interrupts to
> isolated CPUs") prevents create_core_data() from creating temperature
> data for an isolated CPU. coretemp_cpu_online(), however, still adds
> that CPU to pdata->cpumask.
>=20
> When an isolated SMT thread is processed before a housekeeping sibling,
> the mask makes coretemp_cpu_online() believe that the core is already
> represented. The housekeeping sibling then gets no temperature
> attributes. Package attributes are similarly not retried when the first
> CPU processed in a die is isolated.
>=20
> The mask is also used to select a replacement CPU when a sensor target
> goes offline. Including isolated CPUs permits the driver to retarget a
> [ ... ]
>=20
> Fixes: 0f8b916bc5b5 ("hwmon: (coretemp) avoid RDMSR interrupts to isolate=
d CPUs")
> Cc: stable@vger.kernel.org
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-codex-core=
temp-housekeeping-v1-1-96618c5676b2@gmail.com?part=3D1

