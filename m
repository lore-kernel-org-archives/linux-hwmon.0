Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0C63B7B94
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676376; cv=none; b=cznht551I96/tNAdjL1LVycLW2sry4xqmZeMxz9Fa7xGnBG4m4cvU8Vlm9o9VVtvMKvvYzMGtrFNkKVByCaocKoPYcX3dpTmErqddXPO47n+2UFT9romuDdHpUvKmE3uWAQ81mN8B5+w9mRJsImnpx9UwIzA8aezs+iX1RshRGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676376; c=relaxed/simple;
	bh=dHIYQdnvLGJnJAC7TLQp8qBY9JpMSVatPekDx+H7HKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMQeCn4J5ppiXHodkeEFZKgEF4WvNUE9f7AUzhjI2aVb5FHNeFmMIBfJyQGQIJSLQuYo1zlECN629h1u0KvqkAN6LfPqNDAgCeTotz81Wp2Io+BIt1Z249NYdOD6BF3JW26vlyOoUzHYlIvUzWRqleB+EoupCSS0XYr+D7dKxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnYwm/ni; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnYwm/ni"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128b9b7e3edso1578574c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773676370; x=1774281170; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf6K0w2r4kkhYXXvzH/ruQEBH81QgFayUhC8t0LnQKs=;
        b=bnYwm/nitWKqRRr/CuPg2GAMdpmT1ne7gY7YHn7CEQxfzcw81ITs9MaM0vOarGHReV
         GFA0buFZ9nE+cdSiIMvNopxRNerzbvWNS9uioZmEXJsqbYsPBRuohG9iX1fe2qbATUph
         Ar6Uxba3faspEeISwnFBomAb4I06OC3OsvtsDAVSrWvX0U+L23At4PjsSiiqFEk5xW5s
         /NhCB5lEsaD4STCyoM98eLAsktUijjUQnUdGlM4I/J5x1fuJF+GOgG5hnkqETNC4LETo
         vb8H4z5goIndY/05Y1B8elEOLt/VMDnFB5g9TCcXCaOu5PvWKCwQSIQPik39e3hHEoA3
         00YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676370; x=1774281170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bf6K0w2r4kkhYXXvzH/ruQEBH81QgFayUhC8t0LnQKs=;
        b=BXgp0GmeSTBbR5fRzQ2dLyxJ1NbnOTYSwLGOyCDxaVmJ0RB3CUH8he/w7+FPe+hXI6
         aMFQCWxBSKwlACIzt/AfKGN0hZAUNP1k9u9CbAFBhGomZ5sbkBQLJUAf6xPMHq5cZf9U
         JBi6ee9NsPjJfU/AQNS6uu9U2h7NoyacGlYDM9bvI7ku6lzEO2HX8KYGLxPvIA5AqLSO
         bfCRzUgfBE9My0lZP3R7CCdHy4K312jusLDTt/YRifG1NYw7G8p/M0ADA0YK8GjEWVdJ
         qLC1BA4/hYRfFfvVoHrScJjEVMrE0ZA+p/Pk5iA0kd5K9rwhx40ZeBoXjAZMZfvua1lg
         9Nyg==
X-Forwarded-Encrypted: i=1; AJvYcCV7+XSF3sNQaQqoCom+ZG1LXBe2I6q+f5a0x/jdAZW39g9qtPFTMcWrsv885wdbdkg7FM6pnW325dXCCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAM9nwpdQW+TuEvFLiyPnVQUs56AjY45dyLz48yb3jXpgJ4yu
	lBr5aZNvdYaI2UOHdQqKxE9WLNcAs0jJ6HqhCKr1QsCzep4ESMbKfv9U
X-Gm-Gg: ATEYQzxXdZ6NU5zAXtTMr1Cx1NvzGdUI5Zlb1b3HktTGmsdhdLhDWTDixYsXz5UzKtk
	TFzTgsPGd426V+TzN4713xOF/VydCF8UT6eHRuyd71wPV4bb36eaXdywc4suKeu/ndiJUU3G8LH
	/OlHLBRVGdNF3plDDggPUMA73/XGLeEwAMlJGlKj9ba+7zJo7SYrg1oP50JB+4uocmMoDnscBy+
	v2MdZAkxdaN8lNogUlVnu7zp35xicoLW0UuROcdFi0FMCUao+R5inZQSYAWZhPCJVeTuK2j68GJ
	2LxgsoiAJSyCG2bjO5r5GkCk4GOVdK6JY8zu13nSbtWyM6E5opy98nhS+xh1ifpGODtcvGiOB4Z
	HwDeVYouoRiZ1JqTjlC/en5HlFTJ8xZnhX2hXZ0VHVjD53hHBqQPS8udkPbfDBzt6Bq+qvGayUC
	fhQUhLIj1h/94jcJcTlRz15brTqVv+cKl+2X/n
X-Received: by 2002:a05:7022:49e:b0:123:2d38:929a with SMTP id a92af1059eb24-128f3e0db8fmr7150794c88.38.1773676370261;
        Mon, 16 Mar 2026 08:52:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6385030sm11258467c88.10.2026.03.16.08.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:52:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 16 Mar 2026 08:52:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Jan =?iso-8859-1?Q?Clau=DFen?= <jan.claussen10@web.de>,
	linux-hwmon@vger.kernel.org
Subject: Re: Weird Dell SMM bug since 6.18
Message-ID: <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>

On Sat, Mar 14, 2026 at 12:10:26AM +0100, Armin Wolf wrote:
> Am 13.03.26 um 20:06 schrieb Jan Claußen:
> 
> > I was actually in a fixed state for some reason and everything worked. I then tried to get back to the broken state and seems that echoing 2 into the pwmX_enable endpoints followed by reboot did the trick.
> 
> The developers of CoolerControl said that:
> 
> 	"As mentioned in my previous response above, CC reads the pwmX values first, and if that fails, then it doesn't bother
> 	 with checking the pwmX_enable attributes. So, according to the logs, it's never getting to the point of reading the
> 	 pwmX_enable files at all, ..."
> 
> Reading pwmX when the associated PWM channel is still in automatic control mode will return -ENODATA because
> the driver cannot retrieve the current PWM value when the BIOS controls the fan. This likely causes CoolerControl
> to ignore the dell-smm hwmon device.
> 
> There a two solutions for this:
> 1. CoolerControl does not ignore PWM channels that cannot be read when in automatic control mode (or adds some special handling for this driver).
> 2. The dell-smm-hwmon driver stops returning -ENODATA and instead returns a dummy value (like 0).
> 
> Guenter, would you be OK with the second approach? I get the feeling that this issue might affect more
> fan control daemons.
> 

Not really. -ENODATA seems to be the correct response if the current pwm value is not readable.
Returning 0 or any other number would be misldeading and trigger other problems (such as some
userspace code believing that it can write the value back with no impact, which would be worse).

Guenter
