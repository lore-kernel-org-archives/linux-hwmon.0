Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174F23FFFA8
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341706; cv=none; b=KPQlDow6+3dBNRuv0yJR6fvF4u1xbw/DAmyje0yF7fwAumCXqXOhLYQ6Y4vU2Bx/TOfxyBdW7n88qQBaShXmbWl0AssRmMt46XfgYcNA9mD8dwJmIk9tF/V9eWTtucVvcRiI5Z82OqKY2BmDOrxoEJjQrl0OnAMDaTCGEzaKZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341706; c=relaxed/simple;
	bh=DAn+/B0izIDoaENUzIC2/vsaXlQUetkZ0UCryncCCFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XA8Kx4d5gDr3qTYjTvEnLltENXhQXbOK/y17zsZewLYpnKOPZycpnVz75IxeyrXlH8RzFbVN/YM+VpxnKHbJIH8TuE/OIi1ZLVl4o8SSB4H7SaGwSg/M579zkgw5Cw5KIKWDcd7NG1K95Y8XQ/CUS0BW55/puokthIN3w5Byo/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ggv9UE6A; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ggv9UE6A"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1073533a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 12:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787341704; x=1787946504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vNtJI7CJ2T6NkJs0hB3i7Qs9dTN41sdER4mWPQETmAE=;
        b=Ggv9UE6AmDoxv+i5d0bl9F+rNsChmEf1mIRGxCTO41LdmaS8+bVRFYKrymUxvK0EvH
         djQ8otTMUroPlJ0TAQfDy1Nik9NJoDDr3AOyJ8RA1FvWNlFhYjC9NNdGB6XN9Mxavciw
         iwZHq+SZmVQSBJrt83/Tqsf37ODZTzAZ/a5fGffDNnlWG5osrqi9JLWjHqXTG8a1Qhe/
         IKslBCJk2rQImZH/4ep0y9sU33iU1v+TcXoWdfFaRMGmYUYt8d/jKb3Vr40JDitJL3mW
         GXGKgtiI2izEhbJ6kPyDC/uz99Lqou+khs1fxCfg1DDApu2Jq7lkClHQmObywoJkgZEy
         KEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787341704; x=1787946504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNtJI7CJ2T6NkJs0hB3i7Qs9dTN41sdER4mWPQETmAE=;
        b=pjCElrB5J+Bjk9j9Ba+izKm1NL54yubd4sD1x/pdXHVsscGcc/60A87LYhrbSt2l2T
         i02u6Dk2ppXId+26pBl4k5HqNbOmRzlRTpx9IsgGjFZjywvGtmiYm9Fb8lOXuN2yEwvx
         bLNvfFnVuJ7I+dJfPlnz65XyquSmlMoSSrxxA9phj0tN1qTqZqjFtAiXUHWTLum54E6v
         v+2joxZ6auQNIMwV14D3MHGZdLKTqVPL9lDv2yWg1MEv9esa2+E86fb8NVsZKP1h46Eh
         ZG/eGLsTYKNYl9KQHSwhIeP9BDbyBupxyNvw8n+yOHoq5/EXXhELTVPPHMDq0ys4bZu/
         biLQ==
X-Forwarded-Encrypted: i=1; AHgh+RorJo/filsK4vn+4IFDoyahWDfuAoEAJvlgS7AU0Stwc5wk8eJILQxK1to9bJGUN4GbXRG7FX8QeJIdsw==@vger.kernel.org
X-Gm-Message-State: AFuF++nJGZ1hmDZex8VcvwZX6ODHcMqj60NvjvOyS2kyZiEofts/eaiF
	12HxwdOisiPhq8dtBV9KASaDnVL0uAxrqMsR3xbqfnfzgayNra4zd2Mp
X-Gm-Gg: AR+sD13Wf13TtilpbwL/tpgZ1UhmABusU6gJO0J9t/8ZIviUBz0kfJU6Re0mwYdaV+Y
	Utv7Tdpm27GzuDJBZ6t33lpfaCF1iYH08dMlbzErMpE0dcuG7WHohhlmJ3wgVU7F7uL34OdcVN1
	XtxohOQhjQGYPK16SSbR3J/7YwTXogub1EbSyU69v10Xy1Fm/gT2u3irjdrd3PCKmEa4i+/HFiP
	ZcIZpI9lo3yDncF0h+rt6b5KMfZeofwDu7uhw5cj7W0avSGvV+QCVQm8OkUURWEw5BIjnhb9TLA
	vZJehF3LNCoXbKSN+TklsARH2YNa+4z+aeoaqNyAdQI4mHQ8epXK+VYeDVV73SFFfndlIU+Eih/
	/sExB5XoRUIhYqMEI5f+kbI72k9095xNLmD7NPHzmK50WtegzrWhbG9GjBJp6bdR3WmvtT8pSVJ
	bvSTPZaDJfhS2AnHNg2DjhHyZY52ALSuufQsCWT3X0oD4MvpkurA3N93dTR6N6gfJbRkxQWzWjp
	Q==
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr14290980a91.5.1787341704154;
        Fri, 21 Aug 2026 12:48:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm679172c88.8.2026.08.21.12.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:48:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 12:48:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jared Kangas <jkangas@redhat.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Lothar Felten <lothar.felten@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Message-ID: <b60db310-a747-472c-b85c-808951b347a4@roeck-us.net>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-4-fdce35abc41e@redhat.com>

On Thu, Aug 20, 2026 at 06:09:24AM -0700, Jared Kangas wrote:
> INA2XX current limits are converted into shunt voltage limits internally
> using the shunt resistor value. Once a current limit's corresponding
> voltage limit is written to the hardware, shunt voltage and current
> alarms are indistinguishable from each other.
> 
> This causes two issues:
> 
> 1. in0/curr1 alarms may be unintentionally cleared by reading from the
>    opposite input's alarm.
> 
> 2. When a limit for either in0 (shunt voltage) or curr1 (current) is
>    set, both of their alarms are triggered, and both of their limits
>    read nonzero.
> 
> An example of this behavior on an INA231:
> 
>         # cd /sys/class/hwmon/hwmon0
>         # head {curr1,in0}_input
>         ==> curr1_input <==
>         1713
> 
>         ==> in0_input <==
>         2
>         # echo 1800 >curr1_lcrit
>         # head {curr1,in0}_lcrit_alarm
>         ==> curr1_lcrit_alarm <==
>         1
> 
>         ==> in0_lcrit_alarm <==
>         0
>         # head {in0,curr1}_lcrit_alarm
>         ==> in0_lcrit_alarm <==
>         1
> 
>         ==> curr1_lcrit_alarm <==
>         0
>         # head {in0,curr1}_lcrit_alarm
>         ==> in0_lcrit_alarm <==
>         1
> 
>         ==> curr1_lcrit_alarm <==
>         1
> 
> This is because curr1 uses the same underlying masks
> (INA226_SHUNT_*_VOLTAGE_MASK) as in0 on the hardware. As a result,
> ina2xx_{curr,in}_read() both read the shunt voltage alarms/limits
> without considering whether the voltage or current is currently set.
> 
> To fix this, track the active alarm type in ina2xx_data and guard
> alarm/limit reads with a check that returns zero if the active alarm is
> for a different type. The new field is initialized based on the
> MASK_ENABLE register's set function, assuming voltage instead of current
> when the shunt voltage mask is set.
> 
> After this fix, the alarms only read back 1 if their corresponding limit
> is set:
> 
>         # echo 0 >curr1_lcrit
>         # head {curr1,in0}_lcrit_alarm
>         ==> curr1_lcrit_alarm <==
>         0
> 
>         ==> in0_lcrit_alarm <==
>         0
>         # echo 9999 >curr1_lcrit
>         # head {curr1,in0}_lcrit_alarm
>         ==> curr1_lcrit_alarm <==
>         1
> 
>         ==> in0_lcrit_alarm <==
>         0
>         # echo 9999 >in0_lcrit
>         # head {curr1,in0}_lcrit_alarm
>         ==> curr1_lcrit_alarm <==
>         0
> 
>         ==> in0_lcrit_alarm <==
>         1
> 
> Fixes: 4d5c2d986757 ("hwmon: (ina2xx) Add support for current limits")
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Applied.

Thanks,
Guenter
