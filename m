Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303322F5487
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313878; cv=none; b=Sm10V9oQqvJlPrQ3HYGvvUYjteFrbZG+b7RSa0ZpLVhox3uaGsJ9x8dv4dgMkL1BAvC/3JuRApp/3pt3OMrctaVy5lfNqi7iiwsewwj4kVhzMB1JmoUx6vIrUMs7FeELaSpbfZmXxnep1Ew+q3clu4piRp+omHWZTqPKTtKuEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313878; c=relaxed/simple;
	bh=Mco4r9EXmyjyPO4oUASbisRgUDw0nhNYzOqyZ/qcOPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs/cLqTEGcAOA11VwnCo8D6ikbLHWkNLW0VeWUckwCO/TJpiNzDp6ROnlsBlQ4LfH9L4MPZmxYCME04U5g7ST0YOykrQn6bHh4PmPHwd0FoKTv8simO2Tq7963kvXMC5Kbo+edoIZGCBoMxP0N3PXiNSUF3BK6i/sC5TQgjv4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSCWC5Rq; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSCWC5Rq"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-126ea4e9694so744122c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770313877; x=1770918677; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgAIsdC3q5SlxgjvClDPdeluPF6Rdk5m8LkIrUQoYRk=;
        b=PSCWC5RqMVrEC+MCsLwLE/gerK8O66buyj5IFepg5mYhBQLIk6UTzJTcVc5A3opdO6
         Ck2gtDOWCFvOEnCVnbtXr43CkTn6zzN/NMHhOxzQS/1qGMI82Ol8EnTtyRLiu294xLDd
         D867x1nI8uK8k6hJrdK13JjR+kLPLFw3G2P4PvUPaP3T6SIpS+SRaVRxveK/NGl6YxHh
         nRSPaBaJdzkdD6Vim3ePIBdSncjTYoSTAwGBv72SUHd6d//lkVnqhNQRJda39FDIo4+6
         6e+667MplgmC4KmCWxIR7UYQA5AiKUJg/6cNHPTX2gi5Y+z/08fOQUZ+HD1+G/PVjqga
         XsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313877; x=1770918677;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgAIsdC3q5SlxgjvClDPdeluPF6Rdk5m8LkIrUQoYRk=;
        b=XxUJJOuR9BG0geu49A+gQDeXWmQFHb2Q0Z4GQmbr0t/IZvOYlhqkfgYWgSC9e2AZiR
         B5t+mV/4JxIwBW11FgepjL2JSljCUjKrze26mkwlQbmU/yJQ3D1CGUhO2c/iGjmC3tJj
         K7ZGaX+zOwowklNu9PHHfeI5IVzfT6uIzOKEybx0BIwhvxzCgDhn+lasWTzEIfFkEH1t
         eq/6b2LhEunS/WTX5s36QW5nh97+klzmEsrq7j7qNsGBQsh5GLfgix0gwr9Qlpso62wY
         l8NjFyD62wQbgP1sAJQhfDatgwpy2RQcdR4ZWD3sCehj5dtCs9b8v3YUQKyHY2V0x8aw
         93sA==
X-Forwarded-Encrypted: i=1; AJvYcCUMB6w2TlLPPTBfOP6I8yZ5/LtYxyMGLtZNagq3H3CCaRc3Saqj8hinN+NfK6UuUjAJo9VUquOKI85iBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI14AIseqxV6urKe6ohO3eeNNhwizV8deqhqaK6F/cSVV3AFCp
	SMr9Ddwz1T+oP6g1W+a+x1ZmtS7qC3UXB8euTJ161dRS/zes7rDjekOr
X-Gm-Gg: AZuq6aJhcj612JV4O4Fj24sSEBYfaydiQkt/YYb4LRW4ziMOsyjdUHWH5IepYaVCAMX
	askpunHmxuAdIOx2d/sNDguiLQ0idLx4f0FWsEd/MmSZfJCvJnA3WszlEx7J8yjxUA6zZqGs6/i
	xPRnprqNSphVJoCEcYKbHMU1Un+bjIwp/+JaY21s8/TS2Jq8GvkwVuBcHIlmkj9kAKC41RyW/8K
	GYs3ee+sejnqcgR/eW7+TB7mrDZ+7XRWE6Dey6qcav0qgNt1lmTfEiiVEEkSQL7kbHGmyAEyORc
	xW//6i76emzQ9BmkY1hW/AysvJuv4t1L8pMHoMG53b2lc5kHMggqi3pMjtcZbPsxYAmF1rIuVxl
	JeYW1+DX8LhY/J300po3rYODWMijIlwHGHAmPqPtCQqW3uHfbwFYyDByZaYXaWEU0tHI1XlYz2x
	S/P2Y0Pdusgt7+YXDM8A6+ys9y
X-Received: by 2002:a05:7022:2205:b0:11a:61ef:7949 with SMTP id a92af1059eb24-12703f70359mr49171c88.9.1770313877026;
        Thu, 05 Feb 2026 09:51:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad9a42sm82978eec.1.2026.02.05.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:51:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 09:51:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Raits <igor@gooddata.com>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: [BISECTED]: acpi_power_meter: power*_average sysfs read hangs,
 mutex deadlock in hwmon_attr_show since v6.18.y
Message-ID: <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
References: <CAK8fFZ401-nez_CgDTTnQiPT=oBRRJuYooXyEKFuCdHpGCPXtA@mail.gmail.com>
 <27d60756-d33e-4926-9a02-f52505339de6@roeck-us.net>
 <CAK8fFZ43wrQ8A_bO_g+rKN9O31sxULtqA0hUieZSzEH5KqeW1Q@mail.gmail.com>
 <CAJZ5v0hEu_io2BAzp9weUDHwHngorjZ37GRUK=ngSXNjtp38qw@mail.gmail.com>
 <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
 <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net>
 <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>

On Thu, Feb 05, 2026 at 08:25:57AM +0100, Igor Raits wrote:
> On Wed, Feb 4, 2026 at 11:49 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 2/4/26 11:54, Igor Raits wrote:
> > > I have written a patch with the help of AI and it fixes the problem. Attached.
> > >
> >
> > "No MIME, no links, no compression, no attachments.  Just plain text"
> 
> Sorry for that, I had assumed that attaching the file would make it in-line.
> 
> > ... which means I can not provide inline feedback, which is the whole
> > point of the above.
> >
> > Your patch crosses subsystems, so it will need to be split in two
> > (assuming the ACPI side is even needed). Also, references to iDRAC
> > in common code seem inappropriate.
> 
> Yes, this I believe was the essential part (it was the last piece in
> my testing which fixed the hanging):
> 

Then I'll need to ask differently: What happens if you drop the IPMI code,
and just keep the wait_for_completion -> wait_for_completion_timeout
change ? Would that be sufficient to solve the problem ?

Either case, the need for this change suggests that the ipmi change
may not be complete, since it should send a completion with an error.

Thanks,
Guenter

> diff --git a/drivers/acpi/acpi_ipmi.c b/drivers/acpi/acpi_ipmi.c
> index 5fba4dab5d08..ab1f4b27741d 100644
> --- a/drivers/acpi/acpi_ipmi.c
> +++ b/drivers/acpi/acpi_ipmi.c
> @@ -572,7 +572,18 @@ acpi_ipmi_space_handler(u32 function,
> acpi_physical_address address,
>                 status = AE_ERROR;
>                 goto out_msg;
>         }
> -       wait_for_completion(&tx_msg->tx_complete);
> +
> +       /*
> +        * Use a timeout to avoid blocking forever if the BMC is slow
> +        * or non-responsive (e.g., during iDRAC reset). The timeout
> +        * should be longer than IPMI_TIMEOUT to allow for retries.
> +        */
> +       if (!wait_for_completion_timeout(&tx_msg->tx_complete,
> +                                        msecs_to_jiffies(IPMI_TIMEOUT * 3))) {
> +               dev_warn_once(ipmi_device->dev,
> +                             "ACPI IPMI request timed out\n");
> +               tx_msg->msg_done = ACPI_IPMI_TIMEOUT;
> +       }
> 
>         acpi_format_ipmi_response(tx_msg, value);
>         status = AE_OK;
> 
> > Thanks,
> > Guenter
> >
> > > I don't know how correct it is, but it works :)
> > >
> > > On Wed, Feb 4, 2026 at 2:01 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > >>
> > >> On 2/3/26 15:21, Jaroslav Pulchart wrote:
> > >>
> > >>> ...
> > >>> $ git bisect bad
> > >>> bc3a9d217755f65c137f145600f23bf1d6c31ea9 is the first bad commit
> > >>> commit bc3a9d217755f65c137f145600f23bf1d6c31ea9 (HEAD)
> > >>> Author: Corey Minyard <corey@minyard.net>
> > >>> Date:   Wed Aug 20 14:56:50 2025 -0500
> > >>>
> > >>>       ipmi:si: Gracefully handle if the BMC is non-functional
> > >>>
> > >>>       If the BMC is not functional, the driver goes into an error state and
> > >>>       starts a 1 second timer.  When the timer times out, it will attempt a
> > >>>       simple message.  If the BMC interacts correctly, the driver will start
> > >>>       accepting messages again.  If not, it remains in error state.
> > >>>
> > >>>       If the driver goes into error state, all messages current and pending
> > >>>       will return with an error.
> > >>>
> > >>>       This should more gracefully handle when the BMC becomes non-operational,
> > >>>       as opposed to trying each messages individually and failing them.
> > >>>
> > >>>       Signed-off-by: Corey Minyard <corey@minyard.net>
> > >>>
> > >>>    drivers/char/ipmi/ipmi_si_intf.c | 29 +++++++++++++++++++++++------
> > >>>    1 file changed, 23 insertions(+), 6 deletions(-)
> > >>
> > >> Now that is interesting. Does reverting that patch on top of 6.18.8
> > >> (or any other 6.18 release) solve the problem ?
> > >>
> > >> Thanks,
> > >> Guenter
> > >>
> > >
> > >
> >
> 
> 
> -- 
> 
> Igor Raits | Sr. Technical Manager, Platform Delivery
> 
> igor@gooddata.com
> 
> +420 775 117 817
> 
> 
> Moravske namesti 1007/14
> 
> 602 00 Brno-Veveri, Czech Republic
