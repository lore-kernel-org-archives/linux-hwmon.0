Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CE1E4AF
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765733785; cv=none; b=F4WTwhCe5lQRWWdF3P8mn00+sWeWuSra9Rg9UB5iP5LklUbOWpNd9uK6T1GnO8UFnlwaPcekCa1uBxK8jTZiuEJAcJOBtd41exx7He2c1Dgf37v1E52BeUVI8STY5YDMZkhr2wSAWihDh/khxnCCLgrm9FcAvpi7j5HcO/AHA6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765733785; c=relaxed/simple;
	bh=ArPPBxvj/1KFBdjhtVVbPjI10BhRnKL/wUEnXZyKPNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlFQFwjNOn7s6+bGok0SzCtL1GWAWnmvUsx8cfc5ha1x/XT/nk0UHGLBTHAIx0kYssvei35MpAjGAonN1s93Q9zU6yHkh7WShPUmV+WPJ8s6o2aplaRU6ovBb7S9V4PxBatjBKjEn4PtCWT4/dg4cbT4mHNx1ic8BTYb0I+aR8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmIkpRhg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmIkpRhg"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso2150359b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 09:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765733783; x=1766338583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=co2TvOuWPOky10Nva0naS6jBf9MgDS4JqtfS8GXmyBo=;
        b=lmIkpRhgL+VaNdGta53W3dVz25MHdHMIiSP+skyp9olX6dnN1hx3RUDvwUJjhJ1aVd
         EEabjjn6hGSohMnIrtW21nTaZwBrT8fxjtx7EVWDkyLfZf0o1zZsSgOB22k0ccQPAeks
         uEdYTDxzvUiefDhxP2aGC+YvHMATLy+zrQlpUU1FEZJ7ZBiPguGRA4iUXW44ElsdMv0e
         c48uF/HBTEEo3MerzxJmvoz2YPLotPNIVmqJChakQTDx5Hk+EoZpoKQLqgS8wV3oNBOm
         KJtDb4udSsIBsNgRHjJU0dMLdRP4/Nq68dJR1qeFYFW+7kgp71fm1kVf1iSEg7IOw1fH
         LoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765733783; x=1766338583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=co2TvOuWPOky10Nva0naS6jBf9MgDS4JqtfS8GXmyBo=;
        b=MP0PpYiaTtOs/JaHvgvHUAWK/IUZWfzaiFjUFhEyve4BRA1llD3j32TqC+5THgjzGV
         W7oDKO9jfVJoKH0v9jh2/tNGz5MH4grF7+HF/FoBbbWl+Tf14jwlDj8lZaHK/k+s9wVQ
         e7p4ufUjVnptc5wdhUIJjD0JIpn/SR6e1cPCMewJS6rWMVYJqDvwYaVvWLItY9o40sc9
         UIoNPZ0SQNc+6pzc+ByUNyvLgDiKqRwgMnumb2PXxcDX0+10xQMw7loE76an1Un1kLSI
         S34f9omwOQkrL6Pn2To1JbOkK0BUYWHl260dgkSoPG4KoS4BVVcMTg9jqLpQkoEAXYjv
         LCeg==
X-Forwarded-Encrypted: i=1; AJvYcCX+rSVM5GmcUyTG+vru6G1slPsS0qMUKeZeQ1D58wPDyjJ2MIvOMV3YCEQJLMWJbF9YxQ8WuAftYTDayg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSZ+T4u1PeoasGgsbZwPUY8rl4d7TtnrfjAeQc+nXThvjEtTD
	yQugLcOrnXthROam9QRKnQjBh4qHjVF7h+lx4cqu6s2q38rh7Gauvfef
X-Gm-Gg: AY/fxX6WQ8pxKSkgqeWXuYjPQ3apY5/KfXVFfo4I5N8ptbqI1GxJURtw9FQ6pO9VhDP
	IauuwI4YQieF1n3UX5mPYqVj4aExuN1wp8Dyq1Ok2JaPGebeT9oswOF6gIzKBDpbCbFRFklZld2
	kZb1guTH4889VNCaMPv2reQKGn2ENE76wxyAwZNBNsjn7Y3ExO+PNrFMwtkU2nXjUad+1mV5w08
	p+GoAR8SzMdHQYKi+HbRiR7i8XEEGVMihCIa3HfnkGRPqwj8UHzZUgIAjpXzMtTvdRfkNdPfUd2
	PvgDccPJod+t85VX1dnrCoDperftdjFgI5qSZ6HHtXckY1yBLUYlKGZ0GgQdl/6WhJYEq4QV4Yq
	aOfUdjEqJ2qGS2JAF5sgU00RnIFE16Y200exl6OLONmX9jfdaz2uYd/nmOvyigClcj2FIx4dynX
	OA2AFyWvvov+ESLPUQnvrRvBc=
X-Google-Smtp-Source: AGHT+IE5KA3Wd8iGR0xhEv2L7EXy31rZl7g4tVWYxAcRKxWAK3zHZLhMNW8FaTF6n6BaF1JiyMPZrw==
X-Received: by 2002:a05:7022:5f14:b0:11a:2ec8:de1c with SMTP id a92af1059eb24-11f34c10ce8mr4835253c88.36.1765733783515;
        Sun, 14 Dec 2025 09:36:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm37973896c88.11.2025.12.14.09.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:36:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:36:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: "Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>
Subject: Re: [PATCH] hwmon: (ibmpex) fix use-after-free in high/low store
Message-ID: <0b846cde-0906-4470-a3da-8c3fa890006a@roeck-us.net>
References: <MEYPR01MB7886BE2F51BFE41875B74B60AFA0A@MEYPR01MB7886.ausprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MEYPR01MB7886BE2F51BFE41875B74B60AFA0A@MEYPR01MB7886.ausprd01.prod.outlook.com>

On Wed, Dec 10, 2025 at 05:48:08PM +0800, Junrui Luo wrote:
> The ibmpex_high_low_store() function retrieves driver data using
> dev_get_drvdata() and uses it without validation. This creates a race
> condition where the sysfs callback can be invoked after the data
> structure is freed, leading to use-after-free.
> 
> Fix by adding a NULL check after dev_get_drvdata(), and reordering
> operations in the deletion path to prevent TOCTOU.
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

Applied.

Thanks,
Guenter
