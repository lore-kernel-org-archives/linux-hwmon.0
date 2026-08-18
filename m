Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99823ED5E
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096198; cv=none; b=gHexeum4/fpaOekaHti9p5dNj74WirunR5WmIyJ60xEXB1u918GWwhJCIQCE4qjqPSINYV2m2BoehIyQjTJYB+ORXMvnxJ6WvHE0dirTaMAhVtcUUZNRcjY4S60YPD+8Ym7sIQ7s24by2wmbpX6YbFhG/66ZoBtnmiDi/TKtiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096198; c=relaxed/simple;
	bh=04/k0HG1eRbygsQ7nkV1skRD84HVvidkF82cWdZsu4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBlRlpWbPgRpi+RSJzy/idj5Nh28u1AWxDJgTqZCrrF/IW5MiEeXI2cE0Y/yThSFm9ZSE7pDtZYyRFeY+qnxYJ6c2OglwPSZGADp45+YreQotObY05gZAg9c+KT8M8TnBhEKqH6AFaeaypY+qPR5Olr4ed3IIyHUI1kIDEWcllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLvtGhuB; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLvtGhuB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso427941a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096196; x=1787700996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EGd/77iz2abHF5y4GuEtLKn0yrAYtLez+CqQGXBQpE=;
        b=JLvtGhuBRA8o08zhZ33nqqkHKpVSRHxwOyA+30Hj8MiWwnyI6DI7jKKNw2uv9XGuJ+
         L5nDjYkyg2SC6Z5f0tLsvLxiMv7rpP6KJKDjKP/KNgmBxL/hEhLq2xp2q4SwOeSedjLf
         /TtujYxbWNebHkP4M43Hj3yXgVxoS/wjbgP1/fhLA4pIH4rg3rNE3sLDULptdz3sN9kt
         Uelfo7lWhbufai/YStfqHWpkvM1RXP9tlOrEI2TS0JwbgTpXfg2HTbxHxnPL87YUuo1G
         4WG1L02oiPh0NXrbnbGi/rkZUVykKxb8hMyIBtVf2QBaxBIloCxOqvirG3uuo97r918q
         p9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096196; x=1787700996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EGd/77iz2abHF5y4GuEtLKn0yrAYtLez+CqQGXBQpE=;
        b=XkIAga3NTtQdWqKSkd2SdlY82ugQMiI+7/Asjwm/x8MnkKwhjYYL5P5mp8bgLS6JXA
         +qawWTBRtGb+fHPVzR7PxPn72CHj6aWXzeTmKOnuH4RlLRLYdtzOJOM54wE13OAEkc7x
         m+vKTnkVxHq7wlg4gGvtBV6HamvE6B86CubX3hYI0oni2X/9w6M5Bw5mKm64ki3PpkOm
         9P2x9z9qtE5xLBI+MHqHdGclorC+65IFOv0KgtJrfspNRWa73WwJSuK03hLbF12WqaGz
         fDF4T37b/pA5Uu7UWpdVY8z3ThfHQY7BvDE6nLxJAiv49l91bM+qKDqoJW3Caike+UK1
         VxBw==
X-Gm-Message-State: AOJu0YwrMxGKEQmyAieHrrq2la7Y0nHxBR7B1ftCvzQaoeClqVdcrHa1
	QHsfS8khk9MTbhV3gEnFpRzT1dICOzCdeYV4IYh5lHM+OE9n8yEdVSKW
X-Gm-Gg: AR+sD100SRuBJ9UdrHZKq6HvhKTyILQhVLUE9Np8fq4qiVGpZCM4jBBpBl67E72xdaH
	2rPxNlw9OEHd4CplvTGDlRVY4z8XAFvZ014fie8Csm7kKUNvDIXemUsoisfo8fUc/dsBmSqFu5n
	ZRgcSu4obFSiGPlVSXr11Wma30eTGoYgGUj78Gp7ZRkJoezOPIKTuL/ZoU03B/+hVl6hnJMJNbb
	Hzm7Jp83PynqYrwopNpCLOCguAsMRhHoHjHsCcQttuwgcvaKWwu/6jUfODlZcCT2aOwgLc5THEb
	8gT5exoHjOLgs63fPU4UOm8bmp6cw4GkY3VrJIavvmnc+PZawgrKlUziAwZ/IBouX571doaIZDi
	D3OFv+bkzsoaModNaQ2R+yTJLw+iLeMAcu8okqDKamQ/IGjxSUb1HNVLwELFELLZ82BasM/2A1v
	mOf55pNnCy0mOUNjwe55TEpVNEJM557Zo7ODm+dtsVuyak5GN8nDp4N9wb++mEEG5ux9EOyzRhG
	A==
X-Received: by 2002:a17:90b:5484:b0:380:f389:447b with SMTP id 98e67ed59e1d1-395810840ccmr900386a91.11.1787096196075;
        Tue, 18 Aug 2026 16:36:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10a94dsm558957eec.15.2026.08.18.16.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:36:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:36:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nikita Dubrovskih <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: Add fan monitoring support for HONOR FMI-XX
Message-ID: <facb9524-b665-459f-b522-ded46d5bb57c@roeck-us.net>
References: <20260812192242.859307-1-testname142@gmail.com>
 <20260813091411.1186193-1-testname142@gmail.com>
 <20260815232405.2107574-1-testname142@gmail.com>
 <20260815234041.2262291-1-testname142@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815234041.2262291-1-testname142@gmail.com>

On Sun, Aug 16, 2026 at 02:40:41AM +0300, Nikita Dubrovskih wrote:
> The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
> It returns a status byte and a 16-bit fan speed in RPM for either of two
> firmware channels.
> 
> Add a DMI-restricted, read-only hwmon driver using that firmware
> interface. The driver deliberately exposes no fan control or direct
> Embedded Controller access.
> 
> The interface was validated on firmware 1.09 with fan channel 0
> reporting approximately 2500-2800 RPM. Channel 1 is readable and
> remained at 0 RPM during idle and a short CPU load.
> 
> Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>

Queued for 7.4.

Thanks,
Guenter
