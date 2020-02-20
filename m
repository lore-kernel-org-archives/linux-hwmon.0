Return-Path: <SRS0=oaIe=4I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4ECC11D0C
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Feb 2020 20:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C333206EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Feb 2020 20:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vhGbS7Uh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgBTUjn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Feb 2020 15:39:43 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43986 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgBTUjm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Feb 2020 15:39:42 -0500
Received: by mail-pg1-f193.google.com with SMTP id u12so2493107pgb.10
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Feb 2020 12:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NawBrMzwE7VycjAjctYJ6PYYjowW18KLQuakaaf+PVw=;
        b=vhGbS7UhtnGwmuaF91MunLcPNNY0k00ZS5UYMgCB+vsFYQfUp3nVQjK5d0h61/nrHh
         v0kdIE4EZU3FUriAu0bprWQ1UcRVaQeocGnLOk7S2DN+9ABNVp/fuWpxhZyrj8FHnOw0
         3HlIn7/AyAf5Od0RVWHQPtkvr2OxCO88C/EPRctm0dwqQHf2+Zoj89cvwYGCV/9bhjCx
         cPEQdH8zBP73eSpq3AtluEEiICnfP2Qr/grvcTXhB9cSYiJI/rk+NmhG8S6xWmLIMV7L
         iH+zrIL8E4xpX4U8Pys153dVP/0gJD3M4P2MU9ZdKS/IBcMSZN7wzb02R4nJHo+I+eWy
         HsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NawBrMzwE7VycjAjctYJ6PYYjowW18KLQuakaaf+PVw=;
        b=l7Ruo3xguHC6Clr8wJEbafLciylv3EzpV0O8OimcjmBSgR8ePo67nFpT4MJTuDOM+0
         Erv0QWIwbBoMP+Hj8ie78/BpCEx434KC5isuzredhFh/WrLTDerGbpyegLEHO13rYZfU
         B3HwiKw4U+3WO5CXuIXEM86mBy/vJfE+eP2TyTB1fGbOmlenF6BN5ZxEndPPWEvIdcTn
         wsF7HLK7JzoLG0klcIVxd1TBa8Fplyo8NOb+tMRfG6NJmGcl9ZG7pZ49hgcyo43Vs2M/
         32RZhIxcriXTMhNbWBncTZg9utH6MgqfGJNsw+hunvXGzNMe6K58iGuPAYQA12elBG0Z
         L4Yw==
X-Gm-Message-State: APjAAAW0DigjBEuyR9db2yqz3SLbZVHzeXz2B+EkjapnMA2XsXxFgK8h
        5WQNPL4nRhm0wEvaICtLdDIVE2Ii
X-Google-Smtp-Source: APXvYqwRu0QJbAaA0vXcsg9Ztc06kBHHIFcKz7JWsi0gM3192qM6N5vyNiB/Zu7zNt3HjuH6lppxAw==
X-Received: by 2002:a63:d109:: with SMTP id k9mr35770561pgg.219.1582231182092;
        Thu, 20 Feb 2020 12:39:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l10sm322574pjy.5.2020.02.20.12.39.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 12:39:40 -0800 (PST)
Date:   Thu, 20 Feb 2020 12:39:37 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Meelis Roos <mroos@linux.ee>
Subject: Re: [PATCH] hwmon: (w83627ehf) Fix crash seen with W83627DHG-P
Message-ID: <20200220203937.GA23969@roeck-us.net>
References: <20200220143744.10278-1-linux@roeck-us.net>
 <20200220201642.GD18071@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220201642.GD18071@gallifrey>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 20, 2020 at 08:16:42PM +0000, Dr. David Alan Gilbert wrote:
> * Guenter Roeck (linux@roeck-us.net) wrote:
> > Loading the driver on a system with W83627DHG-P crashes as follows.
> > 
> > w83627ehf: Found W83627DHG-P chip at 0x290
> > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > PGD 0 P4D 0
> > Oops: 0000 [#1] SMP NOPTI
> > CPU: 0 PID: 604 Comm: sensors Not tainted 5.6.0-rc2-00055-gca7e1fd1026c #29
> > Hardware name:  /D425KT, BIOS MWPNT10N.86A.0132.2013.0726.1534 07/26/2013
> > RIP: 0010:w83627ehf_read_string+0x27/0x70 [w83627ehf]
> > Code: [... ]
> > RSP: 0018:ffffb95980657df8 EFLAGS: 00010293
> > RAX: 0000000000000000 RBX: ffff96caaa7f5218 RCX: 0000000000000000
> > RDX: 0000000000000015 RSI: 0000000000000001 RDI: ffff96caa736ec08
> > RBP: 0000000000000000 R08: ffffb95980657e20 R09: 0000000000000001
> > R10: ffff96caaa635cc0 R11: 0000000000000000 R12: ffff96caa9f7cf00
> > R13: ffff96caa9ec3d00 R14: ffff96caa9ec3d28 R15: ffff96caa9ec3d40
> > FS:  00007fbc7c4e2740(0000) GS:ffff96caabc00000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000000 CR3: 0000000129d58000 CR4: 00000000000006f0
> > Call Trace:
> >  ? cp_new_stat+0x12d/0x160
> >  hwmon_attr_show_string+0x37/0x70 [hwmon]
> >  dev_attr_show+0x14/0x50
> >  sysfs_kf_seq_show+0xb5/0x1b0
> >  seq_read+0xcf/0x460
> >  vfs_read+0x9b/0x150
> >  ksys_read+0x5f/0xe0
> >  do_syscall_64+0x48/0x190
> >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > ...
> > 
> > Temperature labels are not always present. Adjust sysfs attribute
> > visibility accordingly.
> > 
> > Reported-by: Meelis Roos <mroos@linux.ee>
> > Cc: Meelis Roos <mroos@linux.ee>
> > Cc: Dr. David Alan Gilbert <linux@treblig.org>
> > Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
That would be Reviewed-by:, not Signed-off-by:. See
Documentation/process/submitting-patches.rst.

Note that I added "Suggested-by:" to reflect that you provided
the suggested solution.

Thanks,
Guenter

> > ---
> >  drivers/hwmon/w83627ehf.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> > index 7ffadc2da57b..5a5120121e50 100644
> > --- a/drivers/hwmon/w83627ehf.c
> > +++ b/drivers/hwmon/w83627ehf.c
> > @@ -1346,8 +1346,13 @@ w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> >  		/* channel 0.., name 1.. */
> >  		if (!(data->have_temp & (1 << channel)))
> >  			return 0;
> > -		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
> > +		if (attr == hwmon_temp_input)
> >  			return 0444;
> > +		if (attr == hwmon_temp_label) {
> > +			if (data->temp_label)
> > +				return 0444;
> > +			return 0;
> > +		}
> >  		if (channel == 2 && data->temp3_val_only)
> >  			return 0;
> >  		if (attr == hwmon_temp_max) {
> > -- 
> > 2.17.1
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
