Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEB1256C83
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Dec 2025 04:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907410; cv=none; b=pFC+m/R5Yq4PgwauVArJ34KdEDtZl5V4ETY5E3sx1eV28nxNG2LUSU1931fdeLR9xWQNhkEuE9pjpD5GsszlkcGVDeDBW+UaLz12qYPJ1VRjPGI7lZj16y8AdGf6bJDhP0zeqVprTgLNMzSF70NZRtd/qdJHVVUfCTW7GCvWWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907410; c=relaxed/simple;
	bh=L0mlTgPckn3fQYXFq8WyzPQM8CoQwb3Bh5roMJ5U4SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJMOfYWkjC/yZcXF3SlPA/nVLLbo4uO+UEZbP9IN8LoHlMCx1koG+XaS+r3AUjJpb1Mepqvi023IV9GufcK5lv0PdKun3bWWVVvvkgq+T2iLllodJZ8yO9ipaCZ23BBfyiWNS0iqCGux2Tl6zwiaXn9eBEkXI7Gm8B411afEg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFhuR+86; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFhuR+86"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso2663409b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Dec 2025 20:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907408; x=1765512208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOUA7xF3xg1jso4H3Aqc/OZDv+es3ngBZ3OiY/JHB08=;
        b=XFhuR+86eJdRTkb02xw9Xs9QXCprn9xkt+/gw5uTdwwGNQTf03mI7SdYH/Bk2DpP1i
         hy12YSphQzynfD2401f3KWGdnUPbwxXfmLLHLKhgfKquDgIEfECZ3r503+M8lYtjFSyw
         yDbEq3ej7R0Hj8DL3UgIRkAvHRs/j8IkWk7ylagmha3v9TRP8C//LmO4BA5nJZIsw9nZ
         LFfCj/tXp476yD/oPNYbmnrDJKnpwUzDla9VszE7bd2bDOOZHG2+ZHpOPzGXBeoc7LG5
         /b4kcfZWw7Cn1YsowFui54iOz5zpRCMr4FcSzRuSQK2aNSqkbDfrjJQv8Cx9A8taO2Mr
         dK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907408; x=1765512208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOUA7xF3xg1jso4H3Aqc/OZDv+es3ngBZ3OiY/JHB08=;
        b=P/ZqpLG0q7kJqQf3pFsxEwGzMMXsnUBIiuLK4ZFT1hsLklbu7yaVfl6d0seqBXG954
         zw9/x9j2cBNE0DDCI7UFc/zzUdmFivL7xQueGoQ0t8QsVAqq6Vo3rCRsyu40fmYxD48y
         EKv0usaMBEL5I3xx5cCP9iEBzMy3cI9UlSBVhiMq2DEXqw0PFHJtZ5VVXMXkyerU+S20
         OEKW7fZ08XxnWogVCx8sqZfKuvW9zvsaloHdM2JKGjALIRtgAH3iHG0+0vRDXC6O1P2n
         vFeY0aVwt4Fj1h4bzGa34Gsfz9/cm+PH8/SUUukMR/rWQn05Gp+d8mCTIfmaVRZj+YQR
         SOBA==
X-Forwarded-Encrypted: i=1; AJvYcCXuBufVXltQWIeJ54NdL58ZaiJen+LMxkJIkGiL0bbceFIbpZDPwiH295beGF6R9eCgLqZVJi0OOgn03Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdDfme79oIVvK9vYSJOviRJ2uph5WCeSTr1JQdmYpfCpr6Kxh
	M0irqYO57T6umwjIA/pVV1TiNQMILiJWx8/hsnOvAn6CWaoBTstUNc7Y747R2w==
X-Gm-Gg: ASbGncvLriMjL/TyPxTD3svinQAKEDhR9oRFGcbZKjihDxF4tkAcMPR8HSF9znK/aiM
	4dRwfkAE+7tznGShAKZsoZGW1sUclN4JhxzYkHWEl6EreJt/BlZBcnZrcMyt/fLoFIUzTz4XNub
	vR4V0NIAcXncRagjitHLZ+dxg+xwWzwv+5sY8kg6uxXwigeI5vOwMHFg5hPu4qn/dsIRfCTSE+y
	AFyFtaDaUTEldGjHXZh+ahTwHRlPfgt34Vk3r06l6UnX/JFHKue4lpBkIit1zgUdVXCHgh3TUtN
	TxR751vKxG7A+9wZM0UGcJKaE5GlGEdmYc99y8r8FxwqKA4/vNCll/d9i87kVR9+2+vF8Jkvmnk
	SwF3q41ZO4jGLtl4M2bBAqEAfYoBWD0bhV2BEluq10oBbfIq281AUGCOdx/GLi5l+TekWrVLuuf
	6kArJV7xwU4HyiXzSbnxDiqSXgMd32w+CpNQ==
X-Google-Smtp-Source: AGHT+IElj+T8To+QwxQszhtxmAxzccQSixmMWqGp1fLQk66p2l2O7RhgSvCI5BRzteSapGww+7XBgw==
X-Received: by 2002:a05:6a20:7f9b:b0:35b:d15f:8fc1 with SMTP id adf61e73a8af0-36403763911mr6867611637.1.1764907407764;
        Thu, 04 Dec 2025 20:03:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed331sm3659847b3a.4.2025.12.04.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 20:03:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 4 Dec 2025 20:03:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm): Fix off-by-one error in
 dell_smm_is_visible()
Message-ID: <dd389a71-dce9-4142-b546-78c04d4d1346@roeck-us.net>
References: <20251203202109.331528-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203202109.331528-1-W_Armin@gmx.de>

On Wed, Dec 03, 2025 at 09:21:09PM +0100, Armin Wolf wrote:
> The documentation states that on machines supporting only global
> fan mode control, the pwmX_enable attributes should only be created
> for the first fan channel (pwm1_enable, aka channel 0).
> 
> Fix the off-by-one error caused by the fact that fan channels have
> a zero-based index.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1c1658058c99 ("hwmon: (dell-smm) Add support for automatic fan mode")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
