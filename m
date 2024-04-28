Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A2773518
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714328107; cv=none; b=ei5LFnyNI5aQKOlCSZLQmIsae1LiVWsCMDZkWo95d0PfKk7ahsiYWJniMAz4d9S1dY3FOEWgZtWonxis3DAXWeWYGcfjvFZ+BqRvt4UpVylqxXi25728m3aMWs07U5CefnlcJ+l1N71lyBh5Rvj45/37yXN8J83uR2O3Bm3qrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714328107; c=relaxed/simple;
	bh=dXK6YzWyyLphWYa4+SOqXAeSBKYp3l+MtlctniXPwYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nyx9vqfT01bewzKD0pFEa6dMtm6X4lctokzNCLO6tU6eaUHCUnhG2sxmtOCQTDVkv5qqLj5cPsMmMLFNIT57sTHsDFPsHZ0kjJVJp1m/sQ+ZIPoJ3IAifcGIBMVOtHyJGBUiQk0ABfEh/WeixNLhtmNmvWRDEX2d4jsmBX3bj1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM2EcU7V; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM2EcU7V"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso2129692a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714328105; x=1714932905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLQddvfuR1Ar7QxoZ6g+tjYx5bDeJbkgTQsAn4EpZLA=;
        b=MM2EcU7Vf94AUhHFtpje8WIVXfYmLBJaU6rTycpLoJRP62Wq8L23y0kOaPLAaEgIVq
         MD5UHeLnPRD7f3HYPXD4wHvwG13Q1igqL4kGyVOUiFrjxdBcrD4dcsUPxsvRmbfW0G+r
         cO8XJUwjdqgPlWqK6SYB98kCvshSLtiXQjDpXBPPsh0TIHvGX3j9FTBJv8ZfHiN2Nhwd
         Cun+kcz9ebY5US8mvDYem7lPKTfl7o+LUH2MfERDlNFppJznDf/szRfC1qMktmYphkkN
         YniV3+BeLic66T+3Xuc4kmsNY4oaL/7jwCjBljzRmVotJ+BKpzMj5CLrVhPVKcfqk8gI
         qt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714328105; x=1714932905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLQddvfuR1Ar7QxoZ6g+tjYx5bDeJbkgTQsAn4EpZLA=;
        b=NS4RM79gDFOydqsU3jhP0yYpgmMvKtfBiKVKh5ee9UBhMbpT7Y36AgKf6h/w2W1dbS
         hzotnTwS1zin+OVkbQAx7k4HYXcVBI0HU/RyuY5B2N1IP5cPB4KieTdEi2cSnutn94rJ
         X4hFuzt2cBdNNO39Oi8ik5OI9onk5j7OsCScMFgTywIA0+qZPEzrtJMBBiioBYudjy1y
         j0FQUGwB66o3Ao7gPZamWu685J7/x0W0+O63V1fcgWr9hsURjz5yu40HnFQDFZwZOvJ1
         OvF6RaWorC6rZvRhQVQT+8BWNuPfAbLHTXaU0k9B4nZYYxR9kh5ZRkNOKghTPEAgAlHR
         tEww==
X-Forwarded-Encrypted: i=1; AJvYcCXYegTBIG2cBOy6fF5/OTx/dsqTyahjNkD1Do+u6XrvoY+HuOb1V2KEENJnb5SPQ+fK8cJKiCPlr1REpNIVN/Qoo8NlAPKTvydphaM=
X-Gm-Message-State: AOJu0Yy8L1LcMl5exx2sbGN/YEcI5wCbP8xpyE6HVXeOCnqrDaWZeAM6
	KJZw4Jw88hzRuYafTo5Dpeh4X2aJn8/ZaWlW6etjKYt5xb/+qByK
X-Google-Smtp-Source: AGHT+IGBvJJAD+m5jbCBB2a1S/xMAS9M65IHQqCjr+P9V/nSHZx0848Kmwxfn4Z25HVTl637D4BOFQ==
X-Received: by 2002:a05:6a20:43a3:b0:1a3:a639:ef7c with SMTP id i35-20020a056a2043a300b001a3a639ef7cmr12107821pzl.1.1714328104944;
        Sun, 28 Apr 2024 11:15:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b006ed007b3596sm17929098pfn.69.2024.04.28.11.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 11:15:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 11:15:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lars Petter Mostad <larspm@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: Re: [PATCH] hwmon: (emc1403) Add support for EMC1438.
Message-ID: <6ea4da26-e20c-45f5-a0b4-85773ae178fa@roeck-us.net>
References: <20240426140937.609172-1-lars.petter.mostad@appear.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426140937.609172-1-lars.petter.mostad@appear.net>

On Fri, Apr 26, 2024 at 04:09:37PM +0200, Lars Petter Mostad wrote:
> EMC1438 is similar to EMC14x4, but supports four
> more external temperature sensors.
> 
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>

Conversion to the _with_info API is long overdue for this driver
(not mandatory here but it would reduce driver size a lot).

> ---
>  drivers/hwmon/emc1403.c | 119 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 117 insertions(+), 2 deletions(-)
> 
> 
> base-commit: e723f6ca39fb54ae31f79b5af74fe8496308d4de
> 
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index d370efd6f986..1ce01baf7a1e 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -24,12 +24,12 @@
>  #define THERMAL_SMSC_ID_REG	0xfe
>  #define THERMAL_REVISION_REG	0xff
>  
> -enum emc1403_chip { emc1402, emc1403, emc1404 };
> +enum emc1403_chip { emc1402, emc1403, emc1404, emc1408 };

There is no EMC1408, and if there was it might not be compatible with
EMC1438.

The 8-channel chips (emc1428 and emc1438) suppport signed data
and limit registers. This will need to be handled.

I don't know if this also applies to any of the emc144X chips - the
datasheets for those chips are not available to the public. AFAICS all
other chips in the series (i.e., all chips with less than 8 channels)
have unsigned temperature registers.

Guenter
