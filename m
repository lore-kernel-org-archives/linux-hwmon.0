Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021CD351C04
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769651; cv=none; b=Gsb/gOwfUKyv6qR9tu3QGv2tRuiKWwHb4rpRAUOr/RDJTmPaWgrilLPyx2Y1kU0oP339pQWpl9nOnf/cUxjkHCneuoya6J+uNIefG17znfEiv/WavBYH2b+6J8KbKnekTTTvh7m0k/jsfqZe8bSmmIGrFqvmFeC5D76qwfo1lAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769651; c=relaxed/simple;
	bh=5uOmEpadRadRKkZuxWXITM1R8uvvnmGzgwB99E1jOtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azoj95WF1ldzQU8dlEXGDAm+mg9xruwbZBVvOwD/JYIe+SIaxPH6ntZvuuYylP/bVvWPXEwb8EOLBIssrXbpuPL+e50EA6xac+vI8u5IfZ7AmPhL7y97kd9w3iosI/cL/66aX8b8P0ZPH20pUS/loAlC7bEI7DwaH/t7HCbH5bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7a1Tghi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7a1Tghi"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76b6f9a50eso617071a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769649; x=1776374449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr5YxopLPPl6Lhy7H+cJ2Jp5D/0HQnUmZSE6Kn+2cL0=;
        b=A7a1TghijWOY7IB4jn32kyk5mAY2jKgFQYsEsxry1kX6tsdsYRaJrZbZbnsLDzrRkI
         XgeqtKVC+k6kEjaZMhxIqzAXfFeMCVyBOcJi3BrDJ7Rr9NTcVuTKu2ZP9K2+7KLycfBu
         AfamMjAsI6aRIkH0XbrQivKcXBM6eFVQ3v+aP6ttTQ69pQppZRHz+tZZtZwGdmL981Vl
         3xQMw9+RbB0Xxikq3Kcwe5XnPvpyxZQqBsOa0cqziuOMVooWRXAo2m68vWQeYviJuyEv
         0/8nfjngEO5YfnxqLJr6sdMt2hoNMTzrT1pIhks3i5/BgfId/ki5+racs/AP3kzU6/oR
         cBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769649; x=1776374449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr5YxopLPPl6Lhy7H+cJ2Jp5D/0HQnUmZSE6Kn+2cL0=;
        b=g4wRLh+UTz0UJVbwzzeygBWhvEYLu60qj8eyX2skP6lScJKE5+ISufYtPKiAPoLKmK
         R6IgKQsCBHc37eycVsOa15i5jhj/PTZUbqXN7v5PpT2R5lRkTALVB98So/AX51752+f3
         nGxGMtaX0KGKdrt8L5yJDmt10bTJUm3+EpovHnFG4DLVi7y6lRf5A+Zg6cIUR7M16PfB
         ahfaMQvHvWmc5g3lRz1qjE01eR7EwOS32Bnn+N970RYA1lISA2yprRBu6Yj3FE7W4BjD
         MQ+xKJmlgyfkvGl2FsjjhskgW+F45eI5xusG4vt2744n9DYZw67WDRMpBNkVWxKFxfUz
         M8EA==
X-Forwarded-Encrypted: i=1; AJvYcCVRjFQZ71TNBX7TOE/7F6KUXQJ1VkPNoK7otJPeo455pGhztqAObrIlBHrrkCusWAvAXwTQrIr4xqdcFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeN1VrQPSKP9khFC662NtqbwoaDXRf6ovBe3cuSTcCgPzXxRgp
	DLfvxiKe2lqTC5YzwG3bg7Cm4zsHM3ZUkt2k7TpjuNByU8/Bb7n4QB9jum3yKQ==
X-Gm-Gg: AeBDietbd+Cw5C824Dom81+EVor/Tx8o3JxEP1WPog7yPZnjhSW2pf7WoAFbgexio3G
	ZsnntQDS9RE6AgC3NLOpUpjbYZYMmexbbmHhbarcrfqZIuo7b9ffY5W33uRzp+kf2ybZVJLL9Us
	FXM0CZtI55RGX1eoFbVdgGW8tp8hWtKtrNl69blW/7QYKybeWHV4xA++x8MQEkDjTvvavrXI2q3
	dE8z3sXG5v/3yjxUA1FQWSrMpLeKBqlXGnMN8rEWJN+POcmHbvDWMCvr4KT8I5Cg7uDWa/sCxi/
	dkIgWObNIVzwb+LOPIJI+5lyHP2hLszeTU4CRNA0GzBgS406cW4eh+B36XI+IzrsyY2Mgab+z/O
	4Ka1pBjE3zdQOt2/QgFBW3lZtNp10qMiPwQVH9pHZe1gr2RCF8c8DagpJKq/saxoSOQb6M75Pb3
	apApKFVyyidijhj1BYmikJDqnO7tD0jH86+wXQ
X-Received: by 2002:a05:6a20:1588:b0:39b:989e:6d34 with SMTP id adf61e73a8af0-39fe3c1c2d6mr551016637.4.1775769649341;
        Thu, 09 Apr 2026 14:20:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc64csm344061a12.11.2026.04.09.14.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:20:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Apr 2026 14:20:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] hwmon: pmbus: Sony APS-379
Message-ID: <9abbac2b-ef37-4f8f-9193-f704d1669189@roeck-us.net>
References: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
 <cce0e8c4-8df3-408c-b3ac-6ede3c4b2cf0@roeck-us.net>
 <20ea1c7b-d7d4-4f29-a0f0-c8a8b5a1076d@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20ea1c7b-d7d4-4f29-a0f0-c8a8b5a1076d@alliedtelesis.co.nz>

On Thu, Apr 09, 2026 at 09:02:43PM +0000, Chris Packham wrote:
> 
> On 02/04/2026 23:38, Guenter Roeck wrote:
> > On 4/1/26 19:40, Chris Packham wrote:
> >> This series add support for the PMBus hwmon on the Sony
> >> APS-379 power supply module. There's some deviations from
> >> the PMBus specification that need to be dealt with.
> >>
> >> Chris Packham (2):
> >>    dt-bindings: trivial-devices: Add sony,aps-379
> >>    hwmon: pmbus: Add support for Sony APS-379
> >>
> >>   .../devicetree/bindings/trivial-devices.yaml  |   2 +
> >>   Documentation/hwmon/aps-379.rst               |  58 ++++++
> >>   Documentation/hwmon/index.rst                 |   1 +
> >>   drivers/hwmon/pmbus/Kconfig                   |   6 +
> >>   drivers/hwmon/pmbus/Makefile                  |   1 +
> >>   drivers/hwmon/pmbus/aps-379.c                 | 178 ++++++++++++++++++
> >>   6 files changed, 246 insertions(+)
> >>   create mode 100644 Documentation/hwmon/aps-379.rst
> >>   create mode 100644 drivers/hwmon/pmbus/aps-379.c
> >>
> >
> > Sashiko still doesn't like it.
> >
> > https://sashiko.dev/#/patchset/20260402024101.4136697-1-chris.packham%40alliedtelesis.co.nz 
> >
> 
> Just out if interest is this something I should be looking to run before 
> submitting? I was put off by the low quality results (and dubious 
> license) of some of the earlier AI code assistants so I tend to avoid 
> them. Time to revisit perhaps.
> 

The latest AI models (both Claude and Gemini) are surprisingly good with
code reviews. Failures are often because of missing context information
(for example, Sashiko doesn't know that I3C selects I2C, and thus that
CONFIG_I3C=m and CONFIG_I2C=n is not possible). However, it finds lots of
problems that I (as human reviewer) had overlooked. Which means that, at
this point, I trust it more than I trust my own reviews.

For this reason, Sashiko now sends review feedback for all patches
submitted into the hardware monitoring subsystem.

So, yes, everyone should look into the results. If there are obviously
wrong results provided by the AI, we should [try to] fix them in the AI
prompts. Sashiko is public, so everyone can chime in and submit prompt
updates.

Thanks,
Guenter
