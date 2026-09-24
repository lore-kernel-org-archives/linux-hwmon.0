Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D023F4822
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268582; cv=none; b=Hb+pj11JbjR4i1107FHSEVukQgYLSfzUFJ9rFXerdpBZIJ+KJHH4ahTNvSe2DinQu4u+mFBMMGP/u5NcfKw5orK+okqiUHG0Kl9t1Xb8z9OjFr0JmGwy6V2AU6gnhIDt9d20yofg8XJQaj1gAkICmHoosHrk9z4dx83WOKi7FYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268582; c=relaxed/simple;
	bh=h62Dh836T7epAiauqXAM4RBAh4gzDTS7soCafFIyBjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOt+8laronyFhgGpTBk7f5ykSo44MMgSmnEvFe48o0PH+U8DBYGdXsy/DXZbcVbwZPFxS9hRY402DIbrxFJFCQPgWaO5o2HVR2UeQCU5HOfi0CugSAowsxZXVQISO8xfALXV9HjovtJ1jBEzBuJqtNTogoFDzK7T+EWs4AWFt4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf+cC/dD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf+cC/dD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db710396ffso5325645ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268580; x=1790873380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJf8nX05Vsz64aWKOzYCD8hwmSIbpieR/QsAhzSY280=;
        b=Mf+cC/dDxWzJmOYSOu9qgKDCqGE68ayL+vRVWv6DOBezLxjC5KU9jkf+p7zf4UwmOm
         5vL7I1HeSHoeL3mHZvNvyQdHfw2OG3gGkH0Kim+6t4heJVUgzA6/w0r4wOgSAwC0PRtE
         N8RFnh1CiDBjPhJVswiGDLLvZdx2GtY1S4WhI1LivhTjcR2EXuFxpXBJUZseqtFAv2u5
         kbapARVBhylw9naHQ9Hm69KnjKM6x9VjU/P/+rpHl61AoA05H0nb4bq1dUCVYKPTlewT
         wfIyw9MNOaV9beYrOuMHr8JOoE7uUqqoUId4ZwBNvW5XzvbR1SHFziIF38gs77tA1RZQ
         4hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268580; x=1790873380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJf8nX05Vsz64aWKOzYCD8hwmSIbpieR/QsAhzSY280=;
        b=JuF9WAeMyn3adIusUuPWN4HdZaz1sMEP1VxvLYAdXOEMMkxoAcqhkNZzEmj3sGtAeE
         HZwvylBBb21fg02CVchj4uI2PNoJCZnvDR3yZpIRhSVEqVyeCgh9wq7EnfRxDDr8vQXz
         tJ/A7kcZN6ih1otgax6kWdS3bZEr4a0DPbZfiSFJ7cuSMmiQGMshEBSCouOmkMLA5qXY
         HA5+9JgZARphDQUCnVdaJI0vkUxitRqJ965Q6oitp/5Agf5CY/OKOAG+QmEmtoSlX10h
         vvg+UWguc+V1gYQ395EaawhYAdrBRSPEUzm8bKv27Ggo4t4Jk/Alk9lV6m92jLk/YqDz
         +lfA==
X-Forwarded-Encrypted: i=1; AKwUvBzHbKTbyeAyUSwaINSBsWM5qN9oDpVpEYymL6F41ze4uH3AjBctSh8ocwPC3rVAC1pFNx+Bh8AYWsnOVw==@vger.kernel.org
X-Gm-Message-State: AFuF++neXTVkY6HII/4SxHHDfl7i+bmI+6sNMcIncOrpGORhX+K9xDyk
	IFDmsy66X9lWaqIxWzIWa8KUJ9f52+h4ggeZ00LFKzO2bGct7lXi5jHf
X-Gm-Gg: AYBFou14OqSAHEJ3a9q4B4SNb8Q/C++ISrbnjFj4ecgFX9yGwV+1CSEAwvCEMAHzt+S
	wlYVNTwybNuBcVJy4YmFgUti/X86+F7a6fTNIWGTGfyGW8RTEWRQ5aH6D4vNhSvFBM+0I2BfTM1
	NgCW0BcAD63HEpPft6skw6DNk9bXaIXD7T+wfEuD0NmNJLo50HBDHHK0mcRG9iwmkcJsYU2m3lg
	ex9Ts+ArJLRlDevQlQTlwPQETLUFO8ezgd+Q30IFv7AUCy7NUhlQz1jjNFWlD5jZMf/n8jqjR6a
	sH2m85EmebXu+4trZO1vtBA6TYNAhHfWrltBESRpbm60GlzDH0/8BnhqV5sJcx8mq/t0OQDCs6s
	AInXeLuCYzJm5SRjTy5nba6355SeMk0Kzt8DCWYErUAIPRtVMQ/hu2ELiabUhiv/O8Vt4imMNrD
	EeeStEq/qQlw1JWkzE5XvqK+1ZLxpnZB3DYDJSIIEbBLhH/96EF9OobxPN7jl0eh4Xrcvb7zHs4
	ZJcFRyNXwTN
X-Received: by 2002:a17:902:ce05:b0:2df:34c0:72fd with SMTP id d9443c01a7336-2df7e293926mr19308125ad.34.1790268580240;
        Thu, 24 Sep 2026 09:49:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dd7b9sm30871215ad.61.2026.09.24.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:49:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Emanuel =?iso-8859-1?Q?=C1vila?= <avilaemanueel@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell 16 DC16250 to fan control
 whitelist
Message-ID: <3fc774b4-ee92-437e-a869-c603263ed202@roeck-us.net>
References: <20260924044829.2889204-1-avilaemanueel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924044829.2889204-1-avilaemanueel@gmail.com>

On Thu, Sep 24, 2026 at 01:48:29AM -0300, Emanuel Ávila wrote:
> On the Dell 16 DC16250, the BIOS keeps the CPU fan at its highest state
> (~4700 RPM) even when the system is idle at 45 °C, and fan speed writes
> through pwm1 are overridden by the BIOS within a few seconds.
> 
> The I8K_FAN_30A3_31A3 SMM code pair works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, the fan accepts all
> three fan states (0, 128 and 255 via pwm1) and reports matching RPM,
> and writing 2 hands control back to the BIOS.
> 
> Tested on BIOS 1.8.1 with kernel 7.1.5 (Pop!_OS 24.04).
> 
> Assisted-by: claude-opus-5-5
> Signed-off-by: Emanuel Ávila <avilaemanueel@gmail.com>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
