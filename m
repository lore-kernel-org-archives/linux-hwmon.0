Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F947884D
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574859; cv=none; b=LRpIRvC7TYr+xv09iN3OmZFiKL+JcaBbD1G+oP/mupPJl8lTimyCl+KUK4nrBUt3rFQYZI2EaerqCYrZoJEtKNp2FbsS497U1EgXXsV2ddjmG44vYiCwJBdLgakgLPjohndxpuV7VqALnCQpDnk4juo1jkrgxacFRAcAF4ehUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574859; c=relaxed/simple;
	bh=hlKgQBYPJErWMN4WsJktuJRGbS9W6kWbE2xCMtQGw0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=IUI0ycE68M67mAJVNv6lRqY0G6a0FNDLooxoRYDQ/UA5Xzfo1LaIiYGJ8E/ZMKpJICFtSbgv6U2HggQjjAr2JN/GYQuDUK+8Uyt1b2X/5Oo7GSBjXHiDv2I92edSviD/sT01eHORCwQZKYILuvShFpfPXKWlJ/ddfCZLjzBm3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=TeSqqWQL; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="TeSqqWQL"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13354eb66baso310311c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 01:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778574857; x=1779179657; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSkxtKATHOt5lKJR5tZag8mNdNkA7wEcZE9Z1iwG/uw=;
        b=TeSqqWQLyFM8VnMx6OA5bA/ENQGgfVThSD4wHuGTgPlkbsaWKl8jHzU5xCkbZxPpvx
         JHxETr3Mei73+wn8/WVJmuRxWXI+5UoRvo2X0MEuoUNw6gthVKiiq3Jiu1nHt32QETlo
         PB1Q2k+WQXlzz3y1RE60d+ffD/HLNcNjURyF9zj6VyfNbC9na1oQ43RgqKTY+G47Rqzn
         oKI/HZm+2d190RFWPFqdTnOQ/aoWKUyxe3MKkdfy0ZVmmKcL2HdZAdArUJEpbzllo4T7
         wUnXYcSIrI2FF83wxy7jHG0OW8Dk1hUlLmJEGDzsuJApCkFEDI1mamsbrunZVHzILpZO
         l6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574857; x=1779179657;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSkxtKATHOt5lKJR5tZag8mNdNkA7wEcZE9Z1iwG/uw=;
        b=OSDAf3ofsAtz1V2W2oWosNnjIO1RMQcogcOzUv2U102aXKwHMzguqz8aqyJxwaiFIQ
         +JwEQHRH1IJee5CEbmGdACM9sXRDe+FeVUUatF71zEzAgaDWHWgKQBYEbOrQ15vKPVZx
         pmMszUyKP1v5dqEtIE62Utev8ghD49dO6BMipBq3KBCSqyOi6dEM6d5mIFz9EYLYcPFG
         /v97tMvgvg6pce2VVa0EMXwdJlIJ4vERZqt9IucNovwzrtxQlyy+C4IUKREKn1DNP/yu
         MJaoDdhg8agnnhF92ZWYBK/E+iA6HlCvHRpalhQfZ49rS4r6RyH2Y2gX8ow0G3BTJgb7
         jb9g==
X-Gm-Message-State: AOJu0Ywc5qLemzA7fNKEc9CEPs6WwteMEJl4yHy9eY6+xbuvmo95XaZ+
	f6QjQe/94iy5jLgghAJH8c4lAtptqbHBlWyQ7Ne/CTXiZZLrjmxYq6aF5Fy6BCp4hYT/UWpRc3n
	UOp/OWGc=
X-Gm-Gg: Acq92OG6YPMTpwScqXoWUcXIIhVo8LezaTpZTE/O9F+4A0HSp7HIVZnQDT+7WhMEbve
	7BqlRM3wOtXO5cy5wZ4WKSP7zT93lhTKOl22m1S05a+FqjQbf+yC5/Odl5csI2rOWty9AamszMP
	U+ELByOzvsWBiMFq9WpnmCsUtJ5v/bqnrpGrbqBwQxM4mha+wdYyTZ6dcSo2jveCbJTaqUhCLXP
	wx6DJB60GEkXY6t731Ou/yUf8byHwi0ROs/KWS8/V1u0mHpOcuKigwKGPFPD2RpATbKN28BTQpF
	x4fXJV5lbcmhdhKZMIn711kKYJqczV7vJGXqb7FB/tezsTfQRqlzZn+03c7g2+j4Jn5VtSY98NC
	vSi1D005lli58uMuk73hIAz22OtsrcZ4bWmCftglzBl2MBon/gI7sorEw7f97JEaZSdvVT2PT6G
	NCBY7ekQCEN00Uvy8WmGaIvhM=
X-Received: by 2002:a05:7022:390:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-132a83f775cmr6843540c88.21.1778574856454;
        Tue, 12 May 2026 01:34:16 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132781103e7sm21968628c88.1.2026.05.12.01.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 01:34:15 -0700
Message-Id: <DIGK60W195YF.11EIRC3QZABA2@nexthop.ai>
Subject: Re: [PATCH RESEND v2 3/5] hwmon: (pmbus/adm1266) add
 powerup_counter debugfs entry
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260511-adm1266-v2-3-7a6d34f0de5d@nexthop.ai>
 <20260512012940.BCF82C2BCB0@smtp.kernel.org>
In-Reply-To: <20260512012940.BCF82C2BCB0@smtp.kernel.org>

On Mon May 11, 2026 at 6:29 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing lock in debugfs read function violating hwmon subsystem =
guidelines.
> --
>
> commit 59d29098021812d7f7bd1712ee63ceafd8397c54
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
>     hwmon: (pmbus/adm1266) add powerup_counter debugfs entry
>    =20
>     The ADM1266 maintains a 16-bit non-volatile POWERUP_COUNTER register
>     (0xE4, datasheet Rev. D, Table 93) that increments on every power
>     cycle and cannot be reset by the host. Each blackbox record already
>     embeds the counter at record time, so the standalone live value is
>     primarily useful for matching a captured record back to the boot it
>     came from when correlating logs.
>
>> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266=
.c
>> index 31aefa8fc75f5..99e92a8365fb7 100644
>> --- a/drivers/hwmon/pmbus/adm1266.c
>> +++ b/drivers/hwmon/pmbus/adm1266.c
> [ ... ]
>> @@ -356,6 +357,31 @@ static int adm1266_firmware_revision_read(struct se=
q_file *s, void *pdata)
>>  	return 0;
>>  }
>> =20
>> +/*
>> + * POWERUP_COUNTER (0xE4) is a 2-byte little-endian non-volatile counte=
r
>> + * that increments on every device power cycle (datasheet Rev. D, Table
>> + * 93). It saturates at 65535 and cannot be reset by the host. Each
>> + * blackbox record embeds the counter value at record time, so this liv=
e
>> + * read is mainly useful for matching a record back to its boot.
>> + */
>> +static int adm1266_powerup_counter_read(struct seq_file *s, void *pdata=
)
>> +{
>> +	struct device *dev =3D s->private;
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
>> +	int ret;
>> +
>> +	ret =3D i2c_smbus_read_block_data(client, ADM1266_POWERUP_COUNTER, buf=
);
>
> Does this debugfs read need to be protected by hwmon_lock()?
>
> According to the hwmon subsystem guidelines:
>
> "The hardware monitoring subsystem core serializes sysfs operations
> for attributes registered with the info parameter of
> hwmon_device_register_with_info() and
> devm_hwmon_device_register_with_info().
> Drivers must implement locking required for interrupt handling and for
> attributes registered by any other means. Drivers should use hwmon_lock()
> and hwmon_unlock() for this purpose."
>
> Since this attribute is registered via debugfs rather than the info
> parameter, concurrent I2C operations here could potentially interleave
> with multi-part transactions from the hwmon core (like PMBus page switchi=
ng),
> which could disrupt the device's state machine or cause cross-page data
> corruption.
>
>> +	if (ret < 0)
>> +		return ret;
>> +	if (ret !=3D 2)
>> +		return -EIO;
>> +
>> +	seq_printf(s, "%u\n", buf[0] | (buf[1] << 8));
>> +
>> +	return 0;
>> +}

POWERUP_COUNTER (0xE4) is a global, non-paged register. The read here
is a single i2c_smbus_read_block_data() call, which the i2c core
already serialises at the bus level for that transfer. There is no
driver-side multi-step sequence to interleave with, and PMBus PAGE
state has no bearing on the value returned, so an extra lock around
this read would not be protecting anything.

(For what it's worth, hwmon_lock()/hwmon_unlock() aren't exported as
a generic kernel API. The relevant primitive for a PMBus driver is
pmbus_lock() / pmbus_unlock() from drivers/hwmon/pmbus/pmbus.h, which
fences against the PMBus core's own PAGE+register sequences.)

I have added pmbus_lock_interruptible() coverage in v3 for the paths
where it is justified:

- clear_blackbox (patch 2/5) shares command 0xDE with
  adm1266_nvmem_read_blackbox(), and the read path walks records
  one at a time; a concurrent clear could land between records, so
  both paths now hold the lock across the full sequence.
- The RTC read_time/set_time callbacks (patch 4/5) can fire while
  the PMBus core has a PAGE write outstanding, so the I2C transfer
  is wrapped in pmbus_lock_interruptible() to avoid interleaving.

I would prefer to keep the powerup_counter read lock-free unless
there is a specific scenario I am missing.

Best regards,
Abdurrahman
