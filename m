Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EA48003D
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245492; cv=none; b=FReRf+W0HukJLAYdbaDpFtc2EhdXOsMm/as87t9UAXAeS8QSFRbrGe7g6E2gnLNo4mVrqXYoUyec2G06W5xB04cle8u+TIAlnXA4Iybc44BJ5oHBFqkqIhyFT9aBu0mfTRr7qJrbKyTBVa5SaUmPPn6c0PW6iJN8vpZ4fOPZoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245492; c=relaxed/simple;
	bh=8yneW7/ce5jia/xd5W7lkronOV4txO3UhZMPnr37t8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bCYkAYPjBe4lMe9kI9iEcxrWbyYioEoyuSWTQz8ZnxT3YLjsLbB/NX4Hmob13VVF3og1XKgCd9tH2Z9RAtDEYIiz687jesVgeLmOUogoDSbXrKtNWa6wY/lSlZOLkalyBNp06MzUAXxMo3+NWj5VomkuGN0fa8iX8pSZ7iM+2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRYPsx/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRYPsx/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB45A1F000E9;
	Wed, 20 May 2026 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779245491;
	bh=bdJqP1pI42SS+jm4/OJCyuAMcu92VCDCwPcfXUOhzko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eRYPsx/IeeijZsWrpkBrBiaInymJhqiCltgvmAVpt6LdhTFz0pEH30Z07EfLV6bQK
	 G4R3PbNhHIAVQrEppx4YqjzEV3gPG6WRXObIa9gCVKy0YjZD8Ro8sFd8c9MOurnQpA
	 N6YMgcL++toFWmOJBH56HzVgsqA8+0QfDg+fX2an1BPtenRT/MbYrOr9+L4UJj9kHi
	 pbn4qZoEXYTvZgGa9pmjm3hj5SkWw/e92HKNl/pvr+i3piZ+IwQkElrPZW6qm59IUA
	 jnjzLUmmCJCg+sfzRg0BVZb8E3V7XULMRAf8S9Om7nmQbhU3zI2NTai07AS5+D5n0d
	 Or7W7g/2n+MKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (lenovo-ec-sensors): Convert to
 devm_request_region()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kean Ren" <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520022946.17335-2-rh_king@163.com>
References: <20260520022946.17335-2-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 02:51:30 +0000
Message-Id: <20260520025130.DB45A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims to remove five `release_r=
egion()` calls and drop unnecessary braces, but only four calls were remove=
d and the braces were left intact.
--

commit e8c1e48be4d237988380d2577325024d4865618f
Author: Kean Ren <rh_king@163.com>

hwmon: (lenovo-ec-sensors): Convert to devm_request_region()

This commit replaces manual request_region() and release_region() calls
with devm_request_region() to allow the device-managed framework to
handle the I/O region lifetime automatically.

> Remove all five manual release_region() calls that are now handled
> automatically, and drop the unnecessary braces on the single-statement
> blocks that previously contained them.

[Severity: Medium]
Is this description accurate? The patch diff shows that only four
release_region() calls were removed.

> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-=
sensors.c
> index 8681bbf6665b1..45db49e189d3d 100644
> --- a/drivers/hwmon/lenovo-ec-sensors.c
> +++ b/drivers/hwmon/lenovo-ec-sensors.c
> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pd=
ev)
>  	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) !=3D 'C') &&
>  	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) !=3D 'H') &&
>  	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) !=3D 'P')) {
> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>  		return -ENODEV;
>  	}

[Severity: Medium]
This isn't a bug, but could these curly braces be removed? The commit
message mentions dropping the unnecessary braces on the single-statement
blocks, but they appear to have been left intact here.

[ ... ]

> @@ -607,7 +605,6 @@ static int __init lenovo_ec_init(void)
>  				       lenovo_ec_probe, NULL, 0, NULL, 0);
> =20
>  	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>  		return PTR_ERR(lenovo_ec_sensors_platform_device);
>  	}

[Severity: Medium]
Could the braces be removed from this block as well, to match the
description in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514011411.4167=
069-1-rh_king@163.com?part=3D1
