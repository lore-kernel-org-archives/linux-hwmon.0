Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915B22C859
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762110325; cv=none; b=qdSXSNEbuaSwZIYZrWOpfBG1Iep6Q/+t7KHDbyTZhf27yknXvk1fKIDZ6QBvDAz+dZ+IPVPaRDUnL34SlHkm5yB1U6JckPoynt60STo/9t67hpINiePhblIWAvxqFZxK7FikFq08it/WmHGDfPTSMWpEzKYXYmGx7a9elRhD/28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762110325; c=relaxed/simple;
	bh=CL0xm3KqWtIMl9SlvJ1SzuGnrvB+jFOJq2mpjvkYzlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5/lb9nb3BTBl3ar6UEBSOpA7KzYtzwe9/So2ZHvsmAxwE+IGyYmb8KshizbJbdo6WNNvcVx7CdhZTtuZ8My5T4IUiK6tRoyXWY5RRg7qcwLi+VhDhltNHDog69TfBc7bj5pu9Y6NKp180o9HrivCkmCE2lhxUlelHDydKYCObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6vVJ45f; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6vVJ45f"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2955623e6faso11476595ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Nov 2025 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762110324; x=1762715124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Da5DNptY032BPRk+5IeMxUscoEVtDVHR7BE+h8K5Bs=;
        b=I6vVJ45f73QhGYG0ExBIqOH8Y+D+wucarWqUUD9iRhkeeuDp6tPvnoBehvGUnLAv6Q
         kLFo3d9lOG468cLQU6ZcBHbtFLAT06fey0CIkKbptWiva4yRDsq27TDhHykVX+eWpfyM
         6HwOmP1hweZJfr5+QsdBJy3Ns3WhLG5EN7Z7B2uMXIAfVFoCHcUNIx8ouahsnczP4xBj
         MUvQiXLXMO3Io1ndrrXC1Ilb2u8pVwny4FuLaJnpmhERe0kbL7GBQePr6AXRdgmoc17a
         RS2W4l+2s6agCAF7bNOvZ9xCpCKBTyF+YUTYr/28kaaIvll2c1fhPfvTsOPc4snBxdRX
         R9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762110324; x=1762715124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Da5DNptY032BPRk+5IeMxUscoEVtDVHR7BE+h8K5Bs=;
        b=qW/miiKyZhCwrTGMGGgrfb/YGaat90srOpn4N8XwKxZEMpzI1MM6rcLY4XTLKi92on
         ZFthZtwCj5xrHdaIRBIDYJove0gZulPKuwJM/h9oj9hAp4HiW2fTxB6LvtK+Zxj1xzo/
         38/SXYb1iEn+Mwd+TcR9it5ebSKWzvaRuv1l8MfI3Fgm6RXLScag5pVmbmjL0B3gj1Ab
         9V1FEFuHBD+k8gC27xQ+ZyQlhIifP5b8AtxU6NFuOy+RrDHTl5lytgDMQj0zxlYCb8aB
         KTm4C7pvqNpeNLS+cd9YNmfaT9Nwit3Fm3DSL0neAXh8Lau++FZbnJwt8mKcvoidhfGV
         jnOg==
X-Forwarded-Encrypted: i=1; AJvYcCVPYdDORRz2D1wC0clEYZ8KuABaqH+iBohkr0PNX2NYfkwpxUMMxyhwStTA9XYF3qMJwJa38zQpTZ2YuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC21y1HNdDwGdNLxenwKt+XCGGy+7RprkEvg3pfBTzKp9Mwi7N
	3+XVM1lJfbgMCeomUyfWWW3N9+owemgGyD0ABG9Q//VTjZvhjLCQOoe97M3soQ==
X-Gm-Gg: ASbGnctM+4+JwjE2q/vXsNMkHilCRL34ZsIiAxy05nyEri+9WiaRgJ2WgTU7SePRFQE
	wac8TczBadeB2A8Kmy9hoALH/phNSRuCSdG78qdhWSDRAPTw+RbdK2H63vGQuLZtdgBYIq5LSW4
	HteFatJRgcQze9pPbeDCShuO7VFlJPpvOjNrRZvTGjJihg3qaA7bUwq+yl3qCmJ0OCqTOqqfF+O
	Id0XU2EUXBszApWgMPVefR23qypSRkzJH29cuiV0nv7KFQRWvrZHdcHL1RFqmNmCAc4myU8qIgv
	f9bRMFtXXdvbbSgnkw0ljUxlhok9L4tADMJMBVJmShPqdnt76vYkARYw0QWoCwA21uf1fwNhOIP
	hy4HqaBgcR/SPzZXaTvJNuj7tDYy1Olp24Qj9M0SZFzvirRwRAOvop0jzRVljrRVg1zF8WXhgLu
	gTk4r8qHVoq55NxAu69/T5mTQ=
X-Google-Smtp-Source: AGHT+IFrXifcYOK7J176L3K+BDvbzXMdXVhenewgHc8f7GJsEfPeOUwKCAvP8Ce7HpQtenvpH4HJwg==
X-Received: by 2002:a17:902:d491:b0:295:557e:7487 with SMTP id d9443c01a7336-295557e7b75mr73849905ad.9.1762110323785;
        Sun, 02 Nov 2025 11:05:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340d1a4a587sm4454621a91.3.2025.11.02.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 11:05:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Nov 2025 11:05:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: jcdra1@gmail.com, kiriyatsenko@gmail.com, afd@ti.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] hwmon: (aht10) Add support for dht20
Message-ID: <8dcd27f4-e297-431e-b763-5cab3f85be29@roeck-us.net>
References: <2025112-94320-906858@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025112-94320-906858@bhairav-test.ee.iitb.ac.in>

On Sun, Nov 02, 2025 at 03:13:20PM +0530, Akhilesh Patil wrote:
> Add support for dht20 temperature and humidity sensor from Aosong.
> Modify aht10 driver to handle different init command for dht20 sensor by
> adding init_cmd entry in the driver data. dht20 sensor is compatible with
> aht10 hwmon driver with this change.
> 
> Tested on TI am62x SK board with dht20 sensor connected at i2c-2 port.
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>

Applied.

Thanks,
Guenter
