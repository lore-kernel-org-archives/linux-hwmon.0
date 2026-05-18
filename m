Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B339184F
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140240; cv=none; b=fDKwkg2pvXSB6zptLric8t1iL12c+ABqY9B+Fp0Gyi2f7nonBPf9jorYcBVRPA8JMD1zCsQ7Ht4peQASGjX2usmUIjp8znlncA09oWj9fe+EhFV99z6R4JCo9VxVXlqalEKOdOQ2Tjz7GAxMW76a48+52sKuc9xrDs8eOuxt4rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140240; c=relaxed/simple;
	bh=i43GTxdyMK+VdcaWSoLpBbK8zz90hQn9yi4OJpouGdo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+kPanhO/ZWKbX7JySNpqo/KalVdqlrKDS9wzKDEF58BVvF4DYVsiy2VhWuIqjyd2HRQ/fGf2ooZQo8NVE3uw2KxJKg2ao8CpB5JvX8DCJj3q2LU7m0QOwdbgeb6YffzAsvQDnFs5C/bt6x/N1Dvl8Eo9zQV/KEgt2drRJB2KUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9w1Fmt5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9w1Fmt5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1529558f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 14:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779140237; x=1779745037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBg9aPiRES77DI0TewWq2NXl4MY6GQ2hEKLNnK9/Z5g=;
        b=P9w1Fmt5l8L3QQ9qR3mbGw8wUtGTw0raoIOd+cap/Bp+FqKCLQPn2RMSRnmv9oKlqy
         dx5NAZzydEyMmoU4GQ8o0hwrXZ+rRz2hhVfr0xBAUNDNyIwhMS0xLKw3x3VzsXF/dxNG
         Ejz0hSI475pAFdproGW3ONtMUq91F6Qq7ccDs05JvP6bU1v6WdtNtgBlYu34k596amrj
         1xueNXvAlhTd9WT0bxGxfJKcm3XQwO6n1kSqMFAgQzko3h8B2dMQmihRhinqumzLkG7A
         /yj7W+0pK4afsc14djjxNS3peijYZ0wmryV5qvcpblB4uV9jWwQgRUzcBt4WQkrjoWKk
         4smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140237; x=1779745037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBg9aPiRES77DI0TewWq2NXl4MY6GQ2hEKLNnK9/Z5g=;
        b=byIJORu71uWULfhatsBVaFo+3m3+whxYsqFCRWK9bigNMczn0J/4uRQJQ/wC9qa/px
         hsW9tpzBpQhQ4K6KsBU8kBb0XJyqVTKBSHTmoZFB8AkBrhzCq3CBnx1Touof7yBcUSqt
         2550MyixKL6wWrOY8oLZv0cSouGqgcr/t64oRPwLOjBPs1hhjuZ7ATdfFHfvtoplxc8S
         n3oNZpfXGGajbQzipWe/eOHh/ii3McnTlVD2li7Rfqo6LKPaWPWRjjxgNQdrCSHjRwc8
         SZ98Kxx8vtDzhzQiLCOfGO24Zuogx1OtihPth6y8dDvvZ7OnAtBUsDiRN9wq13qQQuXo
         w1fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZiFGbc680saNiR1fk+CCWK2krwPknvCujllO0B8NBjClX6Bl5jhikODau1DMxQSvVbMoXb5ZvhGNcIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOuna87b1zL4q5BAws2+3weZ2HcR37GDXFBCR9ts1u0kmrvt0u
	w1XfCOz2mmlEnavV9D+ax0Q7lNTXhBPY/CfEQPLxalFZ/hLJIJPgQu3V
X-Gm-Gg: Acq92OEUJr0BAmVeHPwiO2GFsE4eO2pe7c7PfQYzkuh5LFg9UpLqYsRx5S7kGMvhuwV
	IRXr8uwLV2HMP7wFVA7u71iQGWp8oj6Rkbd2a7b3G+SHy7My/pzxIX+LkiNEreEGuHN3MEFOjzN
	Q2nkQdGGWfykUwhKu12k6bGB4uufp8/ZenUjbot89P/GH4kZ1MW3R/00Fcsd9kWwC6bvji+dJqW
	pqMJ44ox1Kg3jLtxYBfbmkuTBSndhTETWjFqXorETGvTGo1us6Mxjt1/cZUTQ76HpaXMJmz3Cpi
	JQQRZ/qHzPKNMIkRiEI6Y3rHjUfHOODPpYoGzr0JCPHLjDW0QoUUwY+FaauHDngQ13M0FUD+LvO
	rk8SC7IpoAEco1njzDyRvTVlstqtkDOGzINea/EuyJoJuNu540a1xy9lb2G8AOeiEmWbK5CCoBn
	DPIIdRM4N06ka6qfpk55/ZIMgTUKXAfcL3
X-Received: by 2002:a05:6000:4014:b0:441:1fa5:4577 with SMTP id ffacd0b85a97d-45e5c5f20f3mr25992706f8f.26.1779140237042;
        Mon, 18 May 2026 14:37:17 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm38301497f8f.20.2026.05.18.14.37.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 May 2026 14:37:16 -0700 (PDT)
Date: Mon, 18 May 2026 23:37:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Mario Limonciello
 (AMD)" <superm1@kernel.org>, Yaroslav Isakov <yaroslav.isakov@gmail.com>
Subject: Re: [PATCH v6 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <20260518233711.4c99cc72.michal.pecio@gmail.com>
In-Reply-To: <144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
References: <20260517130407.795157-1-hurryman2212@gmail.com>
	<20260517130407.795157-2-hurryman2212@gmail.com>
	<20260517232147.34931718.michal.pecio@gmail.com>
	<144ec61c-4cc1-4986-a16c-7c1b99f3a72e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 May 2026 05:30:47 +0900, Jihong Min wrote:
> On 5/18/26 06:21, Michal Pecio wrote:
>  > Instead of the X86 heuristic, would it be possible to build glue
>  > code if and only if SENSORS_PROM21_XHCI is enabled?
>  >
>  > This seems to work:
>  >
>  >   config SENSORS_PROM21_XHCI
>  >          tristate "AMD Promontory 21 xHCI temperature sensor"
>  > -       depends on USB_XHCI_PCI_PROM21
>  > +       depends on USB_XHCI_PCI
>  >
>  >   config USB_XHCI_PCI_PROM21
>  >          tristate
>  > -       depends on X86
>  >          depends on USB_XHCI_PCI
>  > -       default USB_XHCI_PCI
>  > +       default USB_XHCI_PCI if SENSORS_PROM21_XHCI != 'n'
>  >          select AUXILIARY_BUS
>  >
>  > I don't know if it's the best way, perhaps it would be preferable
>  > for the hwmon driver to select the glue, but then I'm not sure how
>  > to force glue to become 'y' when xhci-pci is 'y'.  
> 
> I think I should keep the current hidden glue option for now.
> 
> The PROM21 PCI glue is part of the PCI binding path for the xHCI
> controller when enabled, while SENSORS_PROM21_XHCI is only the
> optional user-visible hwmon driver. Tying the glue to the hwmon
> option would make the sensor option affect which driver binds the USB
> controller.

That's true.
Making this possible is the whole purpose of "if IS_ENABLED" here:

>  static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS) &&
>  			pci_match_id(pci_ids_renesas, dev))
>  		return -ENODEV;
>  
> +	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_PROM21) &&
> +	    pci_match_id(pci_ids_prom21, dev))
> +		return -ENODEV;
> +
>  	return xhci_pci_common_probe(dev, id);
>  }

Currently, you have a weird situation where xhci-pci-prom21 always
binds on x86 and xhci-pci on other platforms (with the unofficial PCIe
card you mentioned), plus the sensor cannot work on other platforms.

> As Guenter pointed out, that would be too strong; the USB controller
> should not depend on whether the optional hwmon driver is enabled.

One could further argue that neither should it care whether some hwmon
driver exists at all, or which kernel releases it exists in :)

Regards,
Michal
