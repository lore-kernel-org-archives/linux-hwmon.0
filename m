Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047E27B34E
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603721; cv=none; b=b52rJxBk87X8EC3060RNFgJGuNdYhT7bDZ/6s4NcfBX2lljzB9DAHci1+GYCaWeNLHX22fmJjuNiU6lPYuvhWWbGREWxC58jvcycaX0vZw/Fcg090lX+EWu83zjRejGgKFfgfpRmV5LR0JgEew1RdO8i+6jO8rBXzJo5boe6p8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603721; c=relaxed/simple;
	bh=X3LJtoIF2cz78g7fd2JzTBDARU25iOSmEdSyogFuUdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9vDc5PIWqqy29Y8/egQzj0/Re8cR9U1bCv6Qn2Ras8juwtbGWuqy6BDhwnVkZ8/7UbqKQd5cIF9gfO8Mce7tKAmLj2W67l/c8R3wthpvKm+2xUZ7V8g41QTz4CgnHM7whE+wnS8J8G7thQu1i9HUM1IfodIxjOkbX28Op1/6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GYvcDDYl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=okDmZJZC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GYvcDDYl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="okDmZJZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783603718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
	b=GYvcDDYlHJOkLP67Ka8TxBloIvsChLLBIOPB5hF2f3ZLtOhH2J7o9UIoXnxIUSYxEJiO1k
	1KbSFaZSJ6R2DE8C5On4ytMzkGb+BPh32C+ZidmUHv681uczi9AtaAQsAJroJG3oirc2mQ
	jcqytS17iwHRhQap5lWQIaFBDe995CI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-gLGLbc4iP3-kDZxOrH6UtQ-1; Thu, 09 Jul 2026 09:28:36 -0400
X-MC-Unique: gLGLbc4iP3-kDZxOrH6UtQ-1
X-Mimecast-MFC-AGG-ID: gLGLbc4iP3-kDZxOrH6UtQ_1783603716
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7f582244e9eso33219357b3.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783603716; x=1784208516; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
        b=okDmZJZCbV/HqschLJkt9nqeFZTJ3hCuDQ6lL7v6HyukNUKy4ll6eeT6IqpneiKoQq
         1U8x/sOFC6wGouSTIUlhYBuM0UoesvGpAM0e/XOJ4CUP4T6NGIG2R6lewaV+n+C32RHr
         ueJ5XPC5U4Pa88OIsTVcA6mnwV4kslh/1Mq8AmWljToAHEV05AI5bBOS8/uj2OpMdiBz
         lm8M+1KUGTOXJEmuFOnOSnfZkWH0W1pQ2Nk/8coSNycDaIM5cOe77WZJs+kXjKP+BFYA
         hBp8rZcYSFHF3l+pr1q/MjtnUjKZ+Rn0U3y+gGpLwAtYWpb/ZHBNVfskdBzy21tjCFOK
         peWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603716; x=1784208516;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
        b=WrHaCiRnvDd9RZM8TeaKO7ou8iMowJyCwy/2ccUyhRBl2/O1njwijzLQtmTaM0f1AU
         SvyrQZ/76zYIOtAJTAsKLSMIZTx9vgILoryfK8G7PEMxN2axP70wuLEVI5pMWH9n/QbH
         1qV/rfusWqsuqSvUvHwpL1xwmg4NH08s8wNDAqRCDNTg7yArPJpqi4N6+lTzV50PGDDS
         FzUvmDtvnAbz2fp9V0fTi8NGMSwcNKuCvXrzP7EuYjgDuhSWcDxhCQa8h8ahClbxOlRk
         Xy6owh8VpcobQYOc6LOX99bIuFPVvdV0cBZHXmetQVrNTRYgkUcRUP5EwFGLL+a09PHY
         hVqg==
X-Forwarded-Encrypted: i=1; AHgh+Roz8n7jiw8vfzZkdYDReNG6rp8Jit7u7b7AeFgCOdEi3y7kE+XfPsSDlsP09ConhqGt0Apzb3as/tw6GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYRDiqZrsF7DdXENVs7fdEn783WIHi3Yro50rA2nF+e/rUV2an
	xacpDi8krmHLeFS/ZLpbTy6IDIS56gXqfneCLmdzlRKwM9h1r8uKD/v1ZRUbcgfiThZ6ze1eqNm
	uMeLah5ZKRD0QHMB3EnTLXgZs14ZKYjwJGT62oT+EGY95FBfg2nzXhac5EnJtrm3k
X-Gm-Gg: AfdE7cmA/NZO2FIjXb4ZwdRJ6yGynlpSTj6q612ErlyKN3WmMDLVYzBO4GlkX0fXrLI
	A7XSSPEfveVcOEHylIkmwfzM0iE6QYJTis4Pi06aBNY/Ta0vwjP00FeF1MBUZKSRmWukqK+AF+i
	oynRf70sCg60VFT8Z6Wu9eMchKHV511aw1Fog566p00J6DlMg9t49DSCCNMPR//6ibCMZbi41DV
	dfqUSOlpiZrCaswXgF06Yz4ABAv7NBJCR0dslhf/nMXdnfY2cW0/VXJCKOEWsq12DeNAa+ym4y/
	0rKS+17x9XjR+E+gidPLwA8D/DmOIaBvBMc+47dl7v9sTbhxPVPSutQ3OUrLCUVwcYSCQJy3AXh
	MfJUndgAKwCe8OuaLfrPksilxLzRX9dMURx4BcngCvWJVpg==
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957899d50.14.1783603715986;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957877d50.14.1783603715498;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm4150627d50.16.2026.07.09.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:28:34 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:28:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
Message-ID: <ak-h8oPcL69fCUg2@redhat.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Hans,

On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
> On 9-Jul-26 12:10, Sudeep Holla wrote:
> > On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
> >> On 18-Jun-26 17:56, Bjorn Andersson wrote:
> >>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> >>> modules, but they are then not automatically loaded. Rework the SCMI
> >>> device table alias support to make modpost consume the information from
> >>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> >>> this information, if known. Also add a protocol-based alias to also
> >>> trigger driver loading when only the SCMI protocol id is known.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>
> >> So I just gave this a test spin and unfortunately it does not work.
> >>
> >> The problem with Fedora's kernel-config / setup is that the
> >> request_module() from patch 2/2 runs from the initramfs, but
> >> the scmi_cpufreq module is only available in the rootfs.
> >>
> >> It does work if I explictly add the scmi_cpufreq module to
> >> the initramfs, then it does get autoloaded.
> >>
> >> We really need some place to put a uevent sysfs attr which then
> >> gets replayed when udev is restarted from the rootfs and then
> >> re-reads all the uevent files as part of its coldplug
> >> enumeration.
> >>
> > 
> > I don't have much knowledge on uevent to provide any suggestions/help.
> > But isn't this a generic requirement ? I mean you could have modules
> > install on the rootfs and not all of them are packed in initramfs ?
> > Just wondering if that works for other modules, we can examine how
> > do they work and what are we missing ?
> 
> scmi is special because the actual devices under /sys/bus/scmi/devices
> only get created when the module with the driver is loaded because
> of some funtion/id mapping requiring info from the driver.
> 
> Patch 2/2 tries to work around this by loading all scmi drivers matching
> the scmi protocol which is known at bus enumeration time, but this only
> works if the actual scmi driver is in the initramfs because this done
> through directly calling modprobe() from the kernel which does not
> get "replayed" when switching to the real rootfs.

Should the SCMI drivers be added to the dracut module here?

https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73

A few years ago we had to add the interconnect drivers to the list for
Fedora.

Brian

