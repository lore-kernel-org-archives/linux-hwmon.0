Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D136E3DDAEB
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 23:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850581; cv=none; b=jJ954OPz4XScXVNWg0fUxScss2romscWp0ck40Rb9VmCmt5CLWa6vaTW5NT8NTWzqZW2YS/aDEmZwpvLmGuE2EvxuEj4XhLVHpkCUGvvY7jXR1La6CKOMMZ+OHJpEmKK6CzXKtqpMKARr0Psx/PGwX6hNtHxuETymzN5y500pXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850581; c=relaxed/simple;
	bh=pH6TpREoPGKux7FUnBNeYrnmfg/ZvJKJ9kxmm6ccVHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3EEJVisnw8Wl5AbdeJdzRklww1+Z8aAfnF2bBFAwI7n5x1HmIzo98pNgMb+PSay/udJgw5eCuGKaMAD7DQ6mz83PC2QWTudBf7yR8fxgra+Hd9YdwfYBNm4ER3DV4to61LMhgjA6a22q8fGWYU7OXdBS3vQjnHkHUzu/NfywQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc6NZP/G; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc6NZP/G"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1640451b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 16:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784850578; x=1785455378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsJvVNnTWIbsdIDqmctBUH8uu1exiEUvWNhSM5LOHKc=;
        b=Gc6NZP/GeSClLCfmrmeYorS7fCqfMusAmEM2nxrQl9AFzDXVHksB1ZEWzmGJwTeoly
         KqTOM888s9r+ZDjsPbkhKSt0zssB+MO9DKdM1kfUs+nhx2zh3OzEnDNdp8vlcAJc9JPz
         TJoE5F5fe3Bd8P/MQj0Bq8JZNBLJlJQQDVtoG11pyRRvzQvsVVJqwNh5TMBd4OJ6eZde
         l25rjN3xyAVpcZxKiS7Kjw8Po8wK0cF56nZZQzUZ1N/XPiQ9QehVzSJYg7kwqQ4eqiIs
         +vTzGhUeQOefZg5CnWB3c5F7mrYCFsoLrQdeFb0y5+fReiNoiB+HcQXdzh1xS4fwycxd
         zxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784850578; x=1785455378;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UsJvVNnTWIbsdIDqmctBUH8uu1exiEUvWNhSM5LOHKc=;
        b=QO6MHq769TcLzT0wEMOSFjGg/NWUeZMQ/gF4d/x4zCOK95XuEl9nL21PRh3+cIvndM
         /i76MOjjHjgmC22gt6YMwpreFzlgNbNW/gAcfwuVhm7usgnARsx3FJOlAiqS9cRbuoLA
         XZvwwuoCoAP26vh9jUjrgy8TsMeku8Az65Lc35EHcSLr6kI96edF6+YU4ETyDHEGolR+
         76g9dmqsqSRdxG3JnxhIPr7OM73QDGWFmESLyB6AhEjl6DqQgZEB9NS57dvazJqaL1bZ
         FeMeR/ziUqSOtue+6ShOA885ardry/ta0Ss0dI3Sn2SWZ8hNxie4J38VbkN3H20D3SS6
         Xa5g==
X-Gm-Message-State: AOJu0YyrR1ubkrsArydIFIRyItbBlPWq4umK9M6uNJ0F1DQgntP2U4MK
	KbDeYBgLQC46zZwILOobGS6u6ZLM2Ryx5/lAmKKNJuz3J2RWOJI2v4Te
X-Gm-Gg: AR+sD131Sj5aYn3D+eiDKQd+10lm32lMGXV662I+zEAwN3aSphVVIA8jsqHrT5lYd4M
	M2JWMqNwShybYWa+Ia9Y2bPAHkJbn+emSmEpK8LGstuZllukS/kw9JZuc9VAcrRpTqcBvTx8LnB
	TCkEETAnI1YbI+lxJGYiOt1N5RbbToKaEE6J/NU2fcpr7v8VzFWMTBPAj8q6IE6sBaofG+0c10y
	yx/6MqAekPTzL37ElIZo6pit9Nn6ShQ5rdS/WCtbvX3m/B0Yo45gHfhprmuEVz09HJtZPp9hRjw
	sm1o7KHxJPXlKUiZdphX/W9Q8I0JtIS7qC13gUs07gLjX+KhFQlpfLP9KyZZu0NL+CIuPjbx7dE
	UZxazP06c+qZgqK0JaobY4x0m5PJPLMbOd5b1uE6Pq9S6sRRB/fcKB/bW95zwQ77pBctFwLJNZm
	SNeQvJbwPiypuBp+S/UyMY4yC3gN6KMaSRVOn6ac1c43yJ3YpGLNU=
X-Received: by 2002:a05:6a20:b786:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3c44afb4d98mr5834830637.9.1784850578031;
        Thu, 23 Jul 2026 16:49:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm24238579eec.26.2026.07.23.16.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 16:49:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e3b1def9-a077-4247-b306-9c02d8de7c10@roeck-us.net>
Date: Thu, 23 Jul 2026 16:49:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hwmon: pmbus: add MPQ8646 driver
To: vjardin@free.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
 <20260723-mpq8646_v0-v4-3-b6323d5fc524@free.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260723-mpq8646_v0-v4-3-b6323d5fc524@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 14:38, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Add a new single-chip driver for the MPS MPQ8646 that is
> a PMBus device.
> 
> Beyond basic PMBus telemetry, the driver adds:
>    - MFR_CFG_EXT gate-close retry after CLEAR_LAST_FAULT.
>    - alarm acknowledge via inX_reset_history.
>    - STATUS_WORD MPS-extended bit decode + post-mortem clear.
>    - In-driver alarm-poll fallback work item (thanks lm90) for
>      boards without SMBALERT
>    - on_off_config/vout_margin/mfr_pmbus_lock sysfs.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>   Documentation/hwmon/mpq8646.rst |  314 ++++++++++
>   MAINTAINERS                     |    8 +
>   drivers/hwmon/pmbus/Kconfig     |   11 +
>   drivers/hwmon/pmbus/Makefile    |    1 +
>   drivers/hwmon/pmbus/mpq8646.c   | 1237 +++++++++++++++++++++++++++++++++++++++
>   5 files changed, 1571 insertions(+)
> 
> diff --git a/Documentation/hwmon/mpq8646.rst b/Documentation/hwmon/mpq8646.rst
...
> +Diagnostics and introspection
> +-----------------------------
> +
> +When ``CONFIG_DEBUG_FS=y`` is set, the driver exposes the following
> +entries under ``/sys/kernel/debug/mpq8646/<bus>-<addr>/``. Most are diagnostic
> +probes; the read/write entries (marked R/W) are direct accessors to
> +the underlying chip command.
> +
> +Identity / observability (read-only):
> +
> +==========================  ==================  =================================
> +File                        PMBus / MFR cmd     Description
> +==========================  ==================  =================================
> +``mfr_config_id``           0xC0 (word)         board / SKU NVM identifier
> +``mfr_config_code_rev``     0xC1 (word)         NVM image revision (PART_RECOG +
> +                                                config code rev fields)
> +``mfr_silicon_rev``         0xC3 (byte)         die revision
> +``mfr_retry_times``         0xF4 (word)         per-fault-class recovery-mode
> +                                                configuration (NOT a retry
> +                                                count). Four 4-bit fields
> +                                                [15:12]=OTP, [11:8]=VOUT_OV,
> +                                                [7:4]=VOUT_UV, [3:0]=OCP.
> +                                                Each field: 0x0=latch-off,
> +                                                0x1..0xE=retry N times then
> +                                                latch off, 0xF=hiccup
> +                                                (retry indefinitely). The
> +                                                chip exposes no in-NVM
> +                                                retry-event counter; track
> +                                                transitions externally if
> +                                                needed (poll
> +                                                ``protection_last`` or watch
> +                                                ``inX_alarm`` / ``temp1_alarm``
> +                                                ``poll(POLLPRI)`` wakes).
> +``mfr_vboot_cfg``           0xFC (word)         ADDR/VBOOT latched at POR
> +==========================  ==================  =================================
> +
> +Timing / UVLO knobs (read-only):
> +
> +==========================  ==================  =================================
> +File                        PMBus cmd           Description
> +==========================  ==================  =================================
> +``vin_on``                  0x35 (word)         UVLO turn-on threshold
> +``vin_off``                 0x36 (word)         UVLO turn-off threshold
> +``ton_delay``               0x60 (word)         soft-start delay
> +``ton_rise``                0x61 (word)         soft-start ramp time
> +``toff_delay``              0x64 (word)         soft-stop delay
> +``toff_fall``               0x65 (word)         soft-stop ramp time
> +==========================  ==================  =================================
> +
> +Configuration (read/write):
> +
> +==========================  ==================  =================================
> +File                        PMBus / MFR cmd     Description
> +==========================  ==================  =================================
> +``on_off_config``           0x02 (byte)         PMBus vs CTRL-pin on/off source +
> +                                                active polarity
> +``vout_margin_high``        0x25 (word)         production margin-high VOUT setpoint
> +``vout_margin_low``         0x26 (word)         production margin-low VOUT setpoint
> +``mfr_pmbus_lock``          0xEE (word)         programmable PMBus write-lock
> +                                                (independent of WRITE_PROTECT)
> +``mfr_product_rev_user``    0xC2 (word)         user-programmable product revision
> +``alarm_poll_interval_ms``  --                  alarm-poll worker cadence (driver-
> +                                                local, not a chip register)
> +==========================  ==================  =================================
> +
> +NVM commit / revert (write-only):
> +
> +==========================  ==================  =================================
> +File                        PMBus cmd           Description
> +==========================  ==================  =================================
> +``store_all``               0x15                STORE_USER_ALL Send-Byte (commit RAM
> +                                                config to chip NVM)
> +``restore_all``             0x16                RESTORE_USER_ALL Send-Byte (revert
> +                                                RAM to last-NVM image)
> +==========================  ==================  =================================
> +
> +Bring-up probes (write-only triggers, results in ``last_probe``):
> +
> +==========================  ==================================================
> +File                        Action
> +==========================  ==================================================
> +``probe_smbus_rword <reg>``  i2c_smbus_read_word_data on <reg>
> +``probe_smbus_rbyte <reg>``  i2c_smbus_read_byte_data on <reg>
> +``probe_raw_xfer <reg>``     raw i2c_transfer read-word on <reg>
> +``probe_page_write <pg>``    write PMBUS_PAGE = <pg>
> +``probe_clear_faults``       send CLEAR_FAULTS (0x03) Send-Byte
> +``force_raw_xfer``           if 1, the read_word_data hook uses raw i2c_transfer
> +``delay_us``                 udelay before each chip-driver hook call
> +``stats``                    per-hook call / error counters
> +``last_probe``               result of the most recent probe_* operation
> +``reset_stats``              zero the stats counters

Many if not all of those commands should really not be part of this driver,
and commands such as probe_page_write would be extremely dangerous and
mess up the driver if ever used.

Are you really sure you want to expose all those to the user, instead
of (say) force them to use i2c_dev if they really want to risk turning
the affected board(s) into a brick ?

I won't prevent you from doing all this if you insist. I used to,
but it does seem that people insist in shooting themselves into the
foot, so I gave up on it. I am, however, telling you that exposing all
those commands is extremely risky.

Guenter

