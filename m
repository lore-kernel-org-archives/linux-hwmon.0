Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3E2F43
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 20:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455416; cv=none; b=J91NTbsEtGJGrUsVFmoaNDHLKgrBMaNuJNHHOWsHEk5FYKTyGo3xHx5/7ehX9h7b27LCPuIAT4y4v/bi0PHdeSgeoblMlNGLm7Axqd6yh1aH4EPii5RbhjaGviBbQCJdDD5bG4sQbSunpKoJr3QM5NIWaCaSq7s3tZVzVsgS068=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455416; c=relaxed/simple;
	bh=AYLDd52b5+c031bV40QXoN0raEtpW8SILxKw27/UggM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWlfSW6hcLlfMZaJunNnqwSq4Z8f0beB0ufH98tZ0dqFqTfjmF6vz705NUxz+EGLMAsqfG0ySUFL/D03J+l0o1WvX9z2nhUULnrHCpq6WtiolQ9aG7GzdnSH/ZhVii+eySjzRmFNn7tyANu5/7gsJyX1quThphYEryP0Sdy22es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7SlAko0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7SlAko0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2156e078563so19435995ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 12:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736455414; x=1737060214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqEjJREtjziB0EVMwCCGfPAym0CEeF7LYRs4eYz1ZgU=;
        b=C7SlAko0d6bXYu/YQmcWwghM+xWLVoIwwkb18Me3lrncGEre7H4I0uq0pVnX3irZK2
         E+eOvK1zXqts1Kf5uPwhV1JEQoQpVHgO74UIIZq/OcUEOBpet4HTGlGoPpfpFxcCRPy0
         X5RvbYI8kpRC2TfSrz9/pbUSIUZNXlL9O2kJmWSN80j0CgkmzzvCJ14ZKriBh7MHqtXW
         apLL7cZj0nVpVTffak1Rw1S/kwyPzPkpAB/BoDxgpB/+dPazgQbWnq95NaQfbYGDFtBF
         cCecY9HnY1H44v7YFr2nnOucQaTwk4JIfpdHVQ9j4vNcxRAp9Xnkv8bvzpngEKjQyMqB
         K8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455414; x=1737060214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqEjJREtjziB0EVMwCCGfPAym0CEeF7LYRs4eYz1ZgU=;
        b=HYQUtywX3T8+XJwVmXZSktLgS9UVFW/FnjYSvNUwfxm8svYKopkkr7MTT/Lia2nHMn
         kW/BPNWNzOy8+4RMMQ8eo2mu6bkLObhJvzwvxZ+4WMQzTbrbRBwEaqQRK2c6TTtTKak8
         t9uFiIAn0pP6BoZUWCZc0dFQ1ESTA/2u0bAI0uPcUgSZSWePloOdGCnj7RkbS4USAW7L
         p5XSmJyTPXWtLdnPK1hVR2ganle5zJwkq700bMhLnDWALkGvGkFY9jXUJ2VDdljE8oHS
         2J4kg9dHpG5axhxqDAw8o9pA+Q+7pQbwu0hSCAX6i6GhKPMmS1ZMwJcplLADKZLM08mw
         TQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt9ufEkEVvZTFolLCKZtEmt3KF5OyzQngiWursSAfTeTl/WQ2Sj3N9YyAdjQTyDdSgcUIUkb8GvA+AlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOekn4ZRi9NFHIwFTwPkwKCBmCom0eLt9MRyPwT5NhGV9kkZZ
	UYZny61PZMB1eq+bymEblDxybJAR4mvVcdAq9e1JlNVbOIDfyhgm
X-Gm-Gg: ASbGncuV+FB2ep1V0x0xGnVHHsJ5zqcxqSwydzaehg9Xza8ltIAWG/1tru4J2GxFnW0
	WSJbZGFXd03FM735T++jdDY3N+BA725NEXED5nEp95SFZexcwMZRmOn0tzf1KlISjSDV8dS7vdS
	WXqybNLbucmFQwHsyEC0he7WSR7poGz6dlFdgtrQ5Ow3SRSHeOvEB3jI1+C17sS+A93qt9pfw4E
	uM28TP6HywP1CkHWv+rtqFJE/DBD15hzbo1WneLQ9w9ZXydR+mQsv0u3JA6g94rP5mCAw==
X-Google-Smtp-Source: AGHT+IGLReXeCbo0nM+LQwyGfc85gnq/d0jhOL3fKePI0DzBUkgO7QBd/+mC0nPJ/nkvMAicLnYVSQ==
X-Received: by 2002:a05:6a00:858b:b0:728:8c17:127d with SMTP id d2e1a72fcca58-72d21f2da93mr13007617b3a.8.1736455413923;
        Thu, 09 Jan 2025 12:43:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b64sm213678b3a.109.2025.01.09.12.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 12:43:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 12:43:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (core) Use device name as a fallback in
 devm_hwmon_device_register_with_info
Message-ID: <58b6b519-05ee-4229-85b9-a5dba574e314@roeck-us.net>
References: <1ebe6961-6445-4408-bfb4-b56173af9db5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ebe6961-6445-4408-bfb4-b56173af9db5@gmail.com>

On Thu, Jan 09, 2025 at 08:53:55PM +0100, Heiner Kallweit wrote:
> A number of network PHY drivers use the following code:
> 
> name = devm_hwmon_sanitize_name(dev, dev_name(dev));
> if (IS_ERR(name))
> 	return PTR_ERR(name);
> devm_hwmon_device_register_with_info(dev, name, ..);
> 
> Make this a generic fallback option and use the device name if no name
> is provided to devm_hwmon_device_register_with_info(). This would allow
> to simplify the affected drivers.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied, after updating the API document to reflect that NULL may be passed
as hwmon device name.

Guenter
