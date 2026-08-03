Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6440B11C
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769320; cv=none; b=trc2FOyb8r1OB4RkNksDlyImty5f4JnC6puMVXjuIGmVwSJVCow6U1fCs4gwLXL96sKz0fFZgsfLTcO/bKdBRiCdL5FBv9rRT+XG8dUIGp42dhJbNmr7oPpiTt57NDbiRejFM2Z1A5IDh+bh5bpWpGJgAxmrWvp+Mk8rzio86xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769320; c=relaxed/simple;
	bh=IZhNb9orP3q/qKe1fv5lTgp5V9rCwNYTH1hDIO9R7MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3zcf6wWdlay4dm18oZSPfnpjXzvMtSxj3OhE0PQhPT3cm8gbX0lWVGmpZbpFBSEOt4CnxMGjWhmF51yzubk7CSduudkghp3JqkkIseu7SZgHc4k863StieS/RjJuXGx8BKJt8vs8yPYWaIOFH7YA4nXPpEDzfl3oFz3zAtqPG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMcHXGjF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMcHXGjF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49553515a8bso35221705e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785769316; x=1786374116; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ep+nLqQCF6bAr0oltLdzKjN/n2j57SUc0s56vDHNl7U=;
        b=QMcHXGjFysL9Kf0JxEJORaRDjwIncMKaYNK2PcOc1/FEYdQnad1oJmyAskYN9LhfZ+
         LZuqmyG1r+TO8KpRPWxVhkr5GbSKTKKXLH3wxeXA8LpNFclWm34WDwB8xBr60EymguwZ
         UYzyYdnxEqAGgFL6nwC8Kyj8xU5TJXh3fgKuLocxKYMkPOs73/r5vH7ADM+vc/X2oPkZ
         up+aBPBU91JChuJ/O/WN0ky7Z4fMERYYhfvc6sgRYts00qDpCPgiSz4Q/GRgTzq8Y4FW
         /pJ//JKSRW0VjEmG/E0YlSOrD/+vFVIpxlARFpyrPeEkg4SWIbfE3sdcEyN7AKKh+qgW
         fgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785769316; x=1786374116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ep+nLqQCF6bAr0oltLdzKjN/n2j57SUc0s56vDHNl7U=;
        b=iUd5Az3W7xPFAZNe87xdO/MYtfdhJ2AllulGYwecOTWKpKyn5o/AYXKjYvfFRQ3bCB
         KGLFH4BrJ1ZWMdut1CTVGKkDCGAL+GZIRPKE9CSHqCngXWyKFNUkyQKpv/tOqEfEs179
         QkqypiWWOxqcCl56gzOsi4qxotxU2m+gNQOFXo2O0a/Li3cUgRv682xxmlSGcLfjH8jZ
         KMb4z/NrjkkFj4Zf6MqpgPhkhS9BvxrDNv6R80eG9XgPTnIi6xGM2UnR1q8jCmN8AHX5
         ZV/jUyxtJGWHnjjPcSu2FJTWNOBltU73u8AHmqlZpGTSnJqqrVx1JaUgGwH84GDiFeZt
         LFZw==
X-Forwarded-Encrypted: i=1; AHgh+RoPXzC/sw8WnSu3AHA4qR8Xb+06wIori9g6Dv0SioCBP6almeTdMmDrljyhiLjg0JmxHAWklObUZ7Xy2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/PC4YXMsnxXov9oM7AyvFwU9uiG3ugNG96J4R1vpYqxDl3EL
	V9afacMO4k6yXFOXiJAQu02d8+4SWXHb/m8ThNVuaCpGRxbrz7YFr+WnDzeqmBa6
X-Gm-Gg: AR+sD12ejKm0yMfsBAFVx7jYClG+JpMeT996o9lE4HV4D1diKKPLLBvnq3jmE9gR5Au
	D8Mfsrb+HMUebQ+ufECtWef4T6yehf4h7Y981WZHJYo/XyfzrlNJFikjOFEmif8RKX7gtmcrDfY
	/KefPHgnYyG0l/iRGOGiNe72ma6KjHhS3XAsPtrkW0F43qrkv3giSFy1PNbJmkm0dvhDUmGNdZY
	QYw/Zz88QEIaLf3vQ6DfwPugJEkCcBbpQ+FkZJ3aAyWucpBdinWPnl1Fyud5aFEuu3rZhY2Ulcr
	9iEjFoTCXwXmViBrB7QWZRipE0sOjYJZQ0YYhNLz0hBO5rIWBtzUH+K4naw7fsIKoVEdxBsBz2g
	9HksirDd45/K4jceIhehKT26SGmH1TrJKBQ6YelSltz2Pq1D0qmhFic8g1z6PQbpTg57D79aK3D
	U8T601yOoH0aRx2Xe2QFZyNnPkHalkHTRED5JBMhCkDJSg0vdZ++MYFiZYHnPbkco=
X-Received: by 2002:a05:600d:849c:10b0:499:48bb:417e with SMTP id 5b1f17b1804b1-49948bb41d5mr32558375e9.2.1785769315942;
        Mon, 03 Aug 2026 08:01:55 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dbaesm404528925e9.12.2026.08.03.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:01:55 -0700 (PDT)
Date: Mon, 3 Aug 2026 16:03:04 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <anCsIHUkaL7ckyiL@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>
 <amtewh9lOgWz0-Nh@nsa>
 <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>
 <amtqPQSM6zsiCh4B@nsa>
 <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net>
 <amzB2aw_4y6ji9zs@nsa>
 <b48636b8-33d1-425f-93a7-d0b9c4dd86ca@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b48636b8-33d1-425f-93a7-d0b9c4dd86ca@roeck-us.net>

On Fri, Jul 31, 2026 at 09:46:29AM -0700, Guenter Roeck wrote:
> On 7/31/26 08:42, Nuno Sá wrote:
> > On Thu, Jul 30, 2026 at 08:54:25AM -0700, Guenter Roeck wrote:
> > > On 7/30/26 08:19, Nuno Sá wrote:
> > > > On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
> > > > > On 7/30/26 07:27, Nuno Sá wrote:
> > > > > > On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
> > > > > > > On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > > > > > > > From: Nuno Sá <nuno.sa@analog.com>
> > > > > > > > 
> > > > > > > > This is in preparation for adding support to a device which needs to
> > > > > > > > use it's own read_block implementation.
> > > > > > > > 
> > > > > > > 
> > > > > > > The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
> > > > > > > I'll need to know if this is a chip limit or a controller limit.
> > > > > > > If it is a controller limit, a chip specific override would be
> > > > > > > inappropriate.
> > > > > > 
> > > > > > I'll reply from top of my head (did not looked at the driver again).
> > > > > > IIRC, the biggest reason we need the chip-specific implementation is because of
> > > > > > the RAIL selection logic (mainly when not in page mode).
> > > > > > 
> > > > > 
> > > > > Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
> > > > > instead of i2c_smbus_read_block_data(). The rail selection logic would not
> > > > > require that.
> > > > 
> > > > IIRC the reason was because the i2c controller on the raspberry pie does not
> > > > support i2c_smbus_read_block_data(). So I guess this:
> > > > 
> > > > https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220
> > > > 
> > > 
> > > Hmm, I think we really need a common solution for that problem. Not all
> > > controllers support i2c_smbus_read_i2c_block_data(), so you are just moving
> > > the problem from one controller to another.
> > 
> > Yikes. I actually though i2c_smbus_read_i2c_block_data(9 was more widely
> > supported (if not always). Not sure if you have something in mind but
> > one straight way would be to choose different implementations (for
> > read_block) depending on i2c_check_functionality()
> > 
> 
> Handling it in pmbus_read_block_data() would be straightforward. Actually, I
> wonder why it isn't handled as fallback in i2c_smbus_read_block_data(),
> but I assume there must be a reason.
> 
> Either case, I don't understand how the existing calls to i2c_smbus_read_i2c_block_data()
> work. For example, in drivers/hwmon/pmbus/max20830.c, the assumption is that the
> first returned data byte would be the length field. However, that is already done
> in i2c_smbus_read_i2c_block_data():
> 
> /* Returns the number of read bytes */
> s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
>                                   u8 length, u8 *values)
> {
>         union i2c_smbus_data data;
>         int status;
> 
>         if (length > I2C_SMBUS_BLOCK_MAX)
>                 length = I2C_SMBUS_BLOCK_MAX;
>         data.block[0] = length;
>         status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>                                 I2C_SMBUS_READ, command,
>                                 I2C_SMBUS_I2C_BLOCK_DATA, &data);
>         if (status < 0)
>                 return status;
> 
>         memcpy(values, &data.block[1], data.block[0]);
>         return data.block[0];
> }
> 
> Does the command return the length twice ?

I think the device is actually the one sending the block size again. I
went looking at very old emails and found this chain:

Me:

"Thanks for the inputs... As I said, I think know what’s my issue. I’m fairly sure the first
byte I’m reading is the block size. I’ll take this into account and re-test."

Reply:

"On one hand, that does make sense. The first byte in a block read transaction should indeed
be the block size. That said, 0xB1 is 6 bytes long when not including this first byte. So we
are still missing a byte with actual information. Could you perhaps please share the full 
packet data that you are capturing?"

The above was me struggling with per phase reads.

But maybe the above changed with newer FW versions for the chips. I'll
ask around.

- Nuno Sá

> 
> > > 
> > > One key example is the PIIX4 driver. Your new driver does not support the
> > > majority of PC style systems with AMD CPUs.
> > > 
> > 
> > I see!
> > 
> > - Nuno Sá
> > 
> 
