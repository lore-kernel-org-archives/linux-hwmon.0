Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354EBC48BCF
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Jun 2021 14:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0598361040
	for <linux-hwmon@archiver.kernel.org>; Sun, 13 Jun 2021 14:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhFMOIk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 13 Jun 2021 10:08:40 -0400
Received: from mout01.posteo.de ([185.67.36.65]:54785 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231782AbhFMOIj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Jun 2021 10:08:39 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id E9033240026
        for <linux-hwmon@vger.kernel.org>; Sun, 13 Jun 2021 16:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1623593196; bh=0fO/biQu6UzHGDaQqIVmZUdYW9zZ982IBt2Ga4Bo+SU=;
        h=Date:From:To:Cc:Subject:From;
        b=WomApdX9wxR2lDrc7kPMTzV5ZLqUXVobgFt+TJjkdhU7jrywd9JJdLoKvs0xNerGH
         1ibKYmLiWfmWE5AIl0gLEtH4Na2Iph9Sb383Ol9TdCN9bfjNYOVp8WTADqGRawdKzJ
         qRXjkh4ZiNb3XhAiZjICOCwzyzjh442lUI7M7gj26Scrq6MnkdQZ4Ujco5sl9tUDnq
         TtquPjQ+azAJddYy8ZhfXgDmvxD+/P5rw5dnIy0SCbomeDosvKJhsD/UgWnP86V0s5
         tnw4+/uDuw9BsYj1xLjQYwc+AN/xY/xjhkTIO2h3XHbw0+/cLpVhB3RGyLX1cF/xcP
         Kth2JxVg8aRug==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4G2xG34xGmz9rxT;
        Sun, 13 Jun 2021 16:06:35 +0200 (CEST)
Date:   Sun, 13 Jun 2021 14:06:34 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: corsair-psu: fix suspend behavior
Message-ID: <20210613160634.52d90cc5@monster.powergraphx.local>
In-Reply-To: <20210604110514.GA1445546@roeck-us.net>
References: <YLjCJiVtu5zgTabI@monster.powergraphx.local>
        <20210603160533.GA3952041@roeck-us.net>
        <20210604071711.78271072@monster.powergraphx.local>
        <20210604110514.GA1445546@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 4 Jun 2021 04:05:14 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Fri, Jun 04, 2021 at 05:17:11AM +0000, Wilken Gottwalt wrote:
> > On Thu, 3 Jun 2021 09:05:33 -0700
> > Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> > > On Thu, Jun 03, 2021 at 11:51:02AM +0000, Wilken Gottwalt wrote:
> > > > During standby some PSUs turn off the microcontroller. A re-init is
> > > > required during resume or the microcontroller stays unresponsive.
> > > > 
> > > > Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
> > > > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > > 
> > > Applied.
> > 
> > Thank you. Though I have an odd question. I would like to change the licensing to
> > a dual license (GPL/MPL) to support the LibreHardwareMonitor project. They want
> > to use my code but use a MPL license. What would be the best way to do this?
> 
> Submit a patch which would need an Acked-by: from everyone who contributed
> to the driver. As far as I can see, that would be Wan Jiabing
> <wanjiabing@vivo.com>, Jack Doan <me@jackdoan.com>, and Colin Ian King
> <colin.king@canonical.com>. I would suggest to ask them first if the license
> change is ok with them.

I got the okay from Jack who had the idea for the precision patch. But the other
two, who did the semicolon and long cast patches do not reply. So what now?

> Guenter
> 
> > 
> > greetings,
> > Will
> > 
> > > Thanks,
> > > Guenter
> > > 
> > > > ---
> > > > Changes in v2:
> > > >   - corrected fixes commit
> > > > ---
> > > >  drivers/hwmon/corsair-psu.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > > 
> > > > diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> > > > index 02298b86b57b..731d5117f9f1 100644
> > > > --- a/drivers/hwmon/corsair-psu.c
> > > > +++ b/drivers/hwmon/corsair-psu.c
> > > > @@ -771,6 +771,16 @@ static int corsairpsu_raw_event(struct hid_device *hdev, struct
> > > > hid_report *repo return 0;
> > > >  }
> > > >  
> > > > +#ifdef CONFIG_PM
> > > > +static int corsairpsu_resume(struct hid_device *hdev)
> > > > +{
> > > > +	struct corsairpsu_data *priv = hid_get_drvdata(hdev);
> > > > +
> > > > +	/* some PSUs turn off the microcontroller during standby, so a reinit is required
> > > > */
> > > > +	return corsairpsu_init(priv);
> > > > +}
> > > > +#endif
> > > > +
> > > >  static const struct hid_device_id corsairpsu_idtable[] = {
> > > >  	{ HID_USB_DEVICE(0x1b1c, 0x1c03) }, /* Corsair HX550i */
> > > >  	{ HID_USB_DEVICE(0x1b1c, 0x1c04) }, /* Corsair HX650i */
> > > > @@ -793,6 +803,10 @@ static struct hid_driver corsairpsu_driver = {
> > > >  	.probe		= corsairpsu_probe,
> > > >  	.remove		= corsairpsu_remove,
> > > >  	.raw_event	= corsairpsu_raw_event,
> > > > +#ifdef CONFIG_PM
> > > > +	.resume		= corsairpsu_resume,
> > > > +	.reset_resume	= corsairpsu_resume,
> > > > +#endif
> > > >  };
> > > >  module_hid_driver(corsairpsu_driver);
> > > >  
> > 

