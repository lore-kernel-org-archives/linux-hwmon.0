Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639A32D0FA
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705534; cv=none; b=WHd7+JUNgkh9XVBH8VZsR4kRTELsOwS6Mays6MLf1Mn40nlPJBjtDKaUSdsfQ2PIYVxcTgXb4zSUlUnNlO2b6xV7GqfTpZBGCt44/rkMFf4g40ssD3olY8nr4iKwI69xdk1ouUJX5mWWabkCpd7OwpH80eKAEjq6ce8gTO2FW8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705534; c=relaxed/simple;
	bh=zGnu1o//e3bxZ1ijfWOYdQqIB9ZYrFiOJVInbImT8Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFzKDqCrCbBHRAjVOjVu+MXi4BJ6xZHhRrmmc4IBHDtYyTZEZUBuECnE2Ex1qjuabJKbptb4i4nUT9H4QswkrqQwSahQiMyh6fER+okD7c6OY3mMxZOYx2rQIcNB/bLCI5TsXsqvxB66bjKj0ER519VmbJYBvBwSk3n7Ae1FxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7oIWL7I; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7oIWL7I"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-267facf9b58so13214475ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705532; x=1761310332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX1z7rpYYkyy+tiYD/wTVd32X+5BN3gi9AYpbkqHgFk=;
        b=h7oIWL7IwCLGHrBimR3oMBZXgeCMZnN/XxCiTCPU2CcQjHnOCbi1se8kasJFdoKArG
         VuTLLnjuwDxUYNh8aWwEH+7qpxlHfAwSxnZvwX0uW24CSGmQ2kETgOU7sjwcbeZGZWJO
         exmU+rU/tetqEfyrM70o5nkN5DzeQ5DaAUoWdi2PHbAWCdtJCLxkeN3tESoxeqpnxje3
         haFfBcI3t65wtccqVw79YUOUWyx070KV2fauJ66JjhQXj/aomuZxXLqJfW9FLFwophTe
         hpOuHnPq5GD5pzEdbGCbRXsgqjdFWt2VvEPA8jfBot7eh02dDc7lCIa9kp8Gb0wtMMFZ
         7G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705532; x=1761310332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX1z7rpYYkyy+tiYD/wTVd32X+5BN3gi9AYpbkqHgFk=;
        b=q0r8A1HZBt0WzAqW6v48SZK79KqbyJKjDa8K/TBNH6Gstd/0PSp7yoGwRREB15MpJ6
         /V1J0lVid52Ll7/ryJElXSkgZ3LVUoYnBTdQ9Y6zWRLsFzJ8koW0FD44iLZluts2nCjl
         mClU6eysox14IKHGrinYXA1tYjgNdmpV6ucJAf80Wg7Us3wUuCi5b09lrIb85eb47vmb
         vYLZ2bzehFM32kOEvA6UKcHLuK/McwcTUlA9/r3GdGIhDBtY+ekXlkmc1BRmYUqtyeSa
         WBu5YoExu2FmKmCEV85mx8RX8LhanWOEYw535ycTrsmLvabTMx9ZZ9Xr2Rg1nIgK7dKO
         0yjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlx6dVpV1Dw2mnhxb9ILvTtCBrTQRCJVqeoxQUgAb1EMloRb72vof2K9R/zdbUIuU5Eydhk3RPzDRCdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFshpJ2wX+Cb/1QXDbDUXa2e5RScMrtKG1xPXZsJUDcE0tgM4
	8i7GDujLGNCTrhCI3od7frGVGkiJZG0pIlmT+iCiumj7z/AljzeYPWXf
X-Gm-Gg: ASbGncv7b8xPxRemSLRqG4aReOUAP+DCZ8PIIMMO0Ms91tSmj486ZF1vp06zBjEZvnD
	r/UUkY4BcwGlvskVYXqd9SWO13pg9ULeFR7LUl4nqMsiT4XFbJZwbhmZZxGTHFHcz/QrvBS0Lcd
	3P8o9m5eFexods/vsFrpIsfvrp8EpzKHuH7vQaRbIXjrGVzygvhoM1n8T/GQCmiADP/4KyefLqh
	HoJdFufEYPwJdFulN+5quyuY/wtr9d+rs6Pbdx9ihYsNlQwDFXn8lT9cBphjMqC6i5daGUGDSIq
	edJIp0sRqOF3roPyNFp+9j7wqjQEj/Dpm9aQZhSG9F9HHJZ29JfoJSmxBsxK6VV0xGtEcYBy9Vx
	x5dBRy2Qoym2pr7MqX43HM4deVEV8TBiSP/WxbhFxhOJmGyMCdOp23jESgtFAMqyMDzYUpgwGaa
	M9I7UUQIV9BysAJeq2a4SeE2c=
X-Google-Smtp-Source: AGHT+IHBD+b3NB37DW1NNJU0Y7CRgNRfgj81Km3ty7iNT68DqbwCZ3dOZD5XoX8w64DGClNML1SwEg==
X-Received: by 2002:a17:902:f642:b0:28a:5b8b:1f6b with SMTP id d9443c01a7336-290c9cbbd49mr47303555ad.21.1760705531800;
        Fri, 17 Oct 2025 05:52:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6522d67sm5481626a91.5.2025.10.17.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:52:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:52:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/3] docs/hwmon: Add missing datasheet links for Maxim
 chips
Message-ID: <bfbbbf63-bd7d-4b2c-9e03-a3d3c3db04b3@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-3-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-3-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:17PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Missing datasheets now available at Analog Devices added.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/ds1621.rst   | 20 +++++++++++++++-----
>  Documentation/hwmon/lm75.rst     | 13 ++++++++-----
>  Documentation/hwmon/max15301.rst |  8 ++++++--
>  Documentation/hwmon/max31827.rst |  5 +++++
>  Documentation/hwmon/max77705.rst |  4 +++-
>  Documentation/hwmon/pmbus.rst    |  4 ++--
>  6 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/hwmon/ds1621.rst b/Documentation/hwmon/ds1621.rst
> index 552b37e9dd34..415d4c3043a7 100644
> --- a/Documentation/hwmon/ds1621.rst
> +++ b/Documentation/hwmon/ds1621.rst
> @@ -9,7 +9,9 @@ Supported chips:
>  
>      Addresses scanned: none
>  
> -    Datasheet: Publicly available from www.maximintegrated.com
> +    Datasheet: Publicly available at the Analog Devices website

The "Publicly available... " text is intended to identify the web site
if a direct link is not provided. Either the text or a link, but not both.

Guenter
