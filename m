Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D813B3911CD
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038315; cv=none; b=JqEsLQo/ryfanbc7U89SkTJwBpAT7/7S8gTLu7f87Tczr0NovQM85KhOiWhfAGP/B0W8+q5WPFh3QJ/ZFdDUxsdaEAp8FVO7uzWW9cDLKg90GeXJWQ0+uMlISQIRmVZE5CgwkbnrwTu7dUW4KpV1CodMMrD3X/xkyfgQvz2n534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038315; c=relaxed/simple;
	bh=q09taP5tBk4Lcw407r6hewZnj85tQkEpw7jC0qG36Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2YxrPMqSXqe/b/8FamhQ9L4Y1+Yj7Ddj+NN80cW2hr68+mxl8FBIqQ2SjS5PBOqHTv0YJLaUUtJGIDMb1XwM1ntgnrSV0zQW0o9fKaEi8r/tvXsc5+gCPm/LDKHVb+roeYTsxV06kKQxwFQliyl7cFdkUmHpHFRkGY94QVgD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxp62rX3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxp62rX3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2247e38eso62728895ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038314; x=1781643114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikKWrgQ/DAI1p7i6Ea9OKMWeL/DQ2eJ+hNZTL5L35eg=;
        b=Nxp62rX3b4rxah7FAL7L0g9Gwk9hKz4B57iju0TOJ/L7umJFo7IhdT1HUkpAaopIvN
         PNsAf4UWKXekXvwdHsb3oYhPek8ZnZ4aLI3T60D4PqWus/twJHkQ7Y4Gu43AVJvzN2al
         lkWqsAkLYXsjjJfvXsZG6YRaJBl0/i2NvTGC+A8FdUvxkNPSasfRqi1LepAvWpqR1IAS
         J4jjk3uTQG8LvLQTC/RltRyRrMPfc2ssN36YSiWS6KZ32ea9mk1oUoS4R4k2O/f/USaf
         NCMQx5Q/jGeHyM4o52hR0VUspqms81rlrkdSxzEurfHsYt0ZIId1XZOkp4RP5hxW8RtC
         Jxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038314; x=1781643114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikKWrgQ/DAI1p7i6Ea9OKMWeL/DQ2eJ+hNZTL5L35eg=;
        b=le6hno6wIraFKmVhXoPnvPeathYFsm9Q/xuDqw2bunU0O+jBpyoRVjGkDDBaEIcDAD
         1ATBwyJOKaizT/kBFEHYkbxTyZqiKpIJ/kgpVFYidXaoxuT2uBWyaTqq/W9mWCl7RY9w
         RnnNrJhQ3eyoQ8uNzlL+MgqhDHKe7apvrKB3H16lAd5g70cWVZztynP23B6cK4cRV4Xr
         Eeeh+Qy1W1DwobN1vqnijr0Ey6nP6HxGlcXaCpWBDtcpLuJhwqWTCJXrGxqEiFlCVQEw
         1yw7100L+SuJ7rKQ5j7B/J0+9cPtmaoOekvPdLBvLbYHHZ5IZBTucXXWkUo4wsGBctkw
         QyOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ROeYbFo+Jj5D6d4YnL3VCfjMrH9HObbr1TEIY9ka8Su7+S/6vbPKxll3Ok5R5tWKzlhpTkbgraOEr1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6pnRlIKdMKkQXwpZgWc8Wv0I1yIeG8oMx203kfYfreoN4IZAT
	hEjPzaxccB2bwk5ywc7JQkBO7jvUSf9UoC7xOlqoq+K8v3Kscjbt2GUIwAckMe4N
X-Gm-Gg: Acq92OFODb+vUlwtKFv0vOhzV9Q2OcsHv3/TOpGLzjPOILjqLf2miR6z33gKFFLxTkB
	uJqLBvlF9TNQABArVUQYyHhN4svTTDmYdIci2CVeelDsObd4rLcrB5X4IrAIGqHz9XFwtsjMCUW
	TQb/OVEIku+lZar2HCw5ty2i70LObxixHv6vK9wh40Oor+UqOy3lsUGTtpwfVbLnrv8zJWHliGl
	nZpi8aPmJSn0bn4rn5nQ6LAsath3UcOKPe9hoAwGOba0GOzjB/veb4YLF5iOkxyffo+dyrbHUUW
	bTeL+LqLzmYaY1rFhZ2rv9cEooT9NOqzWEzr6oN3TzNbChQF4oXT4dQ6qvy2UNj6u5ysYyzAodw
	wH8D8Al1B0BZPz3EWAFnfYfZXl7t7Fgrj4pWxTR35a6dw8Pq8/5EzJcs/ng+Qm2fuZJ7r0anmG9
	Ni9sm+A9g5G7O8H4lXtI1YIr4YKzDKRU8DIYbVgTk2t32dvto=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr260514775ad.16.1781038314139;
        Tue, 09 Jun 2026 13:51:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm216009535ad.73.2026.06.09.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:51:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:51:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: (cros_ec) Prepare the addition of custom
 groups
Message-ID: <457271f3-b8e0-460a-9537-2127c252769e@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:53PM +0200, Thomas Weiﬂschuh wrote:
> An upcoming change will add a custom sysfs attribute group.
> 
> Set up the scaffolding for that.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
