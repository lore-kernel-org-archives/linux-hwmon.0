Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6284A4F1D
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594643; cv=none; b=OOPOw9Em+mTHG6psAfHg9Z3rTnAey6fzv3tQUj87RmPCAfocdbUCZlxTsQEHEPkmoptDIdTvDNNCtqNMEUtbG7MctI+11o86Qm7U38DA6GpnCx74Qt1/O4Y2/NvAaMGOG9urybDieidhl3Dzlat5Xje4FWrvkDrg6gRyaVRwd1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594643; c=relaxed/simple;
	bh=EtTzFxA5QJRtmdY0BycnIWHAtaHV6S5zMcVADPu96ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGVOmz8c4vWTjBvAyvpblLMQinvAORh72DhHQoDQ6pI34TIB/EmSR3GFayKHT9GrUuh3JKlrXEnr/QIG7wstafUi+KTJdu4QZK9LgjYya3LIRANZmwb9q1n89QprG0+cPKjqGqw0CRtN0qH4cgZMRgzO98CxEC739EfIXFZwuQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRRAinO3; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRRAinO3"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so4032648eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594641; x=1791199441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i386EA0b0Na+wN/uj0pCmxx8C5abhthHYG3OLw1qm+s=;
        b=oRRAinO3I4JUizyq6fI0/AuKHDi+6rdFgKAhxVM2TSctP2iQ+DRK7a3NB19s4Wopq5
         LhD1r//Yzqzk4Hh04ViobtfqeG50szqW+zt9r0v6SdJpKrXNN+yu48CHR28sLEUxtnPg
         BFlYn+WxmIvhF66SHMHiKSsUpmaezD9ShkGStHpsZ4qTcC/4w0PfL2Vg1u9en/7mbXVR
         aS5K8J6AIXuYoDXTpEXiTvcXs5yfFjEzBrq3wdWGCn9/3zv6aMBvIMVd37DeYx4SLwrM
         j08jnBkhrtWyyDwCLB6WCTLsjvFPeV8K4oTjmu/FEmQBpNsO1mdmI9YqZ3whKpnqD7X6
         OL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594641; x=1791199441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i386EA0b0Na+wN/uj0pCmxx8C5abhthHYG3OLw1qm+s=;
        b=i5ymZSf41kvwfKcsRgDCSP+oGZnYaNwnSN7LHqtmKAf+AeUHZNJewufG7S19fhSQyu
         bn4Irc+8ldeS/cxTKqZayFuW15Ua2nS3CPhMWXE1AWWahStaD01027Mv0d63StyefIHk
         AX15Zqq+9mAnInIQI8s0By3klTXruLx7/iDwmbOeUbTJp7JfMgmAWvXOMsxtlXhwGNcn
         ffvpBD7Tyl9FrtMtUXCr9vnp+7Abv0EYViT4ggCxoLcdZD/TpARaaWmZ6KxTC9aA6e1J
         B3BweMDL1NaESijMI7tJgWb2YvZrQTljSPETImFARgsfGg6aEPBdVNqPX0m2eQ/aiZUd
         F9dQ==
X-Forwarded-Encrypted: i=1; AKwUvByWwDS5iFnXF4Ce2LGufW7QLTTgEGHRTTKJVWOWNdWIGrsGxgUmdZvkiPtFIxLelTH0OyRPSNmgYkXt3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nZwpP5oKTbUazdj62E4n5a2Gh+dPkvdQRGVDdLZWRJ/zMRgl3a
	beDE0wIMzoIK78PkidqUeySRCBaqdYe0pUrZORcl0clQy6tAUjD1UNNjnwJeTeIQ
X-Gm-Gg: AYBFou3CaBCzwBXvmAdu+LLpyTbhzfPURVbIUAIvv8IK01XdYqj0Znzh8R43Khr0gDT
	71hHAi6YTXpDk/Wsum4VtpMRrTtW34pclf5trgskYneEh+5bbRw8a6UWwube27e92MrGMZocN/7
	zwwj7K5xAwlpALPx/1TmHqUmWZcCJosJirIbK9uEcPNQXw3vhMMbCOFptj1Z0pKKrtlnDc5QiFt
	tTMklY8FLMiAxt+1QpX5Hl2xm9nEMYHxCi4e0Xn+UkE6Qmbrp7N/Bpf0N04t73fvaTW1maZ/Csc
	1mwCvMpoV+Tf66DlAhM6FcFJMoDd+kRlkiAptYWjnxR2oYIcpyXVe9Z7bVORk+qOoSl0Mmq5p+L
	5tnKxAnFpvT4vNuLZ7U07MZ7YSrYCbh6bRSje4CtMo2S0u4tZAc+ocYZq4UtfUCmx8nGqBTZ3Nu
	jLn726JGprXAAxxBRsJlcHzKS4zYzCeAylJ1ZFXUiyZrem+CI+7cn7nK+fl07YglY1d6X6DVL2r
	YO809SNpMVR
X-Received: by 2002:a05:7300:ec0a:b0:342:d7a0:2f40 with SMTP id 5a478bee46e88-342d7a0334dmr10596463eec.7.1790594641113;
        Mon, 28 Sep 2026 04:24:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm26321026eec.30.2026.09.28.04.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:24:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 04:23:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the hwmon-next and watchdog-next
 branches
Message-ID: <d40a607c-af12-4e56-89e9-de2544b07143@roeck-us.net>
References: <20260928105944.2186541-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928105944.2186541-1-matthias.goergens@gmail.com>

On Mon, Sep 28, 2026 at 06:59:44PM +0800, Matthias Goergens wrote:
> The T: entries for HARDWARE MONITORING and WATCHDOG DEVICE DRIVERS name
> groeck/linux-staging without a branch.  The repository's HEAD points to
> branch master, which mainline already contains.  linux-next merges two
> branches of this repository (Next/Trees): hwmon-next for HARDWARE
> MONITORING and watchdog-next for WATCHDOG DEVICE DRIVERS.  Name each in
> its entry.
> 
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> This is part of a cleanup of all T: entries whose repository HEAD is
> not where development happens: one patch per repository, sent in small
> batches.  The plan is at [1], and why it goes out in batches at [2].
> 
> [1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
> [2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/
> 
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 140eafcbbd78..6dd05753c41b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11483,7 +11483,7 @@ M:	Guenter Roeck <linux@roeck-us.net>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  W:	http://hwmon.wiki.kernel.org/
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
>  F:	Documentation/ABI/testing/sysfs-class-hwmon
>  F:	Documentation/devicetree/bindings/hwmon/
>  F:	Documentation/hwmon/
> @@ -29359,7 +29359,7 @@ M:	Guenter Roeck <linux@roeck-us.net>
>  L:	linux-watchdog@vger.kernel.org
>  S:	Maintained
>  W:	http://www.linux-watchdog.org/
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next

If you want to be that explicit, shouldn't that also include the fixes branches
for both subsystems ?

$ grep -e watchdog -e hwmon  Next/Trees
watchdog-fixes	https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git#watchdog
hwmon-fixes	https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git#hwmon
hwmon-staging	https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git#hwmon-next
watchdog	https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git#watchdog-next

Thanks,
Guenter

>  F:	Documentation/devicetree/bindings/watchdog/
>  F:	Documentation/watchdog/
>  F:	drivers/watchdog/
> 
> base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
> -- 
> 2.55.0
> 
