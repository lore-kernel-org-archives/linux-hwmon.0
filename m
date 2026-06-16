Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3954F46AEDD
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625899; cv=none; b=Myo0aE9QjQa7cHJw1M5hoHlJoF4ac0hlakxsHd1mnalD9XwRAh0J9RwVvxFutRin/1D9n0hnhv88dS3cIP3PU3E581FTEiabbqkoQo3fwxX8xyjF1o2JMypiFNRjf8k3O9gGWM+wY8F0jyhRpNVW9W299PfED/L28nnIMap1zAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625899; c=relaxed/simple;
	bh=JTt1BMASzO//6s0s3UfTfNPQ0ZPG1KOklgGV1NBlrY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbIJ7rGrGgyLCWd3Liw2h5l850q6V0Y+Yl1gHMm7B5lntdf4RFXWnKRxUHQuIdjyhDasZmTwNO774PdQXBlVOdtv4ybTokrYpp1vMOlC+v6UKRZYUYP1QnE1NLkAsc7g1+kHT3dUPh0jeXerYSD0eMvP43ZQdkEPyFnk32vd1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDbH20sw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDbH20sw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso2568907a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 09:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625897; x=1782230697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5o8E4nnwz23oQMChItrPyRSqtcUPm5+4qrteQjtd8Y=;
        b=sDbH20swSmTEnxcr1z4A8o83ZHiGcvc/DCkRiDTmAYnHVqs9EWZvL90yG63HESZ9Bi
         iQ2CEMtuGSIXDBKcjW91AA3wEmjrwvQkL0FJUYzx2Sz4jdeJgkBzAoDUnuc/f7o4gii3
         RMJ0aU2Swd5r1H8XoY0HgVFeZNGqFbOkI7CE6kReXlNUX7TiCaxnbdsp8WYNH9GQtIfS
         wx8/bM7mPgPNr0zJyoFjqauSjzEeBzmO+hngB4TNk1Ad+iSl+Z2uc9kvGyfmOZ5I8c7X
         xJy17kv5CC7QTyZfS8HUii7LdTzzpw1ibF9suovudV4srC5rhtNwvo295d2mWhUWcZP9
         al4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625897; x=1782230697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5o8E4nnwz23oQMChItrPyRSqtcUPm5+4qrteQjtd8Y=;
        b=DEllca3wu/keKJXYFN0Tp9MfWR7UVI5KUI/zgRfH29JWozBdoa8+rMWR/+3Zawjeay
         vaRLyf6RjXcT3xVje7GpN5P7/YCZKbbdbVnQe+xgKCK/at9KM8YlHDHbt5NShZabog4r
         lHDq1WmHEbpNby56ut2iflmROn4QDqwrMI9OUYo8eA0DELjzOSUaVdJK521TWacCfb8e
         FUD0p7+vgVJdHPUKUHADatCJgd6TFp80uDcsVVJUlP/YhCZdFxA+xIHjrLHduJiCZ33B
         in6XSyEXFF5ATgSERE2dBVkfcfctw4/gVv5x9Tu9vVHgnl67YEI3ngPoA/kAhr32dxB4
         6w1Q==
X-Forwarded-Encrypted: i=1; AFNElJ925uh/jINsL8fQuGEwvjjQpEE7vMyRUpv1cEtj7bGmvWGea8A1LtvYsl6pVGut4i9GIirUz7wET8PG8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywglue0rQdO6cQqKOTh4Ta+zMXpPTAmzzqI/VEuh/hUX7vcxafe
	JjfH7q6YbdtR4vX22960hl3q5TttBM4YTR86z3aNJ3q39i6DLWZM5Ja0
X-Gm-Gg: Acq92OE+6P1T9/1wFGwO8OnAF5ww3e+LNDxL3YO/h17yAjUB9OWWICGOkSmKDVsoxem
	MWgXj/kSVhfDFZu9bmL/L48UYuvHk2TxZ7MV9WdYbhU6mmwV2a8uKd04i/H6lhrBL3H+X7nwVRs
	huymrbOGKleErmW6vH/9snmWTcme+QTqnWEpgrM2Bs7qdFcRnMuZgvFWFDKxBdcpnkQGa2B0u3v
	+QFTYO0iXTF0yQWyeVpvgWEJiI4GswOgTYrjS3lt7ubOAhL5Yz8EJUwWmN4LlJqh7IFnJ9ibY2g
	z6MIxTlZ+DWtdm3nEiIMtoczk6kX9ENpYbOHM2saOLqchsHwrInF1RpW2jNhiG7MAPzB/uwfbsI
	D5VFK6wlyJzGCv8ePRw8wFXoiXiwfAbpMo5I5fo4ADLXyhDG8pQwe3XGNEBxlt2B3XykQ+iwP5a
	jnnIjzbaDhPHMiM7awzAvJGJnWORAwnaGSJDXpLZngnUE4tvk=
X-Received: by 2002:a17:90b:3b86:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-37c930ac615mr128203a91.3.1781625894719;
        Tue, 16 Jun 2026 09:04:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa16fsm3366290a91.4.2026.06.16.09.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:04:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:04:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v4 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Message-ID: <0b3e63c8-1249-48ef-8f96-2309d7177c59@roeck-us.net>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-3-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-3-zmzhu0630@163.com>

On Fri, Jun 12, 2026 at 11:03:03AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add PMBus hwmon support for the Silergy SQ24860 eFuse.
> 
> The driver reports input voltage, output voltage, auxiliary voltage,
> input current, input power, and temperature. It also exposes peak,
> average, and minimum history attributes, sample count configuration,
> and maps the manufacturer-specific VIREF register to the generic input
> over-current fault limit attribute.
> 
> The IMON resistor value is read from the silergy,rimon-micro-ohms device
> property and used to configure the input current calibration gain.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Applied to hwmon-next.

Thanks,
Guenter
