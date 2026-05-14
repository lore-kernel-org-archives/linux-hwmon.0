Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4D717A2EA
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 19:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788641; cv=none; b=MFPQp54LjpkIMp3xIJ/8l5h55O1zkdLK4DWYQzYMfrP0HnXEUbPTHX1TYtp9RXiuMVI/axxiFy2gqtwQWbPE2yY3/v8rYz2nelviWE70Ezot+i1SqL0jcTIcvRStPBEeOivasbfSLhqxwUBVCgLEty5ExHDvBxisxyM7NmjuR64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788641; c=relaxed/simple;
	bh=Az1IYaOEEgLz6UKgjZworSIXQ7lq5fipFLycaAAHFPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+y4/cjwhvH0tMps8b54VjI11iArEPHEeM9ogxHn6X/bN/K8zJ7OyodXUdQHyh8RxHP0gr8V98A7vjCOxJRzNVy+/y4RhVuLeRZBwOk7/14IpmUNiilf9Fem/U3OBuZ/e/NOFrnBOpiD4O2EQvBLKchkqrjldDmJI4ToKqXe1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syqCzKQi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syqCzKQi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso35979495e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778788639; x=1779393439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Az1IYaOEEgLz6UKgjZworSIXQ7lq5fipFLycaAAHFPs=;
        b=syqCzKQim6dXsrTJ5wmCyd7R0kJaX0brVFLOoW7g+D2vV8TcodF9h9l5AvNCsAduen
         NuBcrakl436S3QfY/jVv0X+ZH9goWQlmbKJXuntpLb76ggoG/ffR4t0TJxs5heaCplC5
         Eq+zCaCuBkP0Htevqw39cnsSVFQ3sMWhxpV3Xesz9VIXwAhANIPKShsQ4Sr5GoRFDJJf
         GUUJr9VPOWFp8qKHmebolYtfY8K4WijfowbaZ6Y7gHleRFx2WfhnVpTfvIko6BobU3Cf
         t76vZ47G8mMWgmAg0DB5BIPlGuFZW+5InjLab4j4htgQfrx0vS9G4ac4rk5sMaiEIzC9
         SCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778788639; x=1779393439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az1IYaOEEgLz6UKgjZworSIXQ7lq5fipFLycaAAHFPs=;
        b=TZ31q41WOdhH5TIPkrSxI7FfmpvSFZSeW5MstLnmQ41x+h4GvrnIfjNCYP0FxtfFpG
         5ADsSjdS/39quB4M5yApfSLWPE/qJ3U55WMx3hJ+sUamX98uSq1YXJgZOhtnM+7J0BQl
         EtQRwz5fad0AWM7XzhZiGb+tn81GF86zlbf4OSSvToY04HiT+mbYWVjW99KS1PoMGH30
         vRVR2zv4D6T6Uxm+BsC6wM0WIfUtrncfbhFLoa4AuOI6escX3cFm4rGCLMCudv+00Y1A
         XR5mn9PmmUSrbEgmlY2BlWx4+emi364uiDPJjIumk8//ssiZ9NQB9wiC8HrdhcTvO43H
         KS4w==
X-Forwarded-Encrypted: i=1; AFNElJ8okjFpS0OBdvEOJiNv9eYHAdGaVN4k9twl+t7DFppOfOTXil6IRTbFScZPhgC2NSGCsxoFJXYNjbb3zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrx5uTvSOesKCFAQit/u7JlF/ndIBCcEE97RuErif1ouiXqjz+
	iaXtuxIIwzShV/oOE/Z/eSRVNsPBKkZVP6Te94ja110c4HOj6JDztwRO
X-Gm-Gg: Acq92OFKRmsCxHIaAHm19AH+xMm3c7vuJhAqlbSLp+HBi+lJ4LtPnPVpOggIXdrfg0C
	DI0ZRGIChLR4tDlt+7nEd+WDBbdUzRmj9O7ZAVwyjs4rTPgqoGW9ZY91N2AkUD6jUy9omBhP21K
	3c4wGT1fY1p/Didy2W05TIOLZLIt4KUE8aYYt3etX7TNUz3q0HIxyf0c5pdljc0JHXG3IecVBwk
	flwfCf4S4rDl7W4gLLKYtU0CTkkUDs1qGmO7UQwEFcPZ++KfKTjuEqAR0eICJddBUabQguPBI19
	3Qbi54o7rJqilAY7NLIgdgCXGPHVGIDZEptixA9+EZ/ZTcU7ASp62ChoES4DuCfajjQwUThosMW
	xOJ0OYyVI9tQR70EtmnloJTmgOUn+RdAMiezi+t0FsW96yXxMw5opKq8dwuwtaT9+FCoC+Dvnal
	HSqdNFs7zuJ0l313IBdA==
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr11004965e9.11.1778788638724;
        Thu, 14 May 2026 12:57:18 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm12617995e9.14.2026.05.14.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:57:18 -0700 (PDT)
Date: Thu, 14 May 2026 21:57:17 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <agYpHdvQiUtsXeJw@localhost>
References: <20260512214703.655633-3-sautier.louis@gmail.com>
 <20260514010209.5C3ABC19425@smtp.kernel.org>
 <106e2981-35a1-4559-ae20-2026c224f590@gmail.com>
 <388bb990-3df0-4eb4-983d-59c502397b8c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <388bb990-3df0-4eb4-983d-59c502397b8c@roeck-us.net>

On Wed, 13 May 2026 22:17:26 -0700, Guenter Roeck wrote:
> If you use a recent kernel, the hwmon subsystem serializes sysfs accesses,
> so hammering it from multiple threads should not substantially increase
> the back-end load. If you have 16 readers, 15 of them will wait for the
> hwmon subsystem lock. All lock contention will happen in the hwmon core.

Right, I wasn't aware of this mechanism. So the amplification
path the bot worried about doesn't actually exist?
