Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F872225775
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878290; cv=none; b=t7rjQBUsAxl7lee7aQ9aG2kd7kFGI3lUSUZGZnTWY3cAKM9uMrI9P3Px/qSfE0v36MtXW7nxsmHaqq6/QGmLBUVkk82pB/fF0iEygKuTNH6P6fbYfOrBeCkjRbF31SJb3KxiHC0DtGPlhxMc13/pkWJn5DfxVE4qh97M1mQ8t/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878290; c=relaxed/simple;
	bh=FciX88FPNr97H7Lac066zfnpTitncLfqzeyFdC2bPqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGzYrnOBLiaO/D+1jTbmSyFck95sjjqc7IBhW+mE/6AtwSS1nMpEWenqBJjTbm+J5Gjj1VUmThcG0jFU1jEhHJyZV4kz1Qsnx6LBZOLG2Srj/KXjA0LKMQ+bAhBhFFhRh4bSdh0ip50K+biRTIuFCMaxbjIm637TSlNV+sLkJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvrELY86; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvrELY86"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3074adb8fcaso5702117eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878288; x=1781483088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9Il7KIXLbr6Qqp2KZE0DFyL3uNS8bQYdKstIr+QUQw=;
        b=VvrELY86UKXgUqj+S6Em5yBdqfC4C84b0XR1vfMyaV4R8xh1KyHJ4vhfqvXhxZiKcq
         OGVCcGVzseVwkxacyPt+zCHBMeehkRk/sWLvyoYBG/YIx8FbdYulmYBvuSII5KdeQRgk
         nVqhZodecuHieixbUzdflbL6MhdD3IjxjavoKzAqwjkKRBaN6tM9h87brvGUNmRKrMJO
         Rj/JgxjZFyI2NxQJmEP7Ipw6YVHzTn+ykIfQmqF0K5xVfaQpxyYnQWGBtth7dH/oG8qA
         pFBMk+u31TFsmvaYQ+M6cbVldnO877AJ1NDE7mea+6gWBKnYAH1tfCX3uDvpC31zzhjo
         8w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878288; x=1781483088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q9Il7KIXLbr6Qqp2KZE0DFyL3uNS8bQYdKstIr+QUQw=;
        b=T1CAb8rDCo26iYwBgjZwyul2wMyYAhQANQkQAJ6lz0CNI4iwb9OTvI0mhMOcw4PehH
         RK/IhQ8ZGLqevJoATgoc/0dmnNT/54vk1kwSYbWPLaJZN67Y4ZYa503v/Ym+ccINpmTr
         lundqXrZgRV61sPDsz7V0/pv+2pQV5rdmI7qqzGdUkrRQyPBRDPDd0rQTTkx4qTUtkWj
         VieDrbv01437j9wHiIfJK2ozD3f+CVpf1uSN5mvCJcXnrTEXlIs3MwKWtkH7512MUcds
         ULtZJcRywu8p6QdDO7oss/0QYmkhnzkX/bcCqlkuKatsleVTaKHuQxZA+maSMcpaE9vw
         fIew==
X-Forwarded-Encrypted: i=1; AFNElJ9CRsUS2jnOuBpStCetudq1oTjJZsv+tkEhyTP6Gu7s6kaGPRaNygOmXRX8hT61b1zEPbZNTWtjKEep5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhkW13AJNOaInEGYhorWFOiXMymyR+mzFiTNTBhqry5DuNloJJ
	LXzu3aUoeSXUFZUJL0iQNchK7xgdO9NXqZcBg5qMlxFXIDW1MV19h3Ii
X-Gm-Gg: Acq92OGMGoJWDQ7d6rcUJeprdURUM5aBziXYtM/1lG2YDJwOpHaM7DQOS96H2wfIMJD
	lxLqIF4Dv6k7NCmlnKoBLNmsIaz/dt5DfkctssgtHoAYpTPqtnrhwIqLM1geurgtXQXhclaTdxu
	VXOyoOzppcWoRpfdbX7n1k6SqJglX9Q8kCezeute8EvW2MHxUy3d9FH1MOU1vY9a4WbEW4zM1X+
	PdeHXyyq4yix6Vobkumw3/RADyuDNz+MuhyODAPyBdeSHTEuPlcDhZtNWn/7571A6canpwz7W71
	1S4F08JMX1oMDzwDSGjGv/stqt0pTEC/m9bon9CbdGCZWJlRva7SX3918NcxtdgREPdQ3mQGPqX
	ndZFtX8U4WnetDdFUyEVMAkBErtPajTlkxT/g9v5egG7plkNabwjMpxaMleiu5v2L3Z4GRXVXnf
	t21zA5a2x0Mo0KKCZPr8m5ItBxXeSepsA044UXQ8rF5JqIHa0=
X-Received: by 2002:a05:7301:1293:b0:304:188d:d0be with SMTP id 5a478bee46e88-3077b17f8d9mr7390764eec.16.1780878288259;
        Sun, 07 Jun 2026 17:24:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm16215925eec.29.2026.06.07.17.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:24:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:24:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] hwmon: it87: Clamp negative values to zero in
 set_fan()
Message-ID: <28e8c685-6fae-4db6-8db6-55352750e254@roeck-us.net>
References: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>

On Fri, May 29, 2026 at 05:18:36PM +0300, Nikita Zhandarovich wrote:
> set_fan() parses user input with kstrtol() and passes the resulting
> value to FAN16_TO_REG() on chips with 16-bit fan support.
> 
> Negative fan speeds are not meaningful and should be rejected before
> conversion. Worst scenario, one may be able to abuse undefined
> behaviour of signed overflow to possibly induce rpm * 2 == 0 in
> FAN16_TO_REG(), thus causing a division by zero.
> 
> Instead, clamp val < 0 to zero and keep the conversion in its valid
> input domain, avoiding unsafe arithmetic in the register conversion
> path.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Applied.

Thanks,
Guenter
