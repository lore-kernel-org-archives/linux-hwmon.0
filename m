Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160FB3839A1
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 04:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786597039; cv=none; b=oYo7lSP1n4aMGIpn37zhAekiKxUiZwBvuSdV9X3rfJr3tnqshuCaZASZmehVctbsACCJepsd5Gq+H2XbooJ735NBLYJAWlI6cqmSMhDaqNctj/U+inNwz5T3kklOmIDgxXyW1GK6ZPBYznLV9I1yh1c4VNbmaM9NUo2pJpCE3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786597039; c=relaxed/simple;
	bh=9+ULFWVEbitvZ6X+/yUPHpOAJDJ7U8TgkFMrJeNMk/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDR5U/gnZuwBmccIrvkTmpDSdkjziBtoR4knA+IoA514eurzQie729G08X++N2PVwOsWldFRxeXWPe1khMr+3X3KgdfFKoGFbWTYu4CL6P8MCob7/EPQD2DKYlRjOdvqULaey317kGrOTR87gsMX7arzGAP0s9WBKfdpHU8AFO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUyV3Mf3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUyV3Mf3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacf197759so32718485ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 21:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597036; x=1787201836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WBtU8YVaq1yMUZRCZWu+8sP/s98ztgfVffYxabqxGEE=;
        b=AUyV3Mf3GPCSO7ud3xXo0H9+iBdkCQ9nuJqP+FUctCHjDf/poEOgsfRsJpT7U8v4EM
         smKOhkeRs3IZbGSpo/4OSr0ntL+u5N0hwL221wehyCRbcqwzD7kT6CHu4nWXuJcRZrzQ
         AWXEdCNHBpzQlXXkZJF39UqulQLoHnMtVowtB84tWB+I8uQjaKAgGVms0AX/ey41oRie
         F1l55WaDkjVJOxB1SM9y9v1nJ/O0ertuLTD4lHwjpPKZ4w5snpVBFilTau1+sW5kwAQp
         R0KXY7TLzkZxdSaz1BQ/Y/HXwl8r0tOXXFwkdPohMDW9ALkCONDBrlTaa432BdQy1SRT
         K4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597036; x=1787201836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBtU8YVaq1yMUZRCZWu+8sP/s98ztgfVffYxabqxGEE=;
        b=kuzj5H2u/U6vJWvSYEi6j81u8ceULJ2D2m/Jt6WwgTIlPDf0Lmz3ZBsBrNjVsg862l
         fWEkHlA8c9PT54AHmKrG/sQTCY6eFq2njI5B0FpWa3CAm528W/434xNBXUB9+XdDgNHb
         4qVjP/XWyBq5Ygx97lSErFAQbJhoWcSRSIOcerzs2H9PJhRzFA8ctqZ8oJsR5NFJn/2h
         zDqhqGHcl2bK/lC+TiFWOUgApuOIrzLz94kgK5KjXWTtDaZf2X5NWYNRMfz4kKpEmjTV
         U6UNbKUlsO0wmu5/Q1dBx7kFfAm2+ez2Vv9J/XW2KgPxul9foMrYvF0tb7sRGCpTxfdH
         Y5wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0IcY43pth7teKRmRyj9fMuLkfhPqku8wwjrnIH//3WE0wvIG8wQUrY5Xs2X9EEJN0fP0egQEx/VXjxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBlId/mYvibvA2LA/CrMkqceqpKoGefM2U2uFUyaY+rEY90XSC
	OVZYgDb2DtRn52QO+sOA3CqFCgRuQr2TEBT1XhdEB7BAUf0fMGTVw7Kz
X-Gm-Gg: AR+sD10Tr9gFJn0uX4Ccylg/JtHVvSoTXys9tckaPNxvxbmGK4kZo0iJf9672iDQNhW
	ukytA+48swiPf9MWnM3CGzMYLgbqzGNdSzvgdO29ndT2WdCvxgYVcnjNyjC+riSc6gpR2ScYyg8
	RJyvgSWkSOyCLvtpuwwJRvKff3Mmcf7thML25UVwco7RS2sp0076nZvTweNSeI2xGi35hBgn5SL
	X3WHEC6KdIRi4ZLELLWlTk/G6SzaA+DfMkSB/BL3/HVNiOfOd4ajW8Ko4A+D+bNZ+tEz9qLTpOE
	cD75+mZdgAoRTuENeJHaFLWQhNeABENknPAoQ6lY0Bwzim+n0NRvzFjX4Sdmf+FGhCDx0PpL/oz
	OIMdjDKyDadpE4Tcw2mwsOi1QMZJsuF1a+kIPSTS/A/DUr56K8xzkmJY2nD6ejiFfzg4Ar/6hYk
	fXLTxji+7+nPGT71NWJSF7VrbyrSkYmB7tja6HbrT9uT1e+Zc8EmJYq/t7XmTIV3pjqdj0QqDDN
	A==
X-Received: by 2002:a17:903:38c3:b0:2ce:93a3:c168 with SMTP id d9443c01a7336-2d37d58376amr36875355ad.7.1786597036243;
        Wed, 12 Aug 2026 21:57:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c200408sm3960635ad.12.2026.08.12.21.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:57:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Aug 2026 21:57:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Message-ID: <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:30AM -0400, Arie Miller wrote:
> Move model-specific report offsets and capabilities into a device
> information structure. This prepares the driver for coolers which use
> a different report layout or do not include the external fan
> controller, while preserving the existing Ryujin II 360 behavior.
> 
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.

This is introduced by this patch and thus irrelevant for the commit
message.

> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

We are too close for me to accept this series without independent
Tested-by: and/or Reviewed-by: feedback. I plan to apply it after
the next commit window closes.

I won't mandate that the issues reported by Sashiko are getting fixed,
but I wuold strongly suggest for the users of this driver to have a look
and consider fixing them. The issues look very real to me.

Thanks,
Guenter
