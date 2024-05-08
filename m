Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F14130A43
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 19:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715196066; cv=none; b=TgUVG7d4dwPmGwYcK6iJYncSw7XQZ8h1qNmrVpb5O39kFa2pchX7gsYHeVycu2H0ex+mQyBjuJJ5KaF0Zm/lWWqJ1D/zqNrJWP5sOPOgA9FjwWT/JjOkXOc+5kukIJziSCOahPpvjTNSDook4Gvh13EWVVMfKLlAXGmoMyXs6iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715196066; c=relaxed/simple;
	bh=/qza8YWWO5uoSXCRyrgSYFcV+jzxhetbdWSA03J8S8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8fJ10LgoNW6d8Ljmj/Juc+AVhWT2UNZbtF57sX+1weRQ/jo7VvtycXQii/D9JvGC1a7AiJ1AoKpgrTJYRZ27dDA8Y/oKQvYFHhD2aOZ2NTzqppDfDnfZEIwiZBEWukmCqlVz2OJXFzwX0Y2bkgxk+ITkTFwjMC66cHUBQyTykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmBHI6Fp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmBHI6Fp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ee38966529so9033135ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 May 2024 12:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715196064; x=1715800864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV9NJGQbCEhjeIOjYJ6S0UNLL5A2waOV96xKpnF4fik=;
        b=SmBHI6FppqCQ6dr5QKBVXzOQ3eBJ8aVGdPmLSHBFYMrp5/ntHXGfR3Kqbr65BBWmVC
         iFrCdRNOUa/d/oWzUhsMrYc1btipAqhag+FH0S6EgS3QZm7d2tjlYadEEKyioDuYGeVy
         +kOjDo56IcesBk6FKiDIFWXs8A5Yn6WbXk62YSy0gSU0pkx0p6kn5PHQKI8aHftiFdsQ
         GoD4d5kfwNXMSzzXu265rbjlPGRGzSd2PptxewXsEQvWdiM98662QgW/TAhy83NuDXe8
         wz12AsghmLIUUuGXrus0zB9hVzdGuD0IbHGF0xrtNfPtIMc6D9IaGXfoMOHc1cVRAENK
         n6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196064; x=1715800864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV9NJGQbCEhjeIOjYJ6S0UNLL5A2waOV96xKpnF4fik=;
        b=OCBVDYhICvIuBXS2xozEEjWMF9gIhSICEQ9P1Xl+oqr0/D4chcQ7oD8HUpLhSsPcil
         EZLSDYxpWdk8UHVGc4gmbiJYJCqxpx7/g+zPmGq5bgXmnmjfjYCztqVmZjJsgX0HhxZL
         j53P+XlqdNoCtmXe2LvYxKItVAVPD2krGiUL/Zp8r3f/X/P9g2qj7B3qSl0dHdoor8re
         IZweUn5IKn2SfIcCmR8e0GYhiOOYVt+0eRMWJn1/rclNVUWmKh8aVetJ4e3hRFM6Qtz2
         1EggiZGCETJeUKgEaugM0GlFUa018eqC4muG6F2cPlTO2jtk5yneCazzl3x6CG11C2X4
         PUvQ==
X-Gm-Message-State: AOJu0YxOdDX/y17F5Wf8IDwcmrvkafJlBKn0pqQuEMPwj4+o+GYk+trM
	omgpEDlUJoCg0laDAsrtorzh9iqDBNzSC6ToTtwBv4JJyEXYSBMTolWnLw==
X-Google-Smtp-Source: AGHT+IGZXYnpPxl2XocxxPbpY2qiQR3DP0v0iYJtAJcnHLo4UyXYnWJzD6N19sjwjgSjHAqWvmAWpw==
X-Received: by 2002:a17:902:ec85:b0:1e4:1fb8:321f with SMTP id d9443c01a7336-1eefa23bddemr9464605ad.20.1715196063902;
        Wed, 08 May 2024 12:21:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ld6-20020a170902fac600b001ec552ff7e0sm12209090plb.269.2024.05.08.12.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:21:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 8 May 2024 12:21:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lars Petter Mostad <larspm@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: Re: [PATCH v2] hwmon: (emc1403) Add support for EMC1428 and EMC1438.
Message-ID: <3d097b41-d5a0-4717-acf2-1d1152212d96@roeck-us.net>
References: <20240508131837.684391-1-lars.petter.mostad@appear.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508131837.684391-1-lars.petter.mostad@appear.net>

On Wed, May 08, 2024 at 03:18:37PM +0200, Lars Petter Mostad wrote:
> EMC1428 and EMC1438 are similar to EMC14xx, but have eight temperature
> channels, as well as signed data and limit registers. Chips currently
> supported by this driver have unsigned registers only.
> 
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>

checkpatch says:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Lars Petter Mostad <larspm@gmail.com>' != 'Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>'

Both have to be the same. Either consistently use the gmail address,
or (assuming you use gmail to send your e-mails) set up gmail to accept
lars.petter.mostad@appear.net as From address.

> ---
>  drivers/hwmon/emc1403.c | 121 ++++++++++++++++++++++++++++++++++++----

Please also update Documentation/hwmon/emc1403.rst.

Other than that, looks good. The changes pass my module test for all chips,
so I don't expect any problems. Please submit v2 with above changes.

Thanks,
Guenter
