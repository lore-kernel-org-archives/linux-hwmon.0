Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCF3D73
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 00:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048084; cv=none; b=EUhwDhLWDsUlzZ0ewgaxjcNRz3AAtO+s4AiGSvD9cBl1bpoko/WQMvLXmspRcYtuK38ttP943CS6wCzFXLwcWFYQpNNpYjBB481XPLNC0RhqZlmW27QEn90P8fXByaWH7VijmDfjcHAwUyKiRgV2a+DkBc8wwOgR7WVRPkHRsxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048084; c=relaxed/simple;
	bh=MlEJSM1KHa4Say3fzuEgwvtwN4JrqWbroPBmOq9oWEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OteaMOn1J7kzOJb4m+80ogcf/xIHki9vmwnj+R5lVKzKIOyRdKQpxkyL09pS/PsLykNa3E8bWF4vqS4E0SzRvz8IR9DiRWd3y6bWnDZBr8h89JmOjQbuhhjNJECgiSjwgFdYbOzzcX2+uUb0+DkNXKo9zgeP9fIM9wzul4mEbBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlhZcBfD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlhZcBfD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso1981270b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048082; x=1788652882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qtm5hrEQjQyv6mXWDBmzfnMUxx+5IDkw7LiiPlnBcwk=;
        b=RlhZcBfDujEAB0rwAoHHX8TX8bZJY/zAVUQHAyDqk+crxXoMQkrv+Y2XIFw3wzug5u
         7///wi+04S5KAeRJDdbaNl6GF7iajMndH8T7/5a43wLuZPOTtIPo2a/mmye7Qbm0fGtj
         e2nUJbyyNxZ3v460ugsGPtNHDOefFyjCUHNQaDWM9OeApbIJelqUqP4fbH7EhWvXyJm2
         hytvmOPtzYHx6tOFBhKvhUJnhIWUUbmpanHs6Kr3vdhuo3kL6/vEAPYEZaeJ5+q7JZw5
         aPFAUO1XE8eMeip/pzkKIsYuz0QU317slVRxFHxwc8I8MGGKFnI2u4GqFZNVWySJ/nFi
         Mv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048082; x=1788652882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtm5hrEQjQyv6mXWDBmzfnMUxx+5IDkw7LiiPlnBcwk=;
        b=sfQeX5lBgY9hDO7pWN7/jWgiEURPopbD3nAz3TmSZK0v/1g5dCY18ot/P+gCyF5dvr
         IWUl+MIupTq3tYb9V80CsqjGULdzPbarc2m7qro1hF8qvpoVroafjfjylvUa110X0noe
         fnow2ul4sXGxZCXYK9+6RWIX39345sewkRRWAWF9alvzv5TfTGvWIaHxcEbYy5l6eU06
         fj0ovW2NVruB+iaxmTP4Z/ppu31aZBE5KWMaU3Fz2SUE2AXLaHVTVZHTqKgkolfv0nF2
         e7sTWJ+gz+vulgjpy9h3yye7HDh87R6PYuC9VKeWDgvQL1VDHHbB8okUPCwAAo8SN/At
         ilpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSYuNZDYfk+70IOq14gqD1UXxO1956CLivRBeAEPrz6KNYuP5+hhGfqK4rOmSOoF4RHyl1GpYVF90agQ==@vger.kernel.org
X-Gm-Message-State: AFuF++leszQ3UB4Rb1aDN7WKrmu0ZS+PTioqjM78aIEGnz/8K4F/8Xk5
	yU4KJvlW0EXnbq9QfCbq/fx63PCSzX0z2opU8q5W9mRv3jTur2BuGAbXByGWbw==
X-Gm-Gg: AR+sD12PiHb49XkkBbvJuVSA0AOXBIwMlSSVNdyL9gEsXaSx64LWACJD541ZB7fTU7R
	Kk7FXSQVjwXxH8pz+LaBTqhJNNWENxLDohkftefk776NIi/Ckvm2QfHwWjZWLuXA93Jik/aZulE
	8JqnGqs97bNnmHpHYhVNU2A0LzrBLkN4HmvJHH8rhRhIRCfpzKyQ/cicHkzvu8rFkTdzalJ6aQu
	nHExme88xoz7wSRyJoY9twL12LhDPXi8z59/zPFso0Dzt0Qp5MDxHLVy+ZToABbk9M4qx01QPql
	itHN6DwC0RbOLgcECv/byE7nRuCZXBRnMu8V/246eiX8ZU/zXdE6k/NbP9CqbmVHCJlGiPekLEz
	b7QBVH5TYD2wLxIg4yQOj/iCmiiI9BrC2i1nzGvOgd/8ru282oOzZ+2hRkJJiHOR06OQEyre7Vb
	Wrkqc6pNjYSomYgb/WDktj6tP6YCc+u1hde4qUWoINqfo6BhPm1et2g1gB7kPXY1XU0Ics7z2Ss
	g==
X-Received: by 2002:a05:6a00:4187:b0:852:3726:dfde with SMTP id d2e1a72fcca58-8562b58e1b5mr34516563b3a.9.1788048082448;
        Sat, 29 Aug 2026 17:01:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa7ec2csm1768211b3a.18.2026.08.29.17.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:01:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:01:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Tollet <jerome.tollet@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: Re: [PATCH v7 1/3] hwmon: it87: describe per-chip PWM temperature
 maps
Message-ID: <e9f4378e-deeb-4d53-89f0-984b5356605e@roeck-us.net>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
 <619425df92463b3c3f9e90f00c527c4009599ea8.1788040385.git.jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619425df92463b3c3f9e90f00c527c4009599ea8.1788040385.git.jerome.tollet@gmail.com>

On Sun, Aug 30, 2026 at 12:01:47AM +0200, Jerome Tollet wrote:
> From: "benoit.masson" <yahoo@perenite.com>
> 
> Add a per-chip count for PWM temperature mapping sources and use it
> when reporting and validating mappings.
> 
> Keep existing chips on their previous three-source defaults. This
> prepares the driver for chips with a different number of mapping sources.
> 
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Applied.

Thanks,
Guenter
