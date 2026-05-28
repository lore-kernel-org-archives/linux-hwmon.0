Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76542FE566
	for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 04:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940897; cv=none; b=AOUsHMNpSxoiD6nJIv5OK56i7EuxB3INLRGUJ+M7er8s1WUex0uyO3IgIA3PH562yRfHHWBxsF/6gvkJfW1+Pwhvssgz0uPmRZI9DGXSZPVKNUxIxOB9Yjodbi/AYjZpE5g60u/R7h1quxi4e2b/RLXcFouXS9wiCetZbgtdsRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940897; c=relaxed/simple;
	bh=srG4ZL6b9e17XegsKhBKeXBRQtNvqMENouo5QJao9Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fq2k331kQdHnsMoWyFBilOM0L+CTHuK2H8XdAvGGQ5rsJSt/B8c3RR1wzyRCOJ+rNYHlITub6cJK0XMSRda/OFiaj+hGd5IApOCezz6PsycQG5dUhGxwsTudrBek93kMXMUgRzd+7MgwHFIvvEl5VxX2WH3aaonNs0+/avTh1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWH/t8E5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWH/t8E5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so208035a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 21:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779940895; x=1780545695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWHZVtRsHrqP05UKrtLgFJpflZqSuWUA1qzDKEVGHmo=;
        b=SWH/t8E5K1h2LM7btetxPWjhq0dB5afw3jmkXukMyYQ0fEu4bWOvUN+QToPZJMVgiR
         F8NWRSClkQUNsy48hArKrFj/V4v3mvqeV9zzRXksda3H/CAUT6sEyy3YjRyW5OkIPxis
         V626KYUwVDfpLsRVgUDzeONnSAoo6a1gkYmBBxzMvRrVuANFFxqV1ijugyLGiEJiFZZ7
         Vhz5XmjhVD2H0sy7JsEqpnhwn2usBZGRUw+tjCU+xLIc31Qd30flrJoTlg7cf6+sAkDY
         6XPasDif3BMApOD/teqZOwQ3MkDGlWpFpIn0C/eOUUFvfBIdkSC0buVqzY/l10J6E8P2
         +R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779940895; x=1780545695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWHZVtRsHrqP05UKrtLgFJpflZqSuWUA1qzDKEVGHmo=;
        b=tReoI4qI+BJpJ9i+lwND8mjutl1eWIEktu83vD9l//2jw7sZK638GCYV4C2RIZIG6M
         0ugLkyP0cTexKBCDTH26l8e+6bPkyiRbkZpdOGlXeucFwUkVnqet77EZATwY/+2KiMDo
         Al1gTZfLmWLwd8/E8BtvkRdB0DTnlTt22PPYN/KtQD3+kGmgwplRH8j+kUOnbDo5rwwc
         AU744AmA6u5WWALurxaas+1QYTnT6mkVBzRMw1dpUWXKEUNYNepyLt6yDoBOHkIo7w2/
         MN8Myd/RvD1+FEKZfWjksCYManpHO/q85kKvupgglOJfKopQxqugH2CD5qKLyvq1n3Vs
         EJRw==
X-Gm-Message-State: AOJu0YwXFlVj8SpqhUIcn4HB+wlNbYtI3hwbd/F0BI/GYzRU1FSuIyMx
	avM6FtmVrUk4e7t8lFh6gdnUq6B8UkuXaMHHik7YEviEMwV0S3o9msPr
X-Gm-Gg: Acq92OH5vg/bchImCH7YUyIG7PdWX7Xlet5yStOjMfvF2AFT/dc/uLI0B+CtGeaoFj+
	BHYQAKeNZGBdb4KQg7hkhTSs/txfhBg4qJJnwNxar/O4Tc3C8mLUX43hpE0SavbDSzSILz5Jdee
	WCyYlPbXdotEmSresGsCuVHoVcXTVXHy7882t5U6nhCOBWvVJtDk30mcn2fLe9hGl6ZHF31/o6k
	4T5UZOAdU0sFnZSqhGAxBgGn2oHup0kfT6F74mPr0z1bgXydRh3FPohDo+21TlRiZNyTl4TrynW
	UAzlGfk1sXJHo0O8yeXTLiaUTfYmZXoj9WuBmBvHI6Disx22AoWvd94NuVbgMQUQ0Sa57XPpuNk
	xQjLB4Y61zC9qdV8mF+KOYSJKYmdch8kz/gt4Dhewi6TBPVeIhSRz4FWWfzfYVm0ASp8kW+OTsT
	tP/gvzAGiODgL+k60XWjYEcnN/nTl2LOwUS/lFCfOd++QDyRc=
X-Received: by 2002:a17:90a:ac10:b0:36a:5b56:5c1d with SMTP id 98e67ed59e1d1-36a5b565cf7mr15529054a91.11.1779940894874;
        Wed, 27 May 2026 21:01:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b90211c6fsm443935a91.0.2026.05.27.21.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:01:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 May 2026 21:01:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"richard.leitner@linux.dev" <richard.leitner@linux.dev>
Subject: Re: AW: [PATCH 0/2] hwmon: ina238: Add samples and update_interval
 support
Message-ID: <b618785d-9af1-42c9-8ad8-4249978708a2@roeck-us.net>
References: <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
 <7af1292b-e61a-4cbc-8353-dcbc6dfce3b6@roeck-us.net>
 <FR0P281MB28617450903B76C97BF62011E00B2@FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FR0P281MB28617450903B76C97BF62011E00B2@FR0P281MB2861.DEUP281.PROD.OUTLOOK.COM>

On Tue, May 26, 2026 at 09:08:18AM +0000, Ferdinand Schwenk wrote:
> On 5/22/26 13:18, Guenter Roeck wrote:
> > On 5/22/26 00:03, Ferdinand Schwenk via B4 Relay wrote:
> > > This series exposes the INA238 ADC_CONFIG register's averaging count
> > > (AVG) and conversion time fields (VBUSCT, VSHCT, VTCT) through the
> > > standard hwmon chip-level attributes chip/samples and
> > > chip/update_interval.
> > >
> > > The first patch adds read/write support for both attributes using a
> > > per-chip conversion-time lookup table to correctly handle all
> > > supported variants: INA228, INA237, INA238, INA700, INA780 (sharing
> > > ina238_conv_time[]) and the Silergy SQ52206 (sq52206_conv_time[]).
> > >
> > > The second patch uses microseconds as the unit for update_interval
> > > instead of milliseconds.  The INA238 supports conversion times as
> > > short as 50 us; millisecond precision would make the four shortest
> > > steps (50, 84, 150, 280 us) indistinguishable and inaccessible.
> > > Since chip/update_interval is introduced in this same series, no
> > > existing ABI is broken.
> > >
> > 
> > Are you serious ? The hwmon ABI says clearly that the unit is milliseconds.
> > 
> > What:           /sys/class/hwmon/hwmonX/update_interval
> > Description:
> >                  The interval at which the chip will update readings.
> >                  Unit: millisecond
> > 
> > It doesn't matter if attribute support is introduced with the series
> > or not. It is still an ABI violation.
> > 
> > Guenter
> 
> Thanks for the clarification. I understand and accept that update_interval must
> be in milliseconds.
> 
> This raises the question of how to handle hardware whose native resolution
> falls below one millisecond. The INA238 has eight conversion steps from 50 µs
> to 4120 µs — atmillisecond resolution the four shortest steps (50, 84, 150,
> 280 µs) collapse to 1 ms and become indistinguishable from userspace. The same
> issue already affects the ina3221 driver in mainline, whose conversion time
> table starts at 140, 204, 332 µs.
> 
> Would adding a `update_interval_us` attribute alongside `update_interval` be an
> acceptable path for hwmon? This pattern has precedent in the kernel: the 1-Wire
> subsystem added `w1_master_timeout_us` alongside the existing
> `w1_master_timeout` when hardware required finer resolution (commit c30983569272).
> 
Yes, that would be acceptable.

Guenter

> Ferdinand
