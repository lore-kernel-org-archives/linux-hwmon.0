Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36302820A9
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014323; cv=none; b=q/l2NZVDC0ztM3iXLhUjMnAGfFvEJHzFAAfa7ETFjiXw61P8eKLMx3DMiV+5BXJnHvkpZd17MjpxeNGTavF6MQ0yalIdugMlVnpdKt1+plbx+WUwjaXvKTiMQekoG4Ne329IFPV3a5NKbqTNiigIw/+IBRkzZuf5CqDypnkpVO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014323; c=relaxed/simple;
	bh=liLv5N2bL+FfpA5Vm5jgN7lGjBHXeU529zM3wEud9/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgMU9R+6cQlAEx0u/En/ocjylbaFMnxv2iCjTf7F6dTg2++y5bbglt1HxwELDfH0v44CfoI6bwGGZYi+yEerDllLOd0u+GBD7L2YQ0GukDGyq/GKV0S2xjjfZQc43+A6ssOwBFsrKE06VfVnljDE0vFguhkVHSN0UfHhruaufEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwsSfPeB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwsSfPeB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so35591185e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014320; x=1781619120; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mLmTJSo8tO087S3+3tOfvhvQVhTG6wQbPzavlDU/Ew=;
        b=KwsSfPeBPNBsBtWEAs6Ih9wwiOj+aZVzrT5tKByvGtXdv+Ich3KnUgcviche7f93ed
         HF475eJ4UwZhGl/+YNgCauxtM18CL7edecl4xILw+uf8VIVNaQokQ+k60ifg0zFx3Kha
         v32PUaUD9F+YbmYpH7qFVJooHTmcvJgQz9hHkR/K5N+L3FcVA5npc7xyl27jjEh7yIH2
         gzJIX8MZpxdsVyPR68eRUo7wdokJFNXHFO3Y8kqFjnflYbhv5rXzms2uL1xEtPs47C9R
         paf5V3pyJCegWbT0mmbC+VSJ0SDDiIhcg+wZEiFeP8jVzVtU8SDDXU341JAeOtc9XELY
         l4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014320; x=1781619120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mLmTJSo8tO087S3+3tOfvhvQVhTG6wQbPzavlDU/Ew=;
        b=OUel0hPCUV7pT/u5+f2ZDI3LrHEEvI4UV8Cob80h6wJ947lPGvKtBqM6B+fWScJBw2
         5sGAgymgFfTDquzGxBOUO9n7+nTC0Zaf/xXofsgACpaihquIYVXdrYguz21PgNNfcSjJ
         GHzlHzZ03v8aowzVsbiV+IhdTaGcrZwaRv8/ooI9CwwuSS78HW30JAW7vSJQnJtpwXt3
         gGgmc1QZrqD+89LjhIYdbAW5Cc+5SzHh9IPfRT5XlvMrBIDIS9E/skfBg3qHSg/HiCBG
         Ypw2Diz6QuWpSLgzTxy20uY2MVy3ynkAVFHXIlGIW6XQjI5fLif2AIT9LVJVnYyXPmAG
         xjog==
X-Forwarded-Encrypted: i=1; AFNElJ+woV6nOQRpExH62+athRE81FDX6TWJ46mShfTbZ4gnJZgKG7JvDMff9quqQupy7oWnfDAuX0qGuh8ypQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHwFSC7aCpm6lP7CRqvLOiZouS/km9FIuW1OY+8WOZyepoFm4
	MgNx8Jo2Boda4+ZJWG1Hh6sf6tHNDhQcwo1sX6trsfjozcnJNDdmMNCL
X-Gm-Gg: Acq92OEl1u6o9ZGnwxYAp101seKH/SxiZHYBQQKMrMtHPXU+2IrNzivtHQf4Ewzxxuy
	ioo/48X3OZjQrzhVZhOSvr/VgClDOHZvtPaU/lvIpB4cgCLBCt36F4fDIIeg6VxXrIxheWyHX7d
	LshV2/tgUscRwEl7JWke582rcQQyKvppvJa0fsGElJCl8mTljt1+on3AlmWDAUttNeWht7ePoGo
	TZoKDw2wrJP9Ft8fpGgsCjU7zFA3xCV62qUhlZkmggwRbjIImfMYksQ2npydW3rs2cg5qMXE87+
	RAXhK2dcIgYm4ntajEeIfJCIb8PYT+5fzKf6dTd9X8LDXlLRZkeebv/5fA045Vrjt88Iacm8hPT
	S8iCUGH64VHUAvHeQKeLJXvIgxNYvq3sVc7r+QWEO9N6XK9czx6Mkxc2FnvJkLoyNzI8Q72dsny
	ouqlHh5OMbe+FMx9U30yOAaFWljA==
X-Received: by 2002:a05:600c:470c:b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-490c25dd118mr346103595e9.19.1781014319938;
        Tue, 09 Jun 2026 07:11:59 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321305665e9.2.2026.06.09.07.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:11:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:12:58 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?utf-8?B?U8Oh?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <aige5END74wK3ENh@nsa>
References: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
 <20260502104311.0D48EC19425@smtp.kernel.org>
 <3044ffed-b9a8-4a30-852e-2689b0cf0118@roeck-us.net>
 <afhpmO_FW6nYtHXK@nsa>
 <aigLddl1zeqM3gX0@nsa>
 <85185e61-f9fa-4183-927d-8d7f4e8d4a2e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85185e61-f9fa-4183-927d-8d7f4e8d4a2e@roeck-us.net>

On Tue, Jun 09, 2026 at 06:07:38AM -0700, Guenter Roeck wrote:
> On 6/9/26 05:50, Nuno Sá wrote:
> > On Mon, May 04, 2026 at 10:51:12AM +0100, Nuno Sá wrote:
> > > On Sat, May 02, 2026 at 09:21:15AM -0700, Guenter Roeck wrote:
> > > > On 5/2/26 03:43, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > > - [Medium] Read-modify-write operations on hardware alarm and fault log registers will cause concurrent events to be lost.
> > > > > --
> > > > > 
> > > > > commit 768d24f774b79f50e1444b93b756d7bda5873159
> > > > > Author: Nuno Sá <nuno.sa@analog.com>
> > > > > 
> > > > > hwmon: ltc4283: Add support for the LTC4283 Swap Controller
> > > > > 
> > > > > This commit introduces driver support for the Analog Devices LTC4283
> > > > > Negative Voltage Hot Swap Controller. It adds functionality to monitor
> > > > > voltage, current, power, and various hardware faults via an I2C interface.
> > > > > 
> > > > > > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..d8931c9a4685
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/hwmon/ltc4283.c
> > > > > 
> > > > > [ ... ]
> > > > > 
> > > > > > +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> > > > > > +			      u32 mask, long *val)
> > > > > > +{
> > > > > > +	u32 alarm;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret = regmap_read(st->map, reg, &alarm);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	*val = !!(alarm & mask);
> > > > > > +
> > > > > > +	/* If not status/fault logs, clear the alarm after reading it. */
> > > > > > +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
> > > > > > +		return regmap_write(st->map, reg, alarm & ~mask);
> > > > > 
> > > > > Could this read-modify-write sequence cause concurrent hardware events to be
> > > > > lost?
> > > > > 
> > > > > If these alarm registers use write-0-to-clear semantics, writing back
> > > > > alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
> > > > > asserted by the hardware between the regmap_read() and regmap_write() calls.
> > > > > Usually, a direct atomic write of ~mask without reading first is preferred
> > > > > to avoid clearing unrelated active alarms.
> > > > > 
> > > > 
> > > > Sashiko comes back to this one. Looking this up in the datasheet, it says
> > > > that alarm bits are reset by writing 0 into the alarm bit. That isn't
> > > > what is done here, though. It will write 0 into any alarm bits which were
> > > > not set when the register was read.
> > > > 
> > > > Should this be something like the following instead ?
> > > > 
> > > > 	alarm &= mask;
> > > > 	*val = !!alarm;
> > > > 
> > > > 	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG && alarm)
> > > > 		return regmap_write(st->map, reg, ~alarm & 0xff);
> > > > 
> > > > That would ensure that only the checked bit is cleared, and that it is only
> > > > cleared if the bit was set when it was read.
> > > 
> > > I'll have to check the above. I gave it a bit more thought and as it is, it
> > > should not be a problem. Because even if we (in the edge case) end up
> > > clearing an alarm that came after that regmap_read(), if the condition
> > > persists in the next conversion, we'll have it set again. Yes, we still
> > > loose one historical alarm but not something will be forever lost at
> > > least.
> > > 
> > > Having said the above I do agree with your proposed change, but I need
> > > to see how the HW "behaves". I'm afraid that if we just write 1's into all
> > > of the alarms we're not checking we create a window where reading the
> > > register again will, falsely, indicate the alarm is present. If the
> > > read happens before a new conversion was done (note that if all the
> > > channels are enabled we actually have seconds for a new conversion to
> > > go though all channels).
> > 
> > Hi Guenter,
> > 
> > I got time for this again and apparently my concerns were valid. As it
> > turns out the chip is not "smart" enough:
> > 
> > root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
> > 0
> > root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
> > 1
> > 
> > And you can imagine the outcome of running `sensors` :)
> > 
> > So I guess we have to leave this as-is.
> > 
> 
> Outch :-(.
> 
> Oh well, that can't be helped. Should I apply the series as-is (v13) ?
> 

If there's no more concerns from you, I would say so. If I eventually
have the time, I should apply some of the outcome from this series to
the ltc4282 driver.

- Nuno Sá

> Thanks,
> Guenter
> 
