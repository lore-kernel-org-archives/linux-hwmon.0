Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B18D3A1CE6
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455927; cv=none; b=EUCsg7VJdCp0pEF+gdYH+g5IVhnX4lZQZ9TVhD9FhBHgT+55Ow9vsul/zwwLk+lQSkWRoG4oKd/SeEwG76vwEmto+Q2oacXhsQJMdCJSytSOph6JFVcIdQoz63PsxpZSiDMwVFxF2KfXUR8paUZZUml7EkOtEiAtatMlWuDMOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455927; c=relaxed/simple;
	bh=tYBvjpMnGrwAVvPegnSZQvvM0nVTvR9WJhA5V4eVzwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRTuoQiE2CZbskeJr+kMoGozYFMa4ZwM84mDyYc9EBH8JzsOKGcoYYjjRjZwcQWlvnMz/SZdWqOjZUdo2MYgJp1lVpNsVpCYqmJmnzkNQQgONrkkGfubBgDAp8i29+uNkkbRwGx/qdE2sAWW+sN8MDkQgKdcOAbqx6fh1Xwr71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRgHv7GO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRgHv7GO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba1e9d3687so47874065ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 06:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779455926; x=1780060726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wDu9z7wa+3U/F+5tl2DDQOAwKQYEGidkrPZebT3WMV0=;
        b=dRgHv7GOUr5E2st3JhZ3pr36heDABK2D3TV7tjdLFHFYvyCXaFkz2hiq+icJD01A9Z
         w4NszEZUIBWy8kJRPdqKFVFNBU58262FF/Ymwj+0VdYeLaKP0AXQHUIjbkmqjHEINu0k
         ryTG2t2XuPCCJDzOQ3A/92Xpxyv7w+EqGM0jetSWIVEqKetUZR3Lr3FFrl2o/1AH+Xqp
         aaYeYTAjLrt9a5UtjODXLzWPAch7zu9jvwVRDL/N0y1Sk8X0FxWGTl/cpAZ4hW2Jvcao
         ILbUrLr9715Wbr1AdV6Pwel/m6T4KFzQFvXmd4rbLH3F6NshtKGAhvUwcBBv4dtnZJVI
         MXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455926; x=1780060726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDu9z7wa+3U/F+5tl2DDQOAwKQYEGidkrPZebT3WMV0=;
        b=hPklGCEdRgwI/sJ3R2KO4wKy19SbOP1ULWxqjqYJvlitoLK/J62AqXO7V9zc3HSmgO
         4Ke7IRcDw56PRZAodersok+a+nMcpkL13Z+bONZVJXBnaQV8lc3IkW2ntJihb2cDColy
         qThNvLwoo6AH0G4jRvRJm04eHmhgezanOFpWhvKFkstZiyASVWyzrUscUJDuMVf5l7Sj
         FPmiSAhhFVDnxAAHmFgE1u/tLpXrsROmx7ZKd2Z0EcIXIdazHWVUNCv4bKFLjSVO3vh7
         CUbtOuCeQF3OGpVL2V7Xwlypj+RuyctcnxAo2kH/Pp6y0Xsd4zWoP5E/lNbvUNr88S/+
         F2Yw==
X-Gm-Message-State: AOJu0YxLghTxdaR8lYWiEafkl7nbSyr/BRLeEtboFBWASOUN3OuTtfr6
	tcUAIWphuuBrLqiAyNfpUN+++VVVqmRYNebh1B7fWrNeNBbPATAQuZFi
X-Gm-Gg: Acq92OEGGSzqV7WNbmC9GETZbyajbWPAV5aCMgv2xB0wUn9CtduvdKU1Wd4Y4cc1zT5
	utmSqCrBjxYga9tyPT1fWIojmrMaDzWOp6BL2wll0pjOk/wcSiRXbtzzXaI2ntOuZjj5RGtlhjf
	5CptOEiNnYLe1cpaNoWalSO5lqftVgohNpnQ05WXy5C12GZWP+fiTQI7kWDT3W0z/L5zdw5ss/T
	+3xbslXOoSAbHdLsIuF405Ys7UwTWp6OpIwmQL60GneCj8nnKvD9TVn1lmoyyqLoLtrMH7AYyZa
	myEltw0uAqCKHc2OqUU4I5KbJoEZ+G8VzK3dUnIEMEwJT09rs3JFsfCPyeS6Q2U3Bma+UnHKkpt
	gDGWA/r3wMCHLWx2vOEBWRqjNxPVFHBcDgOpOGFNLXQ4I8sf8b40f1eaGowctHt50r9/3ynjk9O
	9/g+DtCjp3lKYrHi+z9+cuULY5aKMf+gm8ST+cjZHqpNbHsDcoi/fAGrCxU5yKtTiBqwhv3xtni
	fn8hwJYGJc=
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2beb07001camr41972345ad.39.1779455925655;
        Fri, 22 May 2026 06:18:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm18059095ad.29.2026.05.22.06.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:18:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7af1292b-e61a-4cbc-8353-dcbc6dfce3b6@roeck-us.net>
Date: Fri, 22 May 2026 06:18:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hwmon: ina238: Add samples and update_interval
 support
To: ferdinand.schwenk@advastore.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 richard.leitner@linux.dev
References: <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260522-hwmon-ina238-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 00:03, Ferdinand Schwenk via B4 Relay wrote:
> This series exposes the INA238 ADC_CONFIG register's averaging count
> (AVG) and conversion time fields (VBUSCT, VSHCT, VTCT) through the
> standard hwmon chip-level attributes chip/samples and
> chip/update_interval.
> 
> The first patch adds read/write support for both attributes using a
> per-chip conversion-time lookup table to correctly handle all
> supported variants: INA228, INA237, INA238, INA700, INA780 (sharing
> ina238_conv_time[]) and the Silergy SQ52206 (sq52206_conv_time[]).
> 
> The second patch uses microseconds as the unit for update_interval
> instead of milliseconds.  The INA238 supports conversion times as
> short as 50 us; millisecond precision would make the four shortest
> steps (50, 84, 150, 280 us) indistinguishable and inaccessible.
> Since chip/update_interval is introduced in this same series, no
> existing ABI is broken.
> 

Are you serious ? The hwmon ABI says clearly that the unit is milliseconds.

What:           /sys/class/hwmon/hwmonX/update_interval
Description:
                 The interval at which the chip will update readings.
                 Unit: millisecond

It doesn't matter if attribute support is introduced with the series
or not. It is still an ABI violation.

Guenter

