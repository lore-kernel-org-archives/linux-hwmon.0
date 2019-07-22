Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACE4C7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 22:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35BB721951
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 22:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTmwC7Gf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfGVWBc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 18:01:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33427 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGVWBc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 18:01:32 -0400
Received: by mail-pg1-f194.google.com with SMTP id f20so9072891pgj.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 15:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+wnlujeH2wPJl9YwqIgBKjGPkFfl4ufeXA7OTKT7B8s=;
        b=OTmwC7Gfwae50Sqe1CE3/u5huXGMNrihAD/1dQlsqwh4Ms1BIps8eEAiE+vIVlF8SC
         w+Dvq7Pvvvf7vULcVTsUQf2tn1lkkT0y2GwGbPP2tENthYjYojsh6dGxt7yUnCRgF9ot
         XF8ICs7yf7fAk6jc+1FswOWQd3IUsHMmHJ6RO11yIcbk916vpA+6TDbVb40PDvbLR1ur
         YmiAMsavtBPzVTP+vCyBP3DJqO1P3XKS4mqsRkmH0bUgCgVi1/KjwPg/PMsiRVtMRWJG
         +FcK0RunsGz1gsYuvSRfOYiVoZHY2ED8QmwjJOYU/2Jt5g7qjCjjBw0Yux5M/5W+pCjw
         I3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=+wnlujeH2wPJl9YwqIgBKjGPkFfl4ufeXA7OTKT7B8s=;
        b=WuEy476lx6GcjzRjE88OLEwMq9YTjBS4aLcmP1nRJCIGtKbAcyt3/ZahqcHdNkzq5l
         G8ay+NekIXfv4L32BFFbvXNUkhlMc/caym1npgV/vbi2seAeTz1TIrkUaZRimKhWKM05
         laNF6gj9upax7/rRYjbaIeEE6a4E6z+/F8BRM0GSNat6FIVPyQBg1eUULOd41GIg4s48
         uuL6klfier92fWp0tYG4xuaEBIKsBv3CurftOdoistW8P1/wKNr6JmpcfQdKk0A453XE
         pvmq4NLuxq08mTaQwKTWafqdidi2QuMUqLHSQNvz1Z9bYAMXTdAGzM01NvyJm0SkmFiZ
         3oig==
X-Gm-Message-State: APjAAAWiyHOnY7PNyTXi507Ym1cJ+Cy/XffsxhOSTVmdG3ZmF21EHka6
        GsB+nuzaTNsQ07DcmwJvdSg=
X-Google-Smtp-Source: APXvYqwgT+GNpNczkLNS5naCN4dsSF7CZBzkYMxfEhz8xrELelSCKEnPb3O3Uc4khZx5CuZKFcHeuA==
X-Received: by 2002:a62:2aca:: with SMTP id q193mr2401073pfq.209.1563832891913;
        Mon, 22 Jul 2019 15:01:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v13sm48787483pfe.105.2019.07.22.15.01.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 15:01:30 -0700 (PDT)
Date:   Mon, 22 Jul 2019 15:01:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Vicki Pfau <vi@endrift.com>, "Woods, Brian" <Brian.Woods@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Message-ID: <20190722220129.GA11834@roeck-us.net>
References: <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
 <20190722091245.GA23240@nazgul.tnic>
 <20190722160420.GA16162@amd.com>
 <20190722165105.GA9336@roeck-us.net>
 <20190722173928.GA16597@amd.com>
 <5be62ebf-0930-3ea5-6e0c-936e21450725@gmail.com>
 <9E38F05F-8906-42F8-AB63-EEF2F2DBAD57@endrift.com>
 <5da85f6d-e886-6af8-527c-e5edd9420825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5da85f6d-e886-6af8-527c-e5edd9420825@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 23, 2019 at 12:09:16AM +0300, Marcel Bocu wrote:
> On 22/07/2019 21:11, Vicki Pfau wrote:
> > I'm getting similar variance. Compiling Linux seems to spike the temperature above 70, even with a new CPU cooler, so I'm wondering if there might be an offset I'm missing. It may just be the fan being too slow (going to be reconfiguring the BIOS settings today).
> 
> Thanks for the information! Compiling the kernel gets me to 83°C with
> the stock fan (Ryzen 3700X), and I think I get thermally throttled at
> this point.
> 

Same here, with 3900X. The cores run at ~4GHz each, with stock cooler.
Idle temperature seems to be around 35C.

Guenter
