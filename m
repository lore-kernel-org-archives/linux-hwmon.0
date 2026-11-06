Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954316;
	b=1jTYwdH3ecUIcjMWLCwC3UUpplqZcFQ0YweZ5Xl0J4gTA89N1Sh/lzB3PKCDBQiNUB71
	 uADZBs9CcQvpEEIaHSUUXAeDcDNcY41rt1XQIeYruJXwPODRv3SGdiw2lW0bROEEdOPHn
	 PHUfDazZoEY2zuIK4s/alekaT2ygaS/GrxP1PElTln59Z9+esu6upb027RqIrOgFl9wHg
	 O7tEETmhVJCl/eWo2zfPFklMgEF1k4ds4/WyKzbd1EEWyYFVYJmcgrCQ8GiDFy+sQFjcD
	 GH5vVppz+qbAsKQJyBn+vEwA1f3aQ6BVvde+YfrfI+8z5AO0DgpYuYkxsY/R0BIt8cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954316;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pN31FScZog2gNQjaOLu514WfOU4n+N02fg2Sk40p3QQ=;
	b=GRXsZotJ103CdyX8KejQsT5m2ta1HaiLcLVu8jEXdSs9A4RReS+l+3wf01YurSw++RZR
	 Rb7yjVh480RRsD+o+Cpa+hzZAn9FJgoEaiqP/TzfV358DBhYTgEZoj1k5qVTOwPDFmquM
	 p3VwfMdwJ0/qS7h88+hKFwZy4ocwQYGk6edA8b9e8LQtGmBU93eoieHiVn/ryZ9C/NtLw
	 jOCVkbvdbTdyiQRvTvrCwacr2bd2ZCz1EiwYauLKXciD45kawDPdx5y0I4VdH5CODrqNn
	 Um148QyWFcM2xhfTDNgcxQfpS/yqyNF+kwpn+0ExfkttiMG+NXOUghxSm5o2PDQD1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAbY7kBs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A6606A326;
	Fri,  6 Nov 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAbY7kBs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309021F0089F;
	Fri,  6 Nov 2026 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954315;
	bh=pN31FScZog2gNQjaOLu514WfOU4n+N02fg2Sk40p3QQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAbY7kBsw+cZc4EBPHKQ2UXE2JN35XMlPJETslcAg6CmesValQCDwyS12M0khrxAt
	 H7+DG8t3jTNXnWVkC8DwPTYesPblcvoskx8HoxWIKJ77nKDWYgTfQyqzpWRvpR9vxP
	 zeYitUGlu6xLV0R0DIwl3p+aFucTzQKFCHFfVZzQAm6J3OzpoCMEWg2URznjKDpIJm
	 1aubd1VTX7NBxVTW0E+7CX0tQyAUH5bTv/zl4UWGw06yLMJhuZSMvISZXfoocEniEt
	 AsG1DY0WCBc17yszXrEzDlEu1Rw5Z8m8sE+jSHS1TNFN9MpnuguJFdETUg7lt8Txrj
	 trv09dKgBX+sw==
Message-ID: <sashiko-outbox-201079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] hwmon: Add Broadcom PMB PVTMON monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261106-xg6846b-bcmbca-xrdp-reset-v3-7-d6adeb71afc9@kernel.org>
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-7-d6adeb71afc9@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:38:34 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Expose the BCM6846 die temperature and seven voltage inputs through
> hwmon using the shared Processor Monitor Bus (PMB) regmap.
>=20
> Register the temperature channel with the thermal framework so
> existing zero-cell device-tree thermal sensor references work.
>=20
> Poll for valid samples with a bounded timeout, releasing the PMB lock
> between reads. Report temperature in millidegrees Celsius, including
> negative values, and voltages in millivolts.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-xg6846b-bc=
mbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org?part=3D7

