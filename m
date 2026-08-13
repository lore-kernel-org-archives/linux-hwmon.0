Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16099432BF2
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621920; cv=none; b=ZOx2ZNyXmWlF+Cn5xvpqVnpk9V/hQ2y5RtN14OExdJKTjpXmp1yqNMba0mR1MlKbut1J+4415cEGM3ilxmmFkqBqBCTDKqGlNc4bVAZYTSq/VCYr7O+LEvMcNXThDhzrv/+OVAZlQvW7lE/VP2Oi9NnWuHmE5d1OXB7Ado3RBTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621920; c=relaxed/simple;
	bh=p5pHnp+9S5RtwcRJ0lEuOmNMxlIkwhV1p5+PO2aBxtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daYHuVfhhqNTes/HXZ2CO0UlEr71IDFsVifZ5gxhVFD/SjJ9Kn8Apy17C+HLOy1YT8fdOwsLBB6jyKyFBokKWIbuIDsMS/8I02OX/bu6efBPWQ4WtlGTnZ9JRmtHbsen2grcAWrY4JTA3hWL0tnzTvuQI+ZszJUrsEU0P5I5DmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRqf66st; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRqf66st"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2438479b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786621918; x=1787226718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77d+xiviSlKsXMp+buFtaLWBATIvyNaSwPxIW6LaiDY=;
        b=nRqf66sts1+0tfMuVTlmKTNB/crbGihO8meACX4nW7w6Zp2iNvx4ol06/iUN51jt1h
         A9w1ZlpnTRrhUYurIEaquDkHdj8Kv2Fh0a8/LZCFj7pOyW0e/0F/aVIviHM08kxFLO8y
         kycAsq1sbWE0J8CeJpdGNZN3rRar70ojZ9bbOdx0Pt0YhF5SJb9qoYNA/2ZGstEqguSx
         OWlkFTKm/sbpIBeECzwbRVm43mGwwpKcTpM0SIpJ3zjT70RWKVJu0n4/ZNWOFL2SVfAw
         QJNlX//Kk0CHW8oXZ5KDWZia8vlxWpJGy5ycb8M91/tJshhow/PYFoaRR3yLZ9Iqbfz5
         vEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621918; x=1787226718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77d+xiviSlKsXMp+buFtaLWBATIvyNaSwPxIW6LaiDY=;
        b=oUov5p4f8lxoZPNjY8s0ReorCWZ2feVCumHXOa7XorC0jYiCDF0TnSASogz6VZMxUE
         FHFfJSdR1eRwVuKNOyZ50aTVfA294dF2JFHIqq+oPqnTWIOLpeG2msYhWq/uqNjv688n
         sPwFUnLfGL69lEKFYQviknMtAgM0OUp/MiPjGgjxHpytIwmIflBZluFHCoeZnHlEHqom
         vdDkwqBK0dLCvgp3FTy9qj63AVKft8lD+KOq95UYM5YCddfMBEeIJTAPU8glHOK4QbXh
         5UWForaE+U2RC+P6IBI3k5Nm0hQxKpAulghaGHZAsIhW2tpNpUcF2/C25SD5u2tFH6oX
         iAfg==
X-Gm-Message-State: AOJu0YxDQphnGHDO3ddZIeY0nkTLmpHvjI2RWjwdVCY1GUxnSct5OD4J
	//qCcoxlUw+J/UDKgOwXbC6xqhRvwrPxJEedJVrgJ8tux+8DJJ9niw6v
X-Gm-Gg: AR+sD13WgpftJhaQLFJL7menL3ylD/4fOxP2cLkXxnDfMPYTDNoiTkXEY5ElyYDiSMg
	W12JxniQGeOob+Sj60N4YPIXgFLaodTJnxYQ0SfiBxh8eVtyZ1+xPZhbA2VsHugXsGO3yh3wtdx
	3JZkVFOZExCMrFpXOtG4d1qGQnv9vOvzZWMKt3wtE7PrFRiXQ0Y/QzY7Fixj8hir4Lneas41YmF
	kQ2fl++BkiM1EbVGCwERq+7SgL8cDQhpVOYODYTQlTPvL13Ldb7UXGw6gpZFb79QFO0rSz2m1vc
	fyIIveheof1/yv47a9mC/1jyHAbxMTFwtWQLxoMrDsyB+C773rP6c1FpHPUGbtu7ygBf07+AMxI
	fzh9Pb8X16Tqvre54hdMZr4z1RbJ3/jMPiTNxg359hXV/2Pl5miI1IqAcwohCySb7jyeo1FSgDp
	22MdT79EvYmmDhs4HGRjooxRL7ULQ5pPrrFbcoamxhMWbFDKHGPWQt9YmF1fEBFAEPB3vSPfu9W
	8MjSgYa9+yS
X-Received: by 2002:a05:6a00:1889:b0:84e:1da9:6a53 with SMTP id d2e1a72fcca58-84fc75c3fbfmr4525895b3a.19.1786621918169;
        Thu, 13 Aug 2026 04:51:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4566f8csm750421b3a.2.2026.08.13.04.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:51:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Aug 2026 04:51:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp102) Add TMP113 device ID
Message-ID: <1cf0f701-e52d-4adf-91c9-e6b1a8753acc@roeck-us.net>
References: <20260813090456.70816-1-marex@nabladev.com>
 <20260813090456.70816-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813090456.70816-2-marex@nabladev.com>

On Thu, Aug 13, 2026 at 11:04:24AM +0200, Marek Vasut wrote:
> The TMP113 temperature sensor part is register compatible with TMP102,
> add non-DT I2C device ID. Unlike TMP102 and TMP110, the TMP113 does
> have additional unique ID registers, those are currently unused.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied.

Thanks,
Guenter

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/hwmon/tmp102.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 26c461e95175b..50a8b050d8da1 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -397,6 +397,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume
>  static const struct i2c_device_id tmp102_id[] = {
>  	{ .name = "tmp102" },
>  	{ .name = "tmp110" },
> +	{ .name = "tmp113" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp102_id);
