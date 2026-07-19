Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E85218ADD
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784472355; cv=none; b=mvNnsBE7xexg0x1+fRFgHQkdlWAisxsQX0Pl/qpATfPtGGnJChlflgQsoMO0fY5Cc+5OzP3FLWOLMRxi0TZDnacjAgWkW2mBB6LK+b05M0f72IbY/V3x/WLz+SwSio9hVmglUGjEOMViFMPKa5Vc/hrFzmGKSOl7f9qunWXjeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784472355; c=relaxed/simple;
	bh=ecKNukjHraacwmCQpiHLIQgYMqOEt1ffTnqANIfDITA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOV6FG1tjWcxNb2qiv1d2Sm1H2ZwjonCMUchCYAOlV+v8H0Yblud2OhdzLVGnwksaJygAO0k1pgmFYdK0WVIH8gAyo4D1fP7sDQ4VeBKGohDW1LRGBuxsFsCcVCbhQrJ6tEyYjkIVWd54xu1G8UhcAP+a4qYL62gy8aIk+oiRz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQSeHau3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQSeHau3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso96471115ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784472354; x=1785077154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IysUkVKW9kdhzsnMeCXt3xWNhnDtw3JA68trKpVEwBg=;
        b=MQSeHau3V5FTN1Use03Y5htgo1FVSTfhRYWLMbFNVV1LQ3/mHHqjWIZL+8NeLE0M+2
         r4dKn7aqlXEjOMEPdPuasA/2dKuuV3H20E+u26mKojwwe1K+mhJmTl4oLTosPP4k+tjR
         65haKPrv+8zJFqO5W62B+YWlNsjtc0d6/VsVQaBFdq9qSLn22BYbAAh+xXSxesPJwk9f
         1g064YpmMSZ39Tu53YqT9yHvWeNi1o1bQzH9L7ISZaY0FhPijRCJM//zGdLwaHZyqt7z
         25Izl23ux9UCR2EHxjgYGTzWtYKg7nvVgN85r6XnbL5tAlk/KZjCFdBmERMte2dTlzlD
         MXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784472354; x=1785077154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IysUkVKW9kdhzsnMeCXt3xWNhnDtw3JA68trKpVEwBg=;
        b=mL5RiXz7F+ATcJBVyW8jDfG4vP+zoCknR0pF95fml6F+o4WfFySrpShoLkjkEkMTts
         cp+KOUgl1LzzuPRZQsiGkxJG+rJpZte62UE3EQv0YpjEDI5V+rhfgVCBvagYt9u3Ny9X
         jkTgkUlteVj69Flfdr3/DrKOeGOwAGBKakhvgMmfQjfNShfmPnRbenxjKOPdOYZP/2s2
         7d0EZC0vGpzs/AY9R5i9MCIF6SqPYoYR/L5Nipe5av+jWq51ZynPjFH1dR+37/KfNXrv
         uhuUb81I9luJoTnvXdDgzxPoN3JF/B9DAP7aOd5Ums43RlWlIHq4TuNnq1rlg1L5OAPE
         szEw==
X-Forwarded-Encrypted: i=1; AHgh+RoE8wz0h2c/yXjyoTx4+67hiq0w0xFUSORMBFh8F/beqY8gI3XgN8utIIrZkDZWji+SqxGpmPPKy4uRXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAuzq2osYXbXn0rj5MQ2k4btV3muRaMiKVpQnOyWZkpoJghOkB
	zMil3nlevfi979TVflSVtpY+Pa126C/2sCPBvRuXkLRzx1J2OSrcIDfk
X-Gm-Gg: AfdE7cm/4NupLBjHyWIMgHTe+yIRFIG84XY3mO6B5QxVHozEAhceHYvjRdDywE0a5Hn
	Vsw2lq5CnWVwF8oFqR7gjSUjONV5a365UX77sfBUeuL1585BcJwdc3gZuOx/gzJXTTQ5LNoqZt9
	otxw+FjX6IMi5nx8Eqd0XtKqnzW9KG4owNLuvBY9DNh4dj4z3NQJgIxZ6U/GTUHKIZ4spXKhzPH
	qcGAH7F8z1f8C5R6g1THHMwmiG5GK6V0FKXCFmCmcw+D8yplKsMUhdMgP3tOX+j5Q44Wtjw3xrq
	s+rVfCAQGLICiSbKus6TQ90Dp+9D41Ns0V6FRA69Ug7uRaTAStu1gz3MvIJsm//ARC/pqIxkSMm
	3frhEiobPo7om55NoYg+Ah3tImxdRi6g0fnlYwLLrKSE+77FImk9q1rfV/GQqX2zJiiA/rl7jIJ
	JQLfYq8NwjMnRhpns=
X-Received: by 2002:a17:902:ef01:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2cf3497f663mr115533085ad.28.1784472354006;
        Sun, 19 Jul 2026 07:45:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3476ba24sm40630125ad.75.2026.07.19.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:45:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:45:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: tze.yee.ng@altera.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Message-ID: <d7f375cc-40dd-4b0a-8117-28ceca9b0059@roeck-us.net>
References: <cover.1784096224.git.tze.yee.ng@altera.com>
 <66493aed36c36718ab90d4792d04948d3926d377.1784096224.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66493aed36c36718ab90d4792d04948d3926d377.1784096224.git.tze.yee.ng@altera.com>

On Tue, Jul 14, 2026 at 11:28:01PM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add asynchronous Stratix 10 service layer support for hardware monitor
> temperature and voltage read commands in stratix10_svc_async_send() and
> stratix10_svc_async_prepare_response().
> 
> Register a socfpga-hwmon platform device from the service layer driver
> when hardware monitor support is enabled, similar to the RSU device.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

This version of the series does not apply to the mainline kernel. Please rebase
and resubmit.

Thanks,
Guenter
