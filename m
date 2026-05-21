Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AEF383981
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 04:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779337163; cv=none; b=WKzWvjhWCSDpxA8++4jKIFMlwFlq6LE06Q6GCQKZOer+HvVxnrvr7U/GsjkmM0EH1Ai8A9ccnZES2Vu852LuOUX6zg1oNFOUHWG+7NQ7qQvzZnvmRgtDp1Ox9dspRj6+3Zes588vAeX4m4kbwywxg+ojdGZc0HVRV2YgiVud71o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779337163; c=relaxed/simple;
	bh=iPcpJtFGSYzYrJ8LH0k5fS9RCPo1IYvwyf9g7yfBK08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=id+zbZeQPMMQcexwPGR+3cPm4bSQ9be0z/uiEAMTR/FyeQkq6WRHzoVaqWGfpp28d1w33Z0wl0MUEIFvRcuPmBElMOHMPYOvxlsaUqQsoZWjGgz4+8/uoNL3fupEVaVqdXewGckOYkijqA6PySl0CuKLVYd+ty2KAL/fVAhA8N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYXfRZaP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYXfRZaP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE091F000E9;
	Thu, 21 May 2026 04:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779337152;
	bh=bcoLJ6uJglj1bAoDL29nRV0gRNnDFkUUO0prCCWogE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYXfRZaP6gTfCz6LwgY+42Nzdr4Tq+MITd9kpA8TdejoLu7DlogNK9jr/bJzVFio5
	 M2SBj3Mtsx231QZuRMuRNRGR/f/hOWPXB9WTrQqaGTjFfCGHtlctK9oq34a/0ziGFm
	 N6hgXqfImt40jv83a+HHCx7nuVWDSq7kQIMNmaak4t3wy9tYfoDXjbR+87B0ACynqG
	 NDOJu2v1nTgv6Qy2kkI0c8jNAC2nTfJjVvdfYnEGkDXf7OJemZBUvm6SH5zYtIV4yN
	 0dZ6ZEXPBF7nJRQ1RQLXuVVdmqaysDTGdhORfG7Zj7M7eZzlTiT7SmXNkWO6XXDcxy
	 UIYjK7p/JkB7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (lenovo-ec-sensors): Convert to
  devm_request_region()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kean Ren" <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260521035228.533317-2-rh_king@163.com>
References: <20260521035228.533317-2-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 04:19:11 +0000
Message-Id: <20260521041912.3AE091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Replace manual request_region()/release_region() with
> devm_request_region().  This lets the device-managed framework
> handle I/O region lifetime automatically and fixes:
>=20
> - A double release_region() when probe fails after acquiring the
>   I/O region: the probe error path releases it, and then
>   lenovo_ec_init() releases it again on the same error path.
>=20
> - A release-after-use window in lenovo_ec_exit() where
>   release_region() was called before platform_device_unregister(),
>   leaving the hwmon device active with a released I/O region.
>=20
> - Missing release_region() in lenovo_ec_probe() if
>   devm_hwmon_device_register_with_info() fails.
>=20
> Remove all four manual release_region() calls that are now handled
> automatically and replace request_region with
> devm_request_region, use dev_err replace pr_err.
>=20
> Also remove the now-unnecessary braces around the single-statement
> if body.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Kean Ren <rh_king@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521035228.5333=
17-1-rh_king@163.com?part=3D1

