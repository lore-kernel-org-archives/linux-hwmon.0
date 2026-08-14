Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3E47884D
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731673; cv=none; b=XzW+IVgH3wvvfSB1KUYdVMkcNS18J4CKzkLOZROdYO6e1xgzLvDzyJRtKvmcyhXgB6MqE8IAEHBtH9QScGZqGsNnhfTME6OryixvYOBnkJ+BcrI32Jwpai00LHWeuQJGpAM+eEbVwV8QRHwMab6v55c9VX31956OeYq0SFgisMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731673; c=relaxed/simple;
	bh=VJq6FhwXUxrP9GDaFqhTQqwX1Ca9gKJ7Z6g3XjHxZhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur49RK5D2QpUpW6/aEEk3IOfmVF/1c62M+qP7HtNKyvSLlw0FGTFHNU9Lb8k2oORtMvadStosew68KCUQ9ba2NJfrABNKwvtMlBngUOFBNxkIE/XoGH56OmEEnPtjYstTKNrvO7e2/7HpDcwwetroxzR89oGmf8LJp9aFU6/eVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ynx4pjME; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ynx4pjME"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc97653887so23373695ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786731671; x=1787336471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5/5jt4c2UiEluioT7c/0hhn3yFPqX13xGEKuWAR4H5Y=;
        b=Ynx4pjMEhUm4Xr6y3PX6+Gjd/LhznaBu5KufMg4MoohIX1FHCRk1j0XQS2Nyph4jwX
         J+nd3LyudNuH2eOy07t3bzJNKUzWip0mBhO5HOQyHO7zzGtet3/W4M+ENuO8FRU24OBf
         5U7656G0m2zmlGHNWk8Fi6E+pUFGaQCCym792ZfpDOzT9fUliTCrsU71hTCrPz6L4fQx
         GxmMEShtjnfIy8KEcWpEkKd2Q1kAvpPGzinTtIwk/U6K/aSUiWJpEhK1WdtE0TzhUPlU
         wlex3/7URUWB4u8yzXBPZPO/uH+PSU5b7NHzBhxqXjDpUN3z4iHexwyXPQwakqO3l7lO
         gMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731671; x=1787336471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/5jt4c2UiEluioT7c/0hhn3yFPqX13xGEKuWAR4H5Y=;
        b=I+KvcgZEdhsN28mFk312LLCEh/i0gaAAQxywyvaR2brvk+BXoZP0BHhP6oI3Io0RIz
         +/vayA3D2sAVoTJhTs3lPWcjk8bJdyLi/ADIR0ed65yyDEb+tXPeMow3SB3XMx9XVDqt
         4rTLKGzDpfRPuUcXYVI75It9+mLDyRzpw0x596tPlk+S/LCfkdTrHOMPKxisG5VjWY13
         AjgohCpLvec16E4Bdc9ejQFVfS5jYdfjhhoepcrNMbFWePTLsstDKdbhDSv53oRbTfHU
         TXmRADc3EfzsJlxSGP2TSC5U/LtiQ7aX1/Lw7DnNsufjj7cNbPiZ1KF2cScfww2Jx5uf
         Qqzg==
X-Forwarded-Encrypted: i=1; AHgh+RrrU6GEao9NGW/hqbTONPNGWG58haQ8ifAMIpQdf2BITcXhGr59rDx/8etUKdVI10I2v0M0hXeAaek1Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFqXyvFCidkKtZpYYkB5Y3t3bQC/fdlhGvhtkj+PeEUM4psen
	0E8EX7Q9aiK2bJ9c0+Uns9hB1n1FWpAnmh1VHECBwEtzy4JmuIy12B8V
X-Gm-Gg: AR+sD102b9RVVvGHoMBvGvgQ58YuA7RF2tvaTkJKjXUENqjPxgvX4rn13njlPIG0wby
	oHkYFAGgqNZ7TcpfH04GxN3eqqcaw9gQCZ6eNxXWcqvM455Hbx16QaXKUhSH4XepeAM7qYYOkM+
	M3wPc+7KZMTRl5Ewuh2elSir4ZlVEjVEEqoGFSXtjzSqINSvIsDcZJL4EeJNHCl3NWOCAnDwa+T
	U8xF6/p7lsuC1L1oUYakyau2KUvfrfolIL8W7TjMcdju45yd+3K7nWJptzifAwCip/ZzvsufcWl
	w5GWtoZpTVe3M62usvc9X5jDOyo64m/b319XutN5d0xfVSxaD6Y4NIqyqX7fk7JOvFes2gq1xPM
	nhBuSXNb/ilVNPIdyQPoHvWD9B1Ed9ROoxuDtaOlkHrykMoXwJPn96bStSGm440nRkgEHmyTzSW
	q1qAOYRwb3i5b7RmES047UZ/PXtV1d1j7B9Eww2T4rQ2y7na9vu6/6l7tGv5rS8fy6wFrB0UeXo
	A==
X-Received: by 2002:a17:903:1250:b0:2ca:62e:cc4f with SMTP id d9443c01a7336-2d3b0f6e3a0mr86513205ad.23.1786731670861;
        Fri, 14 Aug 2026 11:21:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm6920348eec.10.2026.08.14.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 11:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 14 Aug 2026 11:21:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 support
Message-ID: <8b1029da-c038-479f-90bb-b560fceb42de@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-3-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-3-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:31AM -0400, Arie Miller wrote:
> The ROG Ryujin III uses different report offsets and a different
> cooler-duty channel from the Ryujin II. It also lacks the separate
> external fan controller supplied with the older model.
> 
> Add model data and USB IDs for the Extreme and EVA Edition variants.
> Skip controller commands and hide the unavailable controller hwmon
> channels for these devices. Update the driver documentation, Kconfig
> text, and module description accordingly.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter
