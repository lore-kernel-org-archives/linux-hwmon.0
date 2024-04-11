Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D043314A61E
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712838048; cv=none; b=tB8C06xfBcDFE3TMDdC11Y+dFJcT1L8QgN0usNEinBOLBDccmxN2A4IFeOPjjnOTGvj5pobUgL8ba/JyHBCjEscPaJFGedz7CDr1guCZMFB85S2JuxwxvthPxfGpNp7LkDaS6jonsDzsEIsH00N2RMfZ7Eqeyc6tC2UXeJoMiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712838048; c=relaxed/simple;
	bh=eroD4NnMy1CrfzkCMjfZATzGKCba0PyD+soplAE6M2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD74KhKg4ZnKxLFTkv9fztQEg6BfU+Rvvu2JVQ7DraJLRENyBzMidnu96PnOIybb6jaz6J3cte+Qdpnl3v2SCxlcLBmYAU181xrIHNTRDsMQ1EKAxdz5CLHYwjjHCeuGw4c+Ng18SuBVdGg6C7LNIMIzqGVHOHr61uI8L4ZbB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2V2opAq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2V2opAq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ee12766586so78616b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2024 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712838046; x=1713442846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4v/E1mg/DJDGaK05rrSrzBpolIV7TIOSaF5rtlHY74=;
        b=C2V2opAq0aHlL1dnqz7lZcbJ6c2T4N+vvidMC+MM1Pb7TNONTVlIja8x92PH9dQ4Y9
         mgzg9YQxfP3qsg6vvihBcoBsGr6XuI24yWDcPDycOkA/pBuvkE9cUlA2KwCKVPsq6AJT
         0ipKJUvLNGbogaR+zQmo0Tb43Vq6QB7aMrZIdBSn64fhMHKLZijPC5EXzr5gIhjLh+LS
         XuLp+fomMPhn1Pb06KihTzZApsq0FgWRkvebSja4wz4Jn8hQlhfnPiU0BDYcpxE7mqw1
         oUr2FkUoVpAqRQZic9ZhXMIXCNuAJ9vbwtz2jilyWTnHL+h5EZO2/wzDEgrm8kHAtNV+
         gU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838046; x=1713442846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4v/E1mg/DJDGaK05rrSrzBpolIV7TIOSaF5rtlHY74=;
        b=b0aKNtoEWX/fci7W9eZXsSep8HzIlJOb+QiJHhcyk7uUeCsK5xMfpDwsZrZaS6ddS3
         wZCwxOOT3esJ5zVRGj7uX/K7IGRNAHgjDR+cusjaWryEStUQ6KngRW/3vM7lM33eMaSK
         Fs3n+1HBewquFinLagnlDpmzZC3D6RVvvK1XXtkirsWyo5WD2Xzgx4mgewu2LDCZwFFb
         HjCOpFmPPFVos+HBSzWWOjDnElH02ddQPwD5YCogjYgZmiIDz7vKJ407enFlyZXvcGkF
         nZRoVpEvwE5aXLwDoNc5pCWOkSoCinyVsSE+3QpowmF20tMQFFACjmUdBlmcdlMv6Fjy
         vDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDPN3hPzgl6rot8WkMo7znC5GpEH49Wl9GNAQ8BgTN9aIEZt/k1mA/QNL3iilR11VFx3xfzYVzE8tUiVt6px/HNsvkUezPb2Rjou8=
X-Gm-Message-State: AOJu0YzlMPOK9dGWvh7aghHE3rVCEpjF3PXNr6PXiDO7vtqYmhpjPY6d
	vRyb1k5HjMBEhQPStY4LFdEXumntVW4c7t46lJTxiDxv+JM/IdcLZL/CQQ==
X-Google-Smtp-Source: AGHT+IEkvhoJeP49sfgF2lQ+OlAoy+FTX2jgdEdl0IgJC6PdzZRbNFYhynU6+6caAoqka9FWDyW+GA==
X-Received: by 2002:a05:6a21:32a6:b0:1a3:6f13:b11b with SMTP id yt38-20020a056a2132a600b001a36f13b11bmr3330176pzb.4.1712838046014;
        Thu, 11 Apr 2024 05:20:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r15-20020aa78b8f000000b006edda81101esm1066858pfd.80.2024.04.11.05.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 05:20:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 11 Apr 2024 05:20:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
Message-ID: <f9963bed-b669-4bdc-897c-3ca04d5162c0@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
 <20240401025620.205068-4-frank@crawford.emu.id.au>
 <0773b784-e552-4b31-b8c7-d68e058a2290@roeck-us.net>
 <bfe6323c154ae4080a38a85e3601c7fe980dc10b.camel@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfe6323c154ae4080a38a85e3601c7fe980dc10b.camel@crawford.emu.id.au>

On Thu, Apr 11, 2024 at 09:08:19PM +1000, Frank Crawford wrote:
> On Wed, 2024-04-10 at 08:17 -0700, Guenter Roeck wrote:
> > On Mon, Apr 01, 2024 at 01:56:05PM +1100, Frank Crawford wrote:
> > > Major part of the change for the new method to avoid chipset
> > > issues.
> > > 
> > > Perform an intial test if the chip ID can be read without entering
> > > configuration mode, if so, do not enter configuration mode and
> > > continue
> > > as is.
> > > 
> > > If chip ID cannot be read, enter configuration mode, and continue
> > > with
> > > previous code.
> > > 
> > > Also update exit code to take account of if we entered
> > > configuration
> > > mode or not.
> > > 
> > 
> > You describe the changes, but you don't describe the problem you are
> > trying to solve. Even if configuration mode was already entered, that
> > is not a reason to keep it active. We don't _know_ what is going on
> > outside the driver and can not make assumptions. For changes like
> > this
> > you really need to explain the problem you are trying to solve, and
> > the
> > reasoning behind the changes. Just assuming that a set of chips would
> > have its SIO mode enabled by the BIOS is just wrong. We don't know
> > what if anything the BIOS is doing.
> 
> In this regard, it is no different to the current code, which runs SIO
> mode enable, but does not ever run the SIO mode disable code.
> 
> In fact this code is actually safer than the previous code in that it
> acts similar to the chip not being enabled or disabled, which would
> happen if no driver existed.

Not really. There is also the watchdog code which will happily disable
SIO access after it is done, causing subsequent accesses by the hwmon
driver to fail. The code also assumes that SIO access was not erroneously
left enabled by some other code which we don't have any control over.

You assume that the hwmon driver is the only driver accessing the chip.
That is a wrong assumption. I understand that the underlying problem
is really that there is no SIO access infrastructure in the kernel.
In the absence of such an infrastructure we can not make any assumptions
about SIO access control implemented by other drivers in the kernel,
and specifically can not assume that SIO access won't be disabled by
other drivers just because it was enabled when the hwmon driver probe
function was running.

Guenter
