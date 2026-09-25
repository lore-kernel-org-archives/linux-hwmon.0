Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64271272E56
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303533; cv=none; b=elhjU1asmehBniBvHQyhLRVtFi49yYm3I/ck2SYREz6UsqxVLNwUY5PeFRcTZmik3UzKaufKMndq3iwAtBU7mEuhHcWfKwvis0g43iqurnOupT3wvvPysz7KQqjk7T2/P+ddXlK8RwrySJU5609t78QUUZfaudNAtTjSESGH41g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303533; c=relaxed/simple;
	bh=CeV8D7cSQ8SDTEJ1s7FiiAbeWSWeq0UMjrOK/LAV1IU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sbDMauH1znxSmOoY5su5X02vy/lvvrM/BCvB4L3VY3V1Et/3uFveo/vq9air00C9Im9fK8CZZd0FcqfyttMQ1J0m4IguzKhCCME7B1R7hWCmWL6dLEQky9uWQdLaedenOyor53hxpN23pmSz/e9JraZC93M3An721iMwrsiYRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aihHAdev; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aihHAdev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC981F000FF;
	Fri, 25 Sep 2026 02:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790303532;
	bh=CeV8D7cSQ8SDTEJ1s7FiiAbeWSWeq0UMjrOK/LAV1IU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aihHAdevS+H9E+iy9h0uimihHaMllZvNFpNcMCRNyK3YBgzJBMIzhzcEOj22yfRj7
	 WRClwCZd7PsvQ1+Zsw2sJLCpPaprDE9rxZGEjBoP+BF/ct4eQ8wO3rnpM0luy47gNq
	 R5mqFwXaGIBvJmBiLf7/mXjjIC8voLK2Qg++gWkwIwXwkU2xa3WPNN4JNUCg2u2fwt
	 bzqBNg5pKw1rwXXK1DVZIwU1jzLpQeYqe5QQ3SxKBAnVeA+354atlXZIiIrlkRxuAm
	 LhS8aP3krPzrqUeRNULfBviRI/+PMb5jy/0CN7Rjl1lLyn3pGyjMUmdsMrc3rtpFCL
	 ZGHdHNBU6Kdpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (coretemp) Refresh the temperature on the
 first read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Neri" <ricardo.neri-calderon@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 02:32:11 +0000
Message-Id: <20260925023211.CDC981F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> show_temp() reads the status MSR only when the cached temperature is
> older than one second. Commit 5c0e64dde80f ("hwmon: (coretemp) Remove
> obsolete temp_data->valid") dropped the tdata->valid check that used to
> force the very first read, leaving that comparison as the only trigger.
>=20
> A never-updated temp_data carries a zero timestamp, which does not look
> stale on 32-bit kernels: jiffies starts 300 seconds short of wrapping,
> so the comparison stays false until jiffies wraps and passes HZ. For the
> first 301 seconds of uptime temp%d_input reports the zero left by the
> allocator rather than the CPU temperature. 64-bit kernels are
> unaffected: jiffies starts at a positive value there and does not wrap.
>=20
> Backdate the timestamp when the temperature data is allocated. One jiffy
> older than the caching interval is stale under either word size, and the
> first refresh overwrites it.
>=20
> Fixes: 5c0e64dde80f ("hwmon: (coretemp) Remove obsolete temp_data->valid")
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-coretemp-t=
emp-fault-v1-0-1884f0ff97d5@linux.intel.com?part=3D1

