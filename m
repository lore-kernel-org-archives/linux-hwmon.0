Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09A38A29A
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133079; cv=none; b=QGH+5LVinLq3P5mm1wxHELOBKfwojeehWSvUP1i+BWglRdJb7wLVaDPGA0dzBV8+88QUHowEeSwNoq9yy9Y+RHRHy1dpI/IVutze8W67qXBiAikQOUyNH3wfpIBOVBGqeIIFyNGDF2ctPOXXiKQcdiEIupu0RvtzyLo+T8yrRHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133079; c=relaxed/simple;
	bh=eyxHPfuwM898vDf8FFvz0/9f9rIdD2aQt0rMnV7xiZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W4Xn+sIKYB6qO+d3zso0RC79LdCJWDJa18zyw6+6ulz44g+RRYF34467FHZM/Owsz6aAB80sWn8rCzonA/Rk1VW990MyKtpqGz0Z7xyNkV6B7jlkZw2G4Bi/ytry+pXqxJJq7+Es12mNSPtYe7X/vD0wKzAkZhT6jTVGqAnikz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyxU3G17; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyxU3G17"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889DCC2BCB7;
	Mon, 18 May 2026 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779133078;
	bh=eyxHPfuwM898vDf8FFvz0/9f9rIdD2aQt0rMnV7xiZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oyxU3G17aATeejtwjdMRIlukC/OvK0zZSstdWMTiWP2+F3xXhA7nHh3KYa/R6Ic7o
	 9+0LoeqhnLaet04SJ3RF++4EJ52beQIuLn8Dt+PbybTUzpGviGf6ZCadw3MQZK/lPm
	 uIJ4o0SY7rFYtJpjtUChDtFri/c1+AoCb1jhG+Ud9lGJnmz0PcB50TvjfDSYe5ZZYD
	 Cb5rrt1sqXog/4agEn1lcJt3kCW0w5qCl6vZ3YZGNvjCkfx/LVz4WyDz2+symlSV7H
	 hjQahkg0U/LYxlb+scyh0v+XSX2o5xBlqyZDCRHqgOmQjQgB3LTADlQAqIrsakuNQB
	 g7plXk2Wtk3Yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] scsi: mpt3sas: add hwmon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Sautier" <sautier.louis@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518184109.770185-3-sautier.louis@gmail.com>
References: <20260518184109.770185-3-sautier.louis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 19:37:57 +0000
Message-Id: <20260518193758.889DCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Kconfig help text references a non-existent documentation file.
--

commit 8d7ed075db4ca1d1d6c8f7e90a2625cc47892773
Author: Louis Sautier <sautier.louis@gmail.com>

scsi: mpt3sas: add hwmon support

This commit exposes the IOC and board temperature sensors of LSI /
Broadcom SAS HBAs through the hardware monitoring subsystem, using
readings from MPI IO Unit Page 7.

> diff --git a/drivers/scsi/mpt3sas/Kconfig b/drivers/scsi/mpt3sas/Kconfig
> index c299f7e078fb9..638acd2c66236 100644
> --- a/drivers/scsi/mpt3sas/Kconfig
> +++ b/drivers/scsi/mpt3sas/Kconfig
> @@ -73,6 +73,15 @@ config SCSI_MPT3SAS_MAX_SGE
>  	can be 256. However, it may decreased down to 16.  Decreasing this
>  	parameter will reduce memory requirements on a per controller instance.
> =20
> +config SCSI_MPT3SAS_HWMON
> +	bool "LSI MPT Fusion SAS hwmon support"
> +	depends on SCSI_MPT3SAS && HWMON
> +	depends on !(SCSI_MPT3SAS=3Dy && HWMON=3Dm)
> +	help
> +	Say Y here to expose the IOC and board temperature sensors of
> +	LSI / Broadcom SAS HBAs (such as the 9300, 9400, and 9500 series)
> +	through hwmon. See Documentation/hwmon/mpt3sas.rst for details.

This isn't a bug, but the help text references a documentation file that
doesn't seem to be included in this patch. Is Documentation/hwmon/mpt3sas.r=
st
missing from this commit, or was this added in a separate patch series?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518184109.7701=
85-1-sautier.louis@gmail.com?part=3D2
