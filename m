Return-Path: <SRS0=IX/m=4J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741C6C35657
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Feb 2020 14:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E608324653
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Feb 2020 14:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="P3BVQdI+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgBUO7i (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Feb 2020 09:59:38 -0500
Received: from mx.treblig.org ([46.43.15.161]:35714 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728712AbgBUO7i (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Feb 2020 09:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
        :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=vFIv1dwmLEvctUlA21Frce+XlkNxhaPdEpGbDXRNUVM=; b=P3BVQdI+Z4D8f9Tl4ivnRpx4Jg
        my8Az1quXUcL2Mo4b4SiOKUhlhtb7QPsJFaqtfrlRKKWN5BCkkdaEo8t0yC5RR4legXRsRL0IVYAs
        zDIQo0/zv7nxnoZ/BDGfmGfojei5N1Y1Llqv/1dSPuuv2E15zZxc6Qexs0DZshDx+dPdPCGEk/GEe
        uvyWSJaSZ57wy1ltArl9AqF4cA5QwnZO9t/b0UPOYwfa+L+o/jnPEGvmAehsFBiGyaNnUsxOgRBp/
        XTEQT7WmhAgviJXZi/3RWmUkd7MRto6IygnUT278fQ467Xu/HfG2gbdXfpIgYC3K789g11VsnLoZG
        xgNaSpnw==;
Received: from dg by mx.treblig.org with local (Exim 4.92)
        (envelope-from <dg@treblig.org>)
        id 1j59mB-0005Jw-Np; Fri, 21 Feb 2020 14:59:35 +0000
Date:   Fri, 21 Feb 2020 14:59:35 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Meelis Roos <mroos@linux.ee>
Subject: Re: [PATCH] hwmon: (w83627ehf) Fix crash seen with W83627DHG-P
Message-ID: <20200221145935.GA8422@gallifrey>
References: <20200220143744.10278-1-linux@roeck-us.net>
 <20200220201642.GD18071@gallifrey>
 <20200220203937.GA23969@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220203937.GA23969@roeck-us.net>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/4.19.0-5-amd64 (x86_64)
X-Uptime: 14:58:14 up 173 days, 15:18,  1 user,  load average: 0.09, 0.08,
 0.02
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

* Guenter Roeck (linux@roeck-us.net) wrote:
> On Thu, Feb 20, 2020 at 08:16:42PM +0000, Dr. David Alan Gilbert wrote:
> > * Guenter Roeck (linux@roeck-us.net) wrote:
> > > Loading the driver on a system with W83627DHG-P crashes as follows.
> > > 
> > > w83627ehf: Found W83627DHG-P chip at 0x290
> > > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > > PGD 0 P4D 0
> > > Oops: 0000 [#1] SMP NOPTI
> > > CPU: 0 PID: 604 Comm: sensors Not tainted 5.6.0-rc2-00055-gca7e1fd1026c #29
> > > Hardware name:  /D425KT, BIOS MWPNT10N.86A.0132.2013.0726.1534 07/26/2013
> > > RIP: 0010:w83627ehf_read_string+0x27/0x70 [w83627ehf]
> > > Code: [... ]
> > > RSP: 0018:ffffb95980657df8 EFLAGS: 00010293
> > > RAX: 0000000000000000 RBX: ffff96caaa7f5218 RCX: 0000000000000000
> > > RDX: 0000000000000015 RSI: 0000000000000001 RDI: ffff96caa736ec08
> > > RBP: 0000000000000000 R08: ffffb95980657e20 R09: 0000000000000001
> > > R10: ffff96caaa635cc0 R11: 0000000000000000 R12: ffff96caa9f7cf00
> > > R13: ffff96caa9ec3d00 R14: ffff96caa9ec3d28 R15: ffff96caa9ec3d40
> > > FS:  00007fbc7c4e2740(0000) GS:ffff96caabc00000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000000000000000 CR3: 0000000129d58000 CR4: 00000000000006f0
> > > Call Trace:
> > >  ? cp_new_stat+0x12d/0x160
> > >  hwmon_attr_show_string+0x37/0x70 [hwmon]
> > >  dev_attr_show+0x14/0x50
> > >  sysfs_kf_seq_show+0xb5/0x1b0
> > >  seq_read+0xcf/0x460
> > >  vfs_read+0x9b/0x150
> > >  ksys_read+0x5f/0xe0
> > >  do_syscall_64+0x48/0x190
> > >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > ...
> > > 
> > > Temperature labels are not always present. Adjust sysfs attribute
> > > visibility accordingly.
> > > 
> > > Reported-by: Meelis Roos <mroos@linux.ee>
> > > Cc: Meelis Roos <mroos@linux.ee>
> > > Cc: Dr. David Alan Gilbert <linux@treblig.org>
> > > Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > 
> That would be Reviewed-by:, not Signed-off-by:. See
> Documentation/process/submitting-patches.rst.

OK, I did Signed-Off because it was mostly the code I'd posted.

> Note that I added "Suggested-by:" to reflect that you provided
> the suggested solution.

Sure,
Reviewed-by: Dr. David Alan Gilbert <linux@treblig.org>


> Thanks,
> Guenter
> 
> > > ---
> > >  drivers/hwmon/w83627ehf.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> > > index 7ffadc2da57b..5a5120121e50 100644
> > > --- a/drivers/hwmon/w83627ehf.c
> > > +++ b/drivers/hwmon/w83627ehf.c
> > > @@ -1346,8 +1346,13 @@ w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> > >  		/* channel 0.., name 1.. */
> > >  		if (!(data->have_temp & (1 << channel)))
> > >  			return 0;
> > > -		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
> > > +		if (attr == hwmon_temp_input)
> > >  			return 0444;
> > > +		if (attr == hwmon_temp_label) {
> > > +			if (data->temp_label)
> > > +				return 0444;
> > > +			return 0;
> > > +		}
> > >  		if (channel == 2 && data->temp3_val_only)
> > >  			return 0;
> > >  		if (attr == hwmon_temp_max) {
> > > -- 
> > > 2.17.1
> > > 
> > -- 
> >  -----Open up your eyes, open up your mind, open up your code -------   
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
