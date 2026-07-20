Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88433264DC
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558085; cv=none; b=WDwDh7Q+XDHCqYdM6q6QUn8Ikmu8pW6c5hq3VHyaJfHZeih88bCO4IkwRC3xmlybOS8UJhYlKm58ECAHT6FwBaGJ9fQpDYMY0bQe/nvkGoYxcbLBhrOYrJAfN56Fu+GNGSSbof6MO/8I0IFkamnmcpX7XAXtOfSwHiFqU1cxwx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558085; c=relaxed/simple;
	bh=XxEok/gyQJjyCbfmc4ni4za68D005XEGN7qqwSMO8co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idwoI/URJlnec3Km3/CWDnAbBPLBj/Za5SPWUiwfDMr2KpWeNpLcM/xhogCDWGSNK9qLNsIHsYBxOSgPSDWuEfxx7f/d8v4aIzWQVo5XV19j3b1SxT8unCSg5wLnWoTABEUBlYMFEztAFDy7BRLMukv12nlKf5ARouyRc4Vk/ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scrVlfSE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scrVlfSE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3461446a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558083; x=1785162883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjKBPerM/kEV9sFP3TfnBk/RDM8de3WpOH8cyJh/jYg=;
        b=scrVlfSEOfwRDvcJUNXvEAUjfxD0fTRR/szgAnwgQGD5jkAKu5oh7I7Rjnjq0X6sm/
         xv/uxthOHYtC9U2xZdwNKird5IRhA7kw1lttZYeTZEQdgoewPyO5o1LXeqF8dKJZZwZ5
         UNtcWQc4h+NRmeY8LAHOsKKNN+5HLr1OO4ZEkTHhcxtQk63ZkzZyZ49lhvgUCFTBRd06
         xCLyr1B9u0HGy+4gpizQgoj28/LqS9j81OM5345JovI90D4+BsEccWb0DuCIMbSgO1hD
         Amsw7cWNExXdQ/GSzCb7sdRkLz+xu3iL+SrqFcWvRiJW3IW5xubPCdvQTeRwnx9apzFh
         voWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558083; x=1785162883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjKBPerM/kEV9sFP3TfnBk/RDM8de3WpOH8cyJh/jYg=;
        b=q9r592/qMQMJbs+GLJzBvhwGGSRXx1CKCHO5dadj9+pTmipbwkPzHXWmIXxgGvRz2w
         zO6VsHtwrYSJR6g2PDTfdfAJovrJ7fVOj0/4Cca5HhJN3Jk/RIatDk5FiDK032PU8yHl
         GHmI8VBziAfowB7TX6PX4rJl0+SBjWhGTwkr+y8nkjtyxfCjEkPocuCMquzep46H84s+
         dRCyAgDQzxPIqOztVwp5fOfs6ke6Hxat+ATt0dI/yMIAbvxNXKl2c0KCPDpmRrI/3/2m
         USH7Y7TpbLsMFkUSxhz2m5iwXsEgmrKfNB2tYWrSxkWIQ7kaBE2jDccaMOqUW3RnZam/
         jIRA==
X-Forwarded-Encrypted: i=1; AHgh+Rolu9ihbWLD2verzJbFxauF+MaVZ3iJPq4uivzlgNZiY9fmQAb7SBWABpwIWuW7BMyO0aYGRZTB8Ewlxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTruo5klXsgKiN7cvPUpGy/W0OHlYyDMhvmtyWCsRZTmoKdbA3
	Sxo0h7LUw0JxUhkO6DyiwPKu1WfXOyShQImvMTpggLgo1YHSbzt9Sw7w
X-Gm-Gg: AR+sD105yg7uCHsodIJbSp13cVots97KKQBTnUJNxzJMTeTXznVeNvlw+Z/FRHjGOMf
	q0FVfvNpk7y2aQTe+2HhHP9KLaqm21fmsn4Q5pXW6PrPbEp/P/TAA1P9qRxr0jvQjFvLBTWHm/O
	OHKdjtRJz4Zadash8MHZscIy5RfCmQZHgsWJHRjPSjH/ZTrxk009+lMa2QoPgk5xElDmXNOKWzT
	beyJewTawkDXu+t1VfUxYiqCcdyO1ZTrKFA7OGfYbdt2U9iJ0+B0MJp/NiU4iyWJlp3SvecSErC
	2YMRG6UZzDVphqto2Bn5ITMaK/Y96XlUN99YSVOYS8DRAukGKAOoioXlFj7L7Aw7wQDQuwAMrFe
	p/sfTZSkAb5V/acQHyCoAFjQ8+xZTGweM3zJigYoDVWjz2Eq4+FOvqAldbGzsW0ayzpCFv7ea8q
	y57tXZVHpBUaI/GDU=
X-Received: by 2002:a17:90b:58a4:b0:38e:69ae:7148 with SMTP id 98e67ed59e1d1-38e69ae720cmr6039935a91.24.1784558083129;
        Mon, 20 Jul 2026 07:34:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29e13a8sm31412488c88.4.2026.07.20.07.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:34:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:34:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] hwmon: (npcm750-pwm-fan) Remove redundant
 dev_err()
Message-ID: <cb3a7e8c-736c-4658-b6d0-b8fda7846a96@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-5-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-5-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:38PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs detailed
> error messages on failure. Remove the now-redundant driver-specific
> dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
