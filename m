Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A039733E
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883836; cv=none; b=DiHs98Wecz6Bvag/Oqh1poCoyOIj6+d5YiqENwdlT00ajIgIKB4l0R8PIf/WMadieEK2aoeItZuD7qVnXoZKBYtmt5JgqXUaHvKvcrcKIGdXr7rw3ws0ycKUyLCAMHcm8YyJcpm9Adi367HwWUMptR+cq5m42BsMzSdLehNbjMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883836; c=relaxed/simple;
	bh=Gl+Swk1dn461Tx4EjTwhkpaDP70S6FB1TJLZiQwopO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEp/3X+5FWNZC4NtVZ0+TRm/DhrI/iXKK7Kv5S869llqa0kuOxkxReok+G81Dr1KdCiTHrUYraGgStyZi3+3PMxYHWah7RPHixVqwp1wXGryBTC4Lq+FOpT50L5MnXg8+t768efjozhVIuyrUgOHPX4C8mLQZ/1ydPUlnhLSmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNWc5Fnu; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNWc5Fnu"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so3304095b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 09:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883833; x=1789488633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FBzAEPvhV3BtFCxgHkQSHE7fPChGhBuXoruAGzCkmWk=;
        b=hNWc5Fnux8tGT7viaOITZwZdYS0A6iYjMRq8lNUAZEY2zOOZ7NZCKtmqK64jrpI0wb
         gIxCptd6CUR70u33SUHCo8+zcjDmspoVKANabu1JvdFmlUkL9vFlzGCo8QT/IYeQFqn+
         cV3l14NEofDCv+L1IvYVfhSOtDVk9LeBgtuSaivuKNgFmkFcjTTavtq+ETmQnpVtt5A3
         /8YDwMOOjnj8gPdxgrJBvavYTMZqg0EnP6G3Vq7F7j6t1cBZS7CorFZah6BZS4jE+UH8
         PEGNfBhnorIoemxq28Thp0+6JcUMDCrUvTrKFXnN+YRj6yKh/ZQZciGdHrCRtkpd1RdQ
         fxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883833; x=1789488633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBzAEPvhV3BtFCxgHkQSHE7fPChGhBuXoruAGzCkmWk=;
        b=g5rJYwR8nDp8poWlvLsGhUfZlvfymarYybGGL40mivY2WPbJqloflBNjewkUD7m9OP
         NRrvc4iejic3HWYbnUhe5sAe0xLaTYmoY4XoLW1uTHS7fgDSgxovSAZEBzSO/WAX7yKa
         nUOlp5P0OFOhbM1D22cp3d6fh6ZFNM2h4aNmm6KYMRvH05tDrhI7pWiQHSchInZiqDY7
         wdLcVL00UXFNHJC8cPNJitn4n5+nvJ4zyy68TZt/g0pq08NRW1MXcjwqSLKocEnQCh+K
         xzK0GHVxVxeKUryGd8rLozBwSdDP/sg2sqSYjxYTwx8sxE71He1A9KzqSRpsE69L3ViO
         oPGg==
X-Forwarded-Encrypted: i=1; AKwUvBx23zn4plp9tXYYfVliPZphhq4fSMEyrx/miDoXPB98pMRQ6DIffdcAXjrY2g4PMlQwXh9CsS7dNl7Qjw==@vger.kernel.org
X-Gm-Message-State: AFuF++lz/RKLmmlmX++jL/anol0+0Hm68+3p3oaTRPPE4EKs0hv1h7EG
	7epeguGug1wa7mJRaz91BGKcryq2iw5thLOj+UQJjeMEbCPtmAC90sM5
X-Gm-Gg: AYBFou0VryDAg6RNvBMyOVBYE8AvifToYKp8Msjh++/FXB6Gdek4YT/zL14XKqRaJW7
	ZcoJiMmzDVlc+TeXVV2sRahFpUzEEirr6UfDCdAeddMwQFX3ita/pEqjCdVlSPPXgDp0w6jSbWk
	T+uwNSAa+8T73YlNvsxXPn04AU9028YVnUbYdMPVxLpl4vQIfZZah9BVDkRFT0sSUhpDUi4pq0c
	QQOumBlp9D2Ls3ywJ+FVH/bSuOa3cEcJxC+5XdbYMr4PJQti9A3b6kHsCFaO8XmJ4c1ll8UGHue
	5ve9m6V86rDQ2pHGmB/kbabG32U/M3PLFgt3/C9mZvwbLYHadzZGW8E06X5zHhMZztaFiR5Ou6D
	gcHcdwgFWerUxe2b+KBHkvNgwx+mpfzl74PNhuy/YQ9lRFzLeDM2jsGwuSbK1md/OHnKHTiinOq
	GxSGpqhPXXCuSQFO1eZeh6MHsm5/1UMpK+ixLPdqc66bUjV1lPgH9j51fDvLxY0dIMPpyZ5NW6g
	m/w6IfToiC7
X-Received: by 2002:a05:6a00:b94:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-861660e2f8amr39694011b3a.4.1788883832664;
        Tue, 08 Sep 2026 09:10:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e39a38sm5766013b3a.39.2026.09.08.09.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:10:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:10:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Carl Lee <carl.lee@amd.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/ltc4286) Add writable shunt_resistor
 sysfs attribute
Message-ID: <49b1e36c-32d3-4511-979c-d04b2e80d1b8@roeck-us.net>
References: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-hwmon-pmbus-ltc4286-add-runtime-shunt-resistor-control-v2-1-5f47f7e5a1bb@amd.com>

On Mon, Sep 07, 2026 at 03:58:32PM +0800, Carl Lee wrote:
> The LTC4286/LTC4287 driver uses rsense to scale current and power
> telemetry. rsense is board-specific rather than a fixed device
> characteristic, and may differ across qualified BOM variants using the
> same software image.
> 
> If rsense does not match the installed board configuration, current and
> power readings are mis-scaled.
> 
> Add a writable shunt_resistor sysfs attribute so userspace can update
> the board calibration value after platform identification. Initialize
> rsense from shunt-resistor-micro-ohms as before (or the existing default
> when absent), and validate runtime updates before recalculating the
> current/power scaling coefficients.
> 
> Signed-off-by: Carl Lee <carl.lee@amd.com>

Applied.

Thanks,
Guenter
