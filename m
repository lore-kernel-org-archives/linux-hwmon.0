Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E73563D4
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143891; cv=none; b=PRBPaYecyT6MvXllU6R0Ky9hBXX4Vh0NaHT1odgYXrSsem1YwGXjEKP5K9OLCnhu/HSdhQ2Gi5IAECWG3A1PqX2Ai/HvaY0uRyxrFxfH/CNX3JXwi4LfOunzLInZfM0zhuFc4u5RqmRwcXiikwM+5L9FxkQ2SeGak7+PPSYT7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143891; c=relaxed/simple;
	bh=VX3jn8byCgO0ZAJp6dhWZejX5JlmyqMoj5sZHahesx8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hdum01vz4l7uCc6WCZeMljujGqHBzzhAxPZvXzJ5y4pqR1Qh7Vcn7ceMNbNbKVYVUCdkRtQgujx3aEPd9j7VyO2IKF0G4WbVRSi/O6u4gnM/rdD8x2YleA0ZwNEtfTj5dSusEWkTrqaOobx6V3B7jPmfUJotukYQKWdbZUKZbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL/OySse; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL/OySse"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891f625344so6338485e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143882; x=1778748682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9FEgjgSXbJMk9lcA99TUtEICHtp0LNQxToJb92NNSs=;
        b=EL/OySseyWN85BxkOMhB+UD/sNBitGtHvpqoqP5x6PAQtVACudDjOCjBNSWCl6/H24
         C8TFl2ysMrpi9FgHV26JFVKnoeQe+ufKvbNOh+3JH/e6hNNbQw7R1CzPpmFiQV54nBby
         /tgHuf0CJ4r5Fpaw3kDXWqCJGyxuxkwbucrEuYSVk/GbkUtMhMKRlE74od2Srvljh3YG
         xacQls46cmhZqblO9I5pikkI0oQU5O0m/U5+1b7DgARkNHKIqlqlxZvm6MSvq/8SWuyW
         Bl99upnUX+zPU4Vm20yT+RzP9qSxzOCt2FkOTVTANyMgODzYHYPuSbp7VHvjFXE8Rr3Y
         1eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143882; x=1778748682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9FEgjgSXbJMk9lcA99TUtEICHtp0LNQxToJb92NNSs=;
        b=FMi6ddzVRTilb4cZQwxIMDNCtIox1V2Vms4FwG71uTfiB3U7Z/VPmh/xoN6eePR2gm
         80bRWmoQen2bqJmzZVsiqWXYYdo1MY3L6SJxwRZLhmiyV4nkB++02MYDajHO6Q85ItOI
         gRugq2qVUU+ztIN0GwyW3oXxR97BFbU8PD3Geq5oVa0NRA5OdkmBJ93CPXPMb4m1HcLl
         YkY51YsOx/Aou9WwUQyuosPwLCrAQpEQZ6Lx5AITqBJdNw1Evs6iYTb1CLjz5h0Y2oVE
         +PNz+HVdyIVMTdXGgs0Zzc3nKAdaT6ZOzVwWrqLjFGwfVSCCQgejtFgXEqu47I7J/9+y
         5+LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XXO2sFOzgkCGLTKx+lTZO/3aQBeOjJS1hJriApvsSQ7/gxUlLn1dOgpfPCZ5H3LFagddWV76ZsX9H0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO+6eYTrskZqaB4IfQpmD+fWHvWz0NRBEDvc5Sye5NZ7jT5kgf
	Qhkek1TjlsAgFFR/Lofd7PMG0GTyhE3uQSQTW3HPDonkGtPTix4SP7C9
X-Gm-Gg: AeBDiesq6hLsijnHbQtznHpE3+IpUQPhklMK8b9pZYMBBJVifOdQF1RouEqP+GHC+rU
	QtAmFctHTB+8D60Pi/QiyPOOKvSQpxyXOUPkPmh4+iBTNgUvHN2WS2SDHHzOy8xgLQ5JjMstxqe
	/7Jt1BC90wLhw02lr9+6K06ewKBBhGmeZFXhddE4Ell2lVjgWOvXuk1IWup5ej9yvhjMg+AhP+L
	MixVBQrP5/j5hJX2U2k8VwIFuA8DU9zqMUUDPyFCpYOR5bf2vdNHC/ldf9KeY9mLHp1/Xjuc63i
	e2D4gpcc6RH+pF9nOx18/k7nSWHmCfeixvj4NnOIuP027PV/Z5SpjizI2VSc50MXvbdU/ND3sY9
	5V9VPIFXbBqmvpw7sBtVJduZ7tMvjSYGwIy1IS1tRK3y8E+WLtnIPqGwmIEyIvUyDYbGCznxiDn
	fSIeJeaibO23qaUGLswWUV3+uBW+yZLhU=
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr31079945e9.9.1778143881872;
        Thu, 07 May 2026 01:51:21 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312dbf8sm33675725e9.23.2026.05.07.01.51.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 07 May 2026 01:51:20 -0700 (PDT)
Date: Thu, 7 May 2026 10:51:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@icloud.com>
Cc: Jihong Min <hurryman2212@gmail.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260507105116.2c1607d7.michal.pecio@gmail.com>
In-Reply-To: <c7d0e6c4-1c6c-432e-90ed-f0604401d691@icloud.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
	<20260506233332.664f220c.michal.pecio@gmail.com>
	<c7d0e6c4-1c6c-432e-90ed-f0604401d691@icloud.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 May 2026 07:41:28 +0900, Jihong Min wrote:
> > I think this commit message and certainly the Kconfig help text
> > should include full name of the chip and perhaps its official
> > marketing names too, so that people better understand what hardware
> > is supported.
> >
> > So: "AMD Promontory 21 chipset" and "AM5 6xx/8xx series chipsets",
> > or whatever they are called by AMD and motherboard vendors.  
> 
> Addressed locally for v3. I changed the commit message, Kconfig
> prompt/help text, and hwmon documentation to use the full name, "AMD
> Promontory 21 (PROM21)".
> 
> I avoided putting chipset marketing names directly into the Kconfig
> text and commit subject because some AMD 6xx/8xx series chipsets can
> be built from more than one PROM21 IP in a daisy-chained
> configuration, including more than one PROM21 xHCI controller.

Not sure how is this a problem?
The driver is still applicable to those daisy-chained chipsets.

Configuring the kernel is tedious enough already, the help text should
ideally tell me whether I need this driver or not without searching
for obscure code names.

I would even go as far as to mention that it's for AM5 chipsets,
because AMD recycles chipset numbers every few generations.

>  > Is there any documentation of the index/data registers themselves?
> 
> I am not aware of public AMD documentation for the PROM21 vendor
> index/data registers or the temperature selector.
> 
> For my initial validation on an X870E system with two decade or
> so.PROM21 xHCI controllers, I passed one PROM21 xHCI controller
> through to a Windows VM, left USB traffic idle, and let a Windows
> monitoring utility poll the controller temperature. From the Linux
> host I monitored that controller's PCI MMIO BAR with read-only
> accesses.
>
> The vendor index register repeatedly held the same selector value,
> and the adjacent data register exposed a stable low 8-bit value.
> [...]
>
> After identifying the register pair, I used the same validation setup
> to derive the conversion formula by comparing the observed raw MMIO
> register value against HWiNFO64's reported PROM21 xHCI temperature on
> Windows.

Looks good, unless there are gotchas like the actual formula being
dependent on other factors you haven't noticed HWiNFO reading.

It would be good idea to record this methodology in the commit message
or docs so that others can repeat your experiment in case of issues.

Regards,
Michal
