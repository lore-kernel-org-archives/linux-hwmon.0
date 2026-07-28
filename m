Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011223C51D
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200033; cv=none; b=eullVYU7aBywDFbZgkQKYgPUn40+NhbtvIOZR9C48uki0kBXuGAGqPeNDG7HbOz0n01h5BUiZVUwLPhEvTqWX9vaNiBL3CMuetWgLsKLSfm//SGweCm/kCWpGcHicvoa8jpk0FJwrdMpTO9DPrnFZBgMKM18xx/i0r4nAi6iQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200033; c=relaxed/simple;
	bh=s+9T2TPDlZ1LKdnOQxTg3tRd9WE2fmDhszS2p43UYO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTwncNbPz/pzvR3jKOdwVdW71uFQkCYSuL26OdS0RE9MqFDGsK+7km5yKo6sYIUr1Ci8rpOC555vtTLHta4K1aldTI12vWnfo9LuaRszXDvSIGFpfxPzI5aURkaxMGEdbi7IGFvjbR6L0l98g2OFTURXewBBFoDvj50fRweTnzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejamw0xr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejamw0xr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84847482584so343665b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200031; x=1785804831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y/v+hPgs4PtxVGyEOvXKn39Rmv7ZZPFXHaM7NsVbOEs=;
        b=ejamw0xrdAccwuN8jIkW4KgbkF2hkhtMbVXxkeIwaiFD/qj/diHFEgoA7w9y8EjH17
         OMJAnyfztAfBXq8x4/1DL+ZiiA1ktC7o9kmrr9JucCMRGp199mkdG+fDdDeqJ14HJ5Ud
         3c1iEOxX4Eb5F09PUEGtr3BIWRekgL0PKqGIExNImBtabCwV7q2MoSJ0Eu8Y6e3nFlIi
         bNvtdj6TXXYvY1XWbVCE2+VaXuF48xDzLO8KLfWGBbMuMsZG668NSLUZ5FBmrny+ksts
         LKYgXTi8WCRPvg4oMHWdnh8BgflJHiZ722ByfOI8Q7EY1Jd/XVrgwTVYnNdbNM+TnDb0
         8+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200031; x=1785804831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/v+hPgs4PtxVGyEOvXKn39Rmv7ZZPFXHaM7NsVbOEs=;
        b=gEf2U3NQfQhYKPlOHRgzQm3M2GGBRs+sYIFVrjbwGPbaO/BW3qyob8WWnbSd6PMBDj
         JjRrlak3+/lnAPAJQpiL1I/FBi/WtuinnbaOWBq15vxXHptPq9JcTvJahzfyIhHovDRU
         AqfZMclKVcrco14JLPVIFDKWe976XGpcy6jQMhxv/FAgZBPRf9PAzNPhAkB08yjvnkcu
         C2FrrDNG9gVGmReVwdHUQFdbHqmqt0mI7pGvcZc0MbzGZ8qCit2elwM5N160mt/PVXK+
         3Z1Z6R0fpUD8puby74MDvQEK6heB8qXQm8iC93jBYSZA5wvrTLMtuRUgqiE+0a9oO3OQ
         EIEg==
X-Forwarded-Encrypted: i=1; AHgh+Rph1VfANQLiHH5bh8zeuP5egAvK66u6u6p4k1P94J3Eil/gRtMrmbwz00ZSAc+KroGcdvL8F0dOAlhLUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi2hDcq/IMlbq/jNEKHdRsCMf5YS8KALT9yBy6Rx/rE1mc2m6a
	mwwbKaFZe6Cx+pbb5Qdo3yAKI04oG3y/Ar7kKqdGH2gBwHdfEb675vR0S7hIWg==
X-Gm-Gg: AR+sD12yLkNw+QcjMiWYJC/Yqh8zWIGamqA0vg9WkCe24H2F0pcH9EYCHTc7auggEhU
	K0EWsH86nqWkjdloh/y1ZirwRH9o4SXxDsUuIxt1NamGyT3v99NYtRPc50i40LFZ38xFnKTrEkm
	svKC1lLjTQZ03rBSCibLFNgrI4knIrJz4EE12zSAk4LkUBpla7So0tz8O56jQIlBAa4XRmybBXP
	/zGZtxAGzDv8s6GlBHmAfzj7UY/kohsNQ67RHLVZoc0UQ1FuJOPLqfe6RTCHI9wcVV7z6A+ldUT
	0EEzXiICkIkk5ezxafPMCdBE0UwNZZWMa5CRQoTMDuj4hIhV2CwIjxQz8FUxWJbr68W5GdPWodY
	Wwn9OfiRygPTmqWml96ZWCiccr5l0qFC3hzr6LBQvqtDKEro/23OBIZx8nRbHcOYi1v9f3ffEBu
	bH1aB1J1s9oqOf0Nmh/KbSdd/WXQ==
X-Received: by 2002:a05:6a00:39a9:b0:84e:2e4a:6d15 with SMTP id d2e1a72fcca58-84e9320d854mr166142b3a.25.1785200031164;
        Mon, 27 Jul 2026 17:53:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6581beesm3856894a12.0.2026.07.27.17.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:53:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:53:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 1/8] hwmon: (adt7470) Fix fans stuck in manual
 mode on I2C errors
Message-ID: <9eb69428-c47d-4a9d-92f9-cc54e3b60127@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-1-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-1-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:17PM -0300, Luiz Angelo Daros de Luca wrote:
> During adt7470_read_temperatures(), the driver temporarily switches
> the PWM channels to manual mode, performs the temperature collection,
> and then restores the original configuration registers.
> 
> However, if an I2C transaction fails at any point after entering manual
> mode, the function aborts and returns immediately. This leaves the
> configuration registers un-restored, permanently trapping the fans in
> manual mode.
> 
> Introduce a recovery path to ensure that the original PWM configuration
> registers are always restored, even when intermediate I2C operations
> fail.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.org
> Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
