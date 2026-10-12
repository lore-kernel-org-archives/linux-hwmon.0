Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FD2F7F07
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 04:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777834; cv=none; b=d5fOGp7a0pO393pnRyUQzNC86Ne6U6qkO+pPcMfHQfah5BZebvH4+SILHilE+yXEvPOj12wl4UKHAJ92ytxbY2/fqCPX1dh+/3UnxYqmKyMdBQUHyQW8YQm0ZMUbh5CpwYSVW814IIzLJYpSg1nFddfHKaEeDmL/Hdi+tt19NP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777834; c=relaxed/simple;
	bh=FAil7OtxKTXvJbTvgGlszJiV2VHkZULg/wq6sGEenPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pa01pfJ2iFj5Z2X2nNbLo+xcsE7DxPb5N2FfiGeyi8I+wRdTaNMA6gBSi09MCaaGp2gNbOhM9CMo01tz8pjAOSkYBCv73yMA2Ia0LQ/z7Yj03KIiKcEpsK6yerWEFvM4nLJOkZI0rZzSI+GvbAJNAKlgzIJw8HUl53j80IZnb6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvjjXgQa; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvjjXgQa"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so1891291eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Oct 2026 21:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791777832; x=1792382632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Td54Itf2pNbuD++sK6cqexZnB1UToN3nPCQFL5wlNVE=;
        b=VvjjXgQaBiu3lG3EhOrptVGqTpcqIC0c5zRPr/1eOaoZd3+4DFEYe1JlqomVEpyq+u
         Abj1jOF0UPNpVaz3A4amvV11NDuie/2QfWXbxsZCRc9fmteH3Q8bBJujyHPmyHVwb7XF
         0vXf6Bvz4cyQAOFQI343O9gVbY3KSSYYY/1eFkHPMbdEkyTZJ7z3SwKvu5+pld5dlSr/
         GCDW31/f5BASM+1PqdSRGK+qrhxGcSrWVr6qEDhGTz6WeWcGbHfIfjusYG8fUSHzTlh8
         DA/KK1DH3RX8SAwZiUpR0aLrz2eZrzKvJnpwdqdvuC0GozYPJNN0iWZjzXPL5XCmJtyU
         RANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791777832; x=1792382632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Td54Itf2pNbuD++sK6cqexZnB1UToN3nPCQFL5wlNVE=;
        b=l/wIPV6iz9u2MVKnCfhh6bxX+doPqMvGC9+GNN8myNOx1ESU+Kvhl1mzTWC5UhbHhG
         HBQIeZnMkpvCL+KIsQRtUC1Yh3JAf1Om+DyLiS3+3AWFT8bP09zanInqZD+3dIFe94X2
         i+j2e2PSAMZVrwjcWNrdb0Dr1LcapjkseF7XHK2z522pxfBrzmIWlTpfQYyEnPCtc9hu
         ctX/R/w+NSmFFp6gc/R9kKOfEvX0kGjtHuw57Cq1bsL34EHVSKG+hfGlae1ZbKof1zRz
         HrwdrwCtcrVbIHQSxNYr1t5cOVIU6OW4svkjDsS3lzBGccPNstjFstmTM1r43E14SSCQ
         oUGg==
X-Forwarded-Encrypted: i=1; AKwUvBwjk0h7eXxaA4m4AAeZy7RQ082S1O55T8qUUiTepmso/cQSb/3Pt2jeIAyAq7Urese+vKrMbtWUMX1LxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/SXZ4o1jcPmso7x+A8GT0fyEX2DbzMEyV/M0auqBb7nl97yQl
	kZgn2J52AmR93gAFwkfgKcKl1YPzyPDEek/i0TBPd0q8wA126EDofVArpAhwtA==
X-Gm-Gg: AYBFou2KusbqTZdsPCelDezyiw7nUf6ugPlKe0exseb/O5slIvYOtrcO2su5mQj7QCP
	tuALYiHyi9kgg7zAaTyu1KN+GuLCfd1RyQ4XJU0snLq0Y5MbYhON2+xHu40nO9A9PGBN5VcdRGd
	f4iT36r20/rVH2sxLi9YUNDlAxc+zxSiYSAsRA9FJ7Eu5QUwWIQwjdlMc/NeWNIbl7Yzzc4YohH
	YoTDya1VkY3OesM0qtUwUNB5MuDwoQoGrtLMZPMqhkss6WMIKb5tLKx36DrTswTaSB2djCi30iY
	Hq6tls5qS84pRX5hMZPr/c04SgbAYhUEutsePya5t7pRt3IHMyD/uMbZtyy1qb9n6Dg6HFS+hj4
	l1eZQ7CNeyYDGvNNO51TXa0h3jZwpBYWEAJOVuStZ+AGvINZbjI3k3KCknrwejskfTX/ulUHWhS
	FDLvoAfImcIoby1ak+Eqcw1ZubQf5F/CNPYeBaO6RBC9i9tcy5lVosq+BiN7PgYJf7zR1S5a7mG
	USEP3cHwjsNrgCmBCgML4Kcgo+G6BPtWB0Glpx5H9dVSsDNVj+OMa8A9FCALgV5wUDEHw==
X-Received: by 2002:a05:7301:fd84:b0:359:8540:19d3 with SMTP id 5a478bee46e88-35985401cfcmr4645193eec.14.1791777832154;
        Sun, 11 Oct 2026 21:03:52 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:8b08:15c4:66f2:a984])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm32226476eec.3.2026.10.11.21.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:03:51 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:33:46 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
Message-ID: <asxTYBiGy6lf6-Ki@archlinux>
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>

+Armin Wolf

On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
>Hello,
>
>I am seeing hp-wmi fan interface failures on an HP OmniBook 5
>16-ag1xxx. This is not a gaming model.

Hi Lorenzo,

Thanks for reporting.

>Hardware:
>  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
>  board_name:   8DF4
>  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
>this machine)
>  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
>ACPICA 20250807 vs 20260408)
>
>Symptoms:
>1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
>   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
>[Integer]" while resolving operands for [Index].

This is likely due to hp-bioscfg instead of hp-wmi.

>2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
>settings: -22".

Ah yes! This is because we are currently enabling fan control for ALL
devices. If you share your acpidump, I can check if we should use the
HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.

>3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
>and WQBE (AE_AML_OPERAND_VALUE).

This is also likely due to hp-bioscfg. Try booting with kernel cmdline
parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
That will help us narrow down the scope. But in any case, I think Armin
Wolf will have to help here since I am not familiar with bioscfg anyway.

>4. hp_wmi still registers as a platform profile handler (quiet
>balanced performance).

This is because 8DF4 is not present in any whitelists, so it takes a
fallback path and uses legacy WMI queries. Honestly, I am not sure if
platform profile should be registered for OmniBook devices. Could you
let me know if Omen Gaming Hub on Windows allows you to switch
performance modes or there is no option for this?

>5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
>(rw); there is no pwm1 and no fan1_input.

Intended.

* pwm1_enable - As said, this is because we are currently (incorrectly)
                 enabling fan control for all devices.
* pwm1 - Absent because manual fan control must be unavailable on this
          board.
* fan1_input - Absent because get fan speed query must be failing.

>6. On the LTS kernel the same WHCM error repeats about every 2.2 s
>while something polls the hp hwmon device (277 times between 551 s and
>1165 s uptime).
>7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
>trip points!" for thermal zone TSZ0.
>
>Fan behaviour:
>- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
>exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
>RPM.
>- The fan works normally under Windows on the same machine.
>- I once saw the CPU around 95 C with the fan apparently stopped on
>Linux; I have not been able to reproduce it yet and am collecting a
>temperature/RPM log.
>
>I suspect the WMI query path the driver uses for fan settings is not
>implemented by this firmware, so hp-wmi should probably not attempt it
>on board 8DF4. I would be glad to test patches or provide acpidump
>output, WMI GUID listings or any other data.

acpidump would be helpful.

Thanks,
Krishna

>Thanks,
>Lorenzo
