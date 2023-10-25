Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83189C0032E
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 Oct 2023 18:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjJYSwB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Oct 2023 14:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjJYSwA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Oct 2023 14:52:00 -0400
X-Greylist: delayed 1752 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Oct 2023 11:51:57 PDT
Received: from dsmtpq4-prd-nl1-vmo.edge.unified.services (dsmtpq4-prd-nl1-vmo.edge.unified.services [84.116.6.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C91116
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Oct 2023 11:51:57 -0700 (PDT)
Received: from csmtpq1-prd-nl1-vmo.edge.unified.services ([84.116.50.35])
        by dsmtpq4-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ian@nartowicz.co.uk>)
        id 1qviWh-0068d4-WA
        for linux-hwmon@vger.kernel.org; Wed, 25 Oct 2023 20:22:43 +0200
Received: from csmtp6-prd-nl1-vmo.nl1.unified.services ([100.107.82.136] helo=csmtp6-prd-nl1-vmo.edge.unified.services)
        by csmtpq1-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ian@nartowicz.co.uk>)
        id 1qviWf-00CUFT-6j
        for linux-hwmon@vger.kernel.org; Wed, 25 Oct 2023 20:22:41 +0200
Received: from debian.org ([86.21.43.223])
        by csmtp6-prd-nl1-vmo.edge.unified.services with ESMTPA
        id viWeqe7tEQDxRviWeqbemj; Wed, 25 Oct 2023 20:22:41 +0200
X-SourceIP: 86.21.43.223
X-Authenticated-Sender: nartowicz1@virginmedia.com
X-Spam: 0
X-Authority: v=2.4 cv=MPKm2uVl c=1 sm=1 tr=0 ts=65395cf1 cx=a_exe
 a=aIvW/Ouf3UKHr+Uc+8N64w==:117 a=aIvW/Ouf3UKHr+Uc+8N64w==:17
 a=kj9zAlcOel0A:10 a=bhdUkHdE2iEA:10 a=_jlGtV7tAAAA:8 a=U1zdPFG_SzZ1OL1MsFUA:9
 a=CjuIK1q_8ugA:10 a=nlm17XC03S6CtCLSeiRr:22
Date:   Wed, 25 Oct 2023 19:22:39 +0100
From:   Ian Nartowicz <ian@nartowicz.co.uk>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ian Nartowicz <deadbeef@nartowicz.co.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Armin Wolf <W_Armin@gmx.de>
Subject: Re: sch5627 on Fujitsu Celsius W280
Message-ID: <20231025192239.3c5389ae@debian.org>
In-Reply-To: <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
References: <20231024150438.68dd079b@debian.org>
        <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOUwuOU+ZcZ+l/su5UzFCC21pi96r2fpTCN+R1QdcdgvQmZVoIGHipDV6E881+MUO6Id6k8HlUBmVd+uSw1wr3UoT4JVobURH7Pyk9hew/z1EEla2SFw
 oZhh8lBsNf8WwxHk5xZ6iWrMJXWPooBm/eB0GBm8kfDlAwt3E2FyefNwv/YGRmQoSp4iF+uFeQcA7HYyeq6virt6QKGYyw7TVu/0ZIeUVPcgEHlVffCCwYRp
 lY0ErcActTJBD62vmas7UGYWpBAegzHqWqCg3sAGPtkzUDIgn1GPfnFaEaNp5jSc
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 24 Oct 2023 07:48:50 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

>On 10/24/23 07:04, Ian Nartowicz wrote:
>> I just upgraded a Celsius W280 to the 6.1 kernel and noticed that hardware
>> monitoring was gone.  Was working in 5.10.  When I added it to the
>> dmi_override_table, it started working again (with a slightly different
>> device name).  dmidecode shows it as an on board device, type other, status
>> disabled (just the watchdog?), and description "SMsC SuperI/O".
>>   
>
>Weird, this is the second private e-mail I get in a single day.
>Is there some information out there suggesting that kernel maintainers
>should be contacted without copying the mailing list ? If so, tell them
>it is wrong. As warning to everyone, I won't reply any further
>to private e-mails like this.
>
>Looking at the code, try adding ignore_dmi=1 as module parameter when
>loading the driver. I think commit 393935baa45e5c messed it up and
>prevents the driver from loading if the parameter is not provided.
>Maybe the conditions in sch56xx_init() are wrong or too generic.
>Armin, any comments ? Do we need to revert your patch ?
>
>Guenter
>

Apologies for the spam.  I didn't know about the mailing list.  Hopefully this
will be more correct.

I tried the ignore_dmi option.  Used manually on sch56xx-common, I was then
able to modprobe sch5627 and it started working.  Slightly clumsy, loading
sch5627 first wouldn't work. It all worked more smoothly with the modules built
in to the kernel and the option on the command line.

I have no idea how many machines use this chip, but I can't imagine the current
list is comprehensive.  Quite old, though?  Let me know if you need more data
or testing on a relevant machine.

--ian
