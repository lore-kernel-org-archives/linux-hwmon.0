Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487596;
	b=NBbq0hriL5keA7F4F1BIUcVHpTpk49eyAn+PHGayGwAM3E0A/jV+h/I1u5OTkBkw+M8d
	 IQH/uQBFMQXZdLSqLqACFXS0g6wgmLd6lGJlHRcMTvgrZsI4VPgiwxMW+LoCXO+jRgxdl
	 e1Xgpv4J0uuttbZqlLSShcd91cYHsAuFDcX4arhZkmwdIeqvaNi18lxJnNcIv8zfBrj9F
	 yjJc/cMUuEkVf/4xlHqyHi1dwxWiJ2jpTIUe4V1FHDTJhB6G6L6y4b5gIsePhzFZChkJ9
	 qm15toVPQzsYVR7Xkayr59C36W2IDgNoQhUOIkgTWIVzVcsXp2pAkgehHTNVMG+99Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UpTb3tb5vUpx1h4uzHZtWBKoFQfw93PEG9+vK9k2idU=;
	b=mK+W78yHtBgkqxNp5madMYF81t3MVBwzvQI2d/Wx4Kz9sQAJjMO+R0IBuMU460BLeMsB
	 8Tu4ANjOTjxJq8JpdhwQMsa8bYXi9qVo0qbE5HLA7nf03PmdOBgsTvNYgTiF+yMZzfaUY
	 5SrSeBYQsJgkBpBQxcBohXP8wxw9ckxEw6WgkEqQdEadjmuy/hfY4Soe3fkgTGvNRWpF5
	 EtvMthWgxouL+u2YV7ptrS0wj4/EwKO+e1aZdUBIY8OvJx1UNkM6wG1D7fqwnLZIYNdc2
	 OVIGsv02YDKGoSQOI0YwtrlTeGn8Xfp37tpfsupQJU1uQjXCbznGNNJXsvcOiUo6XLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O11GHG1I;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD3B606A31A
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD3B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O11GHG1I
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so36914515e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792487594; x=1793092394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpTb3tb5vUpx1h4uzHZtWBKoFQfw93PEG9+vK9k2idU=;
        b=O11GHG1IEoNCa4pX4ex4MmUK4rZxjHtzo5TMI/mfwjb7KXyfk6cqJjp+LlCJ2e1csR
         MC+IV4GYkmKZgxilyE01Zt38KELmkrBQFRHTehMT5ZmOS94ectqDTpIbNyMkFeED/jL4
         seRvNb8aTp//W4Hv1nfIElhL9+N3T9qDjNJRuR4qiB8B9w8eY0QOABMXjFnlQG8X4jRj
         71aa0g05Zca5KGXIElfJDR41EdHHNdfJIL01DZg9zdcwpHXXWcrNMKFF/H7mlAC4fC0h
         +P10xpQM9Jxj+wLPrw3soytXJt7zk8uRmUM5MjOHBWiP51YLfNKsUDrHZakEhHtKVnmi
         e9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487594; x=1793092394;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpTb3tb5vUpx1h4uzHZtWBKoFQfw93PEG9+vK9k2idU=;
        b=iWP5XBco7F2dGiNxQvM6Luefo8vIgkC+AlUkp3cA7LRTB3TcILG2pdjy36+mcQCEWZ
         H1F7AEzM8kS1ewgX8H4ZLVoE5f8hx3dRcNYtkRCLSWA2+x4oqYSCkhYw99qYmFpLJo84
         RkgAK4FgSTJS+EGp03deGgCs3nNetCrhhNvz1QMawq38fHOvbYt2AdHhzGTNYgFPL975
         DfB2BfWKP4vc49egYLEoxbOzrJXzEXdyfgx5jaREPTIWnGiCR47cA5rV+gA4GCdLX3n7
         vuhuFGl6//+jZwsHMv1EuAgKxed4x73KMFVMZzznlYV2TnM4NxxjFsYvLOlIHgPk/46l
         aeng==
X-Forwarded-Encrypted: i=1; AKwUvBza1s7qB++An1BpD9h34i7oCG+X23I8II5mGPsy0dI32V5Oc4AG5VfWw26j9Y69wLk465rIac0gtpoW4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQMdrHsZgjJO/We7okXAghWWZNW0MAm8Jbitya3iMOTxZ8cQOm
	inqAgZQ79WSPDbGj10u7VXr/8IlQHj39i/H5EmyaGYTuRvPtVV7/yAYo
X-Gm-Gg: AYBFou0tziChYQv7o+fsRG28+uZRFGVP4XsZi0yb3ONDd7R3QiKw04+EYWAVxHG34B4
	lffkXJ1Z6EL1DTHgkFU7tprBLBnuDBYgBXTMx/R3AOxY1ehnPplZbdnxFJIavU936LFnDmhfIJG
	6lsQ+vzNOztQPXsn6LOLiS6LLJtlo8seS67fxpVIMXm7TOUocYZ0IEOLdQyfQoueSeKIT1nGnk9
	8vg/NjYbH4qchsspKUpWJyNwRho0msAq7kksOCezw/zA+/Tu59nibgIYydQMQNV9KsfveTtNQxj
	eKwulxuHYW0R8+ec9FZ5bLDVnlN+u+p+FDwwQH+V+fvnCYTE2t9hnzxnvRnSyBOW1WjCnC+UYfU
	roGwZZKJPWSQkMzNHXBRalfz9CvLf2aYhFjLA13nmuW3c3PRzxmH4WQfLCblnETdGhHXPUdSPtI
	vv+0hGdIollxNie8H3e0Ux4/Tc9ebbqwHJ9Qz76g9Z9RUzcQ+2ZJQ1rFLbNS46Y0X2tb8DEnSg1
	mTsPwdS/CpH8R2y3fVQ4iEmVNdUyDjNaSk=
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr237394785e9.2.1792487594144;
        Tue, 20 Oct 2026 02:13:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm61649665e9.12.2026.10.20.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:13:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:13:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Message-ID: <20261020101312.47d2eaf0@pumpkin>
In-Reply-To: <20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
	<20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 16:07:13 +0200
Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The MAX34417 is a specialized current and voltage monitor used to
> determine power consumption of portable systems. The driver support
> getting the channels voltage, average power and accumulated average
> power and energy over an I2C/SMBUS serial interface.
> 
> The MAX34417 datasheet only specified on how to calculate the
> accumulated average power, but with the Sample Per Second rate
> we can easily get accumulated Energy in mJ.
> 
> By default the IIO driver only supports single-shot Voltage
> and Power sensing, but the accumulation can be enabled by
> enabling the Energy IIO channel which then enables the
> Continuous Accumulation Mode.
> 
> The counter is common to all channels, so when reading a single
> channel we will copy all accumulators to registers, so in order
> to permit reading individual channels we must accumulate the
> other channels in the driver when Continuous Accumulation Mode
> is enabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
...
> +#define MAX34417_POWER_READ_LENGTH	8
> +#define MAX34417_POWER_READ_OFFSET	1
...
> +static int max34417_read_acc_power(struct max34417_data *max34417, unsigned int address,
> +				   u64 *acc_power)
> +{
> +	u8 buf[MAX34417_POWER_READ_LENGTH];
> +	int rc;
> +
> +	rc = regmap_noinc_read(max34417->regmap, address, &buf, sizeof(buf));
> +	if (rc)
> +		return rc;
> +
> +	/* Ignore byte0 */
> +	*acc_power = get_unaligned_be56(&buf[MAX34417_POWER_READ_OFFSET]);
> +
> +	return 0;
> +}

I was thinking:
	struct { u64 pad:8; val:56 } buf;
then using bswap64(buf.val) >> 8 on LE.
But why not just:
	u64 buf;
and be64toh(buf) & (BITULL(56) - 1)

David
