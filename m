Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19737C433B4
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Apr 2021 07:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2FB56138B
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Apr 2021 07:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244298AbhDFHWb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244297AbhDFHWa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Apr 2021 03:22:30 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA489C06174A;
        Tue,  6 Apr 2021 00:22:21 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 30so6630577qva.9;
        Tue, 06 Apr 2021 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94LGQmKu191Q4NjqlbEm8nCq1fepKQP22a6U6i4fvKM=;
        b=d2wzKAuRhUOtQz3lioUTVhDmOVR6Sgf7i14zcUb4vuL0tjGr4wX2QnyUkRRm3RBkGr
         G0faRMJ0gvEcQUULecavIK8hiMVMHGv32VrenMELE0kSPfj4FLAo0xg/zPo7FMpYZcXS
         jhwF3pVWx5tBe+fi5N8Qex3WeVBcXRnRaYYtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94LGQmKu191Q4NjqlbEm8nCq1fepKQP22a6U6i4fvKM=;
        b=WaYlDpYF8JDe9GDdXIN0O6rO1Ez7ftqyVbI5zrBsupWHvT2SVVTelZ12oGeRZ/Zgqh
         +A5JkR0vX3++qKJZO6U6SLyQXZofoL5qj40KY7oKwbhpceWj7wDiMBJYzh/pOA1RMCUP
         yz0TQFpj9/raJC8ScD5goQOL0KfiV4pdhvU6l0RTTefkNe4SZIEpSf0beD7QelxV42sD
         9ikYO3QHqN88l6rv4RMrZOkbDGy9kqUPpXU25p+yNzcWVCn/zfBcTRwZ3DPnZH1jVmNZ
         jeS4ub0CaWk6V2vsP8+nrqSLANxCojUatU42RPauiAvlFT9AKTXfIW2kYZ48dtk7JY6t
         FJrQ==
X-Gm-Message-State: AOAM5336fFtVO8blG0ec0Oqr8ZM+BlY7sGXBDJuWy2XVY64lsY7aTxhn
        umZlmIIYz44HZ9CpMIevuRuoFfwPrQT4GC4gLzIiS9ctsgg=
X-Google-Smtp-Source: ABdhPJxDBqEBj5jOidtLo+UqLFoNeCKgX5KSHphsBLUt31DQ5VmmSL+R0vv+5rpslZtCHNtaGXIMxYuYbBmEXgehBXU=
X-Received: by 2002:a05:6214:2607:: with SMTP id gu7mr27129615qvb.18.1617693741145;
 Tue, 06 Apr 2021 00:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210209171235.20624-1-eajames@linux.ibm.com> <38abb74465bacad2ab4a62424d7cef06f344dc4c.camel@linux.ibm.com>
In-Reply-To: <38abb74465bacad2ab4a62424d7cef06f344dc4c.camel@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 6 Apr 2021 07:22:09 +0000
Message-ID: <CACPK8XdWeJN9r3fsLLXn0OYxmM7NDAbONJvnKy+23sEFZMJaUw@mail.gmail.com>
Subject: Re: [PATCH 0/4] occ: fsi and hwmon: Fixes for polling un-initialized OCC
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-fsi@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeremy Kerr <jk@ozlabs.org>,
        Alistair Popple <alistair@popple.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 5 Apr 2021 at 15:34, Eddie James <eajames@linux.ibm.com> wrote:
>
> On Tue, 2021-02-09 at 11:12 -0600, Eddie James wrote:
> > In the event that the OCC is not initialized when the driver sends a
> > poll
> > command, the driver may receive an invalid response. This isn't an
> > error
> > condition unless there is no valid response before the timeout
> > expires. So
> > change the starting sequence number and check for the un-initialized
> > OCC
> > state before returning the response in order to detect this condition
> > and
> > continue waiting if necessary.
>
> Hi Joel,
>
> Do you have any comments on the FSI side of this series?

They look fine to me. Guenter, if you want to take the series through
the hwmon tree I do not anticipate any conflicts.

Cheers,

Joel
