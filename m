Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1FEC10F14
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 18:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7C9B217FA
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 18:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guo5jMgP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390062AbfDRSG1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 14:06:27 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41825 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391480AbfDRSG1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 14:06:27 -0400
Received: by mail-pf1-f195.google.com with SMTP id 188so1454251pfd.8
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vfVGvpsMZhdfqS6WWd7AWNBOevn48YwJgRl+w2jNBos=;
        b=guo5jMgPslLpXmXxLhGRrhJNo/zwzxeWWZzt+UYfD/x3fY7RowRS4EtMPwl1KMkmsD
         tUA6oWQCiCrTQzzNMsyN864y7SWKTiyyIJTqsfkgnyf4BnsYO575KtNGFM3LEMlAF/pr
         NyXbs4dw8CYWDe6oe/f0WPkTqpFVjPZ1bHXyB7fLWLrDyayFNsvv1/sptoBzmhYHN0lg
         0WXfD2zAF08o3OrqlTLcPGPKljHTbt9qQXfAz+Vd7HFoRKQISUpjmwoVLPNrrp6wvmIG
         5hjSpG5kq5OxLPMQuTaLsx7jrYtcjLZJ0gaBxV9vZLS5pnmwcc2aS/ctfMR/k54bnCNG
         4M4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vfVGvpsMZhdfqS6WWd7AWNBOevn48YwJgRl+w2jNBos=;
        b=Ep7+Mtd6sMKvrGg5zgIKt5wvKUy7ji340lujPCaVx2muREjA6i6H+Jkf7b1n4erCEU
         6SOa6XVJhEynHsR77ytt3Tm0Euqxq6lQe0fMu6qsmbYT68sjMu1xGVTZnOACvhz7dgKO
         c9tVkKThz1eaBWIUlnVKZjujpASJOvAdwYVmsUzCS1KXlYMoVFNpsUp5WqPmsbqvTaZe
         /rmOHxFtE3TeeaeNXEaxP/tCWYfkB9KuUZKyp7P3Z29XFipDMKfdJTGUDRSaDKheCnCa
         BFG58+ZLcwYWTJjnba60NfYVkQnh3RV4gmv5qozezDNdK4M/iKNGH73gOKILg8f3jm7f
         zf1g==
X-Gm-Message-State: APjAAAWR+Rxn9nXY/AnKZUVZzszOIqDTcOgvcAdB7KaJug4kpowV/JA2
        ZHgmIe9i2irH9z3tB8tgEC+NCU/+
X-Google-Smtp-Source: APXvYqzbDxFEfXSkzCReyW9Ucn96MXnzWcO2qJbn0j8dGpoWIyTfZ1OOBW+EWItezIOleDjsDqiLAQ==
X-Received: by 2002:a63:c505:: with SMTP id f5mr91081298pgd.87.1555610786040;
        Thu, 18 Apr 2019 11:06:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c62sm6242470pfg.33.2019.04.18.11.06.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 11:06:24 -0700 (PDT)
Date:   Thu, 18 Apr 2019 11:06:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
Message-ID: <20190418180623.GA18588@roeck-us.net>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 18, 2019 at 02:02:48PM -0400, Jean-Francois Dagenais wrote:
> 
> > On Apr 18, 2019, at 13:38, Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> +#if IS_ENABLED(CONFIG_THERMAL)
> > 
> > This will result in missing symbols if THERMAL is built as module
> > and this driver is built into the kernel. You'll have to adjust
> > Kconfig dependencies accordingly. See other drivers for examples.
> 
> Right! Was not a problem for me, but I do remember seing the "funny"
> ifdefs around.
> 

I know, it is annoying. There was an effort to make THERMAL boolean
instead of tristate, but it looks like that has stalled or was
rejected.

> > 
> >> +	data->cooling_dev =
> >> +		thermal_of_cooling_device_register(client->dev.of_node,
> >> +						   id->name, data,
> >> +						   &max6650_cooling_ops);
> >> +	if (IS_ERR(data->cooling_dev)) {
> >> +		err = PTR_ERR(data->cooling_dev);
> >> +		dev_err(&client->dev,
> >> +			"Failed to register as cooling device (%d)\n", err);
> >> +		return err;
> > 
> > Why would it be fatal for the driver if this fails ? It wasn't
> > fatal before.
> 
> Mmmh, you are right. This assumes that all users of max6650 would now require to
> be referred to in some thermal zone. Again, this was not a problem for my test
> environment.
> 
> Wow, two very egocentric issues. Will fix and send V3, thanks for the review!

Not really egocentric. Just keep in mind that there are existing use cases.

Thanks,
Guenter
