Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279543D73
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048115; cv=none; b=TJUPHAjK2JKGth2l6VnKcOKGmeZt2ZfpSXP+FurkDSvK5HzONzCMbX0vOV8AlMc9OuPv4mTZB/TFohfU4dGzuVXA9ufJQ0RfRGVRL8IZTfdbjjdr7E9asYzW2aLNdwpZroEGU9tW7f4mf0oEXhMZM1PR+RYX7AJ3e3AG5NM/K9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048115; c=relaxed/simple;
	bh=4wtM4+E+fU2cEtYrQ8VHz8GeZQ2gz0buheYO0+wMHik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EORupRly5mcA8+dDVexDeOVNAgiq4U8p28p5gazilBsByIJRhxjrPnOWPPaBcLeA4WjGA9PhYrlrERhRuNKjrSewfGgC0GHPZjdAOSB1bRVkD2E7GKZ8WiEK9AqUOd0wI47ZeK+6PO6eMHk/4La8XJ2Z3B1b0yUJ6G4abhGJuCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU8VugEz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU8VugEz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so498264a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048113; x=1788652913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RWp7Eu7TTH+plM+azg4ePCimmLqObhZvnDfLzIUobQ8=;
        b=QU8VugEzQCDnRNeuGaJfI+dRPm0NHtWyFwHXwixtQedt4dWwNJowW5G59avXB4AbV6
         Gdjn26T5QVvxpMFSRBnusX73Wo4Zm4FD/Oxx0+yHdI7VSNMIMOLN8w1xsJdyEAmE5kXt
         KvxbMLTHhrJ7+9UQjC3ijjLHs2MpiGoQqvur2d6f0sC2+jRDhxqZF9dwKAFFIUFc6Rce
         d5AHM4/pgSvqXShwmc3vPC3rLpoJSc53ri54Mzp5JNsLZdNNidIxkX6PAa6a4SL6z28e
         9MCFmevbelMu+p/yjYBoxC0Ubb0kfCGj3eGZHvvd3Ey7eIeDgHjAXaXSSM6vIgWyGIfi
         kp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048113; x=1788652913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWp7Eu7TTH+plM+azg4ePCimmLqObhZvnDfLzIUobQ8=;
        b=c7BnHL8MpJaQjk3I8G8xYip2Re5IyxMk3LkGyODiWt5fvHCQe2rQC7AdNf/c+wTbay
         nwsLAqZyInN3pPMdF3nGwszFL7mjfIbq88/2Kgg7BI4vt8EZ1suK+VzJ453u+ulL9kUc
         bJVIPgOle/BpCmLTWsk5dfaNhwAudMz2QtNhwXnH4uxgQ6j36sV6n0GZyfxDcscX42BQ
         yhcZoO5jK6v06qYGNTaHBBHk4Sn/mgzM6tX9zhCWlpcW9h8cSMMTgS4NnSSammFvlSje
         6+bb6dmUTzzHwvCkXv+R2w2FrgxoNNKKNNMveTuoqacoCHcG5RCdLf3kTE8sRsKoNjU+
         d5lA==
X-Forwarded-Encrypted: i=1; AKwUvBxzTLuQ+GwvcfB4eot9cX5/OjTvEg5WXpKfOCNKViez+HjT6Tsk+ZZ7xyNSYbqYM8WaTyknUAKGHdZ+Tw==@vger.kernel.org
X-Gm-Message-State: AFuF++l4G5UH0tTZLqVE0xxKV1v00G1Ksw1odDQnPNM1ba1Re88vHNA6
	HakiCQAQLIHt11dbnf+Hka84znxmdnu5gfyYbvGCyFRcVG/tgajg458I
X-Gm-Gg: AYBFou1zZ8xHJVEEbjH3XTjj7wIj5wMTXoCxRkAxJjv3sXCz2IjrXMgHaJ2jk84m4Oo
	QkoMS9eCgPV/kRbljdLZ9GpsveGFA4g3N6OLmP4tZJgliPkpioCCIjCUMP125+kW60JafguBywA
	5t/C9+1a9CorTeFlMIfuoQ36HpPCu+i9pGKZJxEFeFPGL5J6ZSFwCl51T/5PqqrARnXP6vPJ6fn
	Lmm3PTANYoOsDcA4CQLH0uO5ECYvQNkglUPmpYTuDHQTJUpWv3Dt7F2zeJQiLQy2NNvX6/pyqFg
	xrYqgHgNWUaEvKTRkhNqVQN1PlauSfNc5I6IpSHGLtPC9ehc3RnhoqN3KcMVJkbsx7Gf0aWObf0
	FCLxSD7tXgI34QTcGAP7mp0QQpayeIdBzY3abf8LUyu4zyxvM744hZtwxt3BkAmbpHae1NXep0A
	UVe9gNGM7/PvvDb3shfJJog4oBtVH0/YW7xlSiMKEfu6QFim0EggMEF2OmoY0j3UbRAbd+4Qsdm
	A==
X-Received: by 2002:a17:90a:d56:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-3989bd3d8fbmr5328726a91.16.1788048113400;
        Sat, 29 Aug 2026 17:01:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc58f3dsm8836045a91.16.2026.08.29.17.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:01:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:01:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Tollet <jerome.tollet@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: Re: [PATCH v7 2/3] hwmon: it87: prepare for extended PWM temp maps
Message-ID: <bf5f1a4d-bd53-4cad-9727-3fc41fb7fce1@roeck-us.net>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
 <7b4f2befc3d214b646c0582e6410f17e78748b4e.1788040385.git.jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b4f2befc3d214b646c0582e6410f17e78748b4e.1788040385.git.jerome.tollet@gmail.com>

On Sun, Aug 30, 2026 at 12:01:48AM +0200, Jerome Tollet wrote:
> From: "benoit.masson" <yahoo@perenite.com>
> 
> Introduce helper logic for PWM-to-temperature mappings so newer
> register layouts can be supported while retaining the legacy two groups
> of three temperature sources.
> 
> Honor the four global temperature sources on IT8603E and IT8622E instead
> of applying the legacy grouping to those chips. Use per-chip masks and
> shifts for newer extended mappings.
> 
> Newer controllers keep the duty cycle in a separate register, so write
> their temperature mapping in both manual and automatic mode. This keeps
> the selected mapping across cache refreshes and mode changes.
> 
> On older controllers, defer mapping writes while in manual mode and apply
> the cached mapping when switching to automatic mode.
> 
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Applied.

Thanks,
Guenter
