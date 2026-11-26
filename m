Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682081;
	b=y/28eEAPFR87QfYswWzeBmXD5fPEQjNZSFD2vqdfcbZJO8P7yJ3ZIINkUgVFBFx6jRbw
	 QdALfg48/8z/5pI3PbronrE40wubvcpAxZsC7Ne3Dg/jxhK/mA1mx/yOk2d/iHrd5InOq
	 4fl+g625JQo05NqyEuSfxkDpjsEcoY/oDC4tpJDolzUMnqcaVqXjpCjGyHYsRey3u993u
	 ixvsQgtp3Kgpm23SGDHdXGJbqwpxK+4PZHlX+Ziqh5+rpF0NVN/pkhMxH1/03CJThkA81
	 nCD+VRi3v9x6IP9VaRr82CFtZ9wUNgXwdZloDBfSpIJ9SV6rg9qk6deV+T0jLdpsnkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682081;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PxyhkZ9fejYcHcXVFlqMrCEUU+mmyQeJ9c/FlvUgMN4=;
	b=H7vE0nLAkwuAtY57Jh09wflYSPKgFheC8dqsRTcYDHMbA6e/hsw9xdrZGv1gwThZnpX0
	 L8GiKKS7L2jMgfpK5CBxmAh/RUWjZyjK5QC4bigsy36I0YUjq261UHkKdUwZsDwC+Y4op
	 pDhIZrjlvePOc6XGZI31ng1p5XaQiVq+4+In3vlsqUlIsegMjuxrX7CU+WUttcguleZoB
	 qZbgsssPGK3T5IgRlfN9BEoco7IG1UKVLrTo0sHA67+H8vIsjEgcI9j8XYCeYiBvl3+vG
	 PzFUKvenjPRu1Wfi96Q4+jmfzOLmvoNjzmOV5SXV389G64pNPKVa6CDXr0+GBvM/YdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcVB6QVA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F218606A321
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcVB6QVA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DFC1F000CF;
	Thu, 26 Nov 2026 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795682081;
	bh=PxyhkZ9fejYcHcXVFlqMrCEUU+mmyQeJ9c/FlvUgMN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BcVB6QVAO+Ox9CzZw2Ql89Dj5z3YNZIrzNjb1T8PMnI0ZqaKPuSy3mRmIAXXhMN86
	 GJfOKpQQ3YLNGB5LGnGqtOWC7CnybMN0AiHCG1L1s5RSrrdxmX0COWAn3UThg/teRc
	 15MZD/v8z8ZvI62DclXjumFeSws/uEOc0QAmAI8V+RCzqzE51ScdW5ZLs34MRmOti8
	 S+t/RbfozygNLeA/rnWhTsjsfaNFu3gN1D/pwr1GLDq2XVZY6H9BELbsOAKQLv41MU
	 7YK+ikBpJ9b1C3KJOTCaVirudFoR2x7h1FQ3idM2JgFxiJU8oUrztlCDj11Ip29AfW
	 vqxiMGOVdk0eQ==
Message-ID: <sashiko-outbox-235032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziqiang Xia" <xiazq123666@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261126-emdoor-intel-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com>
References: <20261126-emdoor-intel-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:34:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 1: no issues found.
- Patch 2 ("platform/x86: Add Emdoor Intel EWMI platform driver"): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-emdoor-int=
el-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com
