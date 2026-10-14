Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2C34A35
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002857; cv=none; b=iXeif8WPtGasN59CZzLh/esSl12oV9slq+H29hDZRerACHh9THrq+KE8Ywr4dG37OF54iFw6u1bXPi6nBr0gAMX6fRslzNzC099nyUbJBJ1FpVEvutOXgfyfHLWt6BJuzPl/coxMeyrQT8W7VkQqm3MPa75ekm4SGZg6R25AIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002857; c=relaxed/simple;
	bh=uM3hAO0Q6WWgDjdxXtli7SucMY1G21eNVy7tiqFMfLg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=La25fv3/e9i2Wat6O5XuIkuu9ZlHk+j9/Wphrxbj5+j3i2stMcNAsg4wjX6KmrKcCb+m/ual9DzpUaIuZuhqe2ISYJGEKVWwOaShEt2W4AvyD5rmxdXyPQTJfropdVXGtoFubobtXrjyh7CWkZssYngfhweIjvDH1DL+Gl/4VYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2Xs/O1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2Xs/O1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2531F000C4;
	Wed, 14 Oct 2026 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002856;
	bh=uM3hAO0Q6WWgDjdxXtli7SucMY1G21eNVy7tiqFMfLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2Xs/O1hVkbtpJj9pLSCcSpS/UfWwXbl0mKfkBecbkhvH4QWlCryAeUcksqjkgOaU
	 7B08Yhr97/olmxDflv/XlXyMQ2sGnPjDRZDhxx1eVGGwAcSK1u45GkHn6mxfWq1aKY
	 v7lgVMIk98mBMmd5xqXt439aZ4Jk6caY/UH0Z6SvRpu43IVrl8b6uaGVFE4D/6a7Ds
	 kLIkMxbDXNW2qSNiPfkaRaUuavtxspdJUhYJqP6rSOQvaFhdTlO/Ed9n4Uxf2TFtFS
	 tzAHfDSXQWetaQpnq23eO1LrBiJh8albpEH71tYX5bWO94b8mwMI1AlJknEp+lnEDG
	 AVbZ0fxd1olYA==
Message-ID: <sashiko-outbox-171707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/11] hwmon: chipcap2: disable device after hwmon
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-6-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-6-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:34:15 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> cc2_remove() disables the device while the device-managed hwmon device is
> still registered. A concurrent sysfs callback can then enable the device
> after it has been disabled during removal.
>=20
> Register a device-managed disable action before registering the hwmon
> device, so devres unregisters the hwmon device before disabling the
> physical device.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D6

