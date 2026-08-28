Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2D34EEF3
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930837; cv=none; b=ZFm6bt2XcBs0gr8uaLRlpCrM9G/oQ8uHcpo2WarUwo2IfNZcK+Bi0Lv7KhJbTCHle6xr1c1A0XgbRcL2MrjufGM6HiVbidaZpz41YshKRVU3cYpJ4j/69+yOq0MgVTejWle77euDZPADQHqmzgLSlsfwwToCX3Dpoy8T09IVmgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930837; c=relaxed/simple;
	bh=fTXzeBLnEwSLNlykRWsZWxQUorLdfVyJ1wnL91ZHAx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdwhz0l1pcqteHsDohDS3GqZ6MGrurHfqoMNgNl84g1UvA5OdS3wq7W70V+xetVS062y0BE4Jz/0GWdtvevYU2fJiE0Bue0KYPFqwWEO22Hjdtw2nCS29+0UsqpxhgsFVXtY4Zos9yVyKTYIH+KhBJXHROXYuMXM7iYIsdrY1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7q5Q4ap; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7q5Q4ap"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1270527a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787930836; x=1788535636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TMn12g7nMPDjiVbYrfmAJ+ZFl1D02Qwt4sVGSEjJmtM=;
        b=T7q5Q4apesQ8F+FN6igO5+vJy8NlxnXxSZPl7eSKMaGV+LpCZo3hY8+CdKNcecfbt8
         mnHMrfcr000pgb47P0i1EY5NoAAo0CnK4zU4rmE/2Bk4uT4i0mePQI5XjYSZeX9ecJ+l
         5ER6SMt2X5jbTgLVXQOhDZ/SFuahCVxe7VkON4eOAM3HavDDJqf34BsaxVUaL3dzV8wk
         CMN6qmmYZQ7YG387ftFo1Z2LA3KGU5PyG4oiyEPEJzKfM/hDe9fXw8OmiiYXfLhOwH95
         PGYS6FqYkmYqVg9/UmFpSNRbNUTFbX5s/CGsSODZ9gbsORt9IAZnXI1nn9hDYBDi6kMe
         vGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787930836; x=1788535636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMn12g7nMPDjiVbYrfmAJ+ZFl1D02Qwt4sVGSEjJmtM=;
        b=GUIWzTVId59+Jfgc7YkC8M4+5YIu91ASyTeBWYAfHZPc9MUpn2tP7/OoXqM/gterhL
         RmxmytX2ND+KiuRaF0ovaeafAj2Df26kztB3z+Co/O2Jjg3EHrWdNq0zfjOCYrfssaOy
         +4t50eGvdnPCNoV84AQ2obsrWI3yfg9ttAtrBu/3LeBMxl+ha9IDqmPMXc3uqcVdgxbY
         lMW0wVeM8wjK8vMtdo4cQYGvfPePfbzYW0XOa6JmrN1Iadpqp2iBFIaF2CP/VdC91aWR
         zwyT0VfFtpvj39vLOPHYoLA1z5iffIcu1pTEnGsopAJxrPiOneZP/c6M8G6LiigN66/U
         UKrA==
X-Gm-Message-State: AFuF++k4DUAlGmnpUg7tGyjnxcXysNXwNRC+tZKFOFeBom+KZWqVPhc1
	JRfacxh6ajK++nYtncemBzyxE3vUfZ5/765elvFPmhIciQl1dsPItnDC
X-Gm-Gg: AR+sD12Wxzwb7nhkw/gGrLlrdeZLyVLwHWvLCBA9zrraqjRsIt315SaDNNJRerf/Ufo
	wanc253aQF5YVEPPfgiRrcg/RXLlT9N94CANA14PvjN4dBuGSaJfGAL4zti9lA8T1hpIx9yo4JL
	jqJgOfFOKwEXncJe6Z4c6JRGO9na4e/6r3ohGApE006AiuqjlwToMk1eVm3LVdZWOEwmW2iIydQ
	MiDvkFowxvApYdMrX2qTsfYb8EL+tfW5Ci73TvWo5OWpVxYmNYtJp+3p1LGo2imt8mBmbo5yZWF
	plG277Xx9hWQFc70Jf5FqAZ574UQM12BnufdOEyhcdp4jPqmsePz8asL4IJpbeM6QjGn9WsWmei
	Hhl2rCapqb5YtBToy2U/D9236RSWyIvhA0uHXiEzczwM4IjvbR/T4lZoOgsRQmwOprr7sDSMSlm
	3UnI9QmgY5Asbq4EGnGGTfKrvOkZ6XSZkPPuGMFYVsNOBAH/ww5agB9p5xrUi2qE/5Ylr1wDqlq
	+RuT9UNk+su
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr1179927a91.23.1787930835644;
        Fri, 28 Aug 2026 08:27:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm7252880c88.10.2026.08.28.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:27:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Aug 2026 08:27:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: chipcap2: fix channels in humidity alarm
 notifications
Message-ID: <1e34a397-32a6-4a90-93e4-eadb64f0297a@roeck-us.net>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-1-6a26c8e9e2fc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823-chipcap2_locks-v2-1-6a26c8e9e2fc@gmail.com>

On Sun, Aug 23, 2026 at 07:59:01PM +0200, Javier Carrasco wrote:
> hwmon_notify_event() expects the channel number as its last argument,
> taken into account with the type parameter that it is a humidity sensor
> type. Given that this device only provides one humidity channel, 0 must
> be passed. The custom construct to enumerate the channels makes wrong
> assumptions by listing all types together (temperature and humidity).
> 
> Remove the custom channel enumeration and pass the right channel to
> hwmon_notify_event() for hwmon_humidity_min_alarm and
> hwmon_humidity_max_alarm.
> 
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied.

Thanks,
Guenter
