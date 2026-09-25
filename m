Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83252270552
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 02:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303477; cv=none; b=W7GdzEqNx3LYKUChvlvGMuEaVvfsrcHWPL9juMLYbQq5ftDQu5/muEGIULRVduEWyRRIVOdQ2xXdLJqsQWEdIZDV25Fvv4wFbExknVwdH33ITtWyVXxFsKY/0T/j55wSoBVYt96NULP5aK3ZdbCluFQi/1zpe+1ijAscYuZFs+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303477; c=relaxed/simple;
	bh=fUZRymZ7Skzg07w0oS+sIcXWjOo7C2Cp7zlQ4WCnEgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=adGtDgsOngIHD9/0iPgho4hu7cP2bL8Eq+PguJFkCga7n7bY3lATqseoqlhHxhsvFIlRlRbpbZB8sgYfUJ8BwgICrmBvJLxRNsQNB5Cq6UxXLwgOyAPB6tx+TAQG8xAPeSSBrrmz4HPx1gGFoJGhcbvuL34HuL/B2wQFHHXW6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZAgeDmi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZAgeDmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6971F000FF;
	Fri, 25 Sep 2026 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790303476;
	bh=fUZRymZ7Skzg07w0oS+sIcXWjOo7C2Cp7zlQ4WCnEgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZAgeDmihBd1AQFRjxoZ6yBaZUHB/PtLLpoOROXbl2Q6REJRmeuO1a2Ss5ijUvtjF
	 tcFrn6mHf6tLdH4lddeYijosAwvZO8yUUHntItO59MH/8h645rZ5OCzUjyGwfJaEWR
	 XSk1dmacGGrqZ4yW/Veck3nfSC7x6WORXxk304uPZ87fUp9U6MLFlBE2DvyAXzmiE1
	 Jy+3/wEIWIfCbQQbqn3vVdx3fZ5sDp/aLtdAbxnPxv1P38YZlKC1CEEK+tvArA4koW
	 c20mBwh3GjEyTex+zDHWCaBdX5rlAMFteLh8WswYZkoztRAHBxvqdPSpH6F5RIqKjs
	 JIXUbZbBwGCUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (coretemp) Add temp%d_fault sysfs attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Neri" <ricardo.neri-calderon@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924-coretemp-temp-fault-v1-3-1884f0ff97d5@linux.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-3-1884f0ff97d5@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 02:31:15 +0000
Message-Id: <20260925023116.0C6971F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The temp%d_input sysfs attribute reports the CPU core temperature
> regardless of the valid bit (bit 31) in IA32_[PACKAGE]_THERM_STATUS.
> Commit bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
> temperatures") established this behavior after observing that some Intel
> CPUs do not set the valid bit while the temperature is too low to be
> measured. The value reported is of more use than an error. Changing this =
is
> not an option: the interface is long-established and userspace relies on
> it never failing.
>=20
> Userspace, however, cannot distinguish a genuinely low temperature from
> one the CPU could not measure. Until that commit it could: reading
> temp%d_input returned -EAGAIN. That signal was removed and nothing
> replaced it. Report the inverse of the valid bit through the standard hwm=
on
> temp%d_fault attribute. Its documented meaning is that the measurement
> for that channel should not be trusted. Tools built on libsensors consume
> the standard attribute.
>=20
> temp%d_input continues to ignore the valid bit. A new update_temp() helper
> refreshes the cached temperature and its fault state together, so both
> attributes are served from the same reading of the status register.
>=20
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-coretemp-t=
emp-fault-v1-0-1884f0ff97d5@linux.intel.com?part=3D3

