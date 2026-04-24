Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808564
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 01:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776992623; cv=none; b=qra5xapLxM9pZZW/eh/2vslCMzSbCeIlERTrz7YLSMnP2SlCaYZyoKQUPa8Pb6Zv8j7pIz8SkVNdRmbth/Jw2Z5rldUv99RSPwKbBO/xBqkmiHUpbY5qn52ZEaj/19UhEeJITXLwpqKiVqlPbhjQHlg3INJ1EkEifxIpRDU6EmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776992623; c=relaxed/simple;
	bh=j2S95j+pkufrL4BBvG8sztekSvkXCK25hLJiHYifOmM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kxvkbNU11Xc4rz4PQXUWrHRLBoSLEf+NfgG80hBdRwlv50rkEd9lyq6Cwtn99sV+TNn+yQxO9wrj7NuZvVfdABl48J/tnZKXy3j793fwr+JsAvXRIpkqIavf6AkJ8u2DbeDJXUqJcEz8G2hxUcn1tac3oORxtYG6JLx8mT2cQYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9bBJKPU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9bBJKPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB42FC2BCAF;
	Fri, 24 Apr 2026 01:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776992622;
	bh=j2S95j+pkufrL4BBvG8sztekSvkXCK25hLJiHYifOmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=L9bBJKPUSzaj1hp4IGqYOs3zhukKfkWCsQZ9h9Umy0w25glxjKesOyVpUb2jqVbwR
	 go5frWt8cRj5rasEZLW6vs4hwZyiOM7P7iY7nsyioUQBwRv94ImLABx4o9G+REgOba
	 +viRv0zXxFlkty2H5BzeE+CavNm0Mn8+DBwVZa9Igd6RFRSW5chBP1DyDhogVb5BW8
	 MGDYyvuu30KqOn32eGAiP+8AQZMy9xuPHsUx+DNR3EmWlu+c1w/c6RaqMO3kSXBAXF
	 3y/dEn93OyIExT+aMCmeIyhktRwKobuofAF3sY/9UxHVlCBOD3/Mow/9XFCe9GYcEa
	 bDsqrovVbY3hQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/13] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-12-akhilrajeev@nvidia.com>
References: <20260423085718.70762-12-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 01:03:42 +0000
Message-Id: <20260424010342.BB42FC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Medium] The driver violates hwmon subsystem locking rules by using a cus=
tom `nvmem_lock`, and correcting this exposes an initialization order race =
condition where the NVMEM interface is exposed before the hwmon device is r=
egistered.
--

commit 8460c5a9338d8916bf61ccb3e598518750ec6cf9
Author: Akhil R <akhilrajeev@nvidia.com>

hwmon: spd5118: Remove 16-bit addressing

This commit removes 16-bit addressing support for the spd5118 driver,
as it is not required for I3C and has no known users. It updates the
regmap configuration and probe functions to only use 8-bit addressing.

> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0ce..8fdde35e68cd3f 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -78,7 +75,6 @@ static const unsigned short normal_i2c[] =3D {
>  struct spd5118_data {
>  	struct regmap *regmap;
>  	struct mutex nvmem_lock;
> -	bool is_16bit;
>  };

Does this custom lock violate the hwmon subsystem locking guidelines?

The guidelines state that drivers must serialize attributes registered by
other means using hwmon_lock() and hwmon_unlock().

If this code is updated to comply with the guideline by replacing
nvmem_lock with hwmon_lock(data->hwmon_dev), could it expose a race
condition during initialization?

Looking at spd5118_common_probe():

spd5118_common_probe()
    spd5118_nvmem_init(dev, data);
    ...
    hwmon_dev =3D devm_hwmon_device_register_with_info(dev, ...);

Since spd5118_nvmem_init() is called before the hwmon device is registered,
would this expose the nvmem sysfs file to userspace while the hwmon
locking context is still unregistered, potentially leading to a NULL
pointer dereference?

Should the hwmon device registration happen before the nvmem device
registration to prevent this sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D11
