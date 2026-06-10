Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2F3546E6
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114631; cv=none; b=cPU4RmESD825LYz8szGhO8cAb7lnjUR2PiAEMSsiTCxngvkcTDtQDYB10KSfxaeAaRO7sba3XJcxFR0cmTYB/b9ReS8hAlXAVGI77ff/U93/wRV/OiGMiTJf4AXHG6T7JIBJH2iQAdk3jb7Pbs+J+192GOA3OFNBkWOk4PaxGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114631; c=relaxed/simple;
	bh=8Tet/U6RpdvN4t+by2bKjVQyiOTctQKBP6RsUs1y7Dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulYSGj4OE4bWG0R6u3vCr5YIwzcHzP1uwpyRNH9fRTJ5FATQsf4H000m8tj001IVtoWe2BmGL2UzFUvJL3KFrpQhFwdkCyZpvMWH4w2Y8GWIIdFyrcrhEYw6KKm4M/QiQ/G+vPbfo8ZM74s3btQ1ogcUnx4uwbE/Pt2annuG3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqRfQeAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqRfQeAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044561F00893;
	Wed, 10 Jun 2026 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781114629;
	bh=8Tet/U6RpdvN4t+by2bKjVQyiOTctQKBP6RsUs1y7Dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KqRfQeACyt9Xm1bx8zlR/p60+Pgt08C0WtruNqzV7rsbwoEWzJs0MyQI5IGsxpCc4
	 Pq6WYbeX4srnRHmlpHeWRNeHSS4gHDnz4T3RX7o3VxiTrA70uXnijq17MAeImdSxmI
	 V0mXjTsmhqCO/ZpxfIYI8HquDy99D1fLRfOhRL4x2/sDtD7yVHkzeY08pU7nar8qj+
	 NvL/MMNvr0FXQ1Qy5ntRDKqlB94LhPDirV/ujtgoRYUnPaQ4rHZMTZOj/6WQSnXWDS
	 clKVmLUmDVmk6zd0lncMCOxJRfqBGK8wkA1drqeaiKsLKkYipPLaGr4OgHAmOiB29P
	 hjHCIU9WmKddQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control
 whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610180141.311503-1-W_Armin@gmx.de>
References: <20260610180141.311503-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 18:03:48 +0000
Message-Id: <20260610180349.044561F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> A user reported that the Dell Latitude 7530 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
>=20
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610180141.3115=
03-1-W_Armin@gmx.de?part=3D1

