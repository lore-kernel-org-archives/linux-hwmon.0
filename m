Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01A1358363
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 21:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487940; cv=none; b=a19Xdt8qMzvONw2uv5MbBpBcn29Acms+DG/UZ0tkVwdBN1vHbn9FCatnNcGEeKPPx0/C2e8CQBZ3vOTo9Ay+IrCYPhlCYtbSy5n7pe9w1hsSnM9uweyHPPr0xgVeZTiW6EVDexXRj0WqcSOw8PfGr0sDYZsyfI7p6BR4X8MZdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487940; c=relaxed/simple;
	bh=BEueXD8bsR4vMFjH3PaJBmfnYkTtvORud6B8odsMRJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEqM44i8/pxGQpuKoUm+CzuxhJ7CxwOgBHjW+SHPVnJ2+IVfBlizW4SFe8cvtUVw7ChQj8Dfy8IFzOXr7BTou2DsPw/JK1hOQTt+FdoxJvDJmyLzU/y/rTc8GC3oJMY42ey8CFF15Lp5tjqJbq1x3XKMvFrdKyt5G7gv3hffsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz0AZue4; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz0AZue4"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12758ce1e8dso22789c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 13:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772487939; x=1773092739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL/dEzicRCHaDVnBC7JpiXtFkqhNbNFEBocabI5n5b8=;
        b=Jz0AZue4h+AstCJq5g50ZE46twE7/eC1wYchZ1xnMLi8Hp5laSA0Q4ZnFh7PqJ2bBG
         jhZQqo9DO+c+8/oqsEub8N0D2Klo0o9PtutUCJ03dsO3JwpIGBMR9NlyG8mZZjEliJxv
         JgWjyVS0Zw+vnadvoFwd5UqvIqLhznDdOy0Yn1/dssE2aDXTwus7B1Yip1ZMQZVHTwPH
         8lp3bqCzgRX99pAA5hlpQkPJtcAtdUXCOGMk0MH5knhgQCJ0d24e7MGsWz0Q9TU+3ib8
         ow5u+RMu/f6T+xToauYcTHUavZ09OUXq8+mh++mvTnNdX67a8aYWoB559S9nk6dvrpFl
         xYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772487939; x=1773092739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eL/dEzicRCHaDVnBC7JpiXtFkqhNbNFEBocabI5n5b8=;
        b=WuAxYABMQ042ylLTqQVSm8rXVHhU1D2Q05eE8/siaC+zgThEy73A7jCdjuIjJwHj/c
         YxKpoJO+MEn4kgmHEbs6nhhZPVLt9BKWxy5f8Ao+V/iXdoO1072whz5pllyLJVehANhr
         7VUPDH3Qjja3JjSLazHoVr6c7NgBDIrkPnDplrq2/Furp6hQNmht2KQhhi+utQXjV3Ae
         TzoFnasrgHAYjEEMYsuy8rDII4PoppFCTHkAeAhRzQ8PcVOmMoqP/y71qfpyxHdt+ChU
         3vY0f8DjISct2uMlSYTPyLhq2N+4ASOxOy0x4aILfcueU3wggWprF7m/LpD5P+/iIWLj
         iORQ==
X-Gm-Message-State: AOJu0YwkSJNQroupQDK+hXbcUCzcBcMGQpiePlr4/BCQIB/MIX/vS8BU
	4N/5vLxyl1JsOopBjm4zE+gco4N8zAKSmxl9wArJcPwppafa91ZEr7lx
X-Gm-Gg: ATEYQzxJqV+c8zE2C6+8NC0DlhbGhPWS/1zJugGcJuEFXuXb354AKiLrfG5Il4RvtLH
	rVFIGSoxictP9m0COELrBXmtU+p34TOc4k4tC9vmTEyxQl1+PwntaVWFeDBMrjTEj9D6vHepDuv
	0npjGP56jLMXiTMTMnn2tjc6kFgd1ThMaWFDWXpKHOZfZPm141p8LTGn+hsXWrv0NhzD71NJzzY
	nRp8yZ5iJLtnAEOFEKdO3au4BhlBkeux+snw+T/wIZgSTG+JAcKpedqUvLVmkYhCHnTKH2bqvv6
	PlYgONHQAijxAtm7MHYH5u4PMIA+0ZY8dGp5CoeGC804aad6RUzHZR1fIEAXlm0GRqeno+WT0Xp
	xyA3w157/lSWJZyHaQZi8YfGwxcnk1AwU99v7teNLBt52nMlBnCvoGIxOOBBTDacsdk41tMTLBs
	KS/8c4moE5bnuYE33bwspRUt8/vIGaYHCa/MMc
X-Received: by 2002:a05:693c:40d7:b0:2be:1dc7:99ae with SMTP id 5a478bee46e88-2be1dc79bf1mr592214eec.6.1772487938710;
        Mon, 02 Mar 2026 13:45:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7e955sm11781590eec.32.2026.03.02.13.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:45:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Mar 2026 13:45:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mariano Abad <weimaraner@gmail.com>
Cc: linux-hwmon@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add LattePanda Sigma EC driver
Message-ID: <ca5e58d2-7ae7-4bd2-a745-cabe997c1946@roeck-us.net>
References: <20260301023707.1184592-1-weimaraner@gmail.com>
 <20260302183514.3021503-1-weimaraner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302183514.3021503-1-weimaraner@gmail.com>

On Mon, Mar 02, 2026 at 03:35:14PM -0300, Mariano Abad wrote:
> The LattePanda Sigma is an x86 single-board computer made by DFRobot,
> featuring an Intel Core i5-1340P and an ITE IT8613E Embedded Controller
> that manages fan speed and thermal monitoring.
> 
> The BIOS declares the ACPI Embedded Controller (PNP0C09) with _STA
> returning 0 and provides only stub ECRD/ECWT methods. Since the kernel's
> ACPI EC subsystem never initializes, ec_read() is not available and
> direct port I/O to the standard ACPI EC ports (0x62/0x66) is used. As
> ACPI never accesses the EC, no ACPI Global Lock or namespace mutex is
> required.
> 
> The driver exposes:
>   - CPU fan speed (RPM, read-only)
>   - Board temperature (unsigned 8-bit, degrees Celsius)
>   - CPU proximity temperature (unsigned 8-bit, degrees Celsius)
> 
> DMI matching restricts the driver to verified LattePanda Sigma hardware
> with BIOS version 5.27. A 'force' module parameter allows loading on
> untested BIOS versions while still requiring vendor/product match.
> 
> The EC register map was discovered through firmware reverse engineering
> and confirmed by physical testing.
> 

I had trouble to find this patch again and found that you sent it as reply
to the first version.

Documentation/process/submittingpatches.rst explains why you should
never do that.

Anyway, additional feedback:

> +/* Read a 16-bit big-endian value from two consecutive EC registers. */
> +static int ec_read_reg16(u8 reg_hi, u8 reg_lo, u16 *val)
> +{
> +	int ret;
> +	u8 hi, lo;
> +
> +	ret = ec_read_reg(reg_hi, &hi);
> +	if (ret)
> +		return ret;
> +
> +	ret = ec_read_reg(reg_lo, &lo);
> +	if (ret)
> +		return ret;
> +
> +	*val = ((u16)hi << 8) | lo;
> +	return 0;
> +}

Is it possible for the 16-bit value (e.g., fan RPM) to roll over between
reading the high and low bytes? Without latching or verifying that the high
byte did not change, reading a rapidly changing 16-bit value as two
independent 8-bit reads can yield a corrupted result (e.g., if it rolls over
from 0x0100 to 0x00FF between reads, producing 0x01FF).

This is AI generated, but it does have a point. lm90 had a similar problem,
which it kind of solved in lm90_read16(). You might want to consider using
a similar approach unless it is guaranteed that this is not a problem.
If so, please add a comment explaining why it is not a problem.

Thanks,
Guenter
