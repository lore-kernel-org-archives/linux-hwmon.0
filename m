Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690412F0692
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557289; cv=none; b=t7VK7jpQyK62j4YNVMKS/0foWlo9ObShtogP2rLpib+KcAJ2vpOcWY47RJ28ODdz3UdpRteMLGdD8Rw2DniCrgRpYwbKb2FZFzqbGj5HqC7RyeS+s09DordOUL0krwxMGBdK/mgWUJjvkuRJIiunir+J+xMNsRDnqzPuJfbZNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557289; c=relaxed/simple;
	bh=c+xSJjw7i4qbPM+60yoCR5jMkiCHj4YMpg6knNXauSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTRtW6uzCsm1JSoZiXTWxzjpqAOlGOM9lEGnc9y5MQJWTatFXqq7n1Ch9SrTWu3lVpjUtS182y09mLnLcLWSs2nbnxIJKFNlqD1Qj4ukP0EJBLyyp1MZvQRSF34hQQM/Pw4FSXwiFgMZqbe/7gnC9eoBTBswhE8Yc1/Ia2wffv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dupx5p2g; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dupx5p2g"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b70abe3417so13907680eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 15:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769557286; x=1770162086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCOkQqPlSxl/vxOOv9v/6rWZvBeuFsDK5/IJXkKn7Ik=;
        b=Dupx5p2gBUGZAq4SS2h3aL7sB55dKmhA2avW3/YoHZ1XdJQEH7F743wQ5n06KD3Dry
         cI9Z/0Hj0sYng909ROj74ZCJ/n8kcpqARm6k+WagMHZaKCVscFm+/TikrxxBn4i4jWaA
         CYI2dTsD/4CsMnUlZ8UHqlsgmmlQWSGPGq+UipSKCRKyvwRHwAtnEW48AC3ldB8dFTL8
         3TQ0D2m6Iaj+ihZQEQtyt2MQNguDWqyKYKrcVuhjY+I8uE5hFhoJUYffD0X1bd071/n3
         UultiBbRU11ajqsgaDo5iHHNQjg6ObBCozOEgE4AhNAyY/BJMR2YmEuri8x97KlroaZG
         o6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557286; x=1770162086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mCOkQqPlSxl/vxOOv9v/6rWZvBeuFsDK5/IJXkKn7Ik=;
        b=gAb44NoYb0SLYoBNE2WE8LPi75VkUPK/TG8ispSOWWNwL5IXFsEPeplY4KxM1Z8haj
         8LHIpG7SCPmDSYhFDyUBarzmrZ8F4vFpKdyLYg4ApHlOJilk4h2t5Em4FmPYMnDvQGR7
         OkBR9+cEL2jANdtxESTu1Rb0EJZ4rvZiZHA/NNaAhc+UkyS7LtkW+OCJJ96k3HUiGMhJ
         9Fr0b55L31icZ3JULQ5cDR/TXcWT4lEQMrt7PstHuJNxCHjqLn7xrax2tYVUJf51f0c9
         ztha2wDFv26iU7cKva1kZ6ekaWWHmdyEraNO7+susd+Kq1ZIvNCLd61townZeHGp4avO
         8SyA==
X-Forwarded-Encrypted: i=1; AJvYcCXh4SCNq4dShPvM7Z+ADVScLM1rKRK1PQ8E3T3EpwOHAMk9+hsm+tBAyo+Uv945SubROEXEXReImTQmFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHW++e0nLEZaQVx9joGQTMDBa0CtpSBVYEcH+wiLxMUb7NoYV+
	3R0KSnlCXk8YfamGLIGvwRzbDX6MLyJzfaCcztDkaGJ1eoofvdQqTK0J
X-Gm-Gg: AZuq6aJAdBow1ZZ2eAf3342ioStQGwjKhZa2Lan38aOa5Y17ju2CBq+4/0xsZuqV87H
	rLETGdXKni7r2AdznMZLbuQsE7Fj3RFUFsubbP10IUmWudRcwHr1Aaqw1m05j9SppKvjkjOHIxz
	pySaduQI1cLWOcnoj8RfPIufjVX3UnAHtRHa7v6AuXRZnFp8wmw/UUn5F7NHaHRoVF3DMcPiAsW
	FhH0RWNR3tljTqTcoWNatOo4GtERKmqqP/fmsPytbDZHlkDTqLbz2gKvjLL4Rbud+XkTUEH4E+9
	ttLXL0It/BbXVv417F84cMSGqv+z3QCGpDB4gfVAivikRVHrEGA17g6Re02sesg5RRh1juODyPj
	yklstPcJE7XF3rcyNkV1IIBSXy9LqwDihnRDzh3iotwPQxqRy2A4WTEdjnnZblq2lde9yWYT2r6
	c8stbLcl295k7VAoahm+ICahFB
X-Received: by 2002:a05:7300:fd0b:b0:2a4:3593:9697 with SMTP id 5a478bee46e88-2b78d9b5803mr2428859eec.20.1769557286439;
        Tue, 27 Jan 2026 15:41:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm337818eec.6.2026.01.27.15.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 15:41:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 15:41:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
Message-ID: <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>
References: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net>
 <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com>

Hi,

On Tue, Jan 27, 2026 at 10:23:24PM +0300, TINSAE TADESSE wrote:
> 
> Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the issue on
> affected platforms,
> even without any code changes. This confirms that the failures are
> triggered specifically by automatic
> SPD5118 instantiation on systems where the i801 controller enforces
> SPD Write Disable.

Thanks for confirming. Can you try if the patch below fixes the problem ?
It is a wild shot, but it might be worth a try.

Thanks,
Guenter

---
From b44c31c2c779a67827e3144b818cf21f5efacea1 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 27 Jan 2026 15:32:32 -0800
Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in
 probe function

Instantiating the driver does not make sense if the temperature sensor
is disabled, so enable it unconditionally in the probe function.

If that fails, write operations to the chip are likely disabled
by the I2C controller. Bail out with an eror message if that happens.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..3e0e780014f9 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -552,6 +552,11 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
 	if (!spd5118_vendor_valid(bank, vendor))
 		return -ENODEV;
 
+	if (regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
+			       SPD5118_TS_DISABLE, 0) < 0)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to enable temperature sensor\n");
+
 	data->regmap = regmap;
 	mutex_init(&data->nvmem_lock);
 	dev_set_drvdata(dev, data);
-- 
2.45.2

