Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87086382368
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 04:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785385606; cv=none; b=l2JVcYdxbrB6BqZkFjHRnpaEzyZJl6v3/LG9xZTOeYteNaoH0trzugMupxFysTXoW674IK+HAA1RjS208f7WamMW9WSURVlU0I8PnNH/LQeOqzhv0SsVDoD2UoJgsHQYI7G4bfH071C5vlO2LSgFF+5Ea1V+zbOlfbHuzIPrtTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785385606; c=relaxed/simple;
	bh=TqdyjM/5GLN2EIbS4ZTkI2p/xSup96wYJXGxoia6qi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRMVxoEbW1cGZkCUUcUFv3pPXvtzVW1sP+cpB1RDbX4kyxusBUD4i5Ylropn7RLO9MCYp5EuhZpAb4AJTEGsLPAmoZBo+fQ97IjdgIyXsNHdtZIW+6E8HU1Eo2ti56zj6cjanfVnO01ioqeefvPjqynLA9WCvtkH44S41t0FMVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNi6Yi3W; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNi6Yi3W"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485b358552so1931016b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 21:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785385604; x=1785990404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiQ1daJGHngzKWEQKXllXfEw1lyX6ubdIL7ID1shbk4=;
        b=tNi6Yi3W1ghYQExSF+l78mW5gG69KD8QYLizk2z/xz26EUU2PRQpBixH+XeIDUPN2X
         6lZE5dBx6nEu7DXdy/xdLpKrf96Vwqn41yBRULYZ0IrYXqnCRWIHVSW1V62IqAkA6cbo
         qZAs/03j+gVCcZevKajtc8K6JwzFlKJacVS5Qjka57q5mGPoyYv2Sk4rR2CjpHBIZJMB
         4AGimVvHvHDZ+61cGCTM7TIA/DNmAyiom7+Etzut8yY5jxioPzso0shX0GO1DVNnrYLj
         Iwbx0rBuiQcvA8Eg6G2scPe3itNL6y0tR/WXTlvzf/V/xT6U65kHMrdg3fZ9tRZ1lP2I
         A+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785385604; x=1785990404;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SiQ1daJGHngzKWEQKXllXfEw1lyX6ubdIL7ID1shbk4=;
        b=cmF4bWO7Eb1t3h+QABGxQne9LFWPVaBEkZ0Guo74P4GsI6Ui6pPfYI8MUBFhHgfvXX
         rpMI84DNIOGszi8FHRJWHliuB2XkJDQscWUv4D1qBL/dQVvAawEPiU3tKvpbCVURbOUB
         63pgXiVWg809+3M0O54l9mhgepdjcdBtViMDMW97inEI23bqGZD41ztIlFt/ax7ffdSm
         oXuwnqTp9INy/FtPQYhgxSs36JshUP2V3j7iAgq6deCEQZ25ydvfUYYqXqgXrKQ6twyU
         mWdLqNALv6FYEzw6F5PtudQQVeoeqix7WYE/6ao883kKPiQMUo20Q2VmllPDExab2hpZ
         JbiA==
X-Forwarded-Encrypted: i=1; AHgh+RqDkUTiOD25IQ6k61XQdg2+qDk1TFRDiZqZQYqhKp4tAYLISYrLJ7r2SHsv09m4nFFWlNmahXkr5YbvvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUsYm+XNiA1DjQzyaFy1ZI2hPvj9GaTauqZgPZZQOL0y8U+6U
	8nnSg0kpQ92yfHYUQ0QMHfhNF7glTdSSRoIWDmEm2fUz2wckPWmtwQa3fP87fg==
X-Gm-Gg: AR+sD12EX9v3LOOfXjflM+srsKpZq6nnSb9GDo92zbJYG+OgODsZPHSxCUlWyhWNwSf
	haGhjfGKAxFtVfhzbc9MxLYqNXSqM7MfuOg4TWXB7zG/9YiA7wYU0r4O/pXgmzYqLsfH7vR/YFg
	VSwtLFzajTrQAFrlPV0E0Pvl6IrxsRG2815VFJUwPvffNr8LC9UrQ6avCVoZYaI0M1UWujsogk+
	M8WK8EXO4ZRtDjGI0chMc61nIAeLx3qSjg3/VVUcUo7voWSuM0O7rEiW4BvXwgQzYCe2Yh1N1Fe
	Sh6F3l5PVzlgin+eMI0UN2k9ZKZbFE6i5sYO9IcFri6iL9X0CEqHA3thJ9eQU6sIocniMvWXF8v
	pqzKlj35jJhttitub63bQzIvyhaC+1yScUXH18UXkzad5sEKfcV2m80ioNnGPd8FdFBs7xlBVsj
	d36q/k+Se1dUIBuZ+3Seovexa58lpTvkcgH6iSxD/b6em1vNb55j3xclm85sKLqSFmSrizWxl7M
	w6ajqTw+uOksVsRAooDnmtXX+Ujk79PtAJcUA==
X-Received: by 2002:a05:6a00:21c8:b0:848:2c6c:dfe3 with SMTP id d2e1a72fcca58-84ebc22ff1amr1152781b3a.17.1785385603717;
        Wed, 29 Jul 2026 21:26:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa4d4sm2244187b3a.38.2026.07.29.21.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:26:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6c663220-c4f2-47bc-8dd7-83cfaaf079da@roeck-us.net>
Date: Wed, 29 Jul 2026 21:26:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] hwmon: pmbus: mpq8646: gate the writes
To: vjardin@free.fr, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 14:51, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The write cases of debugfs entries are provisioning and bench
> helpers. By designs the MPQ8646 powers the CPU cores rail,
> so a wrong write can brown out the board or persist a bad
> setpoint into finite-cycle NVM.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>   Documentation/hwmon/mpq8646.rst |  37 ++++++
>   drivers/hwmon/pmbus/Kconfig     |  17 +++
>   drivers/hwmon/pmbus/mpq8646.c   | 269 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 323 insertions(+)
> 
> diff --git a/Documentation/hwmon/mpq8646.rst b/Documentation/hwmon/mpq8646.rst
> index d3ede656ea15..6207cfd89f7f 100644
> --- a/Documentation/hwmon/mpq8646.rst
> +++ b/Documentation/hwmon/mpq8646.rst
> @@ -246,6 +246,43 @@ The only writable entry is ``alarm_poll_interval_ms`` (the alarm-poll
>   worker cadence, see above), it is driver-local and never touches the
>   chip.
>   
> +Unsafe provisioning
> +-------------------
> +
> +Available only when ``CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE=y``
> +(``default n``, it is for boards bring up only). They WRITE to the regulator.
> +On many designs the MPQ8646 powers the main CPU core rail, so a wrong write can
> +brown out the board or persist a bad setpoint into finite-cycle NVM. The first
> +gated write logs a one-shot warning.
> +

This and the explanation in Kconfig need to be much stronger,
along the line of

"WARNING: Wrong register writes can and likely will physically damage
or destroy the chip and/or the board".

> +===============================  ===============  =========================================================
> +File                             PMBus / MFR cmd  Description
> +===============================  ===============  =========================================================
> +``store_all``                    0x15             STORE_USER_ALL Send-Byte (commit RAM config to NVM)
> +``restore_all``                  0x16             RESTORE_USER_ALL Send-Byte (revert RAM to last-NVM image)
> +``clear_protection_last``        0x08             CLEAR_LAST_FAULT Send-Byte
> +``clear_protection_last_force``  --               gated CLEAR_LAST_FAULT, see below
> +``on_off_config``                0x02 (byte)      PMBus vs CTRL-pin on/off source + active polarity
> +``vout_margin_high``             0x25 (word)      margin-high VOUT setpoint
> +``vout_margin_low``              0x26 (word)      margin-low VOUT setpoint
> +``mfr_pmbus_lock``               0xEE (word)      programmable PMBus write-lock
> +``mfr_product_rev_user``         0xC2 (word)      user-programmable product revision
> +===============================  ===============  =========================================================
> +
> +``clear_protection_last`` writes ``CLEAR_LAST_FAULT`` (0x08) Send-Byte.
> +The chip silently no-ops unless ``MFR_CFG_EXT`` (0xF5) bit[6] is set.
> +
> +``clear_protection_last_force`` performs the unlock with the following
> +six-step dancing:
> +
> +1. read ``WRITE_PROTECT`` (0x10) and ``MFR_CFG_EXT`` (0xF5) for restore
> +2. clear ``WRITE_PROTECT`` if set
> +3. set ``MFR_CFG_EXT`` bit[6] = 1, preserving other bits
> +4. send ``CLEAR_LAST_FAULT`` (0x08)
> +5. restore ``MFR_CFG_EXT`` (with retry to handle the chip's
> +   undocumented post-NVM-write busy window)
> +6. restore ``WRITE_PROTECT``
> +
>   Devicetree
>   ----------
>   
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 9f44e76b0b64..9c6d3de61a75 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -627,6 +627,23 @@ config SENSORS_MPQ8646
>   	  This driver can also be built as a module. If so, the module
>   	  will be called mpq8646.
>   
> +config SENSORS_MPQ8646_DEBUG_UNSAFE
> +	bool "MPQ8646 unsafe write/provisioning debugfs (DANGEROUS)"
> +	depends on SENSORS_MPQ8646 && DEBUG_FS
> +	default n
> +	help
> +	  Expose additional WRITE-able debugfs files in the client's
> +	  pmbus debugfs directory,
> +	  /sys/kernel/debug/i2c/i2c-<bus>/<bus>-<addr>/
> +
> +	  These are provisioning and bring-up aids. On many designs the
> +	  MPQ8646 powers the SoC core rail, so a wrong write can brown out
> +	  or permanently mis-provision the board.
> +
> +	  It shall never be set in a production, shipping, or default configuration.
> +
> +	  If unsure, say N.
> +
>   config SENSORS_PIM4328
>   	tristate "Flex PIM4328 and compatibles"
>   	help
> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> index 1fd41d89e5be..0034cf591934 100644
> --- a/drivers/hwmon/pmbus/mpq8646.c
> +++ b/drivers/hwmon/pmbus/mpq8646.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/bitops.h>
>   #include <linux/debugfs.h>
> +#include <linux/delay.h>
>   #include <linux/i2c.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> @@ -23,8 +24,18 @@
>   #define MPQ8646_ALARM_POLL_MS_DEFAULT	1000
>   
>   /* MPS vendor-extended command codes (NOT in PMBus 1.3 Part II) */
> +#define MPS_CLEAR_LAST_FAULT		0x08
> +#define MPS_MFR_CFG_EXT			0xF5
> +#define MPS_MFR_CFG_EXT_CLR_LAST_EN	BIT(6)
>   #define MPS_PROTECTION_LAST		0xFB
>   
> +/*
> + * PMBus 1.3 NVM commit / revert commands. MPS equivalent of
> + * STORE_ALL (15h) and RESTORE_ALL (16h).
> + */
> +#define PMBUS_STORE_USER_ALL		0x15
> +#define PMBUS_RESTORE_USER_ALL		0x16
> +
>   /* PMBus 1.3 timing / UVLO command codes */
>   #define PMBUS_VIN_ON			0x35
>   #define PMBUS_VIN_OFF			0x36
> @@ -36,10 +47,32 @@
>   /* MPS vendor-extended observability / identity registers */
>   #define MPS_MFR_CONFIG_ID		0xC0
>   #define MPS_MFR_CONFIG_CODE_REV		0xC1
> +#define MPS_MFR_PRODUCT_REV_USER	0xC2
>   #define MPS_MFR_SILICON_REV		0xC3
>   #define MPS_MFR_RETRY_TIMES		0xF4
>   #define MPS_MFR_VBOOT_CFG		0xFC
>   
> +/*
> + * MPS_MFR_PMBUS_LOCK (EEh): 16-bit WORD whose low two bits gate
> + * subsequent PMBus writes
> + *   bits[1:0] = 00  -- unlocked (POR default)
> + *               01  -- lock all writes EXCEPT VOUT_COMMAND (0x21)
> + *                      so the operator can still DVFS the rail
> + *               11  -- lock all writes
> + * A negative-going PG edge resets these bits to 00, the lock
> + * is operationally reversible without a full chip POR.
> + */
> +#define MPS_MFR_PMBUS_LOCK		0xEE
> +
> +/*
> + * Retry parameters for the MFR_CFG_EXT gate-close write after
> + * CLEAR_LAST_FAULT. Bench-observed NVM-busy NACK window on this
> + * silicon is about 1 ms; the datasheet does not have information.
> + */
> +#define MPQ8646_NVM_RETRY_MAX		5
> +#define MPQ8646_NVM_RETRY_DELAY_US_MIN	2000
> +#define MPQ8646_NVM_RETRY_DELAY_US_MAX	4000
> +
>   #define MPQ8646_DEBUG(client, fmt, ...) \
>   	dev_dbg(&(client)->dev, fmt, ##__VA_ARGS__)
>   
> @@ -498,6 +531,240 @@ static int mpq8646_dbg_reg_show(struct seq_file *s, void *unused)
>   }
>   DEFINE_SHOW_ATTRIBUTE(mpq8646_dbg_reg);
>   
> +#ifdef CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE
> +/*
> + * Write/provisioning data, disabled by default: NVM commit and
> + * revert, the CLEAR_LAST_FAULT sequences and a small set of named
> + * writable registers.
> + */
> +
> +static void mpq8646_unsafe_warn_once(struct mpq8646_priv *priv)
> +{
> +	dev_warn_once(&priv->client->dev,
> +		      "UNSAFE debugfs write to core-rail regulator; board integrity not guaranteed (CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE)\n");

This is also not strong enough. You insist adding this functionality to the driver.
Please inform the user that they are about to shoot themselves into the foot.
This is much worse than "board integrity not guaranteed".

CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE in the message is pretty pointless.

Also, the message should be shown when the driver is loaded, as multi-line
message, similar to the unhashed kernel memory address warning.

**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** This system shows unhashed kernel memory addresses   **
** via the console, logs, and other interfaces. This    **
** might reduce the security of your system.            **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your system   **
** administrator!                                       **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************

only as WARNING not as NOTICE.

I'll leave it up to you to find an appropriate and strong enough message.

Thanks,
Guenter

