Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB823EAB4
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763054314; cv=none; b=ehPINGQJ7ROB9UuqoeTgJgqe5nw74qXn7bP+Xvbp/BhC63qkz3SxPfk+u9gw3vzdi68redIAbC1mMDzsocVjjI2Z6aaMN5UNHPLJ5Ft3OsRleZoXClkURTRYgdG9PRMx6h5Sv8HjuWX1IDUWFBWN5YxF3mRF785PDqzP88fB5EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763054314; c=relaxed/simple;
	bh=SnVL18vcQZUAN6xgjrn+FRb1WIhCgUpcajyf8u1AR0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUcQdT/nR6asxPUjyc2kju3xnjmq5pShHXo6CM605RTj8dwKWpx38IRZugEPPI2B0xIqRX261o13W9fl8xDr0c6ZKiu5E2YpLl9C3aaJJM7nlu8u3YoPqcs0pc2KEK82Nn8BDK1PtujVbie9wtwvXA6hmtZmilxIsvh9+7J3Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tkuf4I92; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tkuf4I92"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29568d93e87so9774915ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 09:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763054312; x=1763659112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLU6yk0Yztb2/O+GWzRwbmOA/G7sPQL4gwZtot3K55k=;
        b=Tkuf4I92HP+RgME0wfOYC/Ueh4Iv6RUfYTXbfsprXS/g0OKDuV80A7sJ90v8dYarbp
         gwPEfgXi9GEGXzWMsyI2hAHj33vH4tt49wtjCegW5pu8tmdexI580lXG+FiTIqRB+Jrj
         X16SSuAylnMKTgee0PYigdUZw3YbIkCts3dVHhxZHiVvPHOkd7mRy3WHwdpQfYon/sKd
         FKqli8I6D04A2lbZA2IjtS8cR4G6ZbcFZa/vazXQXPQRXHTioX2ectwoAnxISFsUbgEG
         gBgCeYhrGTLqo5252Rj69Z05WvTdhbGPOr3Be4M3UENFdn86P6PCCYL+bcewSc+7Dgg/
         8evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763054312; x=1763659112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLU6yk0Yztb2/O+GWzRwbmOA/G7sPQL4gwZtot3K55k=;
        b=phYPuFM+PnnUYB0opvmRLJ1oGADGpCelVR8cqSPIM0qze+g2vGCJzKMppprm2XrKEH
         /XgsypsUXTLiac08MeFOhFXSeftxbU7OVrTfwiW1MAcdePACBJwjsOHJJPs9IDgo4tGg
         8VRN5N7bixRVtbsiypaX9lDHWEbEecmjKZhN6cppbXn2T5AyW89aWiSoCqL+X56Zqv+P
         zg37b8f82Kje6zu28v0JXA6fubZiLg6zsghD79RbiXMlsyR5sN94I/ZgVSR3kTnNNhhL
         T/jjbPqHXeK868GHb0mv+eAUn589vijFwZBY8+7pSthkzy26AQ8aoFt3UwxGAJ2mtotW
         W/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWPE7ZlfIPg4YloDfqVDjuzzNHMLdlNlVitjeExO9ZwalGVQot+6WLcmzc1AqZzBZ85X+Dgepe+IiHsBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwECpsMhzLDD2SSScBeYVXUbvuROckN/nOGWKJQi6P3pl/YC3By
	W4F7E3thPlKgyM7lo40hEaNvUycxPa5NJj0rr+y9kHjOZLv6+8B2XBAA
X-Gm-Gg: ASbGnct9/477fvQmxbtLKG3n9kHNDba6CzE82kLLOvpLUQ6tJK1PtOIy5b3QJf8LPRT
	N2CM/mPzXthHoJk8b215vFTqca6B7SH9rNZDtdFXw1sb+VzIKGjNI7uyxPV/4erTrCCQMIKSmoE
	VCOuZiLOK+RiYu7VLRjVTbuTha5TKPQjgXd4896WT7AZkhAEOxoAQfbBr/4WfRAsdDh5XcOX2Or
	1++wVz/JhnOnwvw7Rpr4bWxdoBIdcHunAtDxy30bRCi3qkIwHoVElAJhHH49uw3Tdd9rAvDmWpo
	KOvrE00qBMyLM0zay15K8bxfmj2rm4nk6AiTZhTxCmZxVCJLhqT+m3xwzztH+ceCTq6Ed5xy5Vk
	20rI9r6SE4Nbps97lZea5EeDJHygMHtOc8yz94oZuvVN5rAVZEWrQLEpwOb2PecIGjTegZxqs1s
	LCTrpS5geQ9PRs8X36TfK3fic=
X-Google-Smtp-Source: AGHT+IEotKYkYq6nQaDTYNyp8wTjepFyxltQYF4u8CLaKcnh2+F8uXTp+00cxCEmCtT4klCHOp8owQ==
X-Received: by 2002:a17:902:e807:b0:25c:8745:4a58 with SMTP id d9443c01a7336-2984ed7a011mr103510485ad.3.1763054311942;
        Thu, 13 Nov 2025 09:18:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0bf0sm31722695ad.71.2025.11.13.09.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 09:18:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 09:18:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 7/8] hwmon:(ina3221)Support read/write functions for
 'power' attribute
Message-ID: <79da1c83-0529-48cb-a20d-23512f68397e@roeck-us.net>
References: <20251111080546.32421-1-wenliang202407@163.com>
 <20251111080546.32421-8-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111080546.32421-8-wenliang202407@163.com>

On Tue, Nov 11, 2025 at 03:05:45AM -0500, Wenliang Yan wrote:
> SQ52210 adds power attribute to report power data, and implements
> read/write functions for this purpose.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
>  drivers/hwmon/ina3221.c | 79 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index abb6049c8eab..ea01687ad1fa 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -348,19 +348,16 @@ static const u8 ina3221_in_reg[] = {
>  	INA3221_SHUNT3,
>  	INA3221_SHUNT_SUM,
>  };
> -
>  static const u8 alert_limit_reg[] = {
>  	SQ52210_ALERT_LIMIT1,
>  	SQ52210_ALERT_LIMIT2,
>  	SQ52210_ALERT_LIMIT3,
>  };
> -
>  static const u8 alert_flag[] = {
>  	F_AFF1,
>  	F_AFF2,
>  	F_AFF3,
>  };
> -

Please refrain from making such cosmetic changes.

Guenter
