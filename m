Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9EE2E173F
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Oct 2025 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753432; cv=none; b=VTMW9Eb++bdei28pZ31Ns4iTBKRx0H5cH/3we/lmKCYxNblwglRRYYefsJ46dxVq2BhnIYfP3zvzGs+2St+I/RbtiIWdeXcN465vymSZ197vPoXZP5pOnOcmOFaVxBIzeFU8fk1TRcD/6yKm2QYkdP794CZ1utoApNY3hxJ2H3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753432; c=relaxed/simple;
	bh=BkVZwqqcbUg4h4qiKHFRlKUHrGq1vwEvs0NkhRiKaik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLvAXUnhmR6r7e1wJIgQ2mWtzA/3yB0jI2MvtJsUBXzk4yj28VJJlta3B44gd/cMpYYAqsvWnzWyLyTBMb8oMluUR95+a/PnVqBX64ZTr//V81d53Sp+SBEQHUoJpURf3TdxjHeiags4WLXTvrQXFUukTcKR0K89bWEnT5mL5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsOyoEWI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsOyoEWI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso89202b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Oct 2025 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753430; x=1762358230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YHKaCHVvW4pAa4aGkUydgPlkht3aebf1HBtV+L4fUbI=;
        b=FsOyoEWIwiO5GxvQiRncPYmZr8YdpGTob03IcYGym23y8WBEXnCO/ow88wN/+LXm6g
         70hq1OZUNoSKwMdAYRBXFpyBGempGvJJNauL8Ra7+CEbMSBgikea5y68DP+vjqVOPetY
         4YThanhvBnr101kvYvcw3p4n/n5A9MGAL42KdXAYcLPdYHDjeRMG61RFkQ/bNduGaj4T
         rRAnpor0YqauNVFDv6M0AzKXzRh3KcLBYthv1HrO+8AA37QM6jIGxAZT3XzQGTld/8br
         Z/wJU9uQLpEeACbqeD1npCHG87UR6IIApspi8r2lOw9D+p1rF4I86BQudh8l8KwlylQt
         mUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753430; x=1762358230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHKaCHVvW4pAa4aGkUydgPlkht3aebf1HBtV+L4fUbI=;
        b=KhIbtMok7oTtPeiDCPmhs7pnv6rV2aAokrd2lsMzvNVkcPqjMGFJiTqjRZtlLib/ud
         iYAxz1uyDjYKJ6CsYAqMGgO/aeG1j036ZfEx8w0ZGR38xaaQe82m0Duqsk3ZQOMeoLR7
         kq6edaGOspD+EhF+tWhn3A/CsaJqIF6VdFp6kHZ2323lZu9bM6Ll/gOtWOKanEJV+m5x
         rHVByRzOtW7VlP6XcFIk5jyvjANdbcQjBbjOKc9WC9nq427DNUz35t1UYWe+6iwtQUla
         5/NMxbh3sRwMQgD515ydhVA12a2w3TwBAtqyoH/kKY2HAR+PeJAET1ONd3y7ttpJYMsp
         ksxQ==
X-Gm-Message-State: AOJu0YyGjc94b4iQiMrzwmOos1pwl6uk599PlNAIUBUo5SnYxVvi8vpr
	ZLj/bl3kWsSGAjgaIK9IhPdpKs4aSUJUpcGpOurkUXj1v1ZrEZD9gjeD
X-Gm-Gg: ASbGnctjmpCwr6X8EMyKI6YYovvLgqWUz73ccYRgR/FwlpJ6HEKy1fnnNfiZX6QqxGD
	DJoJ/T5Ch2hNp5Hq4pPSHsYelX6D5CHCPHssXdeSnyrMLlM46l+6Q/fko81FBoa75dML9w16XYS
	AKnOY9WnUZ7rlVxagu0hpc/U1kFhpOHgB2PhHW/ftHI/X0IGC57+dt671dCQDDE9Fan54pyiNgf
	4AO+JqRSQjWkZvIFwwv5I3GFxRe1n65MVcZLA8JZnMEw3s0wC4uWfDf5RibyQqwKIFJNtKcV9t3
	PxlKOG0IGOhX8uhRxiq4y4f5AghIfC8p62zkEuHHBz7W8IqIl5vhYT/Xj2orGdgXxPtYjyEeUy5
	6zXyljBf9meUTWm/KxVjLrcw8dBcRe6CsJjDDFkRB9Mjw1GojRiBHBoClnA77Dmo2XWe9qSL/gM
	6PaaFwTMfXl9qlimHuFkBo23Qjp1CcIcoCwglvT13/iHUgncmw
X-Google-Smtp-Source: AGHT+IGf0JH6EjTEscJDZCE1UX51LztZustHvoXPPNnJE/xXANxakASKFDeS86f8TvevOGkVeEuG3g==
X-Received: by 2002:a05:6a20:3ca2:b0:343:af1:9a57 with SMTP id adf61e73a8af0-346558e2944mr4231242637.56.1761753430231;
        Wed, 29 Oct 2025 08:57:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d4f12f2sm14601971a12.30.2025.10.29.08.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:57:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <88a23acc-9dc2-42c1-b9c4-95fbb077cc9d@roeck-us.net>
Date: Wed, 29 Oct 2025 08:57:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hwmon: (lm75): switch to use i3c_xfer from
 i3c_priv_xfer
To: Frank Li <Frank.Li@nxp.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-i3c@lists.infradead.org
References: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
 <20251028-lm75-v1-1-9bf88989c49c@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251028-lm75-v1-1-9bf88989c49c@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 07:57, Frank Li wrote:
> Switch to use i3c_xfer instead of i3c_priv_xfer because framework will
> update to support HDR mode. i3c_priv_xfer is now an alias of i3c_xfer.
> 
> Replace i3c_device_do_priv_xfers() with i3c_device_do_xfers(..., I3C_SDR)
> to align with the new API.
> 
> Prepare for removal of i3c_priv_xfer and i3c_device_do_priv_xfers().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I assume this will be submitted through the i2c/i3c tree when ready.

Acked-by: Guenter Roeck <linux@roeck-us.net>

