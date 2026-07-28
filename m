Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287351DF74F
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200065; cv=none; b=E9k6zrgwbfzhocP+b8Gej46EQlIXQ8XAkcu6yQVGMlipncTLAt2n1fkdTxgkpgHyUwh7Jf7ofTbkFULvg8QQl2VhKftVHFwgIpKGr9FGJpy/xooGoikz1L6g4Ofo7HMnU51pVRC5zgXDs0R3joOArHi1mMrXAW1t3kIRhbdraNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200065; c=relaxed/simple;
	bh=r0vJ8VfV2TFecW2t6wzJl2TjGR6rrvcgiKuOD5aKdec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFTtzyg/BpOsXQy6+Ubi8zHBGQgVf6O0vj2tD/lb7iEkJd8afrSjyAjodXOC89aF4jx0i6UPEp9rCUw+Gvg9zu6kVYAAQcdbliIiZH/OKyRq2cVD0hHmus6zTSAgel/Om45gWrS60tjpngONHeHMQ9hTm2vJeVtly6T0v2wIH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiznIei5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiznIei5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacf197759so47204055ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200063; x=1785804863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+hUnMDzHN4xrSunfsprxWjWlx1Z/uBNyd7/o2VtlKrQ=;
        b=oiznIei5zS1nnVpc9YBiNX2hqzI+5NOvvk74Tez2q+PINDtJoYApwPZmA7JA2Sq7f2
         GWGsV/jLAub8b2I30D61L5ff0hJ0P9ljsiXPv0cOLbxlGUi5ni64eCGotHxIAYmchvDJ
         J/PV3PCINN94gn5Dx9VIAmogDs2NTEEqA3oxEISWIRn056bs7kepgegbB76QYZGHRIlH
         JTjvlYQt5WfEbw01LMXdxcAZqTtJFee8Pof3K3F54eeGkv9jqho2qaly8vIugKKegjxI
         IYIoQXMNBkBIOk7Ol9G2l34VNtFZKXkhk8xNSkF9H2nwZJzR15GFv4Srg7axf6FW9vlm
         Z4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200063; x=1785804863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hUnMDzHN4xrSunfsprxWjWlx1Z/uBNyd7/o2VtlKrQ=;
        b=DEoJz+IWq8DHxEhXhM64sYx0VtxpgKu41KdOGLk+CylMxZzAiQntRAJE18MswStYXu
         NOVJUa/JBrDmNoLdisBoltO2fNSvgzViZy5xOFN1nhK09cQtQtR/UiyxKtjRClR2AWat
         bZotbtv2OgB8Aqi0MZQgS3C7peBQbb12sjhj0ExyJajoSIr/yEdM+OQaze8q3kuci9UH
         j3vF3yqEIlzhYja6p+JxvBJpg2xCAxAsV0qSa7kV27PFXKoxGLtXJsOlINvsxxziejRO
         4CPFNf0InJ1w6P3mHzxl5iFlO3FfCVR5dfkWiWgd6+cspnsvN8wGLTiEc44J1VJekuxp
         mvXw==
X-Forwarded-Encrypted: i=1; AHgh+Ro267sFqtv/tbujw3fkLIYbgbafWyt1gSSgwUSGvXug13SQhGOnthsIYxppzpxlGiXs6G+rgpHBoz/09Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWss8tkjhZqHEgLgDIoryXSuUVmfKVMogH6KnztgMoWaztaj64
	vhXLev/x8RjOAJF6Y5ClyPEffTGpBOc0cUE0UlbNwSp7i3WABrcfwnt3
X-Gm-Gg: AR+sD13hKHxfYoyaaJyYOAADlunfRF9mN9/rZ1Of+0Q7DvWEwnA6VuQ0A4pIpe4GDtU
	1eZwJkyaMsnpUa182RKtfrHyhy0towAgroiZE0bSNGWI9I8gZaYFD+arUrtabNotj/KoAVduK88
	GZ7d6faRX50glSkc55KW4xrFTj5WNarJV2ps5rOf/bF/9/fui49xpG1GL4nYW8TuFwxV4CzQtV7
	OL0x1f5WPywdzSRZ937BLhj40veln75qBajfPwI4kwFO2tUQN+AZjiKG0KuS7bhqzL3lE21/aX3
	L0GCrTJNtRe1Khnp/VZH4/qD1lg/1yzEQWr7+sHtAgOSJviFNyWwxd0Y7pYUuRpgLygK8lT4slv
	OqJm1ZHQxFGFAVPMJaAXDcZEA7Et4FXx57Lfu7ExlbCz5ybGos7YyZXvYo80YiPYmqpE6CZrGtf
	epiwcw5AhOUrLzfQA=
X-Received: by 2002:a17:902:e945:b0:2cc:ee78:3236 with SMTP id d9443c01a7336-2d015f38fe1mr1738055ad.33.1785200063153;
        Mon, 27 Jul 2026 17:54:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b451sm43285155ad.13.2026.07.27.17.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:54:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:54:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [hwmon PATCH v2 2/8] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
Message-ID: <3a15c09c-0e1f-4752-8df2-fa74752b0ebf@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-2-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-2-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:18PM -0300, Luiz Angelo Daros de Luca wrote:
> adt7470_temp_write() and adt7470_pwm_write() update the driver's
> cached values (temp_min, temp_max, pwm_input, pwm_enable) before issuing
> the corresponding regmap_write(), and never check whether the write
> succeeded before committing that update. If the I2C transaction fails,
> the function correctly propagates the error to the caller, but the cache
> silently keeps the new value, which was never actually applied to the
> hardware. Subsequent reads then report a value that does not match the
> device state.
> 
> Reorder both write paths to update the cache only after a successful
> regmap_write(), so the cache always reflects what was actually
> written to the hardware.
> 
> Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
