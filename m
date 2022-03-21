Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AF1C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Mar 2022 23:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbiCUXq0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Mar 2022 19:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbiCUXqZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Mar 2022 19:46:25 -0400
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640AF44A02;
        Mon, 21 Mar 2022 16:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1647906299; x=1679442299;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=ueRSuVzTY8ZsDESSE/vsPM+hyCtCDS7Tl3WulToFkI8=;
  b=GB1TaDgn+z44qqUDYD64I8R5BqFrcPn48LMeMyvG+z0+apHDhOwmA3jA
   CsyISfhmQk1g5KXUAnevEjXGIRkvPcVS48cfPlSuptAURSN2fZpcEgqiS
   zrhpbfMV8yrPoMTJY4foF/qjeSMdpmAkuQfL1k0+zaXHrAkN8blARuRrk
   U=;
X-IronPort-AV: E=Sophos;i="5.90,199,1643673600"; 
   d="scan'208";a="72903802"
Subject: Re: [PATCH 1/1] drivers: hwmon: jc42: add HWMON_C_TZ_REGISTER
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP; 21 Mar 2022 23:44:58 +0000
Received: from EX13MTAUWC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com (Postfix) with ESMTPS id B594481AF0;
        Mon, 21 Mar 2022 23:44:56 +0000 (UTC)
Received: from EX13D05UWC003.ant.amazon.com (10.43.162.226) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Mon, 21 Mar 2022 23:44:56 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC003.ant.amazon.com (10.43.162.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.32; Mon, 21 Mar 2022 23:44:55 +0000
Received: from localhost (10.119.251.239) by mail-relay.amazon.com
 (10.43.162.232) with Microsoft SMTP Server id 15.0.1497.32 via Frontend
 Transport; Mon, 21 Mar 2022 23:44:55 +0000
Date:   Mon, 21 Mar 2022 16:44:55 -0700
From:   Eduardo Valentin <eduval@amazon.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Eduardo Valentin <eduval@amazon.com>,
        Jean Delvare <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Eduardo Valentin" <evalenti@kernel.org>
Message-ID: <20220321234455.GB3248@uf8f119305bce5e.ant.amazon.com>
References: <20220318233011.13980-1-eduval@amazon.com>
 <9cec7367-e6ec-5fe4-94ce-c908452c9385@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9cec7367-e6ec-5fe4-94ce-c908452c9385@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Mar 19, 2022 at 06:01:27PM -0700, Guenter Roeck wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 3/18/22 16:30, Eduardo Valentin wrote:
> > Add a thermal zone interface to the devices added
> > under jc42 driver. This way, thermal zones described
> > in device tree can make use of the of nodes of these
> > devices.
> > 
> 
> Makes sense. I'll apply the patch, but it is a functional change
> and a bit too risky to include in the upcoming commit window.
> I'll apply it after the commit window closes.

Thank you Guenter. Yeah, this can go on the next window.

> 
> Thanks,
> Guenter
> 
> > Cc: Guenter Roeck <linux@roeck-us.net> (maintainer:JC42.4 TEMPERATURE SENSOR DRIVER)
> > Cc: Jean Delvare <jdelvare@suse.com> (maintainer:HARDWARE MONITORING)
> > Cc: linux-hwmon@vger.kernel.org (open list:JC42.4 TEMPERATURE SENSOR DRIVER)
> > Cc: linux-kernel@vger.kernel.org (open list)
> > 
> > Signed-off-by: Eduardo Valentin <eduval@amazon.com>
> > Signed-off-by: Eduardo Valentin <evalenti@kernel.org>
> > ---
> >   drivers/hwmon/jc42.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> > index cb347a6bd8d9..f40df2f29d41 100644
> > --- a/drivers/hwmon/jc42.c
> > +++ b/drivers/hwmon/jc42.c
> > @@ -443,6 +443,8 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
> >   }
> > 
> >   static const struct hwmon_channel_info *jc42_info[] = {
> > +     HWMON_CHANNEL_INFO(chip,
> > +                        HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
> >       HWMON_CHANNEL_INFO(temp,
> >                          HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
> >                          HWMON_T_CRIT | HWMON_T_MAX_HYST |
> 

-- 
All the best,
Eduardo Valentin
