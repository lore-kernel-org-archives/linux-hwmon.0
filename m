Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080BEC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 17:55:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D186761100
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 17:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhIGR5B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 13:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhIGR5B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Sep 2021 13:57:01 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEC3C061575;
        Tue,  7 Sep 2021 10:55:54 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so91751otk.9;
        Tue, 07 Sep 2021 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RxShzJUquK9IIJMai1wDTI5tYv/F11BXWw1arxXCJDY=;
        b=MAAjgQH3VnuFrjvuwTjcI23341xBM14lYXk//XJ/YOzbTdlbBVWw8AGli93TQX9+Qq
         Z6hHeMxqTeZpVA7DiDZEA0cuNIr8fQm3MKwNMr+HB+RNw1c8D66oOnIuJ0Zo2vP+OXEj
         zrbZVD63cFGmp0Rr65TypuvbulM131ATg9ZylsS0TzULuJphkq/xqnX2qn0YKMZ+F1m3
         6TKMyiUTjkIxPQi/0j6BJndbbN20jhHVnrPm3geAzpvNB1IMo4gJHRHJvQaHtoA3+MgY
         4Ti0DFZ6GgtdVHY/OSEkvT4yCHKZK/j+EUqOG6db3dS5FpJTZDZk4AJGePcZE3RPsTja
         wewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=RxShzJUquK9IIJMai1wDTI5tYv/F11BXWw1arxXCJDY=;
        b=iL+sCtNnYGtxkP2jxJLEDPItTgCRvXbbVbJDlydI6N1bY/5R/Y0rA1neGmfUnjeDJb
         BhZP+pI55/1nG1EwOlNnkmDKa1LmMRJ5YGTO3flMQ542/WTH3647N2q3rKI8iZNdrUbD
         zGpr3c+ptBQIcj/rzkbkqW+flkgI9QaJeCqWqRWuhhHMxzJ9ONztA+KEaVgwcnHOqmi7
         xoHkhNDKkOYmyG0H400EyhG4/Hwhsg+/Zfouu4+HaoaAmUXHaur6eEpMAf2ktoPX3MAH
         2DfYLNYAw0/cNgkC5OteUoBHN4wZuZUrhOD4Dlm4EyD603wTn+fBf5RmOQwX88fPfDBu
         F3qQ==
X-Gm-Message-State: AOAM5320pP+RSGXptKtih6fJz9ezpFOYJAWvRVeuEqBnH9oTx6/t4YeW
        ONFR3MathVoeA1fz+9D/igpOddlnYnA=
X-Google-Smtp-Source: ABdhPJxUJI84pkVViCZBSRYzDT0ussuzQnjz0+Ohnxz+nhIiAylRYgvJLKPK9TZy67duIAasLKCu1w==
X-Received: by 2002:a9d:7294:: with SMTP id t20mr16368196otj.275.1631037353992;
        Tue, 07 Sep 2021 10:55:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w6sm2550326otp.3.2021.09.07.10.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 10:55:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Sep 2021 10:55:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: (tmp421) add support for defining labels from
 DT
Message-ID: <20210907175552.GA235361@roeck-us.net>
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
 <30814a02-10f1-2590-26a5-b3f6ff367be1@roeck-us.net>
 <YTemMLjCVMsbteOm@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTemMLjCVMsbteOm@localhost.localdomain>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 07, 2021 at 07:49:36PM +0200, Krzysztof Adamski wrote:
> Dnia Tue, Sep 07, 2021 at 08:46:22AM -0700, Guenter Roeck napisał(a):
> > > +void tmp421_probe_child_from_dt(struct i2c_client *client,
> > > +				struct device_node *child,
> > > +				struct tmp421_data *data)
> > > +
> > > +{
> > > +	struct device *dev = &client->dev;
> > > +	u32 i;
> > > +	int err;
> > > +
> > > +	err = of_property_read_u32(child, "reg", &i);
> > > +	if (err) {
> > > +		dev_err(dev, "missing reg property of %pOFn\n", child);
> > > +		return;
> > 
> > Report to caller
> > 
> 
> My idea was to make those errors in DT non-critical. I.e. if one of the
> child nodes is not well structured, I just skip it but continue the
> probing. Do you think it should be considered critical and I should
> abort the whole probe function as soon as I detect such DT errors,
> instead?
> 
Yes, I do think so. Otherwise people will just generate bad DT files and
never fix them or even on purpose ignore the error messages. I don't want
to see such messages in a production system.

On a side note, I do not accept dev_err/pr_err if the error is ignored.
Either it is an error, or it isn't.

Thanks,
Guenter
