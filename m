Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ADF3845A6
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043898; cv=none; b=Xe2YLBExkuA8rECYpsVaJAFgqauLir1wzSgnjPVXqrW+rlnLWbGHT3zvVrIzAcyFXPGUTV+9WpVqkKTHl6OZ/3l7VVLpTVbFoNDvnMuEMHnPxcKNaq+LQ0YrpRhyHz4FrwBDzBnd9oE4rZnIm5SavapSm/UWKcgEJ7LHuOlWCDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043898; c=relaxed/simple;
	bh=7nOccmQvNOJ4rXhcezaOKWPMqOfIY0Oh6UDFn4VjQ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4Z1ypZaFR9uc6yzz5XomAXReHeEApX/S4KI9GS9IhdVYd9Bq6CBPWKNzuNAFcBtgWq8B+JRRPdo4cgReWp4V1IdSM8mndv7X8fEjz+yEoKuc+XnQ2HP/VtWYHiruS2oUFzefSBsERY4+dXroqIDHk4FMhw3yWcA/41P+Yn8QHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9dgsljx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9dgsljx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cace91f112so30136805ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786043896; x=1786648696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gGnL1V+ON6U1Fz/6LKbIPM6jq65FDNSFM2034pMDXjI=;
        b=V9dgsljxlVPRd0XUl0qt5WQ5/M/GpeJ3F9SIQtRy6BrLbfL/SN6oj1Fu9lbyQmtES2
         9/ozva5OdcVaHX12nUx/MgxtgUEGRWYAbN3BYOMkO9F7OjgYGKkFr4Bff1rwq2yOemEG
         xBjoq8ddXc+AGqqLSsOwv3NpLGSNMVFU0uvKhpjWP/FC6Fw4UyX9EUaklmUU5bRnZtYH
         o38CXm5ui6lrApg+b3t19U/dtvhg+o20GSeE3dChMmYvIrfqdzZ7DNZZLL6zxFc14Xzu
         zFmFZ+DriyvC4do/MPFchPN6yziCYRvIQo37dGpX6zCmstHuP88lMxJbqx9TFatj2vOw
         R2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786043896; x=1786648696;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGnL1V+ON6U1Fz/6LKbIPM6jq65FDNSFM2034pMDXjI=;
        b=JwwnlicEmODXKPhYpl45eLx3wAdgjidobPI4UYsSsyoDb2+AAgCjOYX9fktwAQRLOq
         UFryw3DKS38NzpZ73OjJw/GPu56d6HYiuRN9h7/GthKy76azwSSCmNwZzpfTlPxls+8I
         lbwVZzmOXjPP5waaT0/n6qSOSrgv3CEfE77gRE/9TPLI3qmxvhEZ9f8KtCog6f7MV+Rs
         qnol64+uCbYJFiNGPerVr76gMmYBwdvjhrKG4sr+MNST7QyynZFuuS8d5PgJlXt4qwFq
         0yXGqxO3zd8sGBZtC/QHquO5+A9RRmiC7Rn/OD2nDwi8fZE0i7uSUg0PpcImFuFs8nW7
         pHwg==
X-Gm-Message-State: AOJu0Yyg+sK0tkJA6tPT9NvWzt1VkXRQMfYez6KuaafwqXq4BCAy5rEb
	cGFIOVMTFUUtkR1rXEqThj/khapqWl2jOkj2NE7evKLFZDjhZe2nAK8I
X-Gm-Gg: AR+sD13lYGESudkggBmJyo1XR+MGYGEJKAkuRU0pMFWbIT0rdK8EZ9VXE45Uu7WM52P
	hYcyBXkvKmj91M9atIXPuqho7sleVxiNbIHugtjOSgJtNagwy3xV+zYhH3StbyDmEiTje0ypZWb
	Go14y6Rra5Do/2cTn+rY66eqnjYQbkqzTC6wPS+WXmOpXWdp8/Ke68qUGcGzB0mrN4x/a2RzxAo
	LkZSl73n8DT4ooVgLp0mX9inq5GzqaRZtZnLtvlIPY/euuch6bKEG8VBVsUsXInQ9VxKcXVddS6
	lSEXDNuIiXFaloixbh3lssOfOYSFYGb+p7SEIanwCQv9ANTGUbxbxXwNwyMJ5rrgOyqfZfj1QrI
	Pqe9iGzD+h6Gxj1uPLNbMaI+nMInf5sGi7Ww0Vcq5EB+hF9aIY9288bxn+2RuFCd7uzRaR4kogm
	VGZtVwQbn+L3r5dcB85bQ0gCAhnDhr5azBkOTD5gSBy5Ji6dYrnLeWC3zOn++iVAnL91xH8X5DY
	g==
X-Received: by 2002:a17:902:cf43:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d0ca7129famr209758775ad.6.1786043896123;
        Thu, 06 Aug 2026 12:18:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d1206fc2c1sm1209115ad.8.2026.08.06.12.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:18:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 12:18:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Message-ID: <4177b253-8091-4867-80ae-ff86867e2455@roeck-us.net>
References: <20260806131103.19104-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806131103.19104-1-sergiomelas@gmail.com>

On Thu, Aug 06, 2026 at 03:11:03PM +0200, Sergio Melas wrote:
> Add DMI quirk entries and map correct ACPI paths and configurations for
> additional Lenovo laptop models including the LOQ 15IAX9, 
> XiaoXin Pro 13ARE 2020, IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, 
> Yoga Pro 7 14IAH10, and Yoga 7 16ARP8.
> 
> Reorder the DMI quirk table to evaluate specific model matches before
> generic family fallbacks, preventing DMI shadowing.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
