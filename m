Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6E257827
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573160; cv=none; b=XUREBplhnlH80D+Xn1+MVL9ruUepAbw+agB6f5Q0OlyOWuRqgE0YWXQohFuMEsJbrPE3ylYEAKXXvufpcQUez3qFnBBtcsqDdgVpJNLK4J1S2URPxrdlSx75I1XV4ZX6aTsxsXQtdLw6GRSi69lq2lsP/LV0YoAusCisfxS7vzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573160; c=relaxed/simple;
	bh=+qKaXpiv7eeIklafuIHZY8c2GZ7k4CIdfO5iNFUHTqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEK6fkhv5z6Yy/P0DdexGCCPCz9a+0nEAmjvjqhC0Pam5EIyT6CtLDwLO+BgrXbMgcTJ9h48uUr+BXy1XRuBYpXLY0UecVSx5M8ckpyAI2W+f69EEx+zhqXQLQMb/ORsE44hZTkARXmNhlMsEKfZowKOkrv1BwYv26f5mSWGgtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK5J7/5W; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK5J7/5W"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f69a286dbso894685b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573159; x=1778177959; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMVHhZ1eUgYJb8AUkhSy4uV/Dn/nEc7kSE5GQyo6dnA=;
        b=bK5J7/5W7wia4UUgDIMb4kAy0K87FBRFSjcatE7sQZ5h99GpEhAvRX2jOt81fLzccI
         a5ierDJqtLRLtRkVh+R0TRcEG5BhpVofLD66au/+LZXrJq7K6hl/IT2XA3OiXSxYQ5bt
         8vcMStSr7kL1dPyN8Eat4mT8/IYLPhRbccw41WczmKB5iQmUXuZ+OuEIDZd1ihwlj3jb
         eEZLjF05nUiS43chHB9vuGOCyuhhE1dnMuwHF8SzaTCKph5ScMgGWE0E6+jRgLR3MD6J
         11cO9yRsc0RoV/dVNaIGOw3bSBiAveOe5zTBRzBZwBVsba9ONKG81ixIuWI/yodN/RIC
         x7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573159; x=1778177959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMVHhZ1eUgYJb8AUkhSy4uV/Dn/nEc7kSE5GQyo6dnA=;
        b=J2zl/3LELvpIVHXxKxijr29i7Az4Z1tuF/5iTSAlqTwmWoU2Q2bkl/KWNgnG2uDo1a
         FtvM06NtanGqlxKi7dJPsi8m1nZ8CGH7sCZC+aYLpJNIzzQUQOfCYqn7mD95CE7kDrNv
         Vt32YhkramXIox5ehRJU6cjVaVjlimXa6GhDn5lMlukdb4Vjh944Ran0mSTAsDXQoOwP
         hqlUxQasDIKzqNYX+I79Ex6u76NCtB2a1oUzuopRCixWWLx4q68SVhPBHMqMPxpGRNVG
         jt2ofzzfO09WcCRXLj32bvU4nHDI+AjrFQS9upo/tlwXOf2xbGdpW0+mMoGoApCTB1fR
         Coow==
X-Gm-Message-State: AOJu0Yw+MeUFIlDrs/ZOf4h8Fzy5kSlwM79jELX8F5w5U50p8WepQOr9
	x+dpSZkBwKuEhJiZg3btq0/7i/VrydxkTITy086xlnu4zyi17lLWNP0K
X-Gm-Gg: AeBDievSWx2SQf/0y5CtwcvmqzEyUioHpdeGNbl99FaDRB8Hlm0Xk3D8037o3KqQWFD
	4PfZg2/73xD0JgF42+TajQ0aV1vsDYLBXDV1La45qWzii4TIb/HdujKAi/NoA4fZgJRGFXBoYNv
	JqUllhE6mmUQY4n0D5/IohlyxE37MYY0tnPoXrp3++4yvgZ8h+tAy/MbaMRvLfCO34E64GT6dop
	GadG+OFbOsPRuDr3+giYXs4YM6fS6xOUFoJElyUHN5ZLNd+PtHsZvFMV0SauA7oVKZJq1Qpw4cR
	6Wv8p0NWK2TxAQWnqMBB8BMjb6RVIbWs4eFRVZv/acUy2/BnduKlQuzDOdAngHOycGhlcPTDBNn
	MoCHhMO4JMsdD2wAR5YWwwmb/q7TOskllMUCvguLnpu3u26MH84AlR6s270ZOrYHHgh6kHR1jfQ
	/0CSeT3RTpYUqE7CXQgxlvzwCUULloKySHRGe1Ft7wrTdcJ9L/jhlfRIJxFw==
X-Received: by 2002:a05:6a00:1745:b0:82f:a6bf:bee7 with SMTP id d2e1a72fcca58-834fdc96838mr4660286b3a.49.1777573158627;
        Thu, 30 Apr 2026 11:19:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515acfbcdsm325989b3a.30.2026.04.30.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:19:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:19:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Remove stale CONFIG_SENSORS_SBRMI Makefile
 reference
Message-ID: <f05a7ec3-8afa-484a-9385-87a0e18af9c8@roeck-us.net>
References: <20260426000319.55908-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260426000319.55908-1-sashal@kernel.org>

On Sat, Apr 25, 2026 at 08:03:19PM -0400, Sasha Levin wrote:
> kconfiglint reports:
> 
>   X001: CONFIG_SENSORS_SBRMI referenced in Makefile but not defined
>         in any Kconfig
> 
> The SB-RMI hardware monitoring driver was originally introduced in
> commit 5a0f50d110b3 ("hwmon: Add support for SB-RMI power module") with
> both a Kconfig entry (CONFIG_SENSORS_SBRMI) and a Makefile line
> (obj-$(CONFIG_SENSORS_SBRMI) += sbrmi.o) in drivers/hwmon/.
> 
> Commit e156586764050 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to
> misc")
> moved the driver to drivers/misc/amd-sbi/ to support additional
> functionality beyond hardware monitoring. That commit correctly removed the
> Kconfig entry from drivers/hwmon/Kconfig, moved the source file
> drivers/hwmon/sbrmi.c to drivers/misc/amd-sbi/sbrmi.c, and created new
> Kconfig/Makefile entries in drivers/misc/amd-sbi/ with a renamed symbol
> (CONFIG_AMD_SBRMI_I2C).
> 
> However, the Makefile line in drivers/hwmon/Makefile was not removed in
> that commit. The orphaned line references a CONFIG symbol that no longer
> exists and a source file that is no longer present, so it has no effect
> on the build — but it is dead code that should be cleaned up.
> 
> Remove the stale Makefile reference.
> 
> Assisted-by: Claude:claude-opus-4-6 kconfiglint
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Applied.

Thanks,
Guenter
