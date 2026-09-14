Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4294825D7
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399765; cv=none; b=aXXmw6AAKjS8zYqfMsfBNlThDWIVHemmpGX09GzyhKLzlkmn+DSsMrlJtqDJu5j7/khzVQqDhDjjAiR953tNA0NYqy0QudpyaiObEwJHwjnSCCPgeoxjI6F69WvnqIlXyCzc2qvvDtJQZNGzTADBgXpIBqAYKzkuu5PjLFBT7Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399765; c=relaxed/simple;
	bh=8P1Uav40Y8kXsjX0HdETGS4JMl9Qk6D8B70bUav+hDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9dkOWBcNXnbYegiXmjSSCXBUDdhLSDcpDHBWDuXiykJdtX5UasLXIvfxDuzXbo0Vnl2H9gChgQWMhEXZBh2GWmtzQ+CXUWCFQFAN1ZwtpHIX2WQHsWMETk8WHGw1bvFnyxqjROqnFLspJbgYeaw4sqrv4CW2lWacYY2vxufuZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykh5rSQB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykh5rSQB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3342224a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399763; x=1790004563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8JGSgbnEFbfQWmMwF+znkBzTBmF0OUyT85pZqVYf5AE=;
        b=Ykh5rSQBWJZoT05PgglIqa6HkClGzhc/Ykcj+r+T5KLH+kZnEfR9S9+5dFb1ImvUL1
         HMSMDrM/DXr7bnvf5OYateicGIAvQqkBLOUpQhfUc/TF3vxQ4qNU4zi2tRabUNnw1Rjg
         f4zv/jVJJN8FNYcxlMm3da/e9SbzXeP1XAluzseSnprHrbYnlcosy5UX3QzBPfEiG82b
         tqfaO5PHXxCJKbJtQV1vJlmUMJ+1EysFOojWbccC8qYsvltGdal3WYHZAQyrXLxAXjdV
         mRNiHEo+MKfkEA2OOPoTtdrbmiSwr5zZ5Oo9XSBYReCeCiwL+vBCaHPOnxbAsdHkP3pB
         n1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399763; x=1790004563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JGSgbnEFbfQWmMwF+znkBzTBmF0OUyT85pZqVYf5AE=;
        b=Lywdc4WQvzgj7Dh19G+h9qWKd/uMBIqQhgjUX7RxNjqMcQCsvgwslE3ylyT9ospdUT
         Lb21sQMXcQxe09fvTWmFbHkFn9R6VPqf0PzGO9kpBzoMo+I+c959U/1G5mfM5Zg+0NTH
         5WmmxVBfJnrNmTlpKV18xeHd6X4niJjmH63gX7OIUg+5pa8kswWw3Wp/Ls95RTrq2r3U
         IAYsRvRjKSakIcJ1ON214liTo89/hiJFN9r/3Lc2dNyyhVYajA0WAr4flEQypJdi3qS6
         ZxYNZCpYaRwcgfu8FQ9Z6LpoHvjW2z+cPXU3gwsJ2wtmih+VPg+yXFCbf6SfgZnF2ile
         uqaw==
X-Forwarded-Encrypted: i=1; AKwUvBzeKBhr2Z6lBTDSIr8o+vor8A4ut14j7bIqSdrL+mgVk/Y6/6SzWF6FFxP13A9I7ZiG69tAi1R/+EEtbg==@vger.kernel.org
X-Gm-Message-State: AFuF++m2rZz/qjoSGKLtZArnaO5+JbCBYAdFmzZiZyJbqHAzMyEsXocg
	DFNtojLFv7/eZ2fGO0qLENEcPgi6Kxd6eqP0SiYdcCULsYv1Rkui9S7V
X-Gm-Gg: AYBFou2f8Aya8CHavKnNFmfGsHVtp79dfWvb23p2O6NorE0C79FlKWTcgE3lqOTKcVO
	lQP4cc+osIfX0MhbkSUeTJR5xqK4xYA4bvF+xJH9L3yzAxFOeYh5JGlnt0Ye4etJERAWDwBS5sm
	SzG/QVkSQoGqnJ8/fIBRQqyvj7LQ+m39OcufMBKxPf8+6LUgCBwP64LNtvfUnGgDYJye0Wh99Ms
	6Hxj0Plgc/tSU2eI1RfzoZVztS5JhW6L+JIcQ5BeOIKVTbzo5Y8ExcBS+8a1Mo4AEB92W43AhWl
	eWaac79N12Ma7NpSCNDrCnQVksycTE4+E3/JSPDVHefzEx1knN1gAZX84O1QLDANvJmyvdHSY2t
	KAooNTIaWx7cetj+0YhwWxJEyqrcIi5FCzMlcHVR78RFKHhQsADJ9MnSXhDGHjO9MZ0ZxUi8p+B
	rs66pxTBXnxMhvz4YijowpFocL/YX0dZhe4c3uodOa/xApr5rAl0+AXBEofvFzX9AZxYPj9CXnf
	M1tZ58vajD4wzmzYZ47Nfo=
X-Received: by 2002:a17:90b:5886:b0:39d:f253:ed66 with SMTP id 98e67ed59e1d1-39df253ee28mr4127241a91.22.1789399763401;
        Mon, 14 Sep 2026 08:29:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb6e82dbsm417472a91.0.2026.09.14.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:29:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:29:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): Add support for ADPM12300
Message-ID: <4f87ffd5-fefb-4301-a550-28518bc2faf1@roeck-us.net>
References: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>

On Mon, Sep 14, 2026 at 03:45:17PM +0800, Alexis Czezar Torreno wrote:
> ADPM12300 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 3000W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
