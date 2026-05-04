Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F7388371
	for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888224; cv=none; b=lgXnTgozGNw+/lI+AoQtOpNrbGfTAHIMp3AupNnfTfgxxT/bZGGnCqQQR+Nh+afry45l4mG6V9QSKAuZxdvgl5dFx0W9hHbucgfgG6rsq8pgbXGuO8rSe9onEGZE078iPcF6OUi2SJlM0PfeMxKa2e8ABKouTBnapaC4JcPwvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888224; c=relaxed/simple;
	bh=9Zg4y6TyKsJrR37qmas3JuCVJk5Y26PPwA23yjCiCbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYLSpv/Oqs1RA3aZp/QewaKV6tqScjqiGpUAMpTnSSsJZePauWY4dhlPZD2JVRBvR9R2SxH1rhDJgoF7RtqYfthxVFg/LkG2dzUccs7DwQvsRxpIKRqL1i5+ZjCRqTqdEV3mCxigsdJc+LlpQ8QmAmh9s3c/zoWsnxWAS/hMR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM+BGI1x; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM+BGI1x"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so36750045e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2026 02:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777888220; x=1778493020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rzb/6v/kMlNBdcsEfp5dSTMtBvwEcriiwup2+Ttvgcw=;
        b=IM+BGI1xC0iAKRklAkv+MR8Un6cMWY7TxedxZTzW0EGNGncTfbMRsWm/ZvFVT9B7p4
         pUnqmI3L7r12D2LydazUZJ4bDtbF7tquHVIhMHP6XScNj9GlZqlqoWgOQuJN62CCsrLM
         5IxfxfPIaz4TQxOykPl0Z2zgR00nspPncmUuLuZuI9nxWcynlFD1RT540iP8NMjCIfO3
         DAVOW3fkJcKloKEsWtmkffud8Vuwi7eHJTT1qc+37MUkOnwFHXe5ZQl3hkkJIBFmd5IM
         wRNDJIENTAxYPTiEBjanJB85LlMufGPCis31ZN3SW3cjyFRT1eM+KH7uxjz8Q7XK9fN/
         NgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888220; x=1778493020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rzb/6v/kMlNBdcsEfp5dSTMtBvwEcriiwup2+Ttvgcw=;
        b=fRNMbf4lnpm7QkuDu2dILxx7uh3SfrJpM1KzdfRe8rNXUecgphez/nZXQSNdb+8gf/
         OKb3aCyx2aYFYJJE/sPE31QhpDQ59ILAvD7886jrVC65hmyByan5SMwikFJ3OXBlAG5a
         bAtGWUnCcspZlUPaEWPqCxoEC42Yml8eyniJnqwqaxSSu6ceSj+Y2jAx7ErYPDtl4IAn
         UUlaTdjFNmxf/DUXfXSgfCpAHe2IvNSe2/nJY3Qg1hdYxx2FK+aSuhP3ABc6+BRgKHOt
         Qvk6CKwPKduCzUFHJa3T4tN781pgZxFnI4U8MmuANq37wJaYkwEvzbv7yn0M1yUTjcF9
         pZvA==
X-Forwarded-Encrypted: i=1; AFNElJ/MFkTxlJ2AlciCz9QcTYmYQOmORRwjIv1bmmmAiHdSmjYhKPVR6EISwLH3CY87zWuRleMGV3Gl+Iwdkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL8Gmt2O8+pHkKGtc+kgDIMN4D5MxJ1PEWTqVO7enqAkAl+P4C
	zkZpsO2WWHBnyqO56dry9m6V42+sLr+/1AtrXpeLk8XPCKzig/sN6vIjutehNQ==
X-Gm-Gg: AeBDievtAjNwBYl3k3KxR1mDfO/rkork7qHApkOGro8gezDLnKyoV9iloaHAfOTP4N+
	Le1MkrxMT1cdj4hh3vC+FWwMmSy2nMSGQ3j4dnetVl66LpZqRTUzJUIYXfwcvERHzo6Gtgq+3nx
	nDVmy6f56Pa4Nh3YZV+Bht5Db0eQDXrhzriMcOxwCemTLeT111DnyYHJ7NsnwFRVDPZAFB+UJo9
	s5rdVG5UUr0rGSmXHCwqnRtksxqXPMxQmlcoHSXu60LhHp3ksTQEt2Q3yn2BdjXL1uZvdXjjcVD
	+xs+PbokBFYVjHRSeNBTGnmxrks8+yTV6afBr/40d8WVyFgstLx2xfLO59v93SepPWn5JngJB8c
	2grhSZ402yqfbxYo2UdnK5ecEzOfeXq2OmPTppaYFC90bbaCkbmDpI0pwWsLQa3oGXruprpOSfA
	KMbzEFG+naTaxJGWKoOS36H0pJtw==
X-Received: by 2002:a05:600c:3549:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48a980fc640mr139679185e9.0.1777888220328;
        Mon, 04 May 2026 02:50:20 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822c3422sm290531525e9.8.2026.05.04.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:50:19 -0700 (PDT)
Date: Mon, 4 May 2026 10:51:12 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?utf-8?B?U8Oh?= via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <afhpmO_FW6nYtHXK@nsa>
References: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
 <20260502104311.0D48EC19425@smtp.kernel.org>
 <3044ffed-b9a8-4a30-852e-2689b0cf0118@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3044ffed-b9a8-4a30-852e-2689b0cf0118@roeck-us.net>

On Sat, May 02, 2026 at 09:21:15AM -0700, Guenter Roeck wrote:
> On 5/2/26 03:43, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Read-modify-write operations on hardware alarm and fault log registers will cause concurrent events to be lost.
> > --
> > 
> > commit 768d24f774b79f50e1444b93b756d7bda5873159
> > Author: Nuno Sá <nuno.sa@analog.com>
> > 
> > hwmon: ltc4283: Add support for the LTC4283 Swap Controller
> > 
> > This commit introduces driver support for the Analog Devices LTC4283
> > Negative Voltage Hot Swap Controller. It adds functionality to monitor
> > voltage, current, power, and various hardware faults via an I2C interface.
> > 
> > > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > > new file mode 100644
> > > index 000000000000..d8931c9a4685
> > > --- /dev/null
> > > +++ b/drivers/hwmon/ltc4283.c
> > 
> > [ ... ]
> > 
> > > +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> > > +			      u32 mask, long *val)
> > > +{
> > > +	u32 alarm;
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(st->map, reg, &alarm);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*val = !!(alarm & mask);
> > > +
> > > +	/* If not status/fault logs, clear the alarm after reading it. */
> > > +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
> > > +		return regmap_write(st->map, reg, alarm & ~mask);
> > 
> > Could this read-modify-write sequence cause concurrent hardware events to be
> > lost?
> > 
> > If these alarm registers use write-0-to-clear semantics, writing back
> > alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
> > asserted by the hardware between the regmap_read() and regmap_write() calls.
> > Usually, a direct atomic write of ~mask without reading first is preferred
> > to avoid clearing unrelated active alarms.
> > 
> 
> Sashiko comes back to this one. Looking this up in the datasheet, it says
> that alarm bits are reset by writing 0 into the alarm bit. That isn't
> what is done here, though. It will write 0 into any alarm bits which were
> not set when the register was read.
> 
> Should this be something like the following instead ?
> 
> 	alarm &= mask;
> 	*val = !!alarm;
> 
> 	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG && alarm)
> 		return regmap_write(st->map, reg, ~alarm & 0xff);
> 
> That would ensure that only the checked bit is cleared, and that it is only
> cleared if the bit was set when it was read.

I'll have to check the above. I gave it a bit more thought and as it is, it
should not be a problem. Because even if we (in the edge case) end up
clearing an alarm that came after that regmap_read(), if the condition
persists in the next conversion, we'll have it set again. Yes, we still
loose one historical alarm but not something will be forever lost at
least.

Having said the above I do agree with your proposed change, but I need
to see how the HW "behaves". I'm afraid that if we just write 1's into all
of the alarms we're not checking we create a window where reading the
register again will, falsely, indicate the alarm is present. If the
read happens before a new conversion was done (note that if all the
channels are enabled we actually have seconds for a new conversion to
go though all channels).

> 
> > [ ... ]
> > 
> > > +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> > > +{
> > 
> > [ ... ]
> > 
> > > +	/* Clear possible power faults. */
> > > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > > +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> > > +}
> > 
> > Will using regmap_clear_bits() here and in other history reset functions
> > also risk losing concurrent fault logs?
> > 
> > Since regmap_clear_bits() performs a read-modify-write under the hood, any
> > new faults asserting between the read and write phases might be cleared
> > silently. Direct writes using regmap_write() might be safer if the register
> > behaves as write-0-to-clear.
> > 
> Again, looking into the datasheet, I agree. It would be safer to explicitly
> write something like
> 	~(LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK) & 0xff.
> This would avoid accidentally clearing bits which were set between the read
> and the write operation.
>

The above is the same situation as the alarm. So let's see how that
settles.

- Nuno Sá

> Thanks,
> Guenter
> 
