Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242E4594A
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471749; cv=none; b=NSnljWy+2eJ8U8eAAckKwc4jLQvDXiZwohiXrT0eDSxi9tTdGk3cbQ87sMlsN+P91uBLcorUlMx4wvVK9CiafFrTKFe9iOQl5ahClguXc4wfdQ+Rn1YAI2hNfXJUBh4P3/u8DcYIKkRrchBB5R2S9zGNO0/PPTmO+w0CWqo1i50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471749; c=relaxed/simple;
	bh=rK2PtXjn3jqhV6HCZZs3u4lbX1egUIpYzYwhCEti/C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1UyWaAHIpOvHFBOthh14ZSppXk3teK4uTQ1lvx8og8/o68KzsmOhecXV1CPRlLAGgYGnlOfV7yfoUs+4JbIw7rh5X48GP9UMBn715cXEOt0OG2YOneDxN7O9HVO8pLdDErsyVemtIcokXI77cwsFNbtnHqdUGSENUVmXawC6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hjb6vKGm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hjb6vKGm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso41453085ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471747; x=1785076547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGxQpu6DbEFbZMC8BTbqJAHmxCtesQu+mVg153D593Q=;
        b=Hjb6vKGmnj3NZnEJQLhO6brSTVo82CyJ+7F4cc0zt1n8Kjkb1ahNgO/c5jn64kWRri
         Gex+DPzFgujDhf9kHex54XM2w8U+Cc9HhutQCR2NB5yY0tY+IfHUIuHp7t0sBc7gwevX
         FdLDlvS2N8r3Y1HA0q/4hFnV6U1zltWa/L8IW6DLWvK6V03TXDOiian6YUG9+sHpmAvA
         23FB+WIEax/Z2Yr+Lr7TSDDQane8HhWaMDcvJke2deTckcKEuT13mI61P+8BCig9FOm6
         smbg2GnvS4KV7v1Xig5ahBiKgAVBgY37SZSg9RgKB8ZCvf64tvdwG3znQ1tymFacX0pM
         8HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471747; x=1785076547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGxQpu6DbEFbZMC8BTbqJAHmxCtesQu+mVg153D593Q=;
        b=Eyngc4+I5PHKhxgAG+XuzI9cKpD2w0l/1vXRtzhy80sii0CwP/801D+C2pXjM4E3gt
         B3+vmU6fkG8cy3cgxZD+Pc7j2mM0Q93gFFxs9mMCAbmmg8s3C8itBaMRu6f7fYMXMivR
         EVrvoCZpBgp2HXW6nGqc4WzXNN56HCOCtjxOKMZmLvCry3TbVX5HHkxB8gZ8UtqJRf6k
         U1t2ngYrPhsdE1MMV9AexFA2uwjfw/1elfk0t2UrRsXRKDfhj7k9T+uhIow+PgkG2nLe
         bVITYNQFCNrARBbI02lVuvtCCT1EloFqrGEbDvqiOMPOhDMeVZoy3fRRHlnDiselk19p
         OOLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2U3mgG1Vz4rlUi/ZAExYxPCx5orDfoKVAw3JmcIaYT5RcLTMsmRmkuZSMthDCSP6LoSpDEi/0Eku9ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIA9HFl4LXUc9gEXyp1nAOzP9iPjH8tyn7seIwGvdMQjnT/0DT
	JybPHyCL8SsFFdXk4n3Gb8IlPoxpMlx8RkfhKN5NizeIsk/FjB1hXXIO
X-Gm-Gg: AfdE7cnF2LReag/+Z6GQ9SApq7WxPvvS3VZJ+4pl6RkHlmV/rfC0pJN9OtSTnhqFqv6
	dI2WzaSgs8vjqF1WiW4jyKwfgfUHDiRGfKLA9kszxUWiqP+qBsZYgjmh4dTguHRgwPCqaLF++Ky
	jK9APNtreTAsUay1E0kAfq+W96keHMjYmY2Ep6RNF9gkQtn7JlzcoR5RwPhTrtBMAaajg3uWNk1
	2nU/r5QhHCgfMU+COLLTVdExINVhpAr6+lB32M2Ix8PW+7sFK4ssYHBT59Y2XnplK/VPtYPBlKA
	TpUwIFzoF92FhkBGei5mCTsa/oKGv9URN6ialeWE0GTZAkpzIRH7gnzabqDbHmZ/dkrElAg6UCm
	AcKxBHt+njjs4o08FtKyrvP76YAWiaglaWSlJwdbToSeGBNx60N0FkdTFbY5xBJWQviJHipHghm
	X4116ag589fcQ5o20=
X-Received: by 2002:a17:903:32ce:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2cf1f028edbmr160307485ad.0.1784471747422;
        Sun, 19 Jul 2026 07:35:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1353sm41322405ad.19.2026.07.19.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:35:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:35:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Sung-Chi Li <lschyi@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) Synchronize EC access from the
 thermal device callbacks
Message-ID: <b305afea-e28c-4a26-9c92-5bf2cd2b4f41@roeck-us.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>

On Sat, Jul 11, 2026 at 11:59:07AM +0200, Thomas Weiﬂschuh wrote:
> To guarantee consistency for the read-modify-write access in
> cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
> 
> Use the existing hwmon device lock to do so.
> 
> Fixes: 5798b62867b4 ("hwmon: (cros_ec) register fans into thermal framework cooling devices")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
