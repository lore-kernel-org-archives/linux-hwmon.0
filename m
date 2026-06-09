Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717FD38CFF8
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038436; cv=none; b=tY9J86oyg8apTEDhZ+TVg3eAC+ayRDtiJd+wiDRm7QarHTWiPTFdR+3+6mZCEa0xvt0NTDphyMySbfsaNjoFACQJPYWCYxUxOweupHD30pEUkpGRLnNXLGQVNj8+ZHiCB3pREYOTTHfUy0Cqk05jvXkS3n72osaYBDL+t46cxCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038436; c=relaxed/simple;
	bh=Qw/3uIxuvhR9pkkQn0Fun90WWrW+XXIONdsi/Hw7s9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0pv7onMnQjVEMA6TOJwGVWrsJ8i/Ct/d65rd4N+sRx4jfQI0FlKO9Zs3LFsqVxYE1SJwzm+HyqkgdyIR8+rP8YLYBHcsX6cvwr39Lkng+o+HWzlvhnPwCDWaSu8RzxPC26RUE0Bpxj6b4ff/YboIf6iZ4M/BfmwwriH0XnYZq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBhtEbrp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBhtEbrp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so3933633a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 13:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038435; x=1781643235; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ90DIeQT+39qjB/FIaskdYlqdzdVSYmD3rl7EwwUds=;
        b=eBhtEbrp9jCU6iSVGB6KhNTQ2Vo40juvWc12jf0iFPx3tMaPy+3lKTpuDHOi5V5DQd
         t9i9IiAE0jRYs5pFdAHz0fbE5nXy9jrMN77yjrrGxc2lVwf7dXjqYVw48dZs+ojCgfLZ
         kHxH7tre0XYwwRaXeTJylvO2x2FbWQtDDh62cbz5kGDP4qvUdmDiqMYVjOkZPxNv62Aw
         3VaqPnxaShOKN62reyqtPZuPZgUxvx2k9UId+Cm+aKVxrWeHkMz0EwWOuvaFvxknbuhE
         O6e+lhI7XIYhc6DEBEA6mw/LuGCrMqOOmKdWLdHDj7dmILr8YE4dHUyScd5gBCLssGDn
         ApSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038435; x=1781643235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ90DIeQT+39qjB/FIaskdYlqdzdVSYmD3rl7EwwUds=;
        b=CfWpRCMLI9uxGb5nV2eoB/57nAEJGRPr37RYUfXEsQWAlSxM9B52ZrtmZc9lgcFby8
         a/EMAiXeB64Kt5UFPvAAgI7TMkFBBQ51iDjW41E6W5TVmzWrX96aue6RKJfRVkObBSiK
         tdOI75mMZdRswKtDfLakrQLPcmCn7kgQgT9WQAIoGWLvB80EQ5mldvIjx1RVbV+F5oZS
         hURvYkiXbTU4TdipFnz4zxHyDuDoRA7H6uzntWrjTRurhj2C5ne2Jq5/afLR0e0XwR1R
         TYGo6VSxLB6JJTDnq8qEx7aCUaKlnixPeXHgSJ1G42AajZzWmvotXxXwCw++8+6BqaKQ
         tDWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AkwGmPjfmi3kG/NH7btGzxzJ3qzWs6UOkbVMBeuzHWYcIkarX4N+SQJU6mzEpWuJx6C+KvGIE3AvCuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycojqPVekBnv+cRZFIB6V4QKXqLnIW+zj0GbkisxFBB1fRb4pB
	nWCnQzTzaeXTWKAc4r5DjYU8OgUkjEVei9ls0O1twDuJKI9w989E3tVX
X-Gm-Gg: Acq92OGF2FO1NpJ2qOpe8IFWWNnOcaWBADsU85YvI3XbNjh1yBjXr2+tT3Zizxtqp/e
	zcfdV03BB7NawIcleALYNpUXOfYNsqCX5Y1lZlCHx8jZRPYmJWAK1j5ezLZKDh96F2CmV9C1FtP
	DvdqmuxFDhVeddHlqnAd3mEWqaknEi1SeekggTuj/lxs8jAmRUYGhvDgrXz6ucOGeqcy6u4LR7K
	2fecMELehrRIU87J7c7O0zgvFyib6rsgTP2w/TUwwN7ztQ+YbTfxzcX3E6+5r+Dg3BPO/ZnGUbq
	nLNq7u8X637EIQUoOcsPGNlVws2cY/+avhz9qUSLmx8alyoflJ2nY9pZzIiiED2gvxj+Tm3iKCW
	4tLjAyZ5cQS95NhSCsUO60xvEcorLdrkljYXz+p6Q7X0HNcK/GRW6sdAn0gFhY1WiW+kevtMKly
	kM/0EFKQWSZJeMWA1StljD6tEdAE0L0zZvFlX+V5YEqRmGbDE=
X-Received: by 2002:a17:90b:5890:b0:36b:bb66:fbc3 with SMTP id 98e67ed59e1d1-370eec11205mr22415053a91.4.1781038434724;
        Tue, 09 Jun 2026 13:53:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm21059611a91.13.2026.06.09.13.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:53:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:53:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (cros_ec) Add support for displaying fan
 curves
Message-ID: <3a3a7d58-010f-4754-bd07-a7f34b21a83e@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:55PM +0200, Thomas Weiﬂschuh wrote:
> The automatic fan control mode of the embedded controller uses fan
> curves with two trigger points to calculate the target fan speed.
> All temperature sensors affect all fans.
> 
> Expose these fan curves through the standard hwmon sysfs ABI.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
