Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91540351C3D
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557637; cv=none; b=chVX2EsQ8BizYxzZEYrwjGryuSexbcJ+iVWkva2dZyBUfPYiAILUo61DFfkh5bTJA/GTzxqnNkDEx5Hdp+uoT5WJbEkX6adlay3JdlDuzja1JhsRENV+Zv18hJZgqebDLEJxp15jp6Ibbigu7orVIMjL0aFyIf93IcvR59aTpTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557637; c=relaxed/simple;
	bh=4iNJkzZFJPsd0uqXCPATWeVuAmdD861ywAVhat7YuoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVkHZkIqr5M1fafZ990/7sSVYd5afk5+a/d04gABoyoTR4BsYcRtTzYtPwJN0jAz+5H5GT7GkBCtj7Prd562VFEBML9/TR/YP3dpGTfl6c1N9fFADSJSIIxVrGGt3el1fCxEESbWIT1HePykIZJ68mXgzf7j59bsCuVFAD8gidg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGQ5UW4k; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGQ5UW4k"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824b05d2786so4794165b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557636; x=1773162436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Nfsz/w//SQlu8oYLMucJ6cmFE2GuaQ4jRzjUGD/P4=;
        b=XGQ5UW4kG0Ln9mYAB+joq351vgz13l2wxZd3HAAvc0RKXka6gvf/nDpspYIHDEJxUl
         PDAOQ0RkkIz89IHe18noL5NXh2LMxpQa6QEzlWqaGOUbd0kP7BGLKNsLn8v1USXHs60W
         unov9HNH+T3l/5y9axcwUyzFC+tCqfChWrGBBYfjsgChNFCtCP3xEFPqT+ZPTfebi3en
         DdpQg/Oz0YnxGKnYZ5DAr5/ITui3XcK8Y37T7RAuHrEjH4ksKDG/Fk0qtMUITsGVgyhi
         54MM/88rCOA3Rww7Rl9g5Ums4VN2T3/bb6xjiMyahSx3Enia41UlTgO/uMqnRjjEnsEW
         pjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557636; x=1773162436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8Nfsz/w//SQlu8oYLMucJ6cmFE2GuaQ4jRzjUGD/P4=;
        b=lGzYlJOFRd9O4yKrZrasv2+Rq+0anNbS6FKFQGWNCuN0XIyDBK9/KvHWRH1dKG4+Mi
         Lsf+i/MzQpZULPtRfkkcBtJkRyrWmkHbk2EvrdyKE+R0v59fAwZNsZuhkp/hYQIlkdoN
         DylVxyXJG9+L1DmnLQRvL2qjaWiMhvkItVbQ3RJxyUTEcdP9QE3pY8W30WEZFOXMWWeP
         GdzYJCmmtJ9SOTyTJNwLDboebQX4N2e02flh4iywVApsrIs4yDS6EPdWMrc6FlDzfcZy
         NY5kQYddYSxYYdJBTZnHwMSPdLv2JcC0JTmc7O2soGeRx5qS7XHucWgJqpuVRChmQwL2
         SBRA==
X-Gm-Message-State: AOJu0YztAamLuESHNuETjhBIDpH8V2Pfn/R6YbfyWggSIJRThJEs6IaS
	1YGnBAC/lvpgYPohQaqwIZQSioIKDA4pUP5YIc/FxXXfP5uphMpjP1MJSzKFhuDP
X-Gm-Gg: ATEYQzyjIdjmJhaH0TRR6LzBkdmbOZ/19gfRhT+rvW36O74muGYYxpwx6gfqOBdFgdb
	fGTwxKy2sL4A1/v9y76NrRYP/vnmyawAaDWALsrDrVifovJFD7VinhR6kRwwdOyIk+OshVeyLSA
	CSz0aWC8PniTv5fbkGAz5/EmFE7h8pNwFLjxTX/EytUU3W9+epTkSv0Gj8jPTbWP1xPMk3JKuBb
	V0P22eiWfeouyugXjw3gVpVq7+VPR2JLqOgSFDZFOkW3shCUnIg5EgXcer0ISwg50BI5WyFNB5+
	50WOSulm5dnzzgRjiXTE2xalF5ECkb1pWE2M3GdiepSB6cFPB0DPHM7I3/MipaYZY1bEAiodZaf
	yIgCgN6E9thTbLj0eRJFAxabz3STCFL8pYahQhWoT3FvIOVqabdw6BwMAwy21fd5rZ3kcslnA8x
	10H4ndQ1hf2U0YUh6Cz7QV6NBWN23Zi7NRJQHv
X-Received: by 2002:a05:6a00:4109:b0:7b9:420:cc0f with SMTP id d2e1a72fcca58-8274d972c1amr16386086b3a.14.1772557636053;
        Tue, 03 Mar 2026 09:07:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a056544sm16587252b3a.57.2026.03.03.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:07:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:07:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amay Agarwal <tt@turingtested.xyz>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] hwmon: (emc1403) Replace sprintf() with
 sysfs_emit()
Message-ID: <778d9774-7ed3-491a-a4f9-ae77087bedf3@roeck-us.net>
References: <20260303152456.35763-1-tt@turingtested.xyz>
 <20260303152456.35763-6-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303152456.35763-6-tt@turingtested.xyz>

On Tue, Mar 03, 2026 at 08:54:56PM +0530, Amay Agarwal wrote:
> Replace sprintf() with sysfs_emit() when writing to sysfs buffers.
> 
> sysfs_emit() performs proper bounds checking and is the preferred
> helper for sysfs output.
> 
> No functional change intended.
> 
> Signed-off-by: Amay Agarwal <tt@turingtested.xyz>

Applied.

Thanks,
Guenter
