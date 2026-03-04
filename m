Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35236CE0D
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661636; cv=none; b=GbeTYVC0SFPpImLmDn1EFohLl7nY7L24pSJpgmTj/Nbn2aB2zJKKOAyEEWlRQHVV8YQkHf7t+rdjQMOWwtftEg+fmiYvonSA6LAKxm5E4NFMV1DmNWSHsEu29rNEGVq6782lSlZ3xOsH9bcRUb8k+nxmS2kVVzAyE6B/NToQ7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661636; c=relaxed/simple;
	bh=m6XH5T3x1DjJ3lCA8btPdZYedKHfxu/LzJ8v+gmN6Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk/PmXoSeED+pGlYLId2FRmKMqkpnM8+4edcQflqPHbt7xpSFBNvxvZEVa8VVVCtpX+79CDkKf2XnLQ7QUle7YZpQgZ6uCtbyA/99N/UgIFyIzJqklfkC7QjZzx3xL3dL0O66lT9UVHXJwOLGi4jUDwcW2jvffWrKTG4oBXrLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+uiEIjN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+uiEIjN"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829759ca646so578044b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 14:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661635; x=1773266435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsY5FVD1PWFdUv5+4v4CMZrnguS4M3jz8cAVJu9gOXc=;
        b=B+uiEIjN3iqCwX6vBtrAFNd6Zo3KBPq9vt7D6gsb1RM3f9dJ1uVAc7b8qqAX36U+g+
         W0C83iWQ8J8VgE6a4crLEeoXczW74w+UTzlm7V49Go/WsWbrsTUq4FSedvMiTY19ibPz
         YpCcYRmn40PsiPLkHq5H7eC2XPHfEjheDrvTq36+rUC158zJkVLZqA73dUyjOb+MkQvk
         V+wlpyFT1NMh8ruqk5aKySzA7XY8U9AtQVL2pFSY7tOGkm0WWEmpoBL7SsjLu1oz4f10
         5cTCM7Lbw+63OvJz+qXCFghvfcQyPAVis8pLtHvhnwPmyDue66Ihas0yAg2Mbr3cwMJg
         OgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661635; x=1773266435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsY5FVD1PWFdUv5+4v4CMZrnguS4M3jz8cAVJu9gOXc=;
        b=Wa3VKqQrbwc2rXQWA0jdqgXbOOc8pBgGRZRH2jdbaDlf3y6vzWsHOp4z0/AzUnoYSX
         pLUihuvugVMzrTIgl5LUX9yyVDK09ysBrTavdp0xmAU8mj4XKH0fLCZYHimjKaqxBbcZ
         Z+p//qPsJGmvskoaLgGho2X4IHAp8uvHi7eww9mTTiW/0G508HWuDlZ1PN0fa9mufFwm
         X4vVZS4Lddb8twPwQvgfO4Jx03P493i+/PEtz7qOoPx+UcjyUDb8GNa/yHs2u4c5wzhr
         Fh/ZDM4Iet9DnKyenWwlNRsZo9OeA3LnfjOuO/MU/hawt/guyv+BVKQKXziKwN31S4Tt
         CnXQ==
X-Gm-Message-State: AOJu0YzsleZyM/001BQpNwXOsc1qEOT/9eo+kpSfcfo993gZUQbY+16Y
	Vlh377kZOnwGUdTV5fcdefN0LNnlSeU6FfZL8FwNsoupmzRRGQ1OlpDz
X-Gm-Gg: ATEYQzw65Lmhey2NYH1+oFosSStBW7FsqTrYQurf2d0BFn3FsQOIyTefTOlIkdDSKLP
	DpRQR4OmIVufeAsl1s+aZr/QdvWg+LwgB3PriGq9taJtVgn8N4wf8tp5Bl6hB9yTGpIJyYbOYs1
	UTGOtXBhclb0wGP29FAV5Sulz2Te41q9DDRFPnTzfvN5Xx1r1SN31aH4Ti3Y/qumWmQ2qgQhAZu
	E9X8+BWO/kkPCjHUoR1VNvsmYIwmOUGsEhZer9KymAGsI2V4LDJAqBKG8DcME/bLn7Ilmn6ljm9
	YRb5uU1pXoy5NX3t9ETZgBCIm2inDq/VLLEHHiKaSQBmhsdXZbnxA7wfoxFdxi5VZKE/cU/Xiwi
	+kLSP6LROl4FIWn4CL1vF0fovo5zWI4OBE2enRqwZIcFpOgd+sVyNjBomVYfv/zOHCXlNJMia0Y
	/M954HAee/tZ4jqtC9NIVcTzqHBhNQg9RvK9DH
X-Received: by 2002:a05:6a00:4404:b0:821:8250:8ded with SMTP id d2e1a72fcca58-82972d9ca6bmr2840322b3a.65.1772661630369;
        Wed, 04 Mar 2026 14:00:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm19617764b3a.6.2026.03.04.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:00:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 14:00:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] hwmon: (ltc4282) Add default rsense value
Message-ID: <fe84f756-71e8-4d3f-b52e-cad257fb6f37@roeck-us.net>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
 <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>

On Wed, Mar 04, 2026 at 10:17:48AM +0000, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Instead of failing probe when the "adi,rsense-nano-ohms" firmware
> property is not provided, default rsense to 1 * MICRO. This allows
> the device to probe without requiring firmware properties, which
> might be useful for some high level testing.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
