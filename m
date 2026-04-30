Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6544D688
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569856; cv=none; b=CQDt4LDubfMWIN+RcluYrrfZiMa+L7sZfw5ZcEYF8zRvw53fXWOXgdmy82/I9BlB1tRl6prG+xqNHNzddGqtoVqTrf8GDRAqbmtrr3dF6YcIJH2CrVNku/0v5YlDc+qnQQCHYNBUYED/Ti1NqGxJRJ4yJrSQKZxyrD+y9GGE5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569856; c=relaxed/simple;
	bh=5jnnMZbdE3Kv+HAQM2cpPpp5ffHMDfQm3jg7X/t7sQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsNq/ksvk8bwr9Ekg9utM4l48lcwPGqTss8j7wDkvF8kXoneRKZqEVvpgGs9N9yxC4/YeUZhqYENe/L17Kpn1fk7aKcQVUdnXN2StaRAa6UTAQcnvuY/w10WrCwLWSchfTAMhdRbtlpgPjjNUQkwyl5wKmsCH8GUSvqGMSam//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq6yh5Vc; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq6yh5Vc"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7da372b87eso476284a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569855; x=1778174655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ss/d5BxGn+KBRcms2g4Npg2cD3lutl8/H/gA06wn6Do=;
        b=iq6yh5VceMggHL7Ixd93NOfkIyNrjqTSasDRXkjUPDf7+I/ZICxa+gEZkPx1U0B32d
         dDXpZdWybZkQI/J70kQZ+ypW+lmP/6KI/FUEPsblzf6Iy5EbZ4UdFvlBwsg4slmMdAs0
         kF6/oxdupwePL6FTd17O08vhd5tTBXLprT7ZMJYF+jNVLxhPkyEnL3LMHK40kSmXjTS7
         e9UWIKIMsWRmj34NFJN6Bi9paK8rAPPlDaUc3W+X5L2SZZgaZJ2Z3NJMepelY3/OtLBL
         SapByww1wfJdXtnllgd2z654qFguEmwza/jZXnWkpvbpnFI6rj7xLGZg2/JYr56GGDLN
         06rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569855; x=1778174655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ss/d5BxGn+KBRcms2g4Npg2cD3lutl8/H/gA06wn6Do=;
        b=BAvNlw10eFy4wy1EbptJHCU3AX6IOPeySGTFhwUJsOPuS2USy8aMVsh8niN/jBn85i
         b6WcOd4XQwSe+z8mXdQAkp+Nu4HXYU0HZWBdIDmlGsBg2pKsMJ3e+9nugCzih09zt3e0
         47iWPOuvmyul67t9Hznvm3cley1htn+nt3fhQLcesFPypUIDbyHZEy/u26xFqXkZLXGO
         C1oIClAuFyJxKYA3QuWjC8i8cldSdPQSAaV+KuWKm0RBt1dZZvZjjOQSPmhlCAanSumj
         1+9FCa2AqL4nJ5YsbuinqCNGEYO+SWDpflGWwo2fNDePpZleX0w/sP29CH+rvuLGAZnQ
         kafA==
X-Gm-Message-State: AOJu0YzAQjOXkMk41S2bj5gCSBzu24GImMS6FD/TvOVS/FADIgvJDsBy
	1mPS2WwuE0SMKN3OqPKeRiz0X/0/QBAifJHP6tg/Q1xrIgjsEG3oWwKx
X-Gm-Gg: AeBDieuCncZ23AXS1UB3MLbYl0NhGe1dMAWZsDoTjMzdhrCXPccsfXRgoJgvXLFEs3T
	FExEpaQW1xbM2WEbJ27PlQBdCCNwjPaklcx624oUl4Vz6+VFC51Q7LCvCIwhiakfIitQLyJB0Nq
	TficKgIjbIRI5tNmymG/5fpu7PM+pY1cs3ftpKidUtdc/gcuX8bRt3oYWQxUG96KizQ8Yu03Phk
	3JNHPJiEiF0zmllljF6E/PYvPUF4VhP5a5gm8dkdfI/Tu6uIZpr4/rceAsMkp3YuO/g76mJW1gB
	KNMyAbPK+2KEAPVEHUcgZzmuNTx72aOX0WT7BGon+1nR7LbX7loB3mXxscJq1BdtEpZAPzsAU3c
	v3rjRbpP05LWmP//ppXZO/gHJWgKrQRrgkIZdWsYWggkcWvHCEBrvu5JQEE3cfRg1ydWC8HnLU5
	jn/I5z1MRPrjnIlcqVyy0uEg7dxp774lBr6iU4gN8sEQlHUbg=
X-Received: by 2002:a05:6a20:3949:b0:39f:706d:62e3 with SMTP id adf61e73a8af0-3a3cf8d59c2mr4406073637.54.1777569854543;
        Thu, 30 Apr 2026 10:24:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc85c61sm211872a12.22.2026.04.30.10.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:24:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:24:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"alexandru.tachici@analog.com" <alexandru.tachici@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (ltc2992) Fix u32 overflow in power read path
Message-ID: <54523114-cb32-4351-8261-daa2c19070ca@roeck-us.net>
References: <20260416215904.101969-1-sanman.pradhan@hpe.com>
 <20260416215904.101969-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416215904.101969-3-sanman.pradhan@hpe.com>

On Thu, Apr 16, 2026 at 09:59:40PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> ltc2992_get_power() computes the divisor for mul_u64_u32_div() as
> r_sense_uohm * 1000. This multiplication overflows u32 when
> r_sense_uohm exceeds about 4.29 ohms (4294967 micro-ohms), producing
> a truncated divisor and an incorrect power reading.
> 
> Cancel the factor of 1000 from both the numerator
> (VADC_UV_LSB * IADC_NANOV_LSB = 312500000) and the divisor
> (r_sense_uohm * 1000), giving (VADC_UV_LSB / 1000) * IADC_NANOV_LSB
> = 312500 as the numerator and plain r_sense_uohm as the divisor.
> The cancellation is exact because LTC2992_VADC_UV_LSB (25000) is
> divisible by 1000.
> 
> This is the read-path counterpart of the write-path fix applied in
> the preceding patch.
> 
> Fixes: b0bd407e94b03 ("hwmon: (ltc2992) Add support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
