Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEE0AD39
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932168; cv=none; b=KCtF0xSfjz2ZoA+mHcTyUovcspXt77YI5Y0gI0uD5naald53l5sF7G7Q1QrFs+TBPDCsV+8we5xZ8FyQJk3uPHvu1tvKyANsbTNqEyLS2byELYMQh/c4RA6Zm6BeLNiXNuP+2PxdbQvAib5Loscz+mfFcBLnzcem4kX26f+S49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932168; c=relaxed/simple;
	bh=xdyqknF8TLi8qzF8M8KyTyjov6n6kc/oeLrlQJFxNy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+LQw1q1Y8RMi5izcuGrtvrVz2igu6RLhVpGbHwefyEg6zYyErS1W4NuTkoGyiBIok8k63vkyApGC48orRnKk47fYYOR8huvnBZ7djhoFG479JCQdaBIpOFf1KPKJdcQDKq671vdlaNJQZm9xn+fTw557UUCQPe15uZJLmpJtFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bglfkq68; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bglfkq68"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2234e5347e2so72169675ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Mar 2025 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740932166; x=1741536966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNZ7DpKifQq1SIcBBVl53cvuepiEeeFCUo4br8vym3c=;
        b=Bglfkq68xE7MM3Yv6wlTp/HqTJzIxiFBTsDpE2j1ZPCP4mtxKWmkV8Ff5jj2Of/KKT
         qjw8jOBR0aoJyMNWqufRv1TdTQjp2pzWhKR+Utv6HQxv+zB+usUPKpnGfK1UN8uRjLns
         6fDNLaBw9RjyVoaWzIEFrD14ewpP0auibwoHaYSGhfc0IJH+0W+CqGyBaRz3X6fcceWd
         cJjofWWMafDfNqz2drM7GiXju7zvoNov24pMllK3oJWTpvqZBbr+bkMEAOwU0qjsbjeM
         sn7/eb6F7lfAvvTiKJjAlkwdygWzOyxXE7rEv6dFNfO3WTrIvn+rB5G1t6O3vfhbcVAu
         P2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740932166; x=1741536966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNZ7DpKifQq1SIcBBVl53cvuepiEeeFCUo4br8vym3c=;
        b=CkyWXEDn5Ap+X4OAcOqdql7e28nXdT/XE7HnvzyigAeI6IDW7boJIsoZWUMt4Rx+66
         B5Ngx+fJ0R7TA/eNnhxTZSK5MQ2ajzlK8NAgBmEIFWP2uJPyIA/SVWkPsGT/xyC7lFNB
         hrCwXTjJUeddavggVTY5S6DgVzcA0TySatWmRm+/91SVC7Rk1LXCO1N3lHRcrpToHS0f
         C5ciujzUYkoT8gyj8dWDnFIHnkd5llJMuEKtHrSwFLnOzSrBKSw+SPI6tFBHGsQ16Oxg
         u3ysxri11x6D1ypfzzhlOM0LXc/D5YZPp6Q4P71hvw3Nxq7mAuOgU1SiEvzs6jE3O/+L
         CQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXf5GNA4NwbnvbrUExSxiXwoY+tEKKAHdtrrQobm/Hh8x1WWCoo5mjzfw2SYgsZvposwR1jpdn9WTzo8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrTN7iHFzRHurapbPHiX7OfaAB0lXz3vtDeH7V3Ga7R1G3oTj
	2MaOew4dx9W9fxuQ9i0gIft2LbYkyGXAYoUno/ak8dU1y2bG/UpL
X-Gm-Gg: ASbGncty07u0g/TD4UmKmkP10RTBAw2q1DupK8DRir8aQVIXdq8XFQZU/PIcF5fnLwl
	zYzpadURMRKFS5y3MHtDf34XgovA/DRP1kDpegzzWoX0dMjNm02FEHmMsPfcVItVQLHHCk/eqqE
	ALcC6SU2Yb8L6U/rJ1Uv3CthtFglaBuASNi/lokpk3zY+uXVFmNVoxu7Nou9nXwyWLqK5P9NYdp
	+g3ovE7vzwgdfrVQSv2ObM87n+l9NrCQ+001oz+pbZUVMiHPkMXlwcyyOQ0wbVSUeEK0a1xYTVw
	z1A85MV3fXu2dBzcgs5Kwz2u6Vx7woF80YeKwroc4bfZFcJoxRlNGLsSug==
X-Google-Smtp-Source: AGHT+IF0R+8mW0RDAUZEog+iY1DLC13E/cBcgukkBdnjklOXzzpu866241ZfUAoo2Tsc5J4X3Dq4sw==
X-Received: by 2002:a17:903:1984:b0:216:682f:175 with SMTP id d9443c01a7336-2236920c40dmr188880525ad.49.1740932165762;
        Sun, 02 Mar 2025 08:16:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f041sm10301315a91.41.2025.03.02.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:16:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Mar 2025 08:16:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) add support for cyan skillfish
Message-ID: <ac2fed74-2b68-4dec-a44b-2784e4bc346b@roeck-us.net>
References: <20250302155009.49951-1-me@mixaill.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302155009.49951-1-me@mixaill.net>

On Sun, Mar 02, 2025 at 06:50:09PM +0300, Mikhail Paulyshka wrote:
> Add support for Cyan Skillfish (AMD Family 17h Model 47h),
> which appear to be Zen 2 based APU.
> 
> The patch was tested with an AMD BC-250 board.
> 
> Signed-off-by: Mikhail Paulyshka <me@mixaill.net>

Applied.

Thanks,
Guenter
