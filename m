Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ACC5914E
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Apr 2024 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712926119; cv=none; b=PsUQJwiRYuNVGVgLaqwQ4DLzSeeKfEpolkZESBUX9N8dGLm7YdIoHkzquI8jyK+Sg9SINHfXWJXutMTMXGXog/HqARZhXYlaBxcmg+oqa+TXTI1h0dIPhDcycTIRL2C9LVKiywKZwx+G03CHlswtKs+YzRVeYVZJ7dHEIDcrNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712926119; c=relaxed/simple;
	bh=BwOkZOl/c4c0DURJFqh4ndmAk1epz+ZLcVTc9dMhT44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fi6aMGSH94b48V26UH73NxX0OfyusE2c8+RBUGl1GY6A+j0nk6CS97v5t9u0mZ62hexQUqhEtHPu/379g4E+AvwPpFxpRufVyzFOa/PSYbMCgJ1a+YwvohF7Icy7AVP9ByHAklFT8O3WNJcsLMomNkUGz+CXDXNHN2h6wVBmGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3+4uac1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3+4uac1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e5c7d087e1so2001135ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Apr 2024 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712926117; x=1713530917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvAoGy01jrmP3qaSOg5gGzdy90WNa3fHxa3Jkikurd0=;
        b=j3+4uac16EWRLZbAUB36UwYjobO9FvNvgETwXXIcGGk1R9XBa46wxJs3x1wq830KQ0
         CGJZMRpD/kWW9Ko0ACX5MZKRbhptwN9IHgu/g+Y9h4PYqtBylQcd0AacAZGIfWUmQLOG
         R6Dp2gFeB4ue8o8voCPEn6LM/bolm7z4pPAlcQgytaK6DzDYhdWlqTO5JeoMZib7rWc0
         rO/JzF7bYqil3AfyAwajEWpoVLYS5fTmCGCLz5BhCCo0RBDwacnothfIksAYxZnO1POS
         GVjZDhfOZlNJ4QgRAJqHCoi8VHkfBoR0zcxfBYN1ZbG2UtzU6/eFivFKhCd4YVGgcGgc
         /k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712926117; x=1713530917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvAoGy01jrmP3qaSOg5gGzdy90WNa3fHxa3Jkikurd0=;
        b=G85F0up2vf4OuacCYcKQL4MnURSoxjzRCNC4JHO6C1XOvtp+rjuS30Boa05oNnw3YU
         8cAVNOIXZFvrcwxFxne1rPmdMYH9iGIQhLy71/7KXdnUcxEK+BwUiSWVNRThCk4M7CNz
         L/dZwntvss1mTmXj+zw+YKnOK6XXEaps9mg2f0CjM2Dms7j12YhsSVUbZz9m2Burej2S
         jKx8Scg8NXs3xjC81dtdx275XKvRagqkUUuKvue5oevjyFc89mmy1uybTJ/LxjcYqjOK
         KkxXjoXGfqsNEnq+K0s5QXlU+/woc42TH833NyFIrhLwIaNuCqHU4bffgsXx4pOc16wb
         rZTg==
X-Forwarded-Encrypted: i=1; AJvYcCUAkmU+WToNRgy+d5WywjI8et024BsuXZC/UfUzaju5OsjvgztiZY6Pinr2aXtam+Fbxiah9V80mkoQRGUzHaQEqCr+546yHb8vLwY=
X-Gm-Message-State: AOJu0Yz7WSHIqwXMJsfIAvR92umF4Axbjb6fxxjWWOF3B3Bd7y/V+xTt
	JTTrWVchYcbD7LFLqGE2RUF+hnFlemkGjPCx9Xfgw6LiaYM5Rq5e
X-Google-Smtp-Source: AGHT+IG5TVzBvuBO6rH6MMPXOWRBwyNmnmdebt9/8KjEhtvUXBMqgWYKqPvzWpP2MpXD9zzkGp4qWQ==
X-Received: by 2002:a17:903:298b:b0:1e0:f1f0:37fd with SMTP id lm11-20020a170903298b00b001e0f1f037fdmr2451981plb.56.1712926116685;
        Fri, 12 Apr 2024 05:48:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id kw7-20020a170902f90700b001e45240eca4sm2905090plb.196.2024.04.12.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:48:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 12 Apr 2024 05:48:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
Message-ID: <78ef79b3-e5de-4b73-8588-1d29ca4dcda1@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
 <20240401025620.205068-4-frank@crawford.emu.id.au>
 <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
 <bfe6323c154ae4080a38a85e3601c7fe980dc10b.camel@crawford.emu.id.au>
 <f9963bed-b669-4bdc-897c-3ca04d5162c0@roeck-us.net>
 <7234a7e75e35c580a09f8952cd35a988e2f079cb.camel@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7234a7e75e35c580a09f8952cd35a988e2f079cb.camel@crawford.emu.id.au>

On Fri, Apr 12, 2024 at 08:11:11PM +1000, Frank Crawford wrote:
> > 
> > Not really. There is also the watchdog code which will happily
> > disable
> > SIO access after it is done, causing subsequent accesses by the hwmon
> > driver to fail. The code also assumes that SIO access was not
> > erroneously
> > left enabled by some other code which we don't have any control over.
> 
> And unfortunately if I can't do anything about it, I can only ignore
> it.  If something does come up we can see what can work out at the
> time.
> > 
> > You assume that the hwmon driver is the only driver accessing the
> > chip.
> > That is a wrong assumption. I understand that the underlying problem
> > is really that there is no SIO access infrastructure in the kernel.
> > In the absence of such an infrastructure we can not make any
> > assumptions
> > about SIO access control implemented by other drivers in the kernel,
> > and specifically can not assume that SIO access won't be disabled by
> > other drivers just because it was enabled when the hwmon driver probe
> > function was running.
> 
> In this case the fact that it is the second chip may mean it will not
> come up.  While I am told that the chip is fully functional with non-
> hwmon functions, but currently it does look like most of those aren't
> used.  While this won't necessarily stay this way in the future, we
> currently cannot do anything about it.

This patch affects all chips, not just the second one. If any chip is
in configuration mode when instantiating this driver, configuration mode
won't be enabled anymore, no matter what other drivers may or may not do.
That includes situations where other drivers (or the BIOS) erroneously
do not disable configuration mode.

I understand your reasoning about not enabling configuration mode for
certain chips, but that does not explain why it would be necessary
to do this for all chips all the time.

Sure, there is something we can do: Unless there is a known problem
that affects _all_ chips, drop this patch.

Thanks,
Guenter
