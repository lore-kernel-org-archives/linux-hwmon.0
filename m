Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7C13B388D
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534804; cv=none; b=Z46lWOL8iQdFLFQ9AwhhSfd9AmOGSmbzG42JstxwECNtMA0pjDEztnpmADzArRVO4CyDKvriKgQYwr5Z8usScFBicreD40livK9+4JVZvoPMZyvROyrejMPgldSCTtvqkQem11tNyLTK3RMXXxjoDjoLPP0aNBT9eUgpHDxOz40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534804; c=relaxed/simple;
	bh=zYIQiK3TQeM5rMzs/z2f5SwtSQrbJCdTGAjc6BOPXTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hZZtlqJMiFp4dOQk/r5AzM9g97O6cnK1UCdP55SpGRQ2hjXu2wBE3hZfDtbrLR7yPxPNn9Cbo7WJJOAk8tSJC4RyQkDM6Lqa9tqKr63X0IgRYHBAmtt4D4v/yIgri9zVFMMKKRjMlO2490KDPoFuT6ZYYaS5CDQpnFwhPANhFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hpm2sDOt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hpm2sDOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C1F1F000FF;
	Sun, 27 Sep 2026 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534802;
	bh=zYIQiK3TQeM5rMzs/z2f5SwtSQrbJCdTGAjc6BOPXTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hpm2sDOtMzC1DE0bqH8/aksi1Fgbz9NAkR3uwPGqou3sBVYgQydVSRp2gUfIyvdio
	 Qf6spvOj+EzD/l9lq10dwyzfQg0eljjJOsvtjllEIVNcJtLTzhJJac4KarLA7PTDgw
	 /Pk9eGNp2Ja6EdcvU6fF1gck8ScP/M+OdV+T2kTYvR3FowuygkbWITlTjaNpGB0nSA
	 5QczohyjSVu9MvaaH/xikOYuUDaH5XI9i3GPLWNy2CPgF5187v1QcbvFdikYtXIG9B
	 7/Ptgb6LQso2hHYjhf0LznBnDy3EaU9jvbz2HQzoPcJzvim5ssIfDcUHOU4SHmeHU0
	 rf2hboY9QbAgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] hwmon: (aquacomputer_d5next) Skip unknown
 firmware version offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927183723.4078226-5-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
 <20260927183723.4078226-5-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:46:42 +0000
Message-Id: <20260927184642.86C1F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Only decode the firmware version when its offset is known, matching the
> condition used to expose the firmware_version debugfs file. This lets a
> device leave the offset at zero without interpreting the report ID and
> following byte as a firmware version.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927183723.4078=
226-1-contact@vasily.cc?part=3D4

