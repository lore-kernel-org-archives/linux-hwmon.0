Return-Path: <SRS0=GW+N=ZY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8A3C432C0
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 14:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B100F2146E
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Dec 2019 14:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9C4tUKK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLBOc6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Dec 2019 09:32:58 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43224 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfLBOc6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Dec 2019 09:32:58 -0500
Received: by mail-ot1-f66.google.com with SMTP id p8so2467402oth.10
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2019 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQ0vEDLAXl+OXcybllOp1VVpMEWHftMZW2fx/Uiac6k=;
        b=k9C4tUKKAkEkTlcDlJqQgalb8QthzEROeeqfqBTPkAxYhn88UMF+krc4OqvjtDBw34
         1Vg4FqQAyH1qMkDgtEXKYl9h6UWumXLDnR1w26tpyhKapT9kSuC7IojzFCaktEIoBDfd
         B6pdbo76je4k1zY6eONBMuP+1An4h3f0SRSmVRszVXuiHXHGqBpVasPOqxPinbbqIPGB
         nStwhn67gJc+XYlB7CtdGJ63yHmwQCCYxpG+aTjDo678re6DVB+0etT10gnP3xIF1ubx
         spzySgLLM3Yj58kFeqgcNdmMfyf139ynuqM3Uzrh01KhPbg50WscN7xs0jcX6oU8s5Jp
         /sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQ0vEDLAXl+OXcybllOp1VVpMEWHftMZW2fx/Uiac6k=;
        b=mc8pWJR7WM66EXsrQ21aBlHF70xGJzipkgx9TLDr0gW9CprPZl16jYvlPt1+jKPso2
         3RPXG9VFYIhOPo6pP+PK0J0BDy5Yo8+5F6IuoVqiIk4rajrMiIVx174BVtUXB/7/CkyB
         mneZyBDn1EqccOHb8SMSAnMxhD73CojGHGlw0aYLIjN/wVZAy1gAHIgAjm3/dOfstS7P
         KCHxMNpnG6Fasue5wsY7P7JV6xjh6f1oj73mZD59PHa4D3wvqMkRnUkZudF6wvsxtZkC
         CrHCajMwqdXR4+WIlE6IWfQaiPUESGgLHOLQqMu67tLRenKMLM0Zgywe5IT6trxU2NwN
         OTmQ==
X-Gm-Message-State: APjAAAVTXrlpkcPMO/1hBfUK+8bfipvjrkMqTAzX+pSsp+fOawFNzbPZ
        viG5fwTYZWj974FSnlA9PsI=
X-Google-Smtp-Source: APXvYqx6lVCKxEalKzLYOnvG0BNDxGfBWY5pMHUD0E9dGaubpAeSuq1P74DlrHAMvLqDwDk/4edOaA==
X-Received: by 2002:a9d:1295:: with SMTP id g21mr21379638otg.301.1575297175902;
        Mon, 02 Dec 2019 06:32:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v26sm10624616oic.5.2019.12.02.06.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 06:32:54 -0800 (PST)
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
To:     Corey Ashford <yeroca@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
 <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
Date:   Mon, 2 Dec 2019 06:32:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/29/19 8:48 PM, Corey Ashford wrote:
> On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/29/19 6:11 PM, Corey Ashford wrote:
>>> Hello folks.  I am running a newly-built system that uses an IT8686E
>>> chip.  Currently, the latest kernel from kernel.org doesn't have code
>>> in drivers/hwmon/it87.c to support it, however, I found some source on
>>> the net which has added support for quite a few more variants of that
>>> brand of Super I/O chip:
>>> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
>>> I tried it out by building the module and "insmod"ing it into my
>>> running system, and it appears to work fine.
>>>
>>> It seems the original developer had a difficult time pushing the
>>> changes upstream, so he abandoned the project.
>>>
>>
>> I abandoned the project (and dropped the driver from my github page)
>> because people started _demanding_ that I push the driver from github
>> upstream, without offering any assistance whatsoever.
>>
>>> My thought was that I could add support for just the IT8686E chip as a
>>> single patch, and since I can test it locally I would have a better
>>> chance of getting the patch accepted.  The changes to the source at
>>> the above git tree have quite a number of changes that aren't really
>>> necessary for supporting the IT8686E chip, so I think the patch could
>>> be pretty small, but will still credit the original author.
>>>
>>
>> IT8686 is a multi-page chip, meaning you'll need the entire protection
>> against multi-page accesses by the EC in the system. It also supports
>> the new temperature map. I don't think it is that simple.
>>
>> Guenter
> 
> Thanks for the quick reply!
> 
> When you said they didn't offer any assistance, do you mean assistance
> with testing?  If so, how about if the support is trimmed out for the
> newly-added chips that have no available test system volunteers, and
> then slowly add those back as people make test systems and testing
> time available.  Should I presume that you have access to one or more
> systems with the added ITnnnn chips?  I volunteer my system for
> testing the IT8686E support.
> 

Testing and, more importantly, detailed code review. No one but me has
seriously (if at all) scrutinized that code for years. Just picking it
into mainline and hope that it won't cause trouble is, by itself, troublesome.

On top of that, the multi-page access problems are well known by board vendors
using this chip as well as by the chip vendor. Yet, neither board vendors nor
ITE talk with kernel developers. The workarounds I implemented are based on
information I got from one of the Windows tools developers, and are not
validated by any board vendor nor by ITE. Every board vendor I tried to contact
tells me that they don't support Linux, and I never got any reply from ITE.
I do know that the code causes problems on early Gigabyte board using the 8686
and similar multi-page chips. Just accessing the chip from Linux may cause trouble
because the built-in EC tries to access it as well in parallel (I suspect this
causes the board to reset because that access is turned off for a while by
the driver). This is all fine for an out-of-tree driver, but it would be
unacceptable in the upstream kernel.

In summary, you'll not only need to port the code, you'll also need to establish
contact to ITE and/or to board vendors to ensure that the code works as intended
with the EC on the affected boards.

Guenter
