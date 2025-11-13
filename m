Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D227B348
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 20:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763065200; cv=none; b=YI0K9sKOvwcaa7ZYCO2N4WIoq2wBPl1uvDg7Ov81zf6k5JQh/YyONaLbrt27kibaierqxyn/yFLK9nCxlDfl7c03dVCf+Wxs7uUQoWIsBaXAKAbAyleBowUYTt1EqJXCndGj8X1NtKoKz6dzq/tO5qO7niudV1MwO+a8Qf7A+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763065200; c=relaxed/simple;
	bh=x6nWMzdrvBHmUio5v0rh4rbd/eNrCyVZJFT3hqa17wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDuxI3WFSTImtLcniTxsQ4YOuFlxXsNGit4SvEOZh4/uFYPg+mikYReOU+5KQ23ub7mzlw+SMCqrYuiT7oB+y4XjK04ZW188T6lNVOilg/DssFs1wZUgvPcIC43Lj5s1zDL+eaYCw2jXEErUcQcRjp1/PqZXTrbcdhldtAggzf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdX2sfK+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdX2sfK+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b0246b27b2so1550494b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 12:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763065198; x=1763669998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5G5tKGG4//arx5En26Yb1xeUnZu+WtJPMBxgLcgOFI=;
        b=MdX2sfK+7Ammhy2IttsB8CnBkrAE1cW+GWCj7OLxHa7goLBzqZ73QflfqsZ0IFVzWV
         Cai7p6Y10nGtIFL7amIdclKlccn3oV0jY5MWWr8E2NY2llY4tOLrPPV/J36MnrH4IJtV
         jllEMoF1c1Bigrsfqd3bmx2tahspY/TZ90JCeyAsqp7bZRn/zCMDc5WLyhE7+yIWFwbR
         5ilB/mXwrlSW/79xKEK79OQ14cI4S1WSu415+PMCeviCISWpXhxpA1qS7YsBUTeJZRhL
         3CdckD2lVMPW/Ays0wmM7Pgw9XG+8YVt2mi2XcX3tCaiZGeNr4ttgVgq0zfyhXCGCY6Q
         Kaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763065198; x=1763669998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5G5tKGG4//arx5En26Yb1xeUnZu+WtJPMBxgLcgOFI=;
        b=ATAk+x0uyQs/WN09jXAFud+eI5YqYsANjylWifXDW1dnspL8dLAdfS2FjU1AFZfyvc
         3KRPu4k2Hp4MpEIA1NdaaQQdGGK3c4n1iNysoqwVZ/Mc0KoiuV7Yq66tA3i1pJXSdHIh
         V2JkBTgh00+pNhgpaHXG6S4mMz0gDEZqR7aK3WFnkL21pegh7f8YBTkU3fV+LkvOQ6dF
         4i4684bZkELvJuUFaPA6a3kEIaZZERSpbXUM/5phypJAP7rrDNJ79gnM5g2t79NGiflV
         YUY6s0sBW/QeP3OpAPq0dhdcgNHDR5pVywAPLXOgPh7NW2XvTG4aaITOUhA7rpmo1mbd
         4/Gg==
X-Gm-Message-State: AOJu0YxbHcN0U91n4rdUzTNweB13tCvxPbwJmyEvKBGIt8G6Hk3DTzJI
	5IBQOBbIlo0C2ZVUq8lHAHT7xJA7+hQ4/0pXfz4+hRhgDnXb+Hbn/gG7
X-Gm-Gg: ASbGnctkF1lU4yJ5EVOEVuY09QOsa/zY8mY5LCE+vcdSxJBHeEj1hghPKCIfzlG4A8v
	I/DP2YeaKDWY0TRIpPq6UrwzWB7VlQPdb2oGB8z6Ur7SspLzltfmb2VNBhUBRrSWKnKNirsyVow
	MNeVcJEe4owXK3WyiCRwITOPBe0luZcIs14w8GCIR3zRp4tijBByTElJts2aidCxoVeHs9kTG3r
	rEE8mCMXRpMG9Hq8vBT+/NFZShikiltCYswpyLi/ZDO/m4zxGJ/LOlfq4LsDvJu4VCZBSNLPLGn
	q7DegAJQqNNiV8rzed2k1q2PW3tyf4NBkNF7KM4DxK7z7Ky1I5cQy/djiyOFXFjBdF3JYWQFAjO
	XTM5ie23NxXYTPFUwbxmAiIMOea2jz3D4QhOE/HHewACB6oXPVRS4XzvmeEiiRzLg32zGRmC0rT
	bU8PPRngL8tmD2
X-Google-Smtp-Source: AGHT+IEBQofpftFJnBlUGit1T27qGz/KI3bgwMOt0dtN8iNTTfn31DkqZYtBF9b4NpJDri8++VpKeQ==
X-Received: by 2002:a05:7022:925:b0:119:e569:fb99 with SMTP id a92af1059eb24-11b40e80dacmr290107c88.8.1763065197712;
        Thu, 13 Nov 2025 12:19:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1309598c88.1.2025.11.13.12.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:19:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 12:19:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Zachmann <mail@mariuszachmann.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Read temperature as a signed value.
Message-ID: <ed973563-1412-4435-8e76-09a9168345c3@roeck-us.net>
References: <20251113100024.11103-1-mail@mariuszachmann.de>
 <20251113100024.11103-2-mail@mariuszachmann.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113100024.11103-2-mail@mariuszachmann.de>

On Thu, Nov 13, 2025 at 11:00:23AM +0100, Marius Zachmann wrote:
> Convert temperature to s16 to correctly read negative temperatures.
> 
> Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> ---
>  drivers/hwmon/corsair-cpro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index b7b911f8359c..6e1c415f3e26 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -40,7 +40,7 @@
>  #define CTL_GET_TMP		0x11	/*
>  					 * send: byte 1 is channel, rest zero
>  					 * rcv:  returns temp for channel in centi-degree celsius
> -					 * in bytes 1 and 2
> +					 * in bytes 1 and 2 as a two's complement value
>  					 * returns 0x11 in byte 0 if no sensor is connected
>  					 */
>  #define CTL_GET_VOLT		0x12	/*
> @@ -258,7 +258,7 @@ static int ccp_read(struct device *dev, enum hwmon_sensor_types type,
>  			ret = get_data(ccp, CTL_GET_TMP, channel, true);
>  			if (ret < 0)
>  				return ret;
> -			*val = ret * 10;
> +			*val = (s16) ret * 10;

checkpatch:

CHECK: No space necessary after a cast

No need to resend, I'll patch that up.

Applied.

Guenter
