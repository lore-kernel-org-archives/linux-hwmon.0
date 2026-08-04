Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAE41E6A8
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834284; cv=none; b=U7n/GOKvRIPrUTjSigaUa/3KZldzBiddXvZZVrEakeKXj9v3Q1L5fEBODEkB01tyD5k6aIFDaF87nt62P+adiGCpQB3ectU4qcUsDKZH7jhkKsW/4gw8ul65Xddt7Cv5Xc5zRzTCxodWpZLNRc5JJs49LXym09zcJGaD1sv13OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834284; c=relaxed/simple;
	bh=0jL2w+SolyTTvOnDtWZM/sEAY+hmOUYdWAyDxxHnoQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbHdih1dvPWldR7AmwcCKUpVzZdUWpO6GqH6y5OilFer3ycNEWf1F5YAiGJFp4cndhz2N+6Q2bfUZp/4AdAvwIuMDfr1VADuT5I5/cF/NwlweWZMzePr7ZvZL6tSZ1wvwzBYFUqAEKYp6Cgr01Fwc3pqN5JIrJOi/4bIviGSA0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwaEoOit; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwaEoOit"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954afac04bso34917125e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785834281; x=1786439081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+7in0iqAam6igQXMwDR/UZUiEop9VUXSy8nMMaT7/Q=;
        b=VwaEoOit6DxqG1SSgYF6p0iHgubuvMF943eAju7d+KuhAXmHwILdYaPlWRMY5cuIuP
         2BpzrvIAQ3VImeQyn0Yl+TKzU/22ZwpioIdGjO27fT2Bg/t14coZ3VFt437//4wqM4Ri
         lgK1aFpG9oCl6vzrZSJz2243zUAL5u5fdj8nU+M+jYawdFhdYgL5Vi3YAq5g6vB2K9VG
         XzSwoap6xMmG7kOnDdsDF44atqEFcJCagsIM11v97DZXrCboOMxZvIhI4yXNi/NYuyY9
         yz6PFN/sOo2gv1XMb94exquSyF1ltbsNqr2pML2e7bWIcrhomZ3Q5uF35tTqrA0ZS6Td
         DulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785834281; x=1786439081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7+7in0iqAam6igQXMwDR/UZUiEop9VUXSy8nMMaT7/Q=;
        b=GTlhF5uT+1OZw75y+ot9i1CHRNPQoSVIumdXKXodxy78NI/XDx1WZzmNPJSkS546BK
         0eWedT+Sq3hJsNNBhZc5vk2idmBfbBqAsxlu3DB7aYo8BTT9xyOUpQoltjOSui29HgjG
         UzULub+nPPvkLHkVgekbIGw1navm7vChjqzNAsNIfR43GeBux2eGMmBZWbizQMX0zhzv
         hAdvjwGLC8pglnMD78e7PnqMK9XHaTrN9dXjTgyplzgCqrUbmeUfGjiwp4HKLPRuh+Mj
         3HkLtXW3/dQTYeWv9VuSrRD3iN8KEghi2vDFkT+J87acRpi1HVcImO73nP+fbyQYXzPt
         TKJg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7z0lDlXaLaD1YxVohi80ZVk0VS3yrNSAs6flYhdio2ypXHHL4Iy61QgyCNwQ0lXvopkt3IOytSODS6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHeMWg6POXhHKgl84YLlD4hCa6FXoo87T56HsdxaL+pT9DgL2B
	GJsz5HCDfAgSJKUoq/c1iF8g5UG0GNyUBQDQzgAHMehqsNTzAj+Axoeht3LjVo+m
X-Gm-Gg: AR+sD12wL+IPYluA1MTUktdSDA5tuz4ioQoQKZ/fW0Na9b3LyFZtBuzbT1L14kLof3P
	T9Xs9vxmBRwpaPP3K9qRfpy4c16p3nWkdgUuK3V+u6hWSlHIkvCKgC/TWGDKhsVRJAC1f3Bw+iX
	4KI4xrMVYCOVa+Y+d/jFYu87kpUO2NjlzYOWlVGKtacxfsTtyqsa/GAhtEZ4w3kAcWE9K3oaPbF
	QD5Alr6DCowPUyIHeY9cC0qNmlUwYrcOJbLBaKI48MwHLQNC0wweG/yywf3shTbsdGIcqQkf9NQ
	7qWhUpuqymBHYDWfNjKQ4Kd4NImXT3AadJt275fzia2cNzSlLv/G+wPExIMi83ZwpS6Yyxq7QB3
	/+AfH70MtN5R+lKVjPe6chLyIPF+xgfd61QlFnMb9R/RtzVbJc2sYwnEbX+JuXqmBAOblH1hBV1
	CA6zoaOdIpduhSIuQMqpDyrI9NQV0Om27cIO/OlIsmAeWYhoIpW5d+
X-Received: by 2002:a05:600c:c8c:b0:493:eed4:7210 with SMTP id 5b1f17b1804b1-4980c673866mr245619265e9.11.1785834281201;
        Tue, 04 Aug 2026 02:04:41 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a101ac9sm64111255e9.15.2026.08.04.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:04:40 -0700 (PDT)
Date: Tue, 4 Aug 2026 10:05:51 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <anGrNyrEX5GX9lYJ@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <20260728162749.A42051F000E9@smtp.kernel.org>
 <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net>

On Tue, Jul 28, 2026 at 11:13:26AM -0700, Guenter Roeck wrote:
> On 7/28/26 09:27, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > 
> > New issues:
> > - [High] Stack buffer overflow in `pmbus_debugfs_block_read` due to unbounded return value from custom `read_block_data` callback.
> > 
> > Pre-existing issues:
> > - [High] TOCTOU data race on PMBus hardware page selection during probe.
> > --
> > 
> > --- Patch [3]: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data() ---
> > commit c4bd4d03203a9fd14a7a2bcff69ec842b441fa68
> > Author: Nuno Sá <nuno.sa@analog.com>
> > 
> > hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
> > 
> > This commit introduces a mapping function to pmbus_read_block_data() in
> > preparation for adding support to a device which needs to use its own
> > read_block implementation.
> > 
> > > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > > index 3d5586c67f840..d697939ec8921 100644
> > > --- a/drivers/hwmon/pmbus/pmbus.h
> > > +++ b/drivers/hwmon/pmbus/pmbus.h
> > > @@ -459,6 +459,9 @@ struct pmbus_driver_info {
> > >   	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
> > >   	int (*read_word_data)(struct i2c_client *client, int page, int phase,
> > >   			      int reg);
> > > +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
> > > +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
> > > +			       char *data_buf);
> > 
> > [Severity: High]
> > Does this API need a size limit parameter? The comment specifies the buffer
> > size is 34, without providing a limit parameter to the callback, which might
> > encourage callbacks to return values up to 34.
> > 
> 
> The maximum amount of data returned must be 32 bytes, not 34. Callers define
> a larger buffer size to be able to append, for example, '\n\0'. The function
> itself, however, must not return more than 32 bytes of data, plus the data
> length in the first byte.

Curious, do you want me to drop the comment or your reply is also about
giving AI context so it does not come up again with the comment?

- Nuno Sá

> 
> Guenter
> > [ ... ]
> > 
> > > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > > index 7b58f71985741..ff4572c473b70 100644
> > > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > [ ... ]
> > > @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
> > >   	struct pmbus_data *data = i2c_get_clientdata(client);
> > >   	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
> > > -	rv = pmbus_read_block_data(client, page, reg, data_buf);
> > > +	rv = _pmbus_read_block_data(client, page, reg, data_buf);
> > 
> > [Severity: High]
> > This is a pre-existing issue, but can this lead to a race condition with
> > sysfs accesses during probe?
> > 
> > Looking at pmbus_init_debugfs(), it traverses pages and reads registers
> > without taking the pmbus_lock. This indirectly invokes pmbus_set_page()
> > through pmbus_check_block_register():
> > 
> > pmbus_init_debugfs()
> >    pmbus_check_block_register()
> >      _pmbus_read_block_data()
> >        pmbus_read_block_data()
> >          pmbus_set_page()
> > 
> > If userspace reads or writes to a sysfs attribute concurrently, it acquires
> > the lock and sets the hardware page. Could the lockless call from
> > pmbus_init_debugfs() interleave between the sysfs thread's pmbus_set_page()
> > and its subsequent I2C operation, causing the sysfs thread to hit the wrong
> > PMBus page?
> > 
> > >   	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
> > >   		rv = pmbus_check_status_cml(client);
> > [ ... ]
> > > @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
> > >   	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
> > >   	scoped_guard(pmbus_lock, client) {
> > > -		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
> > > +		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
> > >   		if (rc < 0)
> > >   			return rc;
> > >   	}
> > 
> > [Severity: High]
> > Can the new callback return a value large enough to cause an out-of-bounds
> > write here?
> > 
> > If _pmbus_read_block_data() delegates to the new read_block_data callback,
> > and that callback returns a size of 34 (I2C_SMBUS_BLOCK_MAX + 2) or greater,
> > would it cause a buffer overflow?
> > 
> > Just below this hunk in pmbus_debugfs_block_read(), the code does:
> > 
> >      data[rc] = '\n';
> > 
> > Since the size of the data array is 34, an rc of 34 would write past the end
> > of the array. Is a bounds check needed on rc before using it as an index?
> > 
> 
