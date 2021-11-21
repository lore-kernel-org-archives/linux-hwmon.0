Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1F9C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 21 Nov 2021 16:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbhKUQSc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Nov 2021 11:18:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238362AbhKUQSb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Nov 2021 11:18:31 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893C7C061574
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Nov 2021 08:15:26 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id e8so15595261ilu.9
        for <linux-hwmon@vger.kernel.org>; Sun, 21 Nov 2021 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egauge.net; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:user-agent:mime-version:content-transfer-encoding;
        bh=wYeCOd7p9kGBj7Q3Ct50Rhv3BWXTno7uUCRuqGjaPE4=;
        b=Q0yjIr8PAv1CU/miCaAGvQjCI5kOmOPSd4pZ29k4AEDg4yIkHgQMG25KFupr0/rWJd
         tBWpsmFKzXIL4PrM9gLwpsbdHvWmZ3jSDwCiJGDs0oObqwZ3aqf8Khv9jUflsHP5Ts6P
         jMqJa1+7D1oU1eIJ6OTwDVDGnb/UnyKN71ufWWR0du4HrMzH4xm9BRo7qRDypN+mToee
         RV3Or4olZGju35RzUCXTaGI3in31KGYFUaPx9uV57spxMnoNMUwXJr4VN2aCMbINFv10
         49yjfoGHGvRuoqZezEsqlIZ1Drj8YkfNMCjey8h4uemDMrQpT4TMbykNFK1PRrXC1sbm
         NEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=wYeCOd7p9kGBj7Q3Ct50Rhv3BWXTno7uUCRuqGjaPE4=;
        b=OBL0JGaW9eJut1HgIzW5A2ronhPGH+5ket7j9cA08/EpDa1m4bpunzX0RGu5LE93tr
         m7UUi3Dc4Sjar2fXo1NPbrcAFT+TK3eGYIxqxT4JWwms78EiVnko+U+vGRqnhLKXWE5c
         YoMh80MVWmy7bI1N+di8CehygCh74EPJ8XJVd+upxQGL8xksmDM4II6N/TrTBlSzfOBD
         PYA2azxzWYKKls9daq5V0yQJuFCVT2JggJCyF+8I/7QLq6G1uJcxu7td9XAi7ZziAjl+
         HJ0heyPS2LIcQcbipTllag2fGmeHyythL8RsuSlOnAXEAvWJ7RCDL/mnsxLXBOZsVyFh
         R0aQ==
X-Gm-Message-State: AOAM533dkPmAEUoxCbPHf3CnGCU/TPIqg9rqqZmpUi/cZzSBmW41GciJ
        pXkS7TV3wq+K5GmZoOUaiEXWo4VaoDpy2ZE=
X-Google-Smtp-Source: ABdhPJx2we4xVeYk90vEZ5TVQsea/Kd8ENExI5kvo/4/A4Q/OPPwiF6+dgPl4HC/IZCFEKWGcL6NAA==
X-Received: by 2002:a92:cb11:: with SMTP id s17mr13105062ilo.321.1637511325854;
        Sun, 21 Nov 2021 08:15:25 -0800 (PST)
Received: from ?IPv6:2601:281:8300:4e0:2ba9:697d:eeec:13b? ([2601:281:8300:4e0:2ba9:697d:eeec:13b])
        by smtp.gmail.com with ESMTPSA id r14sm4534186iov.14.2021.11.21.08.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:15:25 -0800 (PST)
Message-ID: <5c6986c4e0c6ff34bfaf94c30b79c7f3dd21d1a3.camel@egauge.net>
Subject: Re: [PATCH v2 2/2] hwmon: (sht4x) Add device tree match table and
 document it
From:   David Mosberger-Tang <davidm@egauge.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Navin Sankar Velliangiri <navin@linumiz.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 21 Nov 2021 09:15:21 -0700
In-Reply-To: <20211120215148.GA1291159@roeck-us.net>
References: <20211120204053.2299501-1-davidm@egauge.net>
         <20211120204053.2299501-2-davidm@egauge.net>
         <4ebe1f6a-575f-2d34-7839-9055545e5e6b@roeck-us.net>
         <5f5798b3f021c419e94714ba557be0e3a40c671e.camel@egauge.net>
         <20211120215148.GA1291159@roeck-us.net>
Organization: eGauge Systems LLC
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 2021-11-20 at 13:51 -0800, Guenter Roeck wrote:
> On Sat, Nov 20, 2021 at 02:36:39PM -0700, David Mosberger-Tang wrote:
> > On Sat, 2021-11-20 at 13:12 -0800, Guenter Roeck wrote:
> > > On 11/20/21 12:40 PM, David Mosberger-Tang wrote:
> > > > This patch enables automatic loading of the sht4x module via a device
> > > > tree table entry.
> > > > 
> > > > Signed-off-by: David Mosberger-Tang <davidm@egauge.net>
> > > > ---
> > > >   .../bindings/hwmon/sensirion,sht4x.yaml       | 50 +++++++++++++++++++
> > > >   drivers/hwmon/sht4x.c                         |  7 +++
> > > 
> > > This needs to be two separate patches, one the devicetree change and the other
> > > the source code change. DT maintainers need to be copied on the devicetree
> > > patch.
> > 
> > Isn't that going to be confusing if one but not the other patch makes
> > it into a repository?  Either you end up with an undocumented device
> > tree property or you end up with documentation for an unsupported
> > property.
> > 
> This is a trivial device, so that isn't really an issue. Otherwise,
> if there are real bindings to approve, I would not accept the patch
> making the code change unless the devicetree patch is approved,
> and I would typically apply both together.

Got it, thanks for the explanation.

  --david


