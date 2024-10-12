Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F4A17BA3
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Oct 2024 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728691372; cv=none; b=PzbRh4ju5txrfW5eF++w+/aLw9VHsmTiAXnj0vU2KRgCEjixD4X+vlx5SRVW8o/j1pI9toHmuntiWyQ9S0/1mesujfnBJOSZEumLF5X4tYGPsFh3lnSqYkoRYUfk84RzQcMv3Vv9mo2oikx5Hy2CLGBiOMSmzmXdcjMkYYurQgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728691372; c=relaxed/simple;
	bh=N4K1dFUrVdSuAYv3Iw4atRv9wX2Ip8sZ3NeLuoXlNMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsnOTazDPlCigyKdlOZ9+IaQL6SZnxHFlx8gPyIkFTYYKDO6PLbulWjNkedEHrX7TGjqckPgsG30CqLuWlH7QVx4WA+Vn138ukvm905GqCCdSosv1Pk3IIjfzfHNBv8mAdEzVsejUA1eq3zzQQVNaEm6n6srXDmJcBJL+WPOx0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=protocubo.io; spf=pass smtp.mailfrom=protocubo.io; dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b=GfRSHyXd; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=protocubo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protocubo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b="GfRSHyXd"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7e9f377a3c9so211760a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 17:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google; t=1728691370; x=1729296170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovt7c8v72OBIlgT7Hc370eDYghaW5V2Rs6iOK6xiysk=;
        b=GfRSHyXd3R0U2s1+95tv79h9Gn/LD1dAnscjN7Cz87cPhlD5chcv6f8BwWbwsAidxy
         hoeU+/JeIrIyAKAu+Gqqb5dkfJ075U7PV70q18h+GgLzG9PxtFSuogJ76kYkBXanL7EU
         Zvgx06oxCeRCGXYnJo1UDL592J3vwtAEzaKYQzNrBRVSyI6Z9iuZ2cRuliUhrRjgsQza
         DW0i4tqf0GgzGF0vkXi/tLay1Jp2+cRTtxneoZzMG4kLpkNdElEfJYTJYlDwtRaS/ID/
         aqHbjVQMnyJY3pMARbPPPrYbzhxSyokh7s31sfJrHzXFgzIqWu8yd52NuG1psl1xrWVs
         RLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728691370; x=1729296170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovt7c8v72OBIlgT7Hc370eDYghaW5V2Rs6iOK6xiysk=;
        b=d7gNn0bQwn1unWdiJw2+5XbVOvSrXwWdbf77WIunYOLjQDza6JvagJTMJAgyXTMcwT
         xUDoUOwHMdIeIKD5nGlHTIsPPSY5vk5QR2FBAb8TSp8mWgVy+WO1VXLc7sw09IYTEnws
         aoEYHP/YGMuLa/t2Z2KpPcJ7L+gsU6XJYkLpSlp6msKiWBQIcr/v0k0JA6cKr5lg591R
         V4TwDtwxZMmAgHFEA+BFciZyjhSNIAduL2Y3P/dFYgeVqISQNqMnDbhvL/4E5GZvend+
         VIrZdT/AN4NaIdsswhZUmbMS++bNML3rTU32Js9xHYv0qNiasN9N52i+QB0s3+GszMXh
         CUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYmRsxTnxknjmwMw7cP6HqI0JVDviMxy+NPUS80on08BPtwHKyx8zqWHNEp8xWJygLBuljXeLjxQjVeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzO5LRf8SiNyMjPewGPFUBitZeHPOr5nCKdtmi/MHeB44c8iB
	n0Kyp5yoqwVhkeSK4pk0q4JoRTzycxwcMxBdEjqP8rLMoRzS0RjsVVfIQF0J4MA=
X-Google-Smtp-Source: AGHT+IHplHnuK3bFHnSoz7f5mbdl+thl1himfR4enkgU/+qRRYhXrN8IwGUGUWRnGCEuQmNsaBd1DA==
X-Received: by 2002:a05:6a00:6f60:b0:71d:fd4f:260e with SMTP id d2e1a72fcca58-71e37c3d7ddmr2947136b3a.0.1728691369700;
        Fri, 11 Oct 2024 17:02:49 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5e:6038::1000])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa963b9sm3300644b3a.99.2024.10.11.17.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 17:02:49 -0700 (PDT)
Date: Fri, 11 Oct 2024 21:02:45 -0300
From: Jonas Malaco <jonas@protocubo.io>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 8/8] hwmon: nzxt-kraken2: Simplify specifying static
 visibility attribute
Message-ID: <brjrngpwu6tsq6alns7ai5vscyhgtc2x3zmja7dxrfpaamp4qi@rb25dohavidg>
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
 <1ac2be2d-df4f-455a-900d-821fc7bd12c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ac2be2d-df4f-455a-900d-821fc7bd12c4@gmail.com>

On Fri, Oct 11, 2024 at 10:04:31PM +0200, Heiner Kallweit wrote:
> Use new member visible of struct hwmon_ops to simplify specifying
> the static attribute visibility.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Jonas Malaco <jonas@protocubo.io>
