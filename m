Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A7337BAC
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567762; cv=none; b=aIyoGv9r2oSXhvpHws+kRjbthL+EUT7Cx/ckCat0v+JtDRIXlZgZyeeo/AFC32l5a3a9v/Mu97kXWNhzVhguZ4980ZPfdc7+BnzVUqbbph0DyGI+WFC0FCpOZFBDvTiE6J07SBubGY3ZWmcJmr0hGuBHjXJGDY8MbngfFl7qLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567762; c=relaxed/simple;
	bh=xlI1YYt+C5AukoPM6VJT+UNXPmiaBxUqPwpPIhZ6bAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZE1vCyzkC/6u0XYMMEImAR3wKaPVn/iioM8uH5JVj+cQHClS5Denh2IlAMvhOkCBJzJf1NJncYOx4S3lyXnUrZXFaZ0i2fYTZ5TFuhWQYjmIB/nN/Mz3FqxrGFqyOFD0DvAFDbLxBOkYIWaG5aLUwvmN2jq47hTByAnZQNfJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeC3OL0h; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeC3OL0h"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso613465f8f.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777567759; x=1778172559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJpcF6FDTN511t1R8pQD5mX83qkS5gNN+CK8VqgZ8eg=;
        b=oeC3OL0hjZsEKkM6PBXhxgumIVrBxZYnkZ3kxOxqlCJCV+D1avqax2WPe5a6NnMAKJ
         zP/2YCHqVEBBH4hExEUv+mgGpSjez/1YLpLOiG8Q3Jdt4BXFoZM7tR9F0uVydB9T8jOM
         k4pg3o/TCEtPpsFK9hgGBS0xOoekgkNEusorVFRZlo7TtOWimkng92+nkJRyFt+AJ2Tb
         9zbLHoUvLk8gkx5oNYpNNhRpks3VWmhiZF806/Og65/N4Mn7jYTEFQgIS+rVYAwvPRL7
         tcxySZSHTUVWaWD+mSdDsPfrvjV2l45oZHMOWyPk1Y+/OiCvs+MBi8wau3/Y3wprUzYj
         jxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777567759; x=1778172559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJpcF6FDTN511t1R8pQD5mX83qkS5gNN+CK8VqgZ8eg=;
        b=b43C2YdrHmxUKdj0YRH357ZUGkzNV4U9K2kXRTgaQ7UZYRqSGmmF26ou81/G0HBf1o
         ocqyvytvtgT07THfW9Nfqe5qVmfcAIcI3ntGutxUosSvYPp2QgmOjVaLDNdVgWeoaZ8k
         ho7FsX04LqYIAmH/WwrYZhNRdhHH1icQAFTIfqJ8RTO6A7gyiizhzmb/1l2JSjHGkkHw
         k+pyZG2FLuQclkwQmMaiUBm3awq8eWuZjgQTm3w6jqhdiY3NesEAWhs00XSTNJtj4cjT
         7ZdITD2s43DYTtCwvsZd+EjqQ0gm1VIA9I8YbvZddkbaxMsAP5+NGZi603X3eTqFRzc/
         4A4w==
X-Forwarded-Encrypted: i=1; AFNElJ/yvILhQxl7DK6lvHY2gXkxbkgPVMCropYozQXw+ciMCggknOsVwgq+5hwVFPY0lbgR6kDNE/iyxz0Jgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30lPhRFmDkEG810wisZjUIp4w+QEzUOCoEcj/B+XSc6t/dR8p
	53HhTcnOumkxGdexXdzs6AewUzrDG1OFMEtT1/sPTspWmB3uIUQZa+Vb1hbgvA==
X-Gm-Gg: AeBDieu7W8KO+F0PAwQLAXuV8G4vosrzFavmEHQdUBs3+ZU9WX1/PTdfUZ9MfT25tqi
	56YhKQaX8Kdhw6rPhmj3B+OaRJD4LeJFmRfg4GtczmJvohLZx20rFw5ZAGgiBmvLf62E2ihgWpL
	7987lb9w1Nt1uCCF/9Tz1Uwr4Y2Y3V3hBSPmyBz59r1QhXmD0iJFg0FOI0z7H1dxf6w9g47p16P
	TmS0A2Zgkg5WcE+p4lqva8EQzOcNt2iN9hcKvX9B0xQGQv4DnquiL5bApO5VJJmbHB6lVYtHHFW
	ePGbh03eGNK5gklry/l5nmSUm7G/We4IFqcGblKPs/zPsMbzzX53FjwPEQpElytI+OfRU+qiBog
	mMtrTWhhZdGI28laRuY1fIx9hqHqrWEmX+Uu9iv+TMKa7KHT2chUwqLmVMsxnqWettB/V+L8NZR
	bpbqfL8M9BQv3O2pTr84S/cMFlJcrftpocMiXd
X-Received: by 2002:a05:600c:4f81:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a83d62fc3mr54251775e9.5.1777567759058;
        Thu, 30 Apr 2026 09:49:19 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822c85a0sm73422565e9.12.2026.04.30.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:49:18 -0700 (PDT)
Date: Thu, 30 Apr 2026 17:50:11 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, 
	Nuno =?utf-8?B?U8Oh?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <afOH5xx29LGJ9yKH@nsa>
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
 <20260430100343.45D31C2BCB3@smtp.kernel.org>
 <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net>

On Thu, Apr 30, 2026 at 07:52:55AM -0700, Guenter Roeck wrote:
> On 4/30/26 03:03, sashiko-bot@kernel.org wrote:
> ...
> > > +	id = (client->adapter->nr << 10) | client->addr;
> > > +	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> > > +					      &st->gpio_mask, id);
> > > +	if (!adev)
> > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> > 
> > Can this error path lead to a use-after-free?
> > 
> > According to the I2C subsystem rules, debugfs entries attached to the
> > client debugfs directory are only cleaned up during the client device
> > removal function on driver unbind.
> > 
> > If __devm_auxiliary_device_create() fails, the probe function aborts and
> > the devres subsystem frees the st pointer. However, the debugfs files
> > persist and retain operations that operate on the freed st pointer.
> > 
> 
> AI taking everything literally :-(. I'll have to reword that guidance again
> to include the probe error path.
> 

Yeah and it is annoying it always comes up with something that could
have been said before. Even more annoying some of are legit issues :)

- Nuno Sá

> Guenter
> 
