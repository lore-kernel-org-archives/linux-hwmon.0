Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31537456E1E
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985589; cv=none; b=FYv0cQwB/MePCBTJlsjr6HpIikDoYjnZASo4qrt/Tyg1yoEtpDYy+/bQHWSkzzxTZYEtvgmj+kCNBvgT3igKWXUrTDLF4PlQ/fgXZ3sRhYFS/BpTfbQr895Upq8T21ILEFcwYK5cJkYKScovMBVRET38acCwC7x7MkKgTMMSRrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985589; c=relaxed/simple;
	bh=Een+yNVFf0ybajO33ZCJbELKcaZ8PIAmxaDZESSRzAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bg7onKdps5C7V3p4SuKJM9EBejO+qCq8UKmTLTn7oze8Iyy/DnpguPUZJ7VRuVjGkmD9MJmv//6tfultOLspxbYxKzN46zN83MprCNMXBN0642xJlzR6AZ9ppOX0pa63fADuvt/oLROYoAVj/Wa4tZ7COFyH8TRvjH8zjCv8fxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4SKRde/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4SKRde/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf27856f9cso33833595ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786985585; x=1787590385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGzJpdsw9iPsI1keu5Cl2TIz0qK1NDnn+/0NWxb4/hc=;
        b=d4SKRde//c5r0hdPHZmggqrCW2spSkBuUdZHLO2/etqsU0nn8VWuhVqtG8zwTuFEA/
         KsqiIMSPQnW/N80TO1o8l8c0a392QuUy8BEJNI8tLB3ISHiJIUv0ld2pqDWmZaevfH51
         V/DehmZlf+NUmCeZwWXn9UTROisg4f3fUB+PEWaGltILpzBdBFUwFT09/GLY6KXODoxq
         HbAb8rjysdzgPHCuw7lOXsXS80Pc6pYdUU5RfTFineajvtaU1tJ+SZqqqm55gPMSPPvt
         LXE+CWbYxzpvoKLQe3DPDtZxupLE+zPJmUvF/4MJrt46nyv4MKtFu7XWC8O9oE061NAv
         6XWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786985585; x=1787590385;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aGzJpdsw9iPsI1keu5Cl2TIz0qK1NDnn+/0NWxb4/hc=;
        b=k8sb3GIUU3jvNm5z8gaNot3LDVTx1ZA5xggRDzA6Q+IWUJvMAU3mO6uXX9uhkcnCzb
         0om/8FL6wP9rdK4jAk1z3DeCemABAMO1ngo3v5x45zgunxG9TXzHfl6DWpqscBuZTz4k
         wsGHJ4QbAAqkkpzffoquD50HQL0xv7piooVvaLjAHvxi1xlfSBULgyo6ptMiwTH9f/Qa
         ahHZUXovaO692wQOoCtiIMlSuMjePXLXg7lLlvlr5ee1mXeUc6/QnZo3FCBf9gbnsN47
         94iKKf4EJK/PCgUg6geF+0rEyppCZqLTv+yX3VFg8BO1QDIKdCzEvVhGsj5QVftMI1fk
         8aQw==
X-Gm-Message-State: AOJu0YwwB1940k9AjU9N6pEgBPO9vcg5Kjq2Mwpv0yMB+tu5BxP4PE7B
	OZKPMJSRoh0KXKP4U30fjF75el5whw9miJaWsl9aAFTgVGCXgtZFDpjZ
X-Gm-Gg: AR+sD131zrU/XKRqS+3DuRgHZlpqSxtP3x82dh/twqkkDfLcHRaNvAp+4XAKimsFlMN
	YMY1s6vXD8vcd5e3EdzMhsfrQlSH7Uitru1TQNZQVp4OWOTZxKQCEXrj4vVHFSiFIkR2T5R6hma
	JWkv4eaGtbjuGVCV8LiUslUjSajdNgE0mmFTzhvQGssMoNQlHibttXbLQIFeE44BysTsYP6TikA
	MatO9AKM3a1XLBbelILGpD+wFpN/1+mMqZuJu5nBjxdpUdm5d24xlDQxrFB5YGosFC3HvUmNnKF
	y4NDS6Wu8pXtVWZK79v5+2QkNOs6tMZ+S+YoM0zAgt46UAq2NnXiIjBd/QQoNuL2RwVYIMOIQMk
	qFJyhRfY2nLZzSc0wUmMFwCP5ud8vQEMr7fC0A8k5rRO3XosSr339HQrz+hHtD0qZET1mbnHTfg
	mDl0im59nN2I3FUAVxXDxWcL5T07EU7+fdLrVxm12RX+SiggmX2QG+lSZOLEi4ad2ZCs6+HLmVB
	AdsDCoOwJt7Tn/wDQmSE6/KsW1u7c7CY6r9PQ==
X-Received: by 2002:a17:90b:1b04:b0:395:5296:c47b with SMTP id 98e67ed59e1d1-3955aa8620amr1411503a91.20.1786985584872;
        Mon, 17 Aug 2026 09:53:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d1b0143sm3068053a91.0.2026.08.17.09.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 09:53:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b8ac2da0-31a6-4825-a50c-ae5932f6ca68@roeck-us.net>
Date: Mon, 17 Aug 2026 09:53:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected
 hubs
To: GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 09:29, GG wrote:
> Hi there,
> 
> I apologize in advance if this isn't the right place to send this. I ran into
> a quirk on my own machine, went digging, and ended up working out what causes
> it, so I figured it was probably worth sharing. Please feel free to ignore all
> of this if it's not useful or doesn't apply.
> 
> Before you read any further, three things you should probably know:
> 
>    - I'm not a programmer. I can tell you what my hardware does, and I ran
>      every test below myself on it, but if you ask me to defend the actual
>      implementation I'll be out of my depth pretty quickly.
> 
>    - I worked this out with an AI coding assistant (Claude, claude-opus-5) over
>      a long back-and-forth debugging session. It suggested things to try and
>      wrote the instrumented test modules, and I built and ran each one on this
>      machine and fed the results back. It drafted this write-up too, and I've
>      edited it.
> 
>    - So this isn't a formal patch submission and there's deliberately no
>      Signed-off-by on it. Treat it as a bug report that happens to come with a
>      suggestion attached, and please feel free to bin the patch entirely and do
>      something completely different.
> 
> The one thing I can offer that might actually be worth something is the
> hardware. This machine reproduces the problem every single time, so I'm happy
> to test whatever you'd like, in whatever form.
> 
> Anyway, here's what I found.
> 
> spd5118_resume() fails with -ENXIO on every single suspend/resume cycle here,
> and I think it's because the SPD hubs on this board are write protected by the
> platform firmware.
> 
> Hardware:
>    Gigabyte Z790 AORUS PRO X, BIOS F11a
>    Intel i9-14900KS
>    2x 32GB DDR5, hubs at i2c 12-0051 and 12-0053
>    Both report: DDR5 temperature sensor: vendor 0x06:0x32 revision 1.6
>    Kernel 7.1.8 (CachyOS)
> 
> This shows up on every resume:
> 
>    spd5118 12-0051: Failed to write b = 0: -6
>    spd5118 12-0051: PM: dpm_run_callback(): spd5118_resume returns -6
>    spd5118 12-0051: PM: spd5118_resume returned -6 after 15085 usecs
>    spd5118 12-0051: PM: failed to resume async: error -6
> 
> The sensor itself works fine either side of a suspend and the configured
> limits survive, so nothing is actually broken for me as a user. It's just the
> error, plus 5-18ms of pointless failing SMBus traffic per DIMM every time.
> 
> The thing that finally made it click is that this has nothing to do with
> suspend or resume at all. These hubs refuse writes all the time. Writing
> temp1_max back to the exact value it already holds, on a fully booted and idle
> system, fails the same way:
> 
>    $ cat /sys/class/hwmon/hwmon3/temp1_max
>    55000
>    $ sudo sh -c 'echo 55000 > /sys/class/hwmon/hwmon3/temp1_max'
>    sh: line 1: echo: write error: No such device or address
> 
> Reads are completely unaffected. During resume, raw i2c_smbus_read_byte_data()
> on MR11 and on every other register succeeds on the first try and returns
> sensible values. Every single i2c_smbus_write_byte_data() comes back -ENXIO.
> 
> Which means this, in spd5118_suspend():
> 
>    regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
>                       SPD5118_TS_DISABLE);
> 
> is failing silently, because its return value isn't checked. The sensor never
> actually gets disabled. But the cache still gets marked dirty, so on resume
> regcache_sync() goes off to restore state that was never changed in the first
> place.
> 
> The error message itself sent me down the wrong path for quite a while. It
> doesn't come from the sync, it comes from regcache_sync()'s epilogue, which
> force-writes every regmap range selector and then hands that write's error
> back as its own return value. For spd5118 in I2C legacy mode that selector is
> MR11, which is also a cached writeable register, and with window_start 0 and
> window_len 0x100 it sits inside its own paging window. That's why the message
> singles out register 0xb, which had me convinced for ages that there was
> something specifically wrong with MR11.
> 
> Dead ends, in case it saves anyone else the time:
> 
>    - Dropping MR11 from the regcache before the sync does silence the "Failed
>      to write b = 0" message, but resume still fails, because the next register
>      isn't writeable either.
>    - MR11 already reads back as 0 on resume, so there's no stale page.
>    - Reads succeed on the first attempt, so the hub isn't slow to wake up.
>    - Polling for a write to be accepted for up to 2 seconds never got one
>      through, and added 3 seconds to resume.
>    - Pinning i2c-i801 to power/control=on for the whole cycle changes nothing.
>      The adapter isn't marked suspended at that point either:
>      __i2c_check_suspended() (drivers/i2c/i2c-core.h) returns -ESHUTDOWN and
>      emits a "Transfer while suspended" dev_WARN, and neither of those shows up
>      anywhere in my logs.
> 
> The patch below is what ended up working for me here: check whether the device
> actually accepted that suspend-time write, and if it didn't, don't bother
> marking the cache dirty or syncing on resume. With it applied, resume returns
> 0 in 0us and the error is gone. I ran 5 suspend/resume cycles on a fresh boot
> with no debug kernel options, and /sys/kernel/debug/suspend_stats went from
> success=0 failed_resume=0 to success=5 failed_resume=0, with temperatures and
> limits unaffected throughout.
> 
> One thing I can't check myself: I don't have any hardware with a hub that does
> accept writes, so I can't confirm the normal path still behaves properly on a
> machine like that.
> 
> Candidate change against drivers/hwmon/spd5118.c:
> 
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -79,6 +79,7 @@ struct spd5118_data {
>   	struct regmap *regmap;
>   	struct mutex nvmem_lock;
>   	bool is_16bit;
> +	bool suspend_wp;	/* device NAKed the suspend write: nothing to restore */
>   };
> 
> @@ -498,10 +499,27 @@ static int spd5118_suspend(struct device *dev)
>   		return err;
> 
>   	regcache_cache_bypass(regmap, true);
> -	regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG, SPD5118_TS_DISABLE,
> -			   SPD5118_TS_DISABLE);
> +	err = regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
> +				 SPD5118_TS_DISABLE, SPD5118_TS_DISABLE);
>   	regcache_cache_bypass(regmap, false);
> 
> +	/*
> +	 * Platform firmware may write protect the SPD hub after memory
> +	 * training, in which case the device serves reads but NAKs every write
> +	 * with -ENXIO. The temperature sensor was then never disabled, so
> +	 * there is no device state to restore on resume.
> +	 */
> +	data->suspend_wp = err < 0;
> +	if (data->suspend_wp) {
> +		dev_dbg(dev, "write protected, skipping state save (%d)\n", err);
> +		/* Still avoid bus traffic while suspended. */
> +		regcache_cache_only(regmap, true);
> +		return 0;
> +	}
> +
>   	regcache_cache_only(regmap, true);
>   	regcache_mark_dirty(regmap);
> 
> @@ -514,6 +532,10 @@ static int spd5118_resume(struct device *dev)
>   	struct regmap *regmap = data->regmap;
> 
>   	regcache_cache_only(regmap, false);
> +
> +	if (data->suspend_wp)
> +		return 0;
> +
>   	return regcache_sync(regmap);
>   }
> 
> As far as I can tell this goes back to d1b4c755081a ("hwmon: (spd5118) Add
> suspend/resume support"), which first shipped in v6.11.
> 
> Thanks for taking a look, and no worries at all if this isn't useful.
> 

This isn't the only problem. NVMEM access does not work if the chip is write
protected, limits can not be set, and it is possible that the temperature
sensor data is not accessible anymore after a suspend/resume sequence.
The driver must be black-listed on affected systems.

There was supposed to be a patch series which would prevent the driver from
probing if the chip is write protected, but that needs to be determined
and reported by the I2C subsystem (or, more specifically, by the I2C controller)
and it was rejected. The driver could try to detect the write protect status
on its own by attempting a write, but that would be too risky.
So your only remedy is to black-list the driver.

Guenter

