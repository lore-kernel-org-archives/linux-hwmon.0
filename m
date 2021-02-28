Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA49C433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 28 Feb 2021 12:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 979F964E4A
	for <linux-hwmon@archiver.kernel.org>; Sun, 28 Feb 2021 12:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhB1MAe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Feb 2021 07:00:34 -0500
Received: from smtprelay0201.hostedemail.com ([216.40.44.201]:44120 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230075AbhB1MAd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Feb 2021 07:00:33 -0500
X-Greylist: delayed 545 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Feb 2021 07:00:33 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 1D6C41828A7E8
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Feb 2021 11:51:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id A34D0837F24D;
        Sun, 28 Feb 2021 11:50:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: lake55_4500ff4276ab
X-Filterd-Recvd-Size: 2254
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Sun, 28 Feb 2021 11:50:45 +0000 (UTC)
Message-ID: <1bf09d848148311a952870113401077dfc956bbd.camel@perches.com>
Subject: Re: [PATCH 11/20] hwmon: Manual replacement of the deprecated
 strlcpy() with return values
From:   Joe Perches <joe@perches.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Romain Perier <romain.perier@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 28 Feb 2021 03:50:44 -0800
In-Reply-To: <3b8dd556-8c09-9686-dec6-9d523a9762a8@roeck-us.net>
References: <20210222151231.22572-1-romain.perier@gmail.com>
         <20210222151231.22572-12-romain.perier@gmail.com>
         <3b8dd556-8c09-9686-dec6-9d523a9762a8@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 2021-02-22 at 07:46 -0800, Guenter Roeck wrote:
> On 2/22/21 7:12 AM, Romain Perier wrote:
> > The strlcpy() reads the entire source buffer first, it is dangerous if
> > the source buffer lenght is unbounded or possibility non NULL-terminated.
> 
> length
> 
> > It can lead to linear read overflows, crashes, etc...
> > 
> Not here. This description is misleading.
> 
> > As recommended in the deprecated interfaces [1], it should be replaced
> > by strscpy.
> > 
> > This commit replaces all calls to strlcpy that handle the return values
> > by the corresponding strscpy calls with new handling of the return
> > values (as it is quite different between the two functions).
> > 
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> > 
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> 
> This patch just adds pain to injury, as the source 'buffers' are all fixed
> strings and their length will never exceed the maximum buffer length.
> I really don't see the point of using strscpy() in this situation.

Might as well just use strcpy (I'd still prefer stracpy)

https://lore.kernel.org/lkml/24bb53c57767c1c2a8f266c305a670f7@sk2.org/T/


