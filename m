Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC33B3C14
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506576; cv=none; b=VhQ428G5IpWtOakS16e9XGBcMmltTo2Cx8v8bZnKeO17vARU/M9Wc/SLtUmcRPyG4cq8hzInxcuST9KGasjPIwfDO5eevXvlPKTkxdTt2KT4BKZryKASIpxomiaWLx/tm7TkYYx3laQ6kMUPRzWOho9LGgG6DrBb3QHJ2ROc9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506576; c=relaxed/simple;
	bh=uTbPznkvHunmA2wSWKxmue4AC/7PkGLCfIVwrVQW1FQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZQOTEj5RkSzP7QXuCSd5dCQ2TLy6Yerl7g6xf6rZK3IV+UxMwVNobXm4U1lKozzouZM38nErb8L+WdyRtXTHC+k7xMt2qsQlbEZwzX5HVAniG7pNDcJbk3Njx2eq5TeeT3L8YcHaDRvcma+bpKHI7ixwGDoicwIdO48KiX+MB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL27Uq5S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL27Uq5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1EA1F000E9;
	Mon, 15 Jun 2026 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781506574;
	bh=pcEPI4bRWExPLPDtB5HcWHtAFqhDFs1UVEB/qwfPoQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WL27Uq5SwhBZjQ/FH0HVBFQ1gnwUfDv3nSylYhEFSDwVOkR754YL3aetBhrDEuYdb
	 wgLB6s9yVUQ26cJx3pOdoM5SgB/DOKbp3iGSuwxq25sNuP0toWCWObLQGbOeGLbOl1
	 Dsg6Tghnu09m6n+GVVX/DY29Z6ZVo16TfYrA9ETNv9AMd0zBMMTnmEpVLJmX4b4sct
	 hGIjRinCQF5MOHxDRvvYgO5BciaGnyiJmYQP4Pyb3l7ApbpOQiDEvaYunxenGxhazF
	 MH2gGs7rwxVHso2Zd0Pzs0+WFlQfeu+GZHTj0hYuyAPE0PkhqMev6TxbfJwVMmK5Sn
	 mF3mSqejSXawA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627hf) remove VID sysfs files on error and
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260615064732.48113-1-pengpeng@iscas.ac.cn>
References: <20260615064732.48113-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:56:14 +0000
Message-Id: <20260615065614.BF1EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> w83627hf_probe() creates cpu0_vid and vrm with device_create_file() when
> VID information is available.
>=20
> The error path and remove callback only remove the common and optional
> attribute groups.  Those groups do not contain cpu0_vid or vrm, so the
> files can remain after a later probe failure or after device removal
> while their callbacks still expect live driver data.
>=20
> Remove the standalone VID sysfs files from both the probe error path and
> the remove callback.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615064732.4811=
3-1-pengpeng@iscas.ac.cn?part=3D1

