Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6332ABDB
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764013541; cv=none; b=mRLOQ8vzr1ggwJQV3kcCzwcpFTirS9385emJnjB8IaqQjBE3GOYY1U8XjJUYgl+0ICKvNSRiW5RRb1IUBfkp9m+X+SPgS3kAJJedIK/2cXhhcnj1jmDAUqIdStF8il9IRxa/V6Ya/6cl4wkLKIY/gHEFD7IztWaZnDZRKtt1wJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764013541; c=relaxed/simple;
	bh=g5GyQ9mYoeVZ42hhT1URTOPAPWbWyBTIBBkRoyO8Hrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls1OXkuecw9cDSdqgh5gFLoL9Brji+JtscAg5be2itxUSGFgmnLCHLNY5NeeOm6e40im1+ykjUN4YyNL6+xyTkpBYoqxcHpb06AC0uZ8sYlgZ6ZoOpfq0iboNhy9zk93TJUtAum6eXElgL04y6Fvzm6JoX7FvsjD665JAaV33lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXXpqZLE; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXXpqZLE"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aad4823079so4069860b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 11:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764013539; x=1764618339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GzLkFRqL4WRoPkJz68o50wpboOkfUFf59V0L10ozlE=;
        b=CXXpqZLE2HzNxQZW+vMQwPgpElKkyNazU+y7vm0cMvp75v5Lw26Vz9Z2Nw/bHzyvxA
         7xOMriIhjP4QcgXmctLFxIJen4z/eIEGRnn2YQurBoJCKJymM0M9kZpQbp4R9cCIOWED
         qL8SuwN/Ehov0qiReMHysdy3OzrdSDyfWimuX5s0J5XXD4k/V/BNFiysbS/6ixu0qXsx
         etxkcWYATFZdgQXDxvHB2LIBJkOlP3VzjJwSyhQfpPmR10IBtgGKEu8PwjV6F4paQ1+5
         DYqa6xTQce4GDazPt+W19QCktbeV6Fx1FAYSZePxBMHbCzOmdNwP4CBKhWVPmsKkuS4n
         XsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764013539; x=1764618339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GzLkFRqL4WRoPkJz68o50wpboOkfUFf59V0L10ozlE=;
        b=nmDhPKWVfMOVal5khgl4IhazGHmKJKoOs2LpSl22MHkjJsPBE3I93wWs8Yf8nmuCGQ
         QaYx15JwoWHhhXg6M4UCi59JJg9ihfXca6wOohGedJlKAC0tjG1Jvo45TED3CQkVE5EK
         sSe0kvD8kutyykVeT8wIe2ULbg7Cj93ktfM60RgcGECn39Shwtz3uB5xTITv4TQukgWx
         csxbLrqSlTZ0ImGQUvXNrXlnsxt4GgR1ghmMgwx5470IFvoQDJ1OQ/uBJZAabfZ9bygs
         59ntX6DEyLoym+0Ci9CuPtKCUL0y/uNm86IWaOUxHD+KuKQptnQ1A9uDfgOoPhIYrAKi
         mU/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSypkJGpaPlj0Z2D7rjzrkbBWgE0UdC6Nay2tfQfzY1akCmauBdpa+iO6/eRiPzen+HFGS1tLtLsnreQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FTHblncjIW2S6is3cnWODCMr3oLovzA+K/cML+EppGq17zWT
	Y+ZbhfXyH+L3jh71kbYNRwatpT4HwkuLwNSXutNqPWdBrNi5Ehf1CFjw
X-Gm-Gg: ASbGncs8e7g44j0YnyVoOslSMPrh2K9jAul2faCEz1p4pAMESc86DT0z98SvOa2Fr4l
	dqbyCN/s4IzjDIvCg/RkNDduIsWyRpnSioTdw8QRQz0quZrzk9HZ6gh1YhydCrk8dVufCJHh2W5
	E+7Jk6pdqL0T5rtQf7j5bMDTNUzTf9myuyB3PveD5zkA/iVXV+68k65MDl4imzX5ThoFm7Bsw+8
	KSzapd21a+o24Z8vTga6XnZV9+ZGR2lwijiPCgBJWNLHmB46/qkDX3q1ebs/dj73/kXcaCgGJBo
	44YyoMbbzjBHCZNmSYFoeWb1VuY+W9owBNf4cCgH2v8iPTGO73x/oXFeUQAKecEnH2lDALTntaI
	Ym1lB4qE8jMCET/s+BZHvbhtwdP6adf+/sAQyGxzYeFrEbv1FQ9kinB7bc/dTgCz0D7cdqOtNAJ
	oPGQF0oQyIPCi7G4IyF8HaeqM=
X-Google-Smtp-Source: AGHT+IE94Ojt9sjqKgzApUr55KaBR8qxHG1+2EaCdMfSW66Vtwd46vyoNADf7cX/Gbh6Q7pWeVPzwA==
X-Received: by 2002:a05:7022:30a:b0:11a:2e9c:1130 with SMTP id a92af1059eb24-11c9d711b60mr8241711c88.7.1764013538635;
        Mon, 24 Nov 2025 11:45:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e5674csm72839207c88.8.2025.11.24.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 11:45:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 24 Nov 2025 11:45:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: steve.glendinning@shawell.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Subject: Re: [PATCH] hwmon: (emc2103) Add locking to avoid TOCTOU
Message-ID: <0228fa73-4af2-4dd3-a607-a555afc664e9@roeck-us.net>
References: <20251124165508.4667-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124165508.4667-1-hanguidong02@gmail.com>

On Tue, Nov 25, 2025 at 12:55:08AM +0800, Gui-Dong Han wrote:
> The functions fan1_input_show and fan1_target_show check shared data for
> zero before using it as a divisor. These accesses are currently
> lockless. If the data changes to zero between the check and the
> division, it causes a divide-by-zero error.
> 
> Explicitly acquire the update lock around these checks and calculations
> to ensure the data remains stable, preventing Time-of-Check to
> Time-of-Use (TOCTOU) race conditions.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---

Applied.

Thanks,
Guenter
