Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A6419303
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009387; cv=none; b=t/99uFvM7cGT8B5iwxjHSjDY3kj07thKKZMj5jw8d4w34PH5haPY5b71FfhBUmPw5hgotEbT9NAq1A4FnEXIyopb7mqT8arZHuVNCThFIZbFQFp2n5i1yZqzZgeChRFhOSmUk0l99M5cvGn+TJ4gk5rmgApkOedZtYuVffOLxGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009387; c=relaxed/simple;
	bh=brgT+kDRe+Gur3XNP4EdUx6uL/24H1GTbmCen/MJ/E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFyi/zL/PHwPbU8+neVnMQHlpLMT8bSyPf3vXm2A0enHxjDs5zBa3hNAz0m2bywcfMnv1sW0GpS8jhcgZPL8bt2AhDJgZ4eayJFKsNDybS6KwpRZGqHhHBw1+wjmPCMR+xX0QFT+1ZrjoyDUe4BzQV1yWSiDwqBY/bFOQnfeb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWpfzXX2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWpfzXX2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so60129965e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009383; x=1781614183; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaZ/YK5jbJQEVse47nMpFLDrabkl2KuhNakGpkdn9rY=;
        b=TWpfzXX2ouHHDYUdQnxZV8tmlnhNnEOSN3qp9s+pa4SoDRLGzGMTtg429oLPxE8feP
         jBbtcS9339vQu1LElGb6ZIkC4+Bc3EAy3+lMGcPvcPOEKPSsBE7EA6bW/AQqLif6veRS
         A3gu2xz09PpfeoNkTlpQIMgr/7Eka0YrEdphGI8VMp0XCpWIQazuuRy0Wm7kOCKHo75L
         jpd2nUMdWLaVPfNlu9+a4o194HGMXI6eepP95EDmmGASJC095qSzCVJ25p346OrDl4Mn
         Dh/NS+KPN5Ros6dxxM6+zyjZ9+XrXOs4uejQz2g+FbzbtQ1KISB09IdZk/pMO7uGgaEo
         o29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009383; x=1781614183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaZ/YK5jbJQEVse47nMpFLDrabkl2KuhNakGpkdn9rY=;
        b=G0Aj888GPsSqi5H71IQgONTCorQGIM+fhsUfRnO525FClI0FAc1iu4N1U3Wnlj0gPW
         PiJz3gZSYCeupN/9GvljmRi/g6YZoOC+YgFudNdoquwAahKKoGYgIJo+lnLapL9mc3pw
         s1b1iH3K3H4u/lcrKgOs9TcUnu0v8g8+1iKykQdNU555qngFyyyuYCSz48XqVhm+3ZhJ
         dx3n0qVuwgr5y7kk1iDjGd4afv0bEH1KnCFfFonSIhXxoMaeB2qcAh5/5Jq3PgZdjTW2
         JAJh7B+gqBiWfrwyC9Tga3RWyu2GmKMfflTtFbRBkJkBy7x3tbaIa9saK/VLcWHr0bf3
         VemQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ytzbzKYmEnNWMPTF5NRmTDMvNykqxvWYL5mgL52jSIuRldlMf1q+nF0n9y9SgVik3cqYfY4e5PE/6Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhgqzW11rtJCmhXbo2P7G34yiC5FWo6kwtdeYtHvlk0UqSMyZ
	QLjuWf8S2QvsVzMcgp/tqQYLe2v9V1x2fDbM6CDBrPOhMnyOKLtGMdQ4fGijAQ==
X-Gm-Gg: Acq92OFyukj/96xx0DrWTkLNfXowWhRZjuIO71hC18ol4U8x+6i/zbPTGzYR72qqa+d
	TdO/D2nD4MxWCjhQAo8azLfgURRXBHLMTQlGIr6B+fdtF+EGeIaMo5jGCVe/eIo2G36E6CJkp2t
	sQFVEz1QadmpzMk7BGXL9n+QF5Ra/p4qsesylAl9r8hNrWbZwR2RG8VN7EzcW3g/UHw80lHfx8l
	mWKXVpYmvGw1te88VKx8U7yr9WhKf63RSr0Lq52gzufrlTjsIG7CC/3aTMn47VpWqPuvSmXkJOa
	bgrp5oNxMgS8wRUDO+u/OdTokOi+zNv61EV32yn3bTUhg2GaLXWSQZB2N7TuzYQjg2XCWcGHmTk
	Fyv9VvBy38dLzNTY/8mam3+jCRnpUHbfbDNfq6PGfYZoLYMt5dyDOcraRDRhybbMAp4ycGsfn1R
	MLPYVrzy2jZtPVnEQVW9FLXxyOXg==
X-Received: by 2002:a05:600c:458a:b0:48f:e518:d110 with SMTP id 5b1f17b1804b1-490c2614beemr289363995e9.32.1781009382764;
        Tue, 09 Jun 2026 05:49:42 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm457610395e9.10.2026.06.09.05.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:49:41 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:50:41 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?utf-8?B?U8Oh?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <aigLddl1zeqM3gX0@nsa>
References: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
 <20260502104311.0D48EC19425@smtp.kernel.org>
 <3044ffed-b9a8-4a30-852e-2689b0cf0118@roeck-us.net>
 <afhpmO_FW6nYtHXK@nsa>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afhpmO_FW6nYtHXK@nsa>

On Mon, May 04, 2026 at 10:51:12AM +0100, Nuno Sá wrote:
> On Sat, May 02, 2026 at 09:21:15AM -0700, Guenter Roeck wrote:
> > On 5/2/26 03:43, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Read-modify-write operations on hardware alarm and fault log registers will cause concurrent events to be lost.
> > > --
> > > 
> > > commit 768d24f774b79f50e1444b93b756d7bda5873159
> > > Author: Nuno Sá <nuno.sa@analog.com>
> > > 
> > > hwmon: ltc4283: Add support for the LTC4283 Swap Controller
> > > 
> > > This commit introduces driver support for the Analog Devices LTC4283
> > > Negative Voltage Hot Swap Controller. It adds functionality to monitor
> > > voltage, current, power, and various hardware faults via an I2C interface.
> > > 
> > > > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > > > new file mode 100644
> > > > index 000000000000..d8931c9a4685
> > > > --- /dev/null
> > > > +++ b/drivers/hwmon/ltc4283.c
> > > 
> > > [ ... ]
> > > 
> > > > +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> > > > +			      u32 mask, long *val)
> > > > +{
> > > > +	u32 alarm;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(st->map, reg, &alarm);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	*val = !!(alarm & mask);
> > > > +
> > > > +	/* If not status/fault logs, clear the alarm after reading it. */
> > > > +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
> > > > +		return regmap_write(st->map, reg, alarm & ~mask);
> > > 
> > > Could this read-modify-write sequence cause concurrent hardware events to be
> > > lost?
> > > 
> > > If these alarm registers use write-0-to-clear semantics, writing back
> > > alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
> > > asserted by the hardware between the regmap_read() and regmap_write() calls.
> > > Usually, a direct atomic write of ~mask without reading first is preferred
> > > to avoid clearing unrelated active alarms.
> > > 
> > 
> > Sashiko comes back to this one. Looking this up in the datasheet, it says
> > that alarm bits are reset by writing 0 into the alarm bit. That isn't
> > what is done here, though. It will write 0 into any alarm bits which were
> > not set when the register was read.
> > 
> > Should this be something like the following instead ?
> > 
> > 	alarm &= mask;
> > 	*val = !!alarm;
> > 
> > 	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG && alarm)
> > 		return regmap_write(st->map, reg, ~alarm & 0xff);
> > 
> > That would ensure that only the checked bit is cleared, and that it is only
> > cleared if the bit was set when it was read.
> 
> I'll have to check the above. I gave it a bit more thought and as it is, it
> should not be a problem. Because even if we (in the edge case) end up
> clearing an alarm that came after that regmap_read(), if the condition
> persists in the next conversion, we'll have it set again. Yes, we still
> loose one historical alarm but not something will be forever lost at
> least.
> 
> Having said the above I do agree with your proposed change, but I need
> to see how the HW "behaves". I'm afraid that if we just write 1's into all
> of the alarms we're not checking we create a window where reading the
> register again will, falsely, indicate the alarm is present. If the
> read happens before a new conversion was done (note that if all the
> channels are enabled we actually have seconds for a new conversion to
> go though all channels).

Hi Guenter,

I got time for this again and apparently my concerns were valid. As it
turns out the chip is not "smart" enough:

root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
0
root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
1

And you can imagine the outcome of running `sensors` :)

So I guess we have to leave this as-is.

- Nuno Sá

> 
> > 
> > > [ ... ]
> > > 
> > > > +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> > > > +{
> > > 
> > > [ ... ]
> > > 
> > > > +	/* Clear possible power faults. */
> > > > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > > > +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> > > > +}
> > > 
> > > Will using regmap_clear_bits() here and in other history reset functions
> > > also risk losing concurrent fault logs?
> > > 
> > > Since regmap_clear_bits() performs a read-modify-write under the hood, any
> > > new faults asserting between the read and write phases might be cleared
> > > silently. Direct writes using regmap_write() might be safer if the register
> > > behaves as write-0-to-clear.
> > > 
> > Again, looking into the datasheet, I agree. It would be safer to explicitly
> > write something like
> > 	~(LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK) & 0xff.
> > This would avoid accidentally clearing bits which were set between the read
> > and the write operation.
> >
> 
> The above is the same situation as the alarm. So let's see how that
> settles.
> 
> - Nuno Sá
> 
> > Thanks,
> > Guenter
> > 
