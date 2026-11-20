Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165906;
	b=V5VoHLCTVb8t0agbaczafC3IE4KuD1jR4KhjqAK/kLTgHrJo8clLNX5p18Ysvk/jXtAL
	 Z9HH+GKBfUCTyo7zH7+HcJL5Rack+2otc7uwzopWyg6LZinkxt+EU3DGjjprgfF7myGYB
	 rFjaVni7WWbDJDz17JpVbAin8M9GdyQtKwEtrNwFICpP4LFczoh8qKMvSNrMR04j8mnSr
	 YFvHbtUitWhXyFVolP155alS8XNUAlwgRQrmiqHrnmBZ1/IPCvZbt4+fY68vBzwELuXgv
	 b+2osMBZ5izJLttwB5s9KalOKRZhiHQjjf7ZVDFz+oY+l975EAfTukg4yoB0J0OBNLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gApvMPkXNFvtfKmjlnFC4/zpO78lpC90tfwmIXaql00=;
	b=LyvHCY0x/9jwmg5JPWIIQpm/F5UfcQXcorOMgPFO7EicAk5axtOycTUJ6iYh13V+80N4
	 SsV22NVoO8AWl7NBC0p21s3bUfPkoa949cUhsipxWgsRvILEesPj9dYZKQ8wtIKmgLsGJ
	 QYiNhzg7RUynwj6/TYLBqpAC5wpq1RzLK/e3+x2Pg0E0GrtQr1hbD2t7UL8qJJxnALmhu
	 1XDcFf+3D4wbMULF28EswN0+twF0EQuzDq2kqFoUD6/ePsAefVOusAuF/mjxnVpWZZMEG
	 7Ihto/ujvmTWEj71BDaoRuY0m1Rbz8ErUH0mu0DmF+rZKV4fzlaf5s/QJudwh/KAC2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XbvqJWDX;
	arc=none smtp.remote-ip=209.85.167.70
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F95606A326
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 09:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XbvqJWDX
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5bfd95238e3so417258e87.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Nov 2026 01:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795165905; x=1795770705; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gApvMPkXNFvtfKmjlnFC4/zpO78lpC90tfwmIXaql00=;
        b=XbvqJWDXK9IVahjf1KDlaqZGzgXwspltMjh9XxrwryB41luQzh70+rlpOK9t/cgmD5
         7tWcuLS5LH/TfKAAJLyGJtYz74QyXd1t0AjUx2CuSBW2JyHFdGla62FlCQOh9gmclbXX
         ASjJSywJTPMhzr0v5sK1T8gE5KgT7ESlbVVh9rXIUpQWn0TE1DgHpanC2vxWU0tp5An2
         UUS+gSxqXM4PEwnsVP7Jzf8Opx3wkpGZjYUux+ZCPzY5k+FcWi9R3AnYIWcamjdSAPPk
         44dw5ZM7/Fk9klOR2c135Xcmq97cBOC/OBZlOBwof/rbam2BnylBM833f+XQ5MwQe5CJ
         D1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165905; x=1795770705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gApvMPkXNFvtfKmjlnFC4/zpO78lpC90tfwmIXaql00=;
        b=BTns6YdAnIuNby+FfWbmiU44abrG6M9BUuag2G+InYDFVG++AKnDBRR3ebGrsAnqsC
         V5/mnh+SI6oxJHzoaLQtVSxqJ6ktMIpJk9NBNoJeuFZ8Dx3p/knlfjvEy3rzTUrjPbwO
         xySTc1SMvqpHwSrq8eyxhUs8/5bysXSGH1HpbKTDzsjDjttsJ9mJiCLQYU//6zL9eIog
         ElWVxfSKGJ0eTVS1dtRxfosEikbNr1LUas8NwSAWOQzfnTdD3qghJrMhxJadIJrDa4v2
         c50ctwHoLN5R9RA2LpFXGKBNoOKxhivPk8RaCwIIkytOmhJbJeWBaswxRO7ti6LkThyl
         RHAA==
X-Forwarded-Encrypted: i=1; AL+hErF5GjK3XmRfLR5gJdF8dfX1GyU3+dGJTpcQ58PPGxR28M9T+HrzyNNNw3zi84wToEejvgX0kbpqMuztsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JcG5Pa2KlN+DT37AS89anWk/NpJr9IfguOQ6bNYvGgR7qTnHO
	JAXYH5AUcBab0nrG+XOBY07yWLjG4Mm8FXp+UvOftlVhsNLFnOzIh9JYuatPQ0ISeW8NrMpJlyR
	Cgg6aaihTxQ==
X-Received: from lfbo17.prod.google.com ([2002:a05:6512:511:b0:5c1:a87c:20b3])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:3052:b0:5c1:5b06:27c0
 with SMTP id 2adb3069b0e04-5c1bc6f69dcmr588593e87.3.1795165904574; Fri, 20
 Nov 2026 01:11:44 -0800 (PST)
Date: Fri, 20 Nov 2026 09:10:22 +0000
In-Reply-To: <20261118220033.70425495@jic23-hlaptop>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com> <20261107010356.39d9eddf@jic23-hlaptop>
 <20261118204532.257423-1-dbalint@google.com> <11a821f4-aef6-425a-8626-1d8641e9f83d@roeck-us.net>
 <20261118220033.70425495@jic23-hlaptop>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120091022.1459658-1-dbalint@google.com>
Subject: Re: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Daniel Balint <dbalint@google.com>, linux-hwmon@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, mwojtas@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 22:00:33 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Do you need that coherent snapshot to get to userspace in one go? 
> 
> For accumulator channels the way they are normally done to sysfs
> style reads is to snapshot on each read, update an internal store
> of accumulation since enable then provide whichever one was requested.
> That way no data is lost - but you don't get an aligned snapshot.
> So it depends on what maths you are going to do with them, whether
> it can be done in kernel and if not how much interchannel skid
> matters.
> 
> So tell us more on why you need that coherent snapshot to userspace.

Sure, I can provide more context. Usecases are broad, but an example
would be that we calculate per-rail drain contributions over short 
time windows for comparative analysis between device states (device state 
transitions like screen on/off trigger snapshot), or for debugging and
power profiling purposes we correlate fine-grained ODPM data frames
(~1s intervals) with other timestamped system diagnostics in our tracing
tools (e.g. perform per-process-per-rail energy attribution), so math
happens server side, and the relative energy deltas between channels
within a frame are just as important to us as their absolute values.
In general, data from a single channel makes sense in the context of
other channels, there wouldn't be a client that requests only one
channel.

At higher userspace sampling frequencies, e.g. ~1s trigger intervals,
which can happen in both abovementioned cases, interchannel skid becomes
an issue if we read individually.
Because the latching and data delivery (up to 64 MKBP events)
roundtrip between EC and kernel takes non-trivial bus time that's in the
~10 ms range, latching per sysfs read across 64 files spreads channels
across a hundreds of ms long interval, which would compromise coherency
and render the data minimally useful. It would also make the EC
unnecessarily busy with redundant work, so latching per channel read
isn't really an option.
But to Guenter's point, this could be solved by driver-side caching.


On Wed, 18 Nov 2026 15:00:20 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> You could accomplish that the same way many hwmon drivers are doing it:
> Read all attributes in one go from the hardware, then cache it for a period
> of time.

I should have mentioned the importance of timekeeping earlier. As we're
correlating the snapshots with other diagnostic time-series data,
userspace needs to know when accumulators were latched as accurately as
possible.
In contrast to IIO, in hwmon:
(1) There is no timestamp ABI to propagate latch times, so userspace has
    to rely on its own timestamp when initiating a read.
(2) There is no trigger ABI to force a fresh latch on demand (e.g. on a
    device state transition), so a userspace timestamp only marks the
    start of a sysfs read sweep rather than the actual hardware latch.

So, unless I missed something, with a timeout-based cache in hwmon, a
reader has no visibility into whether it's hitting newly latched or
cached data or when the cache was actually latched (skewing time-series
alignment) or whether the cache has expired mid-sweep across 64 sysfs
reads.

We could probably tune a short enough cache timeout where time skew
would be negligible and mid-sweep expiries would still be infrequent,
then it's a trade-off between accuracy and more mid-sweep expirations
(more EC roundtrips). It could work, although we still would do 64
sysfs reads instead of 1 on each trigger.
So I guess it's not a must to send the coherent snapshot in one go, and
I cannot provide any data to claim that hwmon would be a suboptimal
solution to IIO, but our technical judgement is that IIO's explicit
trigger, latch timestamp and single buffer read is a cleaner fit for
power monitoring via the ChromeOS EC.
