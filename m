Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE23ADB98
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088082; cv=none; b=JB4kyPJ296l5f0NnO7irZXA8hjVv71jm+oFiSaep3iV4xghqkc7JkSdz5AcPJCdLcFW8V5KFMfs1+Uq66h6ylinfY9fjQeY1SGMwOYUiIjZUkzDnEbOMGgFers10QybPmpfJ8JjVUX3/MItcvtsCdx0IebAvMaaxFpcc/yA+44A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088082; c=relaxed/simple;
	bh=ZTXrInarONXt5XVdyS25iDHIwZ8C7iQ32862ohvVdH4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e24kHY6VE1w8LEBkyDpHBT+wzHDquf1Q3DelI82F6xeB7bZN7fwxmjcQZ7p61gUWTf//ILYEoSDIPeTaCNxaymLWO006ruQQ2OYM4td2vQgUvBEcsNGii/X/H8O/LJjt1ei3H5UqPhQMpnpHY9GH70V7s6DidMFwAzuGI5GZbI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UR45uDHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR45uDHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4371F00893;
	Fri, 29 May 2026 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780088081;
	bh=ZTXrInarONXt5XVdyS25iDHIwZ8C7iQ32862ohvVdH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UR45uDHk75krEg6f0Z59B6GaNZL1BPOo5agFIaMGSqUM6qnLMO9figh1HfcMudaSD
	 GXYjrzbH1BK6lXrWx5sPGn7ulXiWi+CXHQuS579Z7Xj90WMhZsi9h1svjUn/JJqAiV
	 EXhyY8Q+l1lJcMu3vlNmuvcUFxqPwQHxWmzRf1TN5IapysJ/4wN/q0TAXDw0siZFwg
	 VhLRCO+A8Iff5WKgMLfyVTBe9/mWWrbfNwn6YXd3/Uy/1qOATkheDAnnL3E5bBbQvH
	 7xRjszIS4tiCRznrPpEuWAUmuNKaArSwJeKHNv2cs9oyhm73QfLO5EsrElfo/4wwdk
	 OhTDMyM/yj91Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 20:54:39 +0000
Message-Id: <20260529205440.CC4371F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ChromeOS EC APIs use integers representing degrees kelvin for
> temperatures. The default conversions from linux/units.h will then
> always convert these integer degrees celsius with a 150 millidegree
> offset. This is a bit confusing, as it also differs from other CrOS EC
> tooling. Internally the EC uses a kelvin to celsius offset of a round
> 273, so the current conversion is also not entirely accurate.
>=20
> Implement a custom conversion which preserves round values.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-cros_ec-hw=
mon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=3D1

