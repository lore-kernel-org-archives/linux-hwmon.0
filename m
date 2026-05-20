Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBB2D3EC1
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284280; cv=none; b=Iwuf9gwSKhleVpEkAE0qlETEPJI6Zm9kSPyluiVDGS25caXdRLTzZDHPhXlNTA1GRfCScso3XkxV7mIrU5bdXQONMCCsIedVhFjGX25tFZVEX3lAdy75iA8M8tTmMyw9Xu3VQ6kds5Zx3qgttlHw2wXYJq5XxHXoytAWhKj1e3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284280; c=relaxed/simple;
	bh=XH63ct7iIhKeSOJDhAToPMJ7pAUUY4007bR5OMXx2+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co+TsdpCRXl7pQvW2puyRdwAWhqykEhAMsHwfrrnJnhZrBBirljQe8WMMQ5G0AijyQkOfRh/BEDas0Gf0GXemPsDhvzyGOc/aJIhx/xJT013XII6vLtzpurIXOObtlqtgrTbIGmmgk4PC3UxXcCcALqhTHBGTObB0nA/vTYar3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT/k6g+F; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT/k6g+F"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8f9846c8so5695893c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 06:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284278; x=1779889078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=;
        b=nT/k6g+FYzyaEatJYQhAFvrc3oHiKf8UfzLfnGZFA7q2iGgesFToZx+Bk492i99mN9
         6ojQBvb7Zuyog18oJyYUk4BKf9Q+mffHwJKMjGx+ePwVEFyG8F2lpsxV5l1VrtnMyOlK
         B25JMTOL7l+3/p5lavppNMvFbzkN1sHi9oQZsMNGPiCP3GXqKQgsbTawjFEeD0tcZUD1
         8+PGTyNYS457M6qXhd/RWB1IqEbCd17c0ZrhH2KzEN6JaepXp9qIxxjtawUuXtenZ7bj
         FyPOkTV+kuMCvGv957s/EakWLqrN9RnARWbp72tZqhxBcpCm6wpXWipEkUdd0FnPDIQd
         yRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284278; x=1779889078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8AkZpbZCTo7d3LdnWMBBV6pSxnl3OrCMz1va21zOtM=;
        b=p3U2z9q186csfQi/GDhfaawgIBLPwj/szpbW8zqTbe47aMORhmUTFvNN0UGhlOndpD
         ck5xQmEY07+LZAaV8EzFNoCzcUUe90H681b1Gw0XS0WwOTTXVap/aMuz4f2CaBi/C1Mc
         zVwH4qz1SGRAUy4+PvSbZvk9enneXm16Tk1gjuzlw+u2RBxIbiwrF1cRYtlZtRUpZgo1
         gjY1HcfCKYL3yVgy+SoavFQ8o4BxgIVUR5b6k+D3Or1g94dXaP0Vtd9Fhm7Ar233YrMH
         B53Zc83C5jEa2NXAZAwNwIBNNVOCUdnqQTO3iwjA0HVYWoo1RKg5HG45eRfH7keJx/Zd
         p3ww==
X-Forwarded-Encrypted: i=1; AFNElJ+Y1yTX7KZdhf/FL4C3MJw0anuiBYlgi/Dqcwg/uPH4oa7CL3GJcgCdhFJcoy+0+/ZV3/xyMm/3nPtVtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZhmFBAqBvT/Aw3mghn1PIqz3NMbWQtCfq97GTMXPkiQlKPJOY
	20bEoRTQgQmw/vA+9KT+1wG0Qf24LQD1r9G+2sl2lWkOpV54CSWhbaaj
X-Gm-Gg: Acq92OE1TUgtpi618r8KOzYD0IuOkD06inqd0ZP4KQfc9RuSXcPSTiZiB9Q8ieArNiy
	XdAzvoVctMF3hoLfBedHiQg40P/wKeYDkMcZ/RHSFfPunUcDmP5HUEVxTxF/ueJsq4hxL/KYfgQ
	pm7XEKoWVCA96xMbbZ6q1Gi86XyBvDyfegMOUfqi6xbmvjOxc4ndAbPrgCf/Knjqdfpw72CwfO1
	GGODcihvJ9ilimDrcH/85zEJ7ZVERGWlD1B/K4GV55cj76ZHetbOgEna9gvd4EseocpQz9JHAvr
	h0xq8lXtlRfJLT5mdEjc+aqpQc1f8fQHA2AhAPRDnesajL7Jo937xLwGtwOS5znGNEsUvDIk+u/
	93n6ccQDOOdHWM73o2HqtFKYBN7q6rn0/nhoLJH26b+r0OgHDKDmIIdrJklK0P4MVh6GJQF24yk
	bJUf5cEsQIeXhL/vLyXYEjZ5moUj6X4RqEQPFmJmfU3JssKLw=
X-Received: by 2002:a05:7300:6429:b0:2d9:2b54:ea9c with SMTP id 5a478bee46e88-3039867e6efmr12060147eec.18.1779284277938;
        Wed, 20 May 2026 06:37:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm19200837eec.7.2026.05.20.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:37:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 06:37:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: raspberrypi: Add voltage input support
Message-ID: <ffaa4944-e839-4de1-bb6c-14008a81cd06@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-3-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-3-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:44PM +0530, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>   - in0_input (core)
>   - in1_input (sdram_c)
>   - in2_input (sdram_i)
>   - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>   Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied, after fixing:

WARNING: Missing a blank line after declarations
#207: FILE: drivers/hwmon/raspberrypi-hwmon.c:74:
+	int ret;
+	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,

Please run checkpatch on your patches.

Thanks,
Guenter
