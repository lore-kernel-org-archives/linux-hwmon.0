Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC583242CA
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162698; cv=none; b=aqEBlZurj1qddlYcl0n7y6oSg0PeC4Z0j4KslfsbFxoH2uxpw/geIsmx/bQGOq1+ZEV0m+3zQ41P+KwiUyYX30SnYFeZz1WHkEBXqef2zAAx1dhQ2mkLRjmR2tV1gAE6E/85lhbHnI4+M+8OT7TG76ZWD4rwr6MeM+f5a//sspQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162698; c=relaxed/simple;
	bh=lZ+iG54rrbVA12paMGQex/tNNiLE9y/nVfx1kCFjtig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnzvJKcWXCJhdbfwm0gaT7Da9g+5mmCFbZROmmzZ2Wq7E450AzoEPAomwapiw7mXRXUtHSrfEEsoUt2cE0rs0BFDpJF4sfOGv0TLn6I0rk266EqjJ8WOGeWZk27XJEd8kOsK0N0qiokv2ikvpfDeKW9Ld3g2OZm1SB5KVaslVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIoDqc2X; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIoDqc2X"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c03eb31db80so1484155a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766162696; x=1766767496; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3NnGm7500nw2cNz6dG6fgcX56p974luZAVItQFsKr8=;
        b=IIoDqc2Xgsvxv0kkVgQvpe+CaVFRLMn6jK0qJJp+Cu4TJu1a29taSrNLb9VELGg4oX
         qujU/xYAc3gQyymC6RdsJAAhnyj5cB5Vej4aK85UgPvrEEtbIxfNy6Ut4lQqmoOrEytv
         8nJFajlJdhIcY4RU+tjSGSq+ST2IpOpDaT+r7zGxeI01uFwDdC+D/JwhrKGmmOajPZZP
         23oTbHDJC5/oxe6E+49IksoB1ZWvXCbkwtUEHUTmcI8Lf6Uu77mudvROxfPBDbUX3sXj
         lmhpIkBT5m98GtgAP+qOxWtL0/ejTSaQIFtoZpeQO6Fv6ZS80eJUQAyUva4Y2KIc8HBR
         ZKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162696; x=1766767496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3NnGm7500nw2cNz6dG6fgcX56p974luZAVItQFsKr8=;
        b=OowGQHiGbySn7HWkrE19/TG2f0xc4Bv2c6AOFmNP/j0EcMB5cAwTPErYdhCNOvltDE
         vEJiZ900woSJW0C9e0Du2Kkn1HiNsF6caLVu+/lBTmDsyMScRW6Io/jr71BceLl/zqyS
         oKlSrTSv4HH2yxxx/aYIj1nJf+elr96uU8yMCKVRrLtIw0RtJMKCQRSf+rOhTPdu6kNl
         Oxpk4wmDLuHTi08ANxV41YWbuDm7bNQJX+WbpWXiaFur9GO3FkbRp5PrrlFNYt0Wyg8a
         dStEn9z2qZ33/P6vpCNcj6dI7XivlAhqtVhYenfpBI8PVycF/69wvz7dQI4HuV/lNQw+
         sO3Q==
X-Gm-Message-State: AOJu0Yzewcwh1GnAMr1091SOPMmIMd8CvEf6t2tz0LgJveqaU1G/KZAe
	/JsFmG0fJQ+/Gq7jAA/1vtscd4Hbt8IkS7nB6UXWaaJX6SuYOSUqYkwSbr3R1Q==
X-Gm-Gg: AY/fxX6FzL605UjqNJrXR/TTf3nIQzgFepPpY/twthKgDKSIliSVOxf74SFCCZHsT0V
	TroyodfuDm8JVETW7ren67MvHHBGgT/5QcvUHUG0SfBRPkZibXxEM6Xtm9/fFrm9rfsn0NISvSw
	rJEaXwpXH5VrM1QgYyFbl3huRZdbg+9TYJHQJeo5fy5xR/zMUyK4NANvaH7PxN8LqQJRyANZfFu
	eIoJO6JF2uZyxtHO6jof7DgHPm7r8shQgV9RbBm8BPeD0ewwiTJzN2rONBqn6umY0Y+jYphVjGB
	9IGx+h3LjG86VFaJrRcuzAZL0VTr5pLbiaxx0HquaATQWvBpG8jlOUF6w/1jKix0iS54vlUockA
	ebexzlGe+6HOEgkBPHxJeSb7RFr/WI3JzmGmeATFWT2McojKa+HNLIAJV+CPHYQqgP/g2LXZZiu
	y64pa8kF5aWYNl5E/sjXK1fVSi
X-Google-Smtp-Source: AGHT+IF06i3Q52up9tk7tnhwUl2bgdoFGR3uHg77vMpHElcKEzrXUi6XQnKIKp1A62odJNbuLOY45Q==
X-Received: by 2002:a05:7301:e8b:b0:2ae:5af4:7d65 with SMTP id 5a478bee46e88-2b05ec56b68mr2857271eec.31.1766162695808;
        Fri, 19 Dec 2025 08:44:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm7382924eec.3.2025.12.19.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:44:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:44:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ltc4282): Fix reset_history file permissions
Message-ID: <4aa5e192-8743-41a9-ad48-3dc885c34dbf@roeck-us.net>
References: <20251219-ltc4282-fix-reset-history-v1-1-8eab974c124b@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219-ltc4282-fix-reset-history-v1-1-8eab974c124b@analog.com>

On Fri, Dec 19, 2025 at 04:11:05PM +0000, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The reset_history attributes are write only. Hence don't report them as
> readable just to return -EOPNOTSUPP later on.
> 
> Fixes: cbc29538dbf7 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
