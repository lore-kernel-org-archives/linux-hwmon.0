Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080BA23507C
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446634; cv=none; b=e5CcNng0NFjiq72XMpUPzJSt1SM2mvZwVUjIVDkRY+3XmSSsA8jw+dD6XJYOkK0mO8HdBIrNplbh4Wnt5tvVB0T2gyxJxslmeSJIzQKN3FZLK4+H5fYQJDwz2KMKwO31dpK8VDb9t9Y2ZLF7M8sb2aAI/DDBUJP62BpBjOr9tGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446634; c=relaxed/simple;
	bh=HTaVQB/gVmY1BnuQ4skhOXswz3t1IT5DcnOYFy2XCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hz4HJfq7ZE3P+MjHFcF/TTYlkYaVnrSuzmofnUjLRw0e5DLgKbR1usm4G77PKz3lqF11RgOcTsK7NII9ngmgvXED8L4+YwFsqafYwVZEIY/9KPm6lWYauCkQYLQwjLhQSisEVuAmp7MWJzsp4C/9Hx3JByX7+kI+TdvPqgXvW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt8VVJ2S; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt8VVJ2S"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c160308a54so709896eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774446632; x=1775051432; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmHLauN66hsGQq9eeDWWkMFkqMbTeB12/YKZ/mFq+70=;
        b=Vt8VVJ2SZnTRf2kRa5OPDCYCLob5vvmBU8kqtg/NLf2W8jx8v7x2UX/O4vTRxnOQxJ
         Vk+YVi4PoNli2BrqQhUWThwC66kXPWIrob2PiGUfEGQuQqxsd1z3h4qB1QBQzfYD1P8W
         G2z1G4WZ9bvNNP9c25I0Q6g9cq6C7EKw99D1ISm9nP6t+yrYRyK9A4qKpe76R6SzYt6x
         S6aIJNuSjzHfJGfkQQ/nhQ0A2T9T1PNhdfDdyVf2hk48QHctubaJaIC4mBlybK51yzQw
         Bfpw0sQK92o6vMz8ZkHjvkFlz5LI4OlpgU7AmSHbb2tC/nzmGkGSklt37TvEIvwZAp4C
         uJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774446632; x=1775051432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmHLauN66hsGQq9eeDWWkMFkqMbTeB12/YKZ/mFq+70=;
        b=kU2ixpL9aNnbAQ/fbvyUTYcBgsQwDGZeTM1zSxCJQzSRS53IhkV5qGuT25qaNGwEV7
         1Z9U6GcRxbHhaoz4QXxuq7gOBH00sq+j76LrRUmASOitk6rmur7jZwv6nN9X/yooo08w
         9G3ACqgtdj6X3Fo3abK7CgiYgCDVp7WGvTV2TfcwEJVRa9MSp867ulFnUozWvoN+hzLN
         gageHTtk2f03yQfYAx1NmvkBz2BZdY577TbF/qKIWyEtwZ4pSfvdTIiEBiCZwUSNWjaK
         txcehb7b/inLqHJnv0xveovAr9wmWjgQRodciGK0VAokwVMO6sTbORZNCciIaQBLhOFj
         1Kbw==
X-Gm-Message-State: AOJu0Yw8KsCCcPb52hfnw6r5ge53L+UnpfVLxnIEN7xqW/UZxS+0BWby
	9JGMFAghdL9m/0Em8So1cLlI5RUJfRd+aE1Nryejd9bfI+IIHBriQaGk
X-Gm-Gg: ATEYQzz7hzN68hnYBh38FvCBuQ4IuJiUZCPCN4H3NA0N1qMh7bVcEH8LohrQLMLZC/e
	uG1uZqUXBgwXj/WhE6jB58PqV5CTnVq6e4vTb3REF1vaUmy4dqqP+q71vx3qyLi0ctzIFNkkABd
	ois+B9+leiSXk253zht/bUIofK7OZw4wfOBOTC4YyXvIIHFocJT+IxJ9ST5SVzkXenhzM/FHY9O
	LvORxOOeGrnMcqhwod+G1VwzvRH3ROmpNDqWO4Y2EmWeiHbUQZNd3TevIbytWXOm7tsqEDtO55h
	TNt7NdesMYOxvRB8RY4sWGpA7jJ4EwWpLReBSDw2Heg3wyyOwvrExPrR9qUXctGxL9vpEenrI3v
	rKeX4TW+phNaNuuVUL4WcXIP4zUGNt917T+Wl4XtIhYFPN8hlAzLhLauVXtL6V2y/GnACj6qy9P
	KS6VP9GJ6Z0FURaa1ibqbHpoFOExahfhNWKTKj
X-Received: by 2002:a05:7301:4305:b0:2c1:6cfd:73f3 with SMTP id 5a478bee46e88-2c16cfd7cc4mr42953eec.27.1774446631921;
        Wed, 25 Mar 2026 06:50:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29d28csm22524692eec.19.2026.03.25.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:50:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Mar 2026 06:50:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2] hwmon: (adm1177) fix sysfs ABI violation and current
 unit conversion
Message-ID: <17dd13aa-ad37-4c6f-bbf1-322202037031@roeck-us.net>
References: <20260325051246.28262-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325051246.28262-1-sanman.pradhan@hpe.com>

On Wed, Mar 25, 2026 at 05:13:06AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The adm1177 driver exposes the current alert threshold through
> hwmon_curr_max_alarm. This violates the hwmon sysfs ABI, where
> *_alarm attributes are read-only status flags and writable thresholds
> must use currN_max.
> 
> The driver also stores the threshold internally in microamps, while
> currN_max is defined in milliamps. Convert the threshold accordingly
> on both the read and write paths.
> 
> Widen the cached threshold and related calculations to 64 bits so
> that small shunt resistor values do not cause truncation or overflow.
> Also use 64-bit arithmetic for the mA/uA conversions, clamp writes
> to the range the hardware can represent, and propagate failures from
> adm1177_write_alert_thr() instead of silently ignoring them.
> 
> Update the hwmon documentation to reflect the attribute rename and
> the correct units returned by the driver.
> 
> Fixes: 09b08ac9e8d5 ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor driver")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
