Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A4B39099E
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136453; cv=none; b=RwXBgUtWEkz2f0l3m0BYxX1IomeoHNzRudfY8SwY3U/zf4dORW0ft359rX1aTROeAOHNcrrVEtXyWQMiK4VXZYGLdGjLHQXCDsFnnAqTJ4hOUubszIvSY+26RKNaEXGrQEKs0QeTNkzdITXwaKGGkeAbkWLqnXrX6hopnRogS9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136453; c=relaxed/simple;
	bh=6I+QElhAtc/8WabSKYbV0PXAFvgWpATjbvBd61/xDHI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKmKB/aJCzrpkGnYxdmqPp16XNZhQGBDhgNiDKGJgIu5r/5Oi3QmgIwaGcKO4TPIunULR7cLgtWd3Kua6Mx3CXhuc0lyLPHqbBvaO3Vo/YAu4Cml3ULoHgmh2LcToo2ppwf9ycudJa+X0URGyNitS6VDNvaW2+EAE6JCoD2N8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drMkUY+c; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drMkUY+c"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d75312379so2495259f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779136450; x=1779741250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTgYcEc55BDnl6ROBsBVO2eyQ8MbIi/0Xe4r8X6dKhw=;
        b=drMkUY+ciugqawq3ukBhLpwunBhAUQuwYrkglE29OG13pigY/pc31FwwbTyX/UZQXe
         keRKJUNZE0nRVsHt5XnQumz+hBjSdwSeURsAkBI2KFQjFT7tMtvVZbPkLtbfh5NzX39a
         xa/WHepdwHjbmnJLqiHhLIveq7BtmV4usTMl9r92d1oLK8zj0ryJcS70kPlVc4e9grtp
         sU0yfVkkEIb71vFGBsVluQJVF7qCYX+UGd11pPUAZAAVN0dtOMBawuirOSg18uqHz4yN
         +VDc3Q36ODvlFvsKV1sAWcO+fQHCTKznwNAvm7qKXeWUwk4jCZHBn6KQj0V8KD3eAdpO
         9RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779136450; x=1779741250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTgYcEc55BDnl6ROBsBVO2eyQ8MbIi/0Xe4r8X6dKhw=;
        b=YYAuY6akOa5bljyajlTkh5U3ya+uX5gmBM/3pRq2G0O9ofPAEmeNQKJCGRhfHVgG4k
         39fBHv6U6qqbvLj33B1OBQMYXE9kiQv19v8WrOp0NLLxZ9ypmy4ykmPHHltYp8bCKY6d
         WzjbYpnbOLKK8HFzvBU2tRzYYasS8ZQ084H6PhnUsjtvF2PE5mh+BttxQkIurQw5MklV
         TVakMN2T7nUAbtLJHQhynSWo1ytjxhmJGGfUmB5OnCwBpPwnzjfCpp+PbWBVI0xqw9JJ
         2/iwY2DguKFfUqMVFSdliNLaQqReBnLTkbnbrA4IPHLRvZsSBMbCkiKw0NdT791bcJ5N
         VVYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kAWx8620v1OHfi2lAQdrT86Qm0UUKh/QtNFu0aEPXjz1HCubPrRXtbzL6Gq+Y1+JuMmnou8NiAG6jCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43W6il1GgVbEi6Oc2myKG6SSEgQrnlsYs+nWxiq7kMWTLok72
	Ao+uv2ZtWD2YZoe9Uajh4nyywk+4PqMHU2zTGGMVHI5/xLYVbmlPy4br
X-Gm-Gg: Acq92OFfHN4O8PQHVQ8PCGtbQH0ZX4mF6gEhyP7zhOoN62jlQUQ9qxOVLwnNCZyh9QO
	ji/pDVaEjsU8KUkDUbXw2eX+VQ1HtPPgOac8bYgpp3Pi8RN+QBGP2xvBHqAqe/EvP6Umz2zQ3FI
	gPlVIZpr6SzJLUUWjsiysZ6LbbLCdEr+KOoItmnvLeIe2qsgeXUFW5J/7bZXmOX1lwlkJV8E8nz
	RvWdVxPAfZuQW6uBVDgo9Dwf9O2YuX8YRrQ/M5m2+8YtP4YxOWfg2VcqPo0a4jGQvai1nWy2NJd
	7quXta3Sns0Ve1tu6BpYPxx9ArcrG8Y7COZDwZoAEXHAUVgcHwPU+mijqJjK9/t6fxi5CHTzjKD
	gksbuJoTUyq939crttMnc3rV93gANdOYW7K3E9mqrtWaDg946ocBvHAvzToIbMPR3//RjsIbGhQ
	1buBLBzKmVaUOK5wi/Dyu2FOE6Kidhp9UO5MUFkChYlmk=
X-Received: by 2002:a05:6000:402c:b0:453:9897:76aa with SMTP id ffacd0b85a97d-45d93eccfbfmr34057576f8f.21.1779136450085;
        Mon, 18 May 2026 13:34:10 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm36967631f8f.11.2026.05.18.13.34.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 May 2026 13:34:09 -0700 (PDT)
Date: Mon, 18 May 2026 22:34:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jihong Min <hurryman2212@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Mario Limonciello
 (AMD)" <superm1@kernel.org>, Yaroslav Isakov <yaroslav.isakov@gmail.com>
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <20260518223405.06cd8fbd.michal.pecio@gmail.com>
In-Reply-To: <f05e075d-a87e-49b5-95f8-5858d21acf64@roeck-us.net>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
	<20260517130407.795157-2-hurryman2212@gmail.com>
	<20260517232147.34931718.michal.pecio@gmail.com>
	<f05e075d-a87e-49b5-95f8-5858d21acf64@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 03:55:52 -0700, Guenter Roeck wrote:
> On 5/17/26 14:21, Michal Pecio wrote:
> > Instead of the X86 heuristic, would it be possible to build glue
> > code if and only if SENSORS_PROM21_XHCI is enabled?
> > 
> > This seems to work:
> > 
> >   config SENSORS_PROM21_XHCI
> >          tristate "AMD Promontory 21 xHCI temperature sensor"
> > -       depends on USB_XHCI_PCI_PROM21
> > +       depends on USB_XHCI_PCI
> > 
> >   config USB_XHCI_PCI_PROM21
> >          tristate
> > -       depends on X86
> >          depends on USB_XHCI_PCI
> > -       default USB_XHCI_PCI
> > +       default USB_XHCI_PCI if SENSORS_PROM21_XHCI != 'n'
> >          select AUXILIARY_BUS
> > 
> > I don't know if it's the best way, perhaps it would be preferable for
> > the hwmon driver to select the glue, but then I'm not sure how to force
> > glue to become 'y' when xhci-pci is 'y'.
> >   
> 
> Unless I am missing something, that would disable the entire controller
> if the hwmon device is not enabled. That seems a bit draconian to me.

I haven't tested (I don't have this chipset), but it should work like
the similar xhci-pci-renesas module, which I'm familiar with.

When the special unicorn module is disabled by Kconfig, xhci-pci no
longer rejects its devices and works with them normally, like it always
did before the unicorn module even existed.

It should be the same with xhci-pci-prom21. You don't need to enable
this module to use USB, only for the special functions. So if hwmon
is disabled then you can disable it too.

I always found this dual-driver solution (for Renesas) rather ugly and
confusing, but so far it's the least bad option tried. Hmm, maybe the
next iteration should be an aux bus interface for FW loaders...

Regards,
Michal
