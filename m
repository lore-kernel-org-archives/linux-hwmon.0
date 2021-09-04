Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E851C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Sep 2021 15:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F076460E9B
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Sep 2021 15:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237247AbhIDPEo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Sep 2021 11:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236890AbhIDPE1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Sep 2021 11:04:27 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95448C061575;
        Sat,  4 Sep 2021 08:03:25 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so585877oon.2;
        Sat, 04 Sep 2021 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uRzdPnHd9fIR0hd81Spx1ITtPzPFg6GSruXgMkYHH7k=;
        b=mCgLcl6DuYNDLEKlAJg+ahqbq5k0Ze3iiGChZjukfr+X2oAVMWuE7VXw8JCXODEKDQ
         o03CrKbjErl83dmOEQKdIK5Q/7HDMPVbG9WSlDY6nzT+NKpdeR8msdUZVRg7KBd8H46t
         xxeRsYv1G+mQtE0B1pWM7nqfbwrLEhY4du7LxOFI2i78MgHu6eOGT8Eo1XQNo2tRuG32
         FMUJzKNmxReFnh5mzkgTUV4LUAImOx21I/GyFdnRJnOjwRNAOvvJqm+dMBCKHOypVJ6q
         T7jRaj5ET79mHFFS0PuArOJYWX5sQTHZ/MbwUr6yNx9HiHiv+zHV88iyl8kHEJmj785f
         kZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=uRzdPnHd9fIR0hd81Spx1ITtPzPFg6GSruXgMkYHH7k=;
        b=WIbo51Pptr5OopEDSrfp/tW3r5nvaD92dlzvxBHCFrWA3ZymsJMKzoars8TS9yHtHl
         asYOBYL8fS2MSFrVHvfJ5hUhQeW3VONzvQWnIKpB/B4ehnjlf9wBYloRjKVtXtj5B7fg
         sjJdk3m6vhmMBHtxGTGQFddhsJMVmkFLTIyG71OXYtISL8vo78b+pojWpQE2/krsstew
         MAFNW/baoQ6AXV2mqEpdnyGnnVG1ZkQhxLxCRos6g1UFYv6sW9eDb3wQiWiQeAFtsonF
         dDmUnF1V2uRugBQEn45cZV75IoZjQ37jscjz1v2Q4tFOJuA7HsIHV6pDZ6RSHiy36klP
         Xe7g==
X-Gm-Message-State: AOAM530YoJ59EjkomHz3+pXb38Wxslu6jju2j1GSyqJ4ZLPAUV0GCNIR
        Q7gA5obvHyR4VaW8FSVH7i4=
X-Google-Smtp-Source: ABdhPJz3DCw13LHRf3UsdXfnu7JuiwceqDL1lgU9ZEldZcx05VKYXsM1jI6zMeEf9y+IFIN6vYKPFw==
X-Received: by 2002:a4a:2a09:: with SMTP id k9mr7284811oof.79.1630767805007;
        Sat, 04 Sep 2021 08:03:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h3sm538147otu.7.2021.09.04.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:03:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Sep 2021 08:03:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 23/52] dt-bindings: hwmon: Add IIO HWMON binding
Message-ID: <20210904150321.GA3637658@roeck-us.net>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-24-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-24-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 01, 2021 at 11:18:23AM +0200, Maxime Ripard wrote:
> Even though we had the iio-hwmon driver for some time and a number of
> boards using it already, we never had a binding for it. Let's add it
> based on what the driver expects and the boards are providing.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied (assuming this is supposed to be pushed through hwmon).

Thanks,
Guenter
