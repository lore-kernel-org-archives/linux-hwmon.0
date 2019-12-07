Return-Path: <SRS0=6LgM=Z5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4304C43603
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 16:49:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72C3F24670
	for <linux-hwmon@archiver.kernel.org>; Sat,  7 Dec 2019 16:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Kh8ibXyt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfLGQtm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 7 Dec 2019 11:49:42 -0500
Received: from mx.treblig.org ([46.43.15.161]:41090 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbfLGQtm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 7 Dec 2019 11:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
        :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=VJ7xGuaP9rLGJiILYURt19PwQgdRW6ZAVwJJhvdND/c=; b=Kh8ibXytjzpXM/hh4bihB/wFux
        JQVsEDvXh3p21wxdck+zhDClGFbQ50SIqhRHkvMPhWfAQQhRlsczbWtHy2kxQFJFiVeHc42E12GcY
        VSDpmIMTBTZZLorUOXRF3efokx2zTqytcAvN9lW5c+6gE3QzLNVutrZIwC/UiDfOoAN/6FlCoNMwh
        DlzaKRUdAb4ALmmc6PUY3403RPvwEY2O9tV3uGC8P5T6BaVcyYZWzj1qF/yYm3nfPMKkK3Jb7A+0T
        HmCxewYEVERCsYRmu4mOOtSaHQTHlipCEFETUg8+crFuF74LjwGmhXy0ST8Jt7ovkc41Gop5UPZPe
        jq7TpiIg==;
Received: from dg by mx.treblig.org with local (Exim 4.92)
        (envelope-from <dg@treblig.org>)
        id 1iddGy-0007Sn-3V; Sat, 07 Dec 2019 16:49:36 +0000
Date:   Sat, 7 Dec 2019 16:49:36 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (w83627ehf) convert to with_info interface
Message-ID: <20191207164936.GA25521@gallifrey>
References: <20191124202030.45360-1-linux@treblig.org>
 <20191124202030.45360-3-linux@treblig.org>
 <20191207135127.GA24852@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207135127.GA24852@roeck-us.net>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/4.19.0-5-amd64 (x86_64)
X-Uptime: 16:42:53 up 97 days, 17:03,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

* Guenter Roeck (linux@roeck-us.net) wrote:
> On Sun, Nov 24, 2019 at 08:20:30PM +0000, Dr. David Alan Gilbert wrote:
> > Convert the old hwmon_device_register code to
> > devm_hwmon_device_register_with_info.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Looks good. I am sure I am missing something, given the size of the patch,

Thanks! I couldn't see an obvious way to split it and keep it working
bisectably.

> but I am going to apply this to hwmon-next.

Great.

> Side note: At some point we should drop support for nct6775 and nct6776
> from this driver.

Hehe it would have probably easier to do that first!  Oh well,
I've added it to a TODO, that means nothing about if/when I'll actually
get around to it!

Thanks again,

Dave


> Thanks,
> Guenter
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
