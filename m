Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6827BC0015E
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 18:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbjGUSar (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 14:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjGUSaq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 14:30:46 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD95330CB
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 11:30:42 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-78374596182so106089739f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689964242; x=1690569042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yp59dRCvjSciqgDn+kCvr1mLdwjK2gJG35rnW+BlTE=;
        b=jomz5JEnhx2wL0F7xJuqKsJN3xh6E9uw/M/1b2j4hjaXvve/16xljWdLJqPm/ik9UC
         B62T8Y1lIlSZcxqycwUT+BD1d7f0tvZvy+QLVN9ZEnAyHcWGjVyDtoP/W/JK6EgzeYs+
         WuIdrwglwaBFENYauMZAT4cC5o6AuXOB2w0qzfMm2IC8WVlaVZxD4gvWUjcpdJB3WQVk
         AEdEvlvgmSWSCPwrsIN9kEAzbUFjgn5Kf/7464knKTHgZIFHBVLbmXWavN5pHsv+yhJU
         tSmUMTFHZuO+wbCZmbXzvmePa0hQHEfyvK0h44WGutwAxVveW8UfwaWgGn2DHQTp0sge
         9ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689964242; x=1690569042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yp59dRCvjSciqgDn+kCvr1mLdwjK2gJG35rnW+BlTE=;
        b=U/uwH5uFtaGmzhDG3pW9q+DuE0IPjM8iu6eErNXQKu1mefspCs93cBgqyGiiQHbO8n
         jfwU4MlgaqXzuqXypH0WurQw5j2YvGLc4PNTnnkZ3brq85MNRtaon8VGYdgpd0q2LnqU
         /2aT0HRsNAA29ox0Z1KPxGvvIgJFkyo5pkH0vKQHstwjw8EdCN6A35cf1XWuj1JOWLyx
         y3SPquuonZpXbZ8fuOo802u9m5dY590XA7ZqMFVuLg55YwefUgirr/Ms7X5wr+SeY4fw
         lRoa6moLw9PLlCWVNF5Q8DYLtZOdaS81FankK5PPkk6KuKuzDI0ivWsAo0Lqo5SezisQ
         H2TA==
X-Gm-Message-State: ABy/qLZtzEPr7c/m/78zDgUUq+IfvQQWYwPIc5wHEkMz+QpuIsdxV9nN
        TPqZ3HgKG3kQFaFJLEmTun31FiiNFos=
X-Google-Smtp-Source: APBJJlFVlf1UsuszvJCRxD6xZBcGyEcIQO1ZKX/XUPkgi01xv6AHCKRJicZiiTELPo/IwKilC76TnQ==
X-Received: by 2002:a6b:5c19:0:b0:787:1a8f:1d08 with SMTP id z25-20020a6b5c19000000b007871a8f1d08mr714295ioh.15.1689964242112;
        Fri, 21 Jul 2023 11:30:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u4-20020a02cb84000000b0042afd174c62sm1172477jap.99.2023.07.21.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 11:30:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 Jul 2023 11:30:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gilles BULOZ <gilles.buloz@kontron.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even
 if PECI1 disabled
Message-ID: <901138a6-af49-4428-9c8c-21cbf5d89796@roeck-us.net>
References: <e6e6c227-6789-9c82-3561-530095f46e02@kontron.com>
 <1dc6bddf-6a31-4fa1-a149-c792beb406de@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dc6bddf-6a31-4fa1-a149-c792beb406de@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 21, 2023 at 11:27:16AM -0700, Guenter Roeck wrote:
> On Fri, Jul 21, 2023 at 07:29:19PM +0200, Gilles BULOZ wrote:
> > Because of hex value 0x46 used instead of decimal 46, the temp6
> > (PECI1) temperature is always declared visible and then displayed
> > even if disabled in the chip
> > 
> > Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
> 
> Applied.
> 

Actually, no, the patch did not apply.

$ git am -s -3 index.html
Applying: hwmon: nct7802: Fix for temp6 (PECI1) processed even if PECI1 disabled
Using index info to reconstruct a base tree...
error: patch failed: drivers/hwmon/nct7802.c:725
error: drivers/hwmon/nct7802.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 hwmon: nct7802: Fix for temp6 (PECI1) processed even if PECI1 disabled
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Please resend and make sure it applies.

Thanks,
Guenter

> In the future, please version your patches and provide change logs.
> Also, please fix your e-mail address configuration to avoid the
> following checkpatch warning.
> 
> From:/Signed-off-by: email name mismatch: 'From: Gilles BULOZ <gilles.buloz@kontron.com>' != 'Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>'
> 
> Thanks,
> Guenter
> 
> > ---
> >   drivers/hwmon/nct7802.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
> > index 9339bfc..024cff1 100644
> > --- a/drivers/hwmon/nct7802.c
> > +++ b/drivers/hwmon/nct7802.c
> > @@ -725,7 +725,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
> >   	if (index >= 38 && index < 46 && !(reg & 0x01))		/* PECI 0 */
> >   		return 0;
> >   
> > -	if (index >= 0x46 && (!(reg & 0x02)))			/* PECI 1 */
> > +	if (index >= 46 && !(reg & 0x02))			/* PECI 1 */
> >   		return 0;
> >   
> >   	return attr->mode;
