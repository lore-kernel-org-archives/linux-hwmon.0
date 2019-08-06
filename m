Return-Path: <SRS0=UELc=WC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED68C433FF
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 15:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F6BE2070D
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 15:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOb9IdaB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387489AbfHFP5j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Aug 2019 11:57:39 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:44026 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfHFP5j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Aug 2019 11:57:39 -0400
Received: by mail-pl1-f176.google.com with SMTP id 4so31043048pld.10
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Aug 2019 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3qgui2I+zfB48ojs8ooEiD2uEXewkBooil/uri0HQhc=;
        b=oOb9IdaB2lAh1H6qrqWYQ3qWWli+wxqj27Q8TJg17F1SHN8oJv2ljCQNu05aVrruBa
         CBnBgDVdQyu95elDKz4xwGMno41xmGgCgRaqyc6EPRLc9RLuewu/b7xjSMpq0MYoU544
         XAol38NJu77kcj9lgJVSe/qcqhJpj+Dff/Ts3sAysz/9UTK0qn1t+kjZHkIXFJ9Bzm7S
         8B4Vrjc94tCevfulmYnGh7lrfb3bnVoOxoDU226dscI3VuWJ53nBEjgIo4e6DNR16QpG
         pwqh4BbEEjDsX0mCZRaUiktw+PYekTIoRF30XFyNB4kXfQQz9PSPwYLWKijUI+Rhjcov
         ZY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3qgui2I+zfB48ojs8ooEiD2uEXewkBooil/uri0HQhc=;
        b=WPg8x1oBlk4BzjiyKL36AbPgaWJUxTkkC2WVO6Xlql2l7PAeZr8o9Su8Yoje+vgJxJ
         wmHB9V9xBpoEJoiF2+NAoznF35XtyoBo7/IURHULDczEDRinNRKlVdTdv7kck3nA2LQw
         5MyVLemGSVGJIYKMpfV9mhtGAtX+UjvE39IANvHLgDX+0iGAHx4AMfZWF+A7AER+Ds9S
         TxDFNrjS8yov4ZLGVZJ53RhjDSAQbfwzkd/X7nyUzKap1CfwJ/r20toVrv7O5r/nRaKL
         0vHTY67GJzXzXJKTplO4wguJ6yPPVx5iCLL4Ve6nmGcVGUGykccNyM2sGiRAo9An4oF4
         6vmA==
X-Gm-Message-State: APjAAAWxvbgpILe69HmUDSwy5Zpj7aG3bF0uD8aeMGtmoqEXIF1Vpx5R
        EKa/46iZ7nAiCPSKuckOsFUCk6f/
X-Google-Smtp-Source: APXvYqzMy7x8vsPiOq9pQA2k/RgpM6Kt/mIppoYakW7CDWo0M8/g7xoQG3drAmI2ZrFrOoC9ZtJtaA==
X-Received: by 2002:a17:902:44e:: with SMTP id 72mr3904837ple.326.1565107058833;
        Tue, 06 Aug 2019 08:57:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y12sm98514882pfn.187.2019.08.06.08.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 08:57:38 -0700 (PDT)
Date:   Tue, 6 Aug 2019 08:57:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: new device support doubts
Message-ID: <20190806155737.GF12156@roeck-us.net>
References: <80ab6867e69894f34131dbaac4d41ab0a254cac2.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80ab6867e69894f34131dbaac4d41ab0a254cac2.camel@analog.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 06, 2019 at 07:38:32AM +0000, Sa, Nuno wrote:
> Hi all,
> 
> I'm currently developing a driver for a hwmon device and I have a couple of questions that maybe someone
> in the list can help me with. The device can be found in:
> https://www.analog.com/media/en/technical-documentation/data-sheets/LTC2947.pdf
> 
> This device also has support for measuring charge which, as far as i understand, is not a standard type
> for hwmon subsystem. So, my question is: How should I handle this? Should I just add a SENSOR_DEVICE_ATTR()
> or is there a more appropriate way of handling this (using power supply subsystem)?
> 

The hwmon subsystem is not the appropriate subsystem to report charge levels
(measured in Ampere-seconds as far as I can see). hwmon is about hardware
monitoring.

> Another thing, is that the device supports continuous mode and single shot readings. Only in continuous mode
> we can measure energy and charge, and the device can handle switching modes on runtime. So, can we just add a
> sysfs control file under /sys/class/hwmon/device or is it not the way to go?
> 

I am not in favor of supporting single-shot measurements in the first
place. Most chips support it, but it is hardly ever supported by drivers,
for the most part because power savings are negligible and the downside
of supporting it (programming complexity, delayed readings) is substantial.

What is your use case for both requirements (reporting charge levels
and single-shot mode) ? Both seem mutually exclusive.

Thanks,
Guenter
