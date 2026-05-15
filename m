Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776636EA8F
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778809327; cv=none; b=lFW9EpgJ1psCobUYageDz33JON17uP4Uq1UMoWaMpLm/4KwNeuNEsgfcNckEfZNZrFtdXozlOmEC/yXsOTBT6TUgASajbob8tG91/yFojsojY18zawgrogW6OmOFaDzpZMgVYRLeSTc75+695EgsCsE9+AI9ELjPrUAHUdEh7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778809327; c=relaxed/simple;
	bh=ps5vk+VM+L+FYx4u5/RRqT+x6dzgOu/6OyG21fXaQSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0Mmnu77Z471C26qllMLUhuYIpK9saS9CKj2t/foXTtu4C628FJ2VkG6MjhJ+t2l0v7sXAn/nR+fDUzDFNeI+U/DJIsOBs4lc/GYS4tkJRUI6bwAZImIoI2Orw55ECo9GsZxERel/WnHINzQ8fOvRcqAtCA7zlQLb6pWDcqtAtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMMO4HrI; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMMO4HrI"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1332772f6b3so7868037c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 18:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778809324; x=1779414124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/M7qvOw5n8r3Pyepd0iOKMjChQQQyNXJWeh8BJrPZk=;
        b=BMMO4HrIwtd5O9atgkUIEMXa4aGNXdFBUrrGUD1m527X3/vlJLf2yj2HjDWBhJH1td
         laNW/ww8g7lu3lkOVuTI/l1zYVkHSfkSZqYpFcenhlqgI0xxzPr1+KzHfROD2vzz3zBw
         ZPT14Ss3ZPynP9z7Ged66gIA5EM9CVmmGpLB5Y3jz503yP07Gon1OQUgWVkHpdjouyKG
         yFPE8kroO3f8eqsGhCHjhk6mAQTL1Cy10WLM4hNdRvDbEXQBaO+fWNd21uesj3lWGLPb
         DgT/Y5EcSXIZZLOdxhVPelqQKUX6pRdwOP9KszL7QdD1dQEVQvGvqJ4dyHtJNJUjClgR
         xXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778809324; x=1779414124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/M7qvOw5n8r3Pyepd0iOKMjChQQQyNXJWeh8BJrPZk=;
        b=LNoE7/4TOi0xY60kbDvpA7S/N/6Rkv9A+W1ENDn/WTdrdY0Vo8qcqqOeUKrYk5mslB
         n57csUsTH0pM9o5yVngFOJEl5P72Mbpp2Nn8n/5iKlpmYjPtCVJDqNbfrKGAHk4n14KA
         iYilprStH5vWMAi2lgq9bizsOXx0ifuFcF2XNU8m5A4OVlezKGHf7Cvx1rYrGCrj8lcv
         dPNRTHAZel11RKFyhTDYOJZ+nEkYBtiO2qsYZ7ohmQIzmpaQ407rW6HpD8KfAF25vhXx
         O17NqUV63Q/i4BcT3jjeiO9qQUcqQDhPne8qvyidkBzp481GD0NxkprgNQm2QDLKJ8pI
         t3Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/JCvvSkSqkVtOVjBX75t9OsxVyQKOKnA/TtGx1ivvPm4i7pabUv6xaLiHlw6CAHFHQCFPNgunseP0DBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKW92UdaW5fIkomZO8G4DTXJ0al27pcxZ2kp7Dy4T5A9GPtZa
	E4AGwVK/1mjVubxrZIDwWNCNLpDE8m5QGhOeWxrmFo1ShK4POstKZ7AOPo4giA==
X-Gm-Gg: Acq92OE8GSWwGQdcwVfAkhcQOTmKIMAEv0/jr7bo/nZXwZTLrLGVryy5Qzieg6BbOab
	8c6G0smVlFXTM0SCEJT/rQ9+aznXMVxAP1htEM5D7K8OMcTV9cknFloRCd6LGPysvDA7oy+65jb
	8Frvnd/E5XaYd/pJRGRInzuTG96Gg+tdi9clzlE1WeD6O+vANxNCMJ9Geat5FYeIjbWTDFCpNRb
	AfC1WUq/YHdth5tX1VdrBlPivyvXjOD30jpIYwz96qhdTY0B2VebmFV4FPM/xn3LJuPWz+XH/R5
	+7Lo79atocjllqC48U09j9WtpJpZWSTIWUmEXAYDDgdTjsdmGy9/CqgLEMA3dI42fbrslKnKwas
	mZC95Iyym2PsGSZ7aU0WeuY6qTUQd/VCei1Wo+LHVWhXiNftXf2gqi16bN4VjnyzXDBxqcjTGIr
	1fxQMVfH+U9+TUETT+fRFjNR4rQrQfpizC0Ave
X-Received: by 2002:a05:7022:7a2:b0:134:ff2e:a71c with SMTP id a92af1059eb24-1350430e5acmr764440c88.9.1778809324186;
        Thu, 14 May 2026 18:42:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2352f2sm7253756c88.10.2026.05.14.18.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:42:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 18:42:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Message-ID: <c88265fe-deaf-48e5-9caa-e70f0677e7f9@roeck-us.net>
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-1-a81a479b0bb0@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-adm1266-v3-1-a81a479b0bb0@nexthop.ai>

On Tue, May 12, 2026 at 11:56:24AM -0700, Abdurrahman Hussain wrote:
> The ADM1266 reports its firmware revision via the IC_DEVICE_REV
> manufacturer-specific block-read command (0xAE, datasheet Rev. D
> Table 80). The first three returned bytes are the firmware
> major.minor.patch fields. This is useful when correlating field
> behaviour against ADI release notes; expose it through debugfs
> alongside the existing sequencer_state entry.
> 
> The standard PMBus MFR_REVISION (0x9B) register is already exposed
> by pmbus_core's debugfs auto-create path and reports the
> manufacturer revision, which is a separate thing from the firmware
> running on the device.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied to hwmon-next.

Thanks,
Guenter
