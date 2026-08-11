Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCC040B0F2
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463819; cv=none; b=tk0hYWqxUv45Logjx4ypavX89hEJ+kEwqwKWCrqVSIPfD0y84aQCQjJajOsdFZN6Pncm9lKdKpykZD+sLprc4fapHdMiMmeTxjpo3h/ZSChuF7VriRUN1SC4lFrTD7YQycU9QjjlmaZUCS+whPS/P703BmtchTmeo1kn0au20L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463819; c=relaxed/simple;
	bh=GyoQxlwnS5y1RD4HUx6IA8SHn0FMVOOm/0EeXjfKGwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb9NQfu8kRY0w/BlRIUwLwd08w7D5n4mMZSQfc661Qx645CDVDQitl6qpFjyK4FjuQ956t6X8xxDLOdT/0he6x2PAFpyOWtsQruH8Jd+g3/9pB84w4gnlLOQv1h+4GThTzXEpgywBSfzA7pV5jATvlrO1pwxQHNSoseQnDPGyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7fRnhme; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7fRnhme"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a2dcede83so13547b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463816; x=1787068616; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3SPSLY93TYB/F/LmH2Bl4KXONVrBAnfEMkGae7C/LM=;
        b=d7fRnhmecX9sH/P5ZMwA3QvYWDqzeFlsWMgh8Ou0uryAaKLRS0toMVia5pzm+laCUW
         o35ubldvxwlzCWnEhcmk38dJX6sylVMSBkAN/nVr32reaWm73+C7h4ytt1CIBYmqppmg
         J8+bMM2yk8wYi0PWM/7++tHwlMyRJt4trGuEyImT5tKs3gxEI/X85VEc9oQ4pDfhOVXS
         X0JojQgwBIK/eDkPB3r7Bq2dPJ8RhPw7gEbhLHa9slipwu2zSFXzi2LrmwS/yRwBSn2p
         nuHuxtsXczZytOf0bZrAdh+EDz5AspK5v+WLZvo9PhnM6yjymj+cnp95bypMHdoue3rK
         uBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463816; x=1787068616;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3SPSLY93TYB/F/LmH2Bl4KXONVrBAnfEMkGae7C/LM=;
        b=pX3eYrPVn75nYV8B/96pegQnjHQaueA3Y2VvkRCQKAjWI6AvhHHzViYhuDwxuo6KnV
         bIUjsT5EPzpxzRa+zNsSvbm1JCgjilJsQkuO41XuF+SYWQrw+i1J0o38Ekb2GB6ud0M8
         8rjLoER+iJgQ/tlHiOsMpipRGMmXP4FD+mRTBcSXX4Z/s6iWu3C5G2x3PLe33NOSpdJC
         zuWxLKX1Sar2D0kT+EOcTPrGWzgjDeV23XwfaDVUttwLnhvQX2+eoPoOfDYkG6qfC9iL
         9LPzHr4ZAHVgKUyoWTwgJBKuCKSLK4ob6NZ4lp/fi1/SPEnIsfDmrAZlt3j2UTkSHJZv
         bTnA==
X-Forwarded-Encrypted: i=1; AHgh+RocFBTxt6UnAiTgcBp3ZvpaJ3FxNxnz7jdG+Rdr3SGYBV1lChwGA43+VLD6tqwxbmWKCU/pquGYRHpOFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6S46gpOErNgnudKh2RH8neHkubCrb+mVTB2TZbcKBzLd2MJUb
	b4GE+Ksc5xrmN1ejK4t0H+/GI4WGEDgn/3RRKZMiro7XXlkApT1dXGQu
X-Gm-Gg: AR+sD134PDgVSMxipKbOHrTVK2F25sGDrmdRCxdz+bNjyMCjhPWcEkTY6DYU5+orqCB
	dvtBjv1c03xTCUnfAwojdPX2o+vPgYknNR4KxcgjjsXFlZfk66cXata76wwFazCAVniiVDaZMon
	c0svVYSatuTU5ArjztMUgf6gxC0GbShNQkpoYAJIhBXQJtlBL4mXciXvL32s1XbLlThpm2zppP7
	1XeoQhe8MQCfjH/W0AQQJPaENthAA7BVFnBscZRcOa2GDZ1D1+GPcqVo/FvCiHj9oVQCIv8HxbX
	nAA+50W8bzAAEexay/OlyMS55WRVo2JFkvCQqlOmssM1dQqzTyIhDlWP/JI3N4TimQVDWoNNJ4X
	2tCY7pYr5utjvRFXC2HQsLPjaY//IniI1BnenbA3y9rcEr+lMaWt+uVQ27yrh1ILuDoVbv9VHlI
	VRIzhSKOu9AVf5dr37ntvIsvT08rod+CEbNBraVF9SIQRk6pjyflKeQIvRylfJW0WpfEd/PIodW
	g==
X-Received: by 2002:a05:6a00:b81:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-84fa866d78emr4192518b3a.3.1786463816220;
        Tue, 11 Aug 2026 08:56:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1d285a8sm7098b3a.18.2026.08.11.08.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:56:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:56:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (emc1403) Convert to use OF bindings
Message-ID: <dd0149d0-2933-4baf-ab61-049ea505d5d7@roeck-us.net>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731113007.145322-3-clamor95@gmail.com>

On Fri, Jul 31, 2026 at 02:30:06PM +0300, Svyatoslav Ryhel wrote:
> From: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> 
> Add OF match compatible table to be able to use this driver with Device
> Trees.
> 
> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Applied.

Thanks,
Guenter
