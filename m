Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47A2DB7BB
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786189; cv=none; b=n3DyIRP8h48Zqgxk/S54DQUTBHoYtEqpWP7e9eNHYyKsewaJfwITgMy0L0VhEJJKsRpYU6zdpq4wb0pjNJy702FauZBE0jmenqNGtEgHjhN+jw3bYMGa56zV+BGXHTgqgo7XBAgT7vXh/EnjuIwyX7N5F2jHPd1XGWWmq9iJ9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786189; c=relaxed/simple;
	bh=Q9LZ07fCCXhRoxjgTndK3nKluanuzYpcsQtLd1ru28I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMPnRHlI/uwuz5DEV5Bx6+sWoXgjgbQVoyMJrT/VkhUQjncTqWPjbdpIyNHsBDtJtpUXpZq4oJXGOm73FZ18Lf4/jrrxqWBNOsxvAhIeTahLWM7vShMS2JBZiQRFxg5w//mB1giFnSY4njG08+NO6IKwwwKgXKpWBm9odnUnvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXqhla5f; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXqhla5f"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bb213b16so176166eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773786188; x=1774390988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W61FjlgmSjYLAaowkOupK3Ne06cSXA9WNaHsWuJiiT4=;
        b=AXqhla5fiZJMaqjEf3mdvojCnFxxA8EH+EKHTB4xfkTvnnw9lzu/+DPTplj15AMBOO
         eU4t8E62U+D+oZFysRXB/0wRw9pn7ne4xgKDbIpbihHLKwowVC8niKYm9Yx/Jqp2vYRc
         +nd1DKoK8vN1Q1JtNhsERHbMBwizxBo5XVNNf1ZAEIjIeLHlJmtZA6HctkTHtGLDduF2
         mXvEtDEZ3vG11beORUb9F2O2fhEO5vdCTlcSltfbP/0iDJZpzHEXMk1atNeerJFroIZp
         H2FfIEWyFJuIZSmAJMtcTT7YklGbBgiVY4cgVa+ypoc3iJR8UMO17ge37Y7j67FGbwMB
         qh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773786188; x=1774390988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W61FjlgmSjYLAaowkOupK3Ne06cSXA9WNaHsWuJiiT4=;
        b=qGIDnI3dmEOizSKfeskhBZyNTkzkivmQGg87tYOxHERyTVjbaeZjwnEC86Q93N6xE9
         ZiXF/nUrIbVdBEGjghB/ayS70fZgbCMVy0ufNFe4QRoChX/660/+j/BTsuFipkfiDYJO
         xPAKcUzKObsW5neaXhpf2CNIlrYWlUx82Dx+5Z8AdQ6jz0FmHCmP0WQeqMZ0BO2qrk19
         DK8En6mYXS8yCx6zGcIEl4ZVBRSc3Yd+UoVvMithYOMwP/UYFIu9xheH0+PQhM1wf/cv
         P01MwLE9OIuBqd5/UNwUGTHKfkZB7gER/b1K+kHjzAl5VHyJj1uyGn2NDkRQDZgff8+Z
         TNmg==
X-Gm-Message-State: AOJu0Yz2IhwHH4YOZ4AvTQm8NFm4koYLbxPf80ijoaY7FJ+6RjJY2KD5
	cS3tdxurtWcWZGSolcsCa8WwLJKnrjO3cvaMzAGaFl9hPH3M3Sss7Qtm
X-Gm-Gg: ATEYQzzyeVu0zzQrACxUCQ38g1qiugAWO6s7SYRxJWnzaTVhBRSkJKwlDK+QKS2/0Ox
	RsHTibVhOUYA3gT3uoPSL7Z7ZENRcrUerqS7GHcEYAb2GMFxBslxw/KQZ2MfmcuNmJt/SlCYPFU
	JuMzg2LEboWHMJTjA45sqGCq7F6RjiLUS4EPzwmXggCJVIqqL4aZ2kmNRis3mxRvCupYXl8F9iu
	8B4Tj5rjGSK/FDv+URKLdnCel+nWDcFidCZePEN89TK7F11wVcWD56VpS3duDhbpZ1yn3hfxWpH
	qQl0CyVxG0CSHwNuqoqztxrKOI8UeW1VvEP3iw197ENRaZR6Kyag0RGO2me7NOoNc0qmRRD332l
	gSY5lsQxKOI9HWeGlnd7JvqodhcIOFyUia9PvvEWEt4n5VJk6xuZUbuwIQlIJJmplT5uGYLRvxc
	j4gZgu8gzwojqHUekBCbUYgup9TXhr6O03mGkL
X-Received: by 2002:a05:7301:1285:b0:2be:617:2dec with SMTP id 5a478bee46e88-2c0e503e6dfmr603879eec.17.1773786187847;
        Tue, 17 Mar 2026 15:23:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a2be4sm1423580eec.22.2026.03.17.15.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:23:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 15:23:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"vasileios.amoiridis@cern.ch" <vasileios.amoiridis@cern.ch>,
	"leo.yang.sy0@gmail.com" <leo.yang.sy0@gmail.com>,
	"wensheng@yeah.net" <wensheng@yeah.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 0/5] hwmon: (pmbus) Fix unchecked error returns in
 multiple drivers
Message-ID: <a4e1fe2b-ffc3-419b-a899-7ae0cf4deeeb@roeck-us.net>
References: <20260317173308.382545-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317173308.382545-1-sanman.pradhan@hpe.com>

On Tue, Mar 17, 2026 at 05:36:33PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Several PMBus device drivers use the return value of pmbus_read_word_data()
> or pmbus_read_byte_data() in arithmetic, bitwise, or macro operations
> without first checking for a negative error code. If the underlying I2C
> transaction fails, the negative errno propagates into FIELD_GET(),
> FIELD_PREP(), XOR, or DIV_ROUND_CLOSEST operations, silently producing
> corrupted sensor or status data instead of reporting the error.
> 
AI review feedback is at 
https://sashiko.dev/#/patchset/20260317174553.385567-1-sanman.pradhan%40hpe.com

One of the drivers (see patch 4 feedback) has an unrelated problem, for which
I would appreciate a fix, but patch 5/5 is making a wrong functional change
which needs to be fixed.

I'll apply patches 1..4 of the series.

Thanks,
Guenter

> Sanman Pradhan (5):
>   hwmon: (pmbus/hac300s) Add error check for pmbus_read_word_data()
>     return value
>   hwmon: (pmbus/mp2975) Add error check for pmbus_read_word_data()
>     return value
>   hwmon: (pmbus/mp2869) Check pmbus_read_byte_data() before using its
>     return value
>   hwmon: (pmbus/ina233) Add error check for pmbus_read_word_data()
>     return value
>   hwmon: (pmbus/isl68137) Fix unchecked return value and use
>     sysfs_emit()
> 
>  drivers/hwmon/pmbus/hac300s.c  |  2 ++
>  drivers/hwmon/pmbus/ina233.c   |  2 ++
>  drivers/hwmon/pmbus/isl68137.c |  7 +++++--
>  drivers/hwmon/pmbus/mp2869.c   | 35 ++++++++++++++++++++--------------
>  drivers/hwmon/pmbus/mp2975.c   |  2 ++
>  5 files changed, 32 insertions(+), 16 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
