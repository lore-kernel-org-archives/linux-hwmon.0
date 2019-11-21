Return-Path: <SRS0=izF8=ZN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A55C432C0
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Nov 2019 14:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFB702071B
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Nov 2019 14:27:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7lfnjf3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfKUO1P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Nov 2019 09:27:15 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41145 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKUO1P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Nov 2019 09:27:15 -0500
Received: by mail-pf1-f195.google.com with SMTP id p26so1759442pfq.8
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2019 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=osHOEhIAzUalQfcLz+T/IXlsbkR4DZxvl7PGoFTWfTM=;
        b=X7lfnjf3Z6gAi5W+pyAj+/qngcnpUlusOCdfbO+UioiYwdGqH/fOPvr05eZciAn7u/
         RK+OT3AYaFJ9w9LORR5b6hXZCea8jVXUj+PnxZHQaiRGX8heRYzv7ukwzjfoovxj6Taf
         WVEYGntM0t5h4WnFK7Kb8I4vuR2QSPgm+kEHjpjv8oFJ/IYF0wu7AsSqEsgarGH14L7b
         SqryOOh03/ob5JnYFl+ZyBfZ73jtHLwkgF+IExCKIqo2/Bw/b7WyCKu56n2YbPG5Wvyc
         hRHslIrstjcaRcCOMsALgZ827eE2MByo753pGQ6DJ8idOFUmA/inXv4aqzVIJkYpcleR
         t65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=osHOEhIAzUalQfcLz+T/IXlsbkR4DZxvl7PGoFTWfTM=;
        b=S5gSUtHcxLmtDDg48eDCQgPYOdkF3Urg7hYkjQY4T1MgKyJRFqh35KY0VQ6C3xVZJh
         +fVGBMeT3OIGrP/gUTqrLUoyhTsRRo1p0EHDX+HZD6/93zJPFW1N8GWBBdExB7GBhuZO
         gz/+QGgbXuG0zyU63RGteXqINIfkLmuU1WioUoWum7QCH9ihsrvn1fwA6GO0JsZDrHSZ
         xAQjIFpm9ypcu1stjNkcj3mjkYwZB4Aja/6vDNBrl2cHPyuiawpLUtZ/zxe2GffksxEP
         oV2IydOIGSsBRGxFxyt0mFBbvih0byH/DLi7hAggy5K8/2fUJooQIXrJZm4xDsne+59w
         84Pg==
X-Gm-Message-State: APjAAAVHN9cqGpqob84T3i+lrCdTxr8vMCVFPvy/R/Fs+7gyEOpRlY2S
        T6Lku4+z93rZ9z8gr4NUwNI=
X-Google-Smtp-Source: APXvYqwwYD2FM1U2oGIp2GJepOd1T0RZsjezlrlDT4Pw//lZpxEaql2fGcOE+GE45bjDPMNV4A5dGw==
X-Received: by 2002:a65:5548:: with SMTP id t8mr2257631pgr.304.1574346434577;
        Thu, 21 Nov 2019 06:27:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s66sm3795149pfb.38.2019.11.21.06.27.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 06:27:13 -0800 (PST)
Date:   Thu, 21 Nov 2019 06:27:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 1/2] nvme: hwmon: provide temperature min and max
 values for each sensor
Message-ID: <20191121142712.GC13249@roeck-us.net>
References: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
 <1573746001-20979-2-git-send-email-akinobu.mita@gmail.com>
 <20191120184827.GA12322@lst.de>
 <CAC5umyh8kbQTPh22CX6uEcR1jNEHxa+5HCjGDahnZ_i1k=cEPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyh8kbQTPh22CX6uEcR1jNEHxa+5HCjGDahnZ_i1k=cEPg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 21, 2019 at 10:48:21PM +0900, Akinobu Mita wrote:
> 2019年11月21日(木) 3:48 Christoph Hellwig <hch@lst.de>:
> >
> > On Fri, Nov 15, 2019 at 12:40:00AM +0900, Akinobu Mita wrote:
> > > +/* These macros should be moved to linux/temperature.h */
> > > +#define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
> > > +#define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
> >
> > Didn't we want to move this to a generic header?
> 
> Yes.  I start preparing for <linux/temperature.h>.
> Once the change is accepted, I'll move the macros to the header.

I agree, it is better to keep that change separate.

Guenter
