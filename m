Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005CC26B75B
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341223; cv=none; b=Og1WrO1GaimpLsRszFru+/eZtHnlUql0TYiT3BE5DEfeWMOFP5TdveEcGixefyCnV123lZ7jdDa5dnocZb8biyXkO+l5+L0uXav6CdH0yB54oG+Y3b5xoFQES1n5NHsZkuIG0bmY6E4l3c26bOUEaeFAL7K4C3NO/yxHgCdRtiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341223; c=relaxed/simple;
	bh=90ABeSQWds/sn2w99N2BJPg8+8uGqH/ToAzyW/wK/8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yf0qOxenNZN/cyliYCIC14HmZZx8mBjsZym3rlupw7CdR+Tx5TL/qzhwO3fVzVzClu2QxP0pVHqmFDkNziEl/gFC6xpbynAPfAeCrs2qIzQHjS76Epc6RinDFEgQQYmkCmgKsR0lmG6qEqWrjqh/od5xdlboc/mvIpa+LrOhpqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK4LbZuT; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK4LbZuT"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1329507c387so2859651c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341221; x=1778946021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIunFsTg35qiBdjtt8jGYanfPNrLdcpPoJiWvKofhfQ=;
        b=RK4LbZuTX8yjgCbR71Wkmypz/DH4oSMxN7dmayOVLp928o5DxIAlrOmuDqv/eLEb7x
         dqbFpxzcRa4Q1jeZ7uXqqgPyGbtWWKH+ZQ27IiUtRnVf4DKiH6kfYzEjW50oplKoB1AY
         bBzMrUWuiog0YdrYJ+YuGJ+svSyNzkczqjkLVDm2S8GV8QIV662rnc0WQKPQX55fkrDH
         g0yMSyQn5YhGMnZPVD0+6Yd9LVpsD8dFHCloOMBFRzflGNrmJbAqdW0b5uD5mduMNI/H
         T4MLuxUlAAia9wciifDp3VAtqrVmMbeo0YNPVKdOYSsmbcUvFb4kYQZcZ6bNazhJnciQ
         72Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341221; x=1778946021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wIunFsTg35qiBdjtt8jGYanfPNrLdcpPoJiWvKofhfQ=;
        b=JaJW2iDs5TPaO0osyvYRmvmkKL3Ch2kyBqIz2FiEyOa0X+hHO9HbGqU9ZsJ7oKx372
         z2EMzE0aP0Dzy4UJF2aWaX0zjOlTaq4aN6Z6KPXU8Xwy8rvMYgYV43grPDjIRRiBgF8J
         hDNBiPiGIuRJ6Kih28trrF71ti/0gq2d+fON0B/jmnKSe4upVRmKfhoqFe/jqzGkyKkq
         /vSoo+Os+mouDPqKf9525TSJxhWAu0Ef7YzJU19/4lEXQNCR+smTxhM1PG7S/8P7Mx8P
         Cc9FHWMovl9P+ZJvZGeq22+flCuN/pPa7r9a0r0b+HnDXz5BoJT6bk4CXWeqmMTebKLt
         Sx6g==
X-Forwarded-Encrypted: i=1; AFNElJ9XDpPWOqcFQPwPisvnSeT+MtvglTJLjP31M6ciJ24lnS5T3/ZZUyO8ZuMmEnXj6YaRhF1PnEDV5YZgFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl2Xq276Gwt9LghFL5Kwqp1NRtenW1rrLcRDaRguLcoWcTcp4L
	G2gi9MF/mxgz3bFeG2W/prqBWgtubDAxmNEkZthj2qKqutdkKyYqJWki
X-Gm-Gg: Acq92OELkagUwp6swGj2UU9Z9D4J11abn8iB34+nHYtwRW1nqroSdSu6QgoL4eWMof9
	m28Sd+HT06nfVnPgG9wQoTaSe8CvOnWQjgS97P6kA+H6mAVvRcEcmC41ASd50ez3dOuoaD9o9/c
	6YiHCs9tihNfJEGU/Vv5WzkNuFOTgD5rKBXp9EvLHi4l9Iaa6HUcXI8DIAEuC8hTyi5vCP9p/v8
	R6DIqkf88cUDjRdaQYtULrVq0MFwY0VvV9Tv5+wjlAHfsnNS8IwQXncDYcb63s3IfyDK+s/6pGJ
	AlVO1RMW4uSKyd5owBaV9Qypt5ny4dJbfTgo0B/FYewOLL7K3NlXIynRBZt+Q7zJsTRlkkMHyBV
	6qEzarLsxAA4MBmezdW4tHt2eMc8ayjLaZoruKgKkZ3q8jfJaZz8WcKIBnpsDyKdIZFPrhHesEP
	FesPbc7UzsiPbcuc3X0qXgdMeYvAGlKrtqWEIlrep8/Go684U=
X-Received: by 2002:a05:7022:e1e:b0:12d:de3f:d849 with SMTP id a92af1059eb24-1319cf5bd08mr10389339c88.44.1778341220922;
        Sat, 09 May 2026 08:40:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278758e0csm7279364c88.12.2026.05.09.08.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:40:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:40:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 2/3] Documentation/hwmon: add Delta E50SN12051
 documentation
Message-ID: <2c1cf69f-2732-4ce5-8626-09dd380227e8@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-2-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-2-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:29PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Document the hardware monitoring support for the Delta E50SN12051
> device.
> 
> The documentation describes the supported sensors exposed via the
> hwmon subsystem, including voltage, current, and temperature measurements.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter
