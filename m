Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062FA33BBCC
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096298; cv=none; b=a5yLQ9fAUqHnVy53uvnXr/Yc9aHJPkTr8A9Lm7SluQ159DoWIc90OP+2Uo6xNwxxshg3gxY4N6Xc39viIMDLExIYYZwv6p9LDMT7wG4FZLoU4NPWx0LA80M7GJIh1qsicsq0H8Tw214G1vWsFukJ9jzsTMy+G4shf9dLUavT6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096298; c=relaxed/simple;
	bh=JvVGIAW5ni3Xc1kJeyoHi4C0Xeo9QBavCmEIrdZjNk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/MNV50aE/x/oYuS9Ppt3Ar390i+PG079VEMT3459rOlaEGA/cVfpOM2sqAoX5Ly/fV8nGvillmVaC8R0K+/dwSTr3O/aCBTSt3nj/PNMWtqL9O2jTzBZw2Y0QGTvPT+TXBamme7FYfWbK2cRFRg2/WryPnBtOzgrP5HkeURA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GULZNdFi; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GULZNdFi"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso190637a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096296; x=1787701096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PQRDXp2z74RjQBsbJ19hTerd/5ta04pnNNJl+vajzDE=;
        b=GULZNdFiGSIKs0BywXdM5DR8k686vtGmH/hc1tgAEjr6ICz3GlUG0qaGLoINevP/nV
         g/mhSsCm0mhH79vCd2pwst80XgHohS3kP8BuCl8SwZUnTvwePgkuAWfICWQqk0bGgNTk
         HaYjhXcniDLPTe7Yt0aRQDY2t8g0nm9qebqN38PVFO8ZrJXSbh/znADTK2IwsrvCgzPo
         zslYh4TJU2rMty/AxN1yJbcmg2p9COGIf2kcX7q7pK6DYMS6tkP22Lo1h3IrGb4hasro
         sPfeZ1QZhpl7/Hf+BuyikMUGL/EwywWKUb64hhl7VGiODgLi9q2SOwoEoO4tX8SuUOur
         R0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096296; x=1787701096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQRDXp2z74RjQBsbJ19hTerd/5ta04pnNNJl+vajzDE=;
        b=Pv2A+5jcOj5y6Hsnh3hcJOBCCn4MO25vRwwksKU5knYWT4jO/b6dGY9dIa3/CVIxb4
         xdZr4pZRm95DySINLrbNLz8vmQyPVlyAkT3zh6Wc92+FGvAh9jBHrt6g3Rm37eT3/Qph
         bn+ZO+wyRpmhkcMAOh4ew2bEI0pKPbVvHHKFAVrcKFSam3yVtUcYu2Xe7tUJ13++PPo4
         K4H5cwrhnHGul1q8ShE3ggvW0Pm6TJqGKTdCq4Hs9NiyUxNKfW+lySuj+b9MAC0mQa0a
         Apkmgb+HrInG651necKo6RufR/crBMPn2qoTWmxHWx+CQ10uG3UMA1t4VJzFWh2EfC27
         D4tQ==
X-Forwarded-Encrypted: i=1; AHgh+RohX+4PWfJz1Ah2n83o6QG/ogTkNt0fd5EJZHjd7Iw9hFofN9ZYK7w8+s2TM1D2LLI1qHOAKKMcq01EiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8AXb8iY2DCDwxNv+Q6Rc2j5Abx0t67B59EeVc1mFaLK/N/ZT
	NoG1hrTtguI1taO4BqtWuVJa6pZipr3GVlnmY6eA09R0q13xuo6sAFKs
X-Gm-Gg: AR+sD12ROeHjOU+9EUU0+IfC0K6RUxZUuh6tFKAXZTF+esQLSmIlq2cXjFHwa+ryHdU
	fs39K3yBPqszdj+INam9v1I99RElM7RWSik79OzxiduzceYQFwjWlY5yHq/8yo8C+OmIjddsp+b
	NsLsCI5hSMQieC/Y2Q6VvthNnjLf1n5SN3OFmFxpt7t7YbF1fgQJajaxRu0kXr1SWUQYy7MIeco
	B2goTgtahLQ7QLj8roH7hCH5YJlemoYzs9VRceIOcrOMHMuU0Le4gtBS2Nhun/9n14b7Vz/u6Jc
	ryX3rAa1iDz0tdawfZA30+t2xVc5DYTIwENNN3326/SEwQrrsbayObiN8G2aWNOOGX2FfrTPQ59
	kBlgoJtVUAlXVG/hWcUHxbsPVBa/GBMSXr1Vof4NRx3yt8nuUoHNLy9OeSiccXw2wJgB/U5oMIA
	8I+g775jZoUWdOM8NC4chxvjWPMtc4z4ufIHZ8BhguJWPFsHYV7zA6KcTgvHUUPypWx65qaSPPM
	Q==
X-Received: by 2002:a05:6a20:72a3:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3cd011a39famr1020421637.16.1787096296030;
        Tue, 18 Aug 2026 16:38:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm522227eec.25.2026.08.18.16.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:38:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:38:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Message-ID: <5095200a-51a1-4e68-9e78-36e8165cd29a@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-4-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-4-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:45PM +0300, Stoyan Bogdanov wrote:
> Extend the existing TPS25990 driver to support the TPS1689 eFuse,
> as both devices share the same command interface and functionality.
> 
> Update the documentation to include TPS1689 support.
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Queued for 7.4.

Thanks,
Guenter
