Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA443C8733
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524500; cv=none; b=q3c5C9Y3vWgdn6jHWAUjlzTR3gQK5DpElJT+vwLZ1yP93XlGiIuh8ndDYf9SEchYZbSYA34Pk+2IAxkoBWnd1uEKL0W9SNl3j0mu8t3aFQx8tZOUT6sK0jsQz3IKpJQO+bNegXHPSyyDSD4kB31AjPEIPBQyQcvu4k7KMSnwPQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524500; c=relaxed/simple;
	bh=NABFMso1eJX32ULS44mVneLa76fZy3FFUNHo0c77wl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2slQNRaEtOqt+m8IR+96+XYi/bFqYuchG7qooSzW4fYxnOCtzJ+0LmHny8bPE5mGFngDIHoV7+uUmsIXRf1t37zi/JQdtroLVfzocbDG0JL8QnKITm5iTLR47h+hOScPzEfDB9l2jsZDxxNtPodFkNyZvQfX3pyJ8brAMLo+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4p59Sek; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4p59Sek"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad9a9be502so5354125ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774524496; x=1775129296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KVN4Ue1K9o4ecsxbk4KWSp1ra22r70pkRO3bbM1geo=;
        b=S4p59Sekl+Q1VgZsyABNAuQ2kUT6S0JN6/z/og6GtgUPeJLkvbzfwmaFPBXs4QI65G
         SXw7lTtLPrikq8JGIC2rA4Di0VrTN7IOsoLNkzyfNcWOJ+aEPFe63ljq5J8mmgHaZaqc
         OFBZbenwsmqEXnbP+YHYPeSecFYvA5P5nDQCpyaNxme1SrHNux2lVFjIP1xh0gKWsbd2
         G1J5bafBtZjHVmWqmMSUQcH/+9LNEtLZIiW2BYUKxRxju98uzEwrzHlu0ggBzh2znzaz
         xXRqrmIsCAhHiUmpA2rLph0ckSZMqLZvLRVqTcjytDZPppeLDIrmaUGgwBSnt3lcpL4J
         Uajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524496; x=1775129296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KVN4Ue1K9o4ecsxbk4KWSp1ra22r70pkRO3bbM1geo=;
        b=r0dKsB7l3PnU7g8z4avecta9H5Mi5HQjuqGetBnR6blxtZfejxL62iczgAP45Razhs
         6q4FAaJMurCXYAf7Z+5avLMrL+uCvIvmwH2RxtLSyHVlM27UvUWkFivRgyrrYwlNrIbT
         FCaahDHMRwIiPOfWjBhHzfIXAXEEHghg1rQF/XkO5lPUmcJAD1g46wIi7feNp2gy4dyH
         xjMH4XTr51DntrpsWS7PRj/0/4wqpUKlv3mFzWDYRbySHGfHMxq83WIo2WDhAmegPI6p
         1r6ApeR9LDyfgN/pZnYwQB4DY+z2F/Kns0pJcGHqJtaD3rVsUGOBUsxXb3gRLKPXkKUm
         CsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxPxRMzKsAfkIYUEQmjkB0ZUr/LdCdQvnReieEZaBzb+GSwUQVRlWNRH8XBHE2jZ5z3WPhs4ectaUuWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhspn/5EfRnYxz6qtXRQ5BrcgBIWs8nRBnO6swTBEgFCG8eL0
	E7bfy9RALIHth/iDZ+eX9cT9ZZhqM+yharK5aU9rtcYn7HGMoBjQ2SwB
X-Gm-Gg: ATEYQzyoTilnPtR039AWPij8TMe/7MASyjzwmg/MMy2kU4JUU7AOUvzkl18L2js9JSG
	mi1NIOGgY9BFGHenI4Y7LCg04E5eT3k/Y/HbQAO/ejkflj54yVUK33LnjbS4RCkIhzcspzzbgdO
	TzlBipin6eBBV899jL9fCHmbqjHuMF8lBjGV5IBKnRaPZ1Ob8ESUNEaBeFNbE4C0qPANb7raB63
	xrCY7F18LCdmn4NLwRr3LeTMRNu/9ZZnuxlKE7Wa9Ni6PqJoySZVeety3TxHnvE8gy1tQvSjias
	Fe/P98l1bVwWElcDFOgxHaP+WuS79FrtzU53aH0Q2QoPudeJ9GX80xUGpvSAmcic1EYCSp4XZbZ
	JbCmlncVaM66RVb1itmEpXPUvjv55dKwb9q8HIT35DbdS1RVeRerxaDQPysblxonpCnwapdnSNI
	njdwQnpY0uSUv9HjebEmFKV+7PROlnynpA41QU
X-Received: by 2002:a17:902:da91:b0:2b0:691a:8ce5 with SMTP id d9443c01a7336-2b0b0a3a693mr72765395ad.23.1774524496540;
        Thu, 26 Mar 2026 04:28:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc795f08sm35632925ad.21.2026.03.26.04.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:28:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Mar 2026 04:28:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina2xx) drop unused platform data
Message-ID: <a4661a50-1419-458f-a0f9-a9d9f6f59177@roeck-us.net>
References: <20260326-drop-ina2xx-pdata-v1-1-c159437bb2df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-drop-ina2xx-pdata-v1-1-c159437bb2df@oss.qualcomm.com>

Hi,

On Thu, Mar 26, 2026 at 10:30:00AM +0100, Bartosz Golaszewski wrote:
> Nobody defines struct ina2xx_platform_data. Remove platform data support
> from the drivers which still have it (it's effectively dead code) and
> remove the header.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks a lot for your patch. Checkpatch complains:

CHECK: Alignment should match open parenthesis

No need to resend, I'll fix that up.

Applied.

Guenter
