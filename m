Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38671DD543
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182812; cv=none; b=TiCyqLaXiBMHELjQZFmLZYu/q05jUgLr1drqJD7nu6M8xYgmPm2BmsSyq+D6wR6KM/FLIibvxs9kgeW/Z4I7p4ypWQWuoAzKFwvmnEiTR3CGll6uMnpizJsiAZnpJBmGQRiBkTxF0q6ZolFTzgIXZEFa2HwWXv/jnLKEmsdSAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182812; c=relaxed/simple;
	bh=hqniof2GhTZu2S0w+shlVUB+28jxUopKiRUwiDjnJE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvdUqA1ivCB4H+BOoNWdBKAlD05jmBs/cqCxoH1376J5gJXKWr8llR6zdenW0CtCmNeMj51t5KAlNyYDeovfVe6UuA7+U70iXbLk94FGlNtLNzGgxci9Ek748UUDRSMxmSipP7xkTIZleng0XhWx4e7Ymzh6PS0E+NkU+jva0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1CKOJT1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1CKOJT1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21a1e6fd923so12146535ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 09:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736182810; x=1736787610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqAaMDhLOAYUKgs84K+Nmgt++3Ml/i0SasUrqa/0xfk=;
        b=O1CKOJT1P4/DU5B+JxEtQRipebpb6EvbDbpZvLgfRz8Fp2Xg6UoL/nV4o2KCfoqBCF
         s3Mgi0xiMqolw5jc/EGw3Q53IFxgMhdJaXiwIdaO0VL5p5E8kYTqqWLPSvAFK6/Foaoy
         pYdIjrYnbj37pgcShfyymrpet2MdsNImPRDr3SPNVi8U5Dfe0f5zjril0mV4O5uqInLS
         TABytQP6rwUVQNBM7gPSloEpaHog9IUEKW3g1A7blds9GRJYfIIK15zaOtXRPUvbsYEu
         tz8FQ78DZ3MxPKYkpQi4y5sC4THSzwY/1T6qIfSFqSXo2aEJjMIA54Ki8W7on0kDxdgX
         7PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182810; x=1736787610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqAaMDhLOAYUKgs84K+Nmgt++3Ml/i0SasUrqa/0xfk=;
        b=Bib95qAPZT1kPXOU0Gaa8F8yACszL2Gm9raouJ4dYNruUGIW/+zF8mcU0xtm4AAdie
         RYV2N0APyrbayWY/YI5DExTQ7WtUYMZLSfjg3PO6u/pmzVql+F6BZrlTyIRHfF1SAReb
         VYVlufgrLQD8eXTYufEEb6/QmfsQ4EcijwntiqNtq48HPjrmCcxeALsCW3XawjsClC+V
         7joWaomN4pi+On8ELEpeNTXR+FLzjHoi2uRvNGkd6JuZGwl1O+/NgKwShH/h3velyPkJ
         DuQmWoJXO7IecA/NEcx2VCs/u0AoHIt+oXC3rtsHUta7ZXv3Ph/WMJf1+jN3bT+UeSgG
         Wvyg==
X-Gm-Message-State: AOJu0YyNVdJ0URYQubg/74QHgsXV9iiQFHQ6tzBfmXC3RaqzWJXKg1i5
	1Rbt3CW8Xr6xErC9TjUbFzd1Cc8iYC7luxlTxd1hur3LQoama7dS
X-Gm-Gg: ASbGncv4u7uf9iD1wwJZ5L4uQByorWI5vCjKBgrQ7SW/F9OryoomBLN5EucCt1ukCYp
	3e5pPPeqPfwOgQYFw3ql1L8Q2gSrxP6d83H8FnqXJ61Otgyx4l9KV2iKXDe/IowPNPpsZ6GkUZ6
	XfhTOCuZKUGqXmGJiWoTP8xU8uuFzv0NDIhTGsHYmH342izBbgnHdAsH/p8vUOHRW20jUsjD4DE
	qYTT4xp8WbD86UtoqgAlYA+3gEd+zTSB2F1JoP5bFN+vo4uCF/67NvNIkjIDXtxBnPhgQ==
X-Google-Smtp-Source: AGHT+IEZwvuQNIIqP0L/BbyDZKu3m5Gx9YK6weHZPd38Ik9HaaOLEYnlOv31n9d1f3cPhrlx+KEhcQ==
X-Received: by 2002:a05:6a20:244a:b0:1db:ff76:99d7 with SMTP id adf61e73a8af0-1e5e07ef1afmr112787475637.35.1736182809833;
        Mon, 06 Jan 2025 09:00:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8164d3sm31680220b3a.15.2025.01.06.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 09:00:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jan 2025 09:00:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-hwmon@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] hwmon: (pwm-fan): Make use of device properties
 everywhere
Message-ID: <5349faaf-83d0-4790-b841-170a9278b904@roeck-us.net>
References: <20250102170429.791912-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102170429.791912-1-peter@korsgaard.com>

On Thu, Jan 02, 2025 at 06:04:29PM +0100, Peter Korsgaard wrote:
> Commit 255ab27a0743 ("hwmon: (pwm-fan) Introduce start from stopped state
> handling") added two of_property_read_u32() calls after the driver was
> reworked to use device_property_* in commit dfd977d85b15 ("hwmon: (pwm-fan)
> Make use of device properties"), so convert those as well.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied.

Thanks,
Guenter
