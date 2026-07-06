Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2B1FBEA8
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345937; cv=none; b=sn20aHwcGGt3j854Y3BzbRBkepcYplW/sPEOLZje23uNgDApEBbzUPNerU4vu3kxAkYxqK+6z3kmYfsssVnD26AIYeeQqrQ9xIa1CxhzpFrhJypZgej39uDGfywKroV/oWbg5G//A/54RG6w2dHpGlTbk/c22nKHMPXRJLiD5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345937; c=relaxed/simple;
	bh=LuVFvH30snQ5nukPCTSqXmOHD+U48U3n8WKf7I9zbD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5H//qR7zToJp7T8pZcOWd/0YezN3icWEPxQa0qr9JgHr8zO0cVg3qeqIHo/7xhY3qwfY/8QSR9+GTzw9RSLkZ2PE+X8IdkrLF5RuNTCxMGPF3dL1jTiYeIhls83kFfEbVhtFMUxORUYNYrk1naVQ2ttL7AlrGxS9Tre6rDZ3nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXQOxf9g; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXQOxf9g"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc8bc9d222so14167435ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 06:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345935; x=1783950735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fodGbpSxRQEsm3dd0pVr1IQBHu2WY5ik1uhhAyC3m+E=;
        b=nXQOxf9gE7l4IEwUzc9Tx5cbCdrZqT78k/YT9VvMacwaDes20ip+P69XmKQ+qAS8RU
         g7iEP/lOKscfG7GG+97Wn0mc5T/TRKZCYnwyyTwuu1vxT2o+cQGQqDW4/oywERuFmeZn
         eSbAimKANmK26lwiehnSmClnPaRCr706Q8X+ujJEP39SYyHj+EJO3DMNGhKlqgFXcxqk
         u+Hgiw8rT3Hy5RU3TvHTDjE5yVPwqs7NdnmJp1O2w8xpPR2iVqh+xzEdSDP+amyiTMB/
         jg+4RLVG4M6fcW11Oap3YZL/pMjMP1df1k4WCpNinOlYisKSBm+cs0mCXOUYRcOTLF7J
         Q+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345935; x=1783950735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fodGbpSxRQEsm3dd0pVr1IQBHu2WY5ik1uhhAyC3m+E=;
        b=hGuoGNIbaryQ+CIhNL5DYHvsApO+7RX/XvFwELzMrasbDFY0W/fvDimquUWXBGxIWx
         8L9T+9xjL52WtJcAOlB3syD+s+aI40tgIe4H2tMgkJUpMaSzwCLVFtdfQdQiKGMYTce/
         XJ2KtU8ecnO2PDqV98MwrlKvB4s9UFbeq2Cca/bQI4Qj4OXcN+VrKu/IN2tcqdTDSuZ5
         AV1lqUGOvow9qzL+ddlnAuflCSgakNoso6xW6INTzf6q3UOtHCg5ZmlN/UGbD1A//skr
         tWCY55It6/6Yl18F6on/NvYTZYgYdq1kLPB2x4yIvw0bDb41AGnHhskLG/beCXXQQUAv
         iAgg==
X-Forwarded-Encrypted: i=1; AHgh+RoddqPBiIZR5/Y9kp9y9p6ER9Toe1hVsn/8J91kiWxpI2yf/ZEZqXq6rsD8xp5bITtOWmMkO45y56l/Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXIx3yHTk0lNsnyhg476JfhPsZe3ibWWABbbKEkef1cLp/WrTr
	A1HnxcWAfNbFljGVQF3/cikbZZ99q+X//9iU7+g7nsc/Nh4h0bWRBkW5
X-Gm-Gg: AfdE7cljVp6qhLhysL7ifXsJR4X0W+I954jnVCOdKYInl+t8CbdAqdMcO5eSZAc8d1k
	qTyROmjUQ5MH94HFlaca0RpvcV+5Ce7YauHuoE83dcjJMnjbJH434OHb2CUOEIXfRVD6aqLeCqb
	ihxx1Ta885l7v3XxzaX/mOexCh75yBBxIR3Ljbgx/xExuqHxwveU91FY8ep0gH8O9gPvmZV13Tc
	61Ajhd6r6IbtJGUo365W2Qam4+kP/ZayJKyqmlZssGkpQRZpNMHeZrN3RUWPGVJDoryguA4aIeO
	/pDntnUwElgvezvsglEipRMh8Sr/seSK/pyTokxN6bUnV0AVGhlNi8g3bKiI8uisU0nfMBW/4T7
	NCN7fQIzhNDrvX3QyoXYigz+hu/etlyOX+PZPt1kplIdY3BpCFhG2GxJUPubPHbHoZfCPtKIrYs
	+KXyP+NQf6/W6NtYnFK0rmV0XKww==
X-Received: by 2002:a17:902:d548:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2ccbf010aaemr5945915ad.23.1783345935549;
        Mon, 06 Jul 2026 06:52:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765773sm52115055ad.40.2026.07.06.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:52:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 06:52:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Florian Schut <mail@florianschut.nl>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG Maximus Z790 Hero
Message-ID: <79669e80-d2bd-43d3-a119-1246aa946712@roeck-us.net>
References: <20260705113125.812045-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705113125.812045-1-eugene.shalygin@gmail.com>

On Sun, Jul 05, 2026 at 01:31:15PM +0200, Eugene Shalygin wrote:
> From: Florian Schut <mail@florianschut.nl>
> 
> Add support for ROG Maximus Z790 Hero.
> 
> Signed-off-by: Florian Schut <mail@florianschut.nl>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> ---

Applied.

Thanks,
Guenter
