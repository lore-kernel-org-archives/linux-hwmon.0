Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1999EC7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:23:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3CE221901
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 18:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESFM8cKh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfGVSXg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 14:23:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44748 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfGVSXg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 14:23:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so19506445plr.11
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2019 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XhDKQZse9JGSKhqhD9MpECieZuBBk78b6zZX5isbiA4=;
        b=ESFM8cKh0KeYjOSZN0v1Zd4CLgXNTZCIMrnrK4n6r/+7iK4y6beAJoh0jvpt93YFEk
         916VcmwUZOXexC8XYD2ptH8nmT+rnt76p81rDU8A4BGxEgE19Y3V+bLsNcjyGFpmq260
         R4EBTaENMtB5wZzivLrKveKmZMZqMfo84zntk5krDuUkYNPF1PXgOWWCIWTxGz0fgcK4
         yeyzC8im6xZJ4hD4NF8IouKrfmZGxt/wSk72v3f5GvpSLFUezguHMWk+wLdgGtZOTrkm
         1eqxq20I7/E0HHBeGCNgv/yBJe27DQuLbWQ3xi4ihzrHFqlhHSlb2tw9xNaIQKH2nvZ8
         mcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XhDKQZse9JGSKhqhD9MpECieZuBBk78b6zZX5isbiA4=;
        b=OmSpKYqb1/Q5Q79/nvnWjGoCRrfrjIdRrIIsG+G5DfMydNjPpxcn2+/lINJF/i20eb
         e1DITI2PJbxfBRFyjnLQc9ydPQ7NMfrh6QKLOftatImGgqelkWyPgGSwLZLPNdqUkGMS
         eZKUwri1iGHYT6NFmA8NR17EiKHJum3e5MhsjbXkRhKRLa//8eATwOoaNS0CCBKadQWQ
         hKI8hjV7O/c+WeRj5Vi9WQCNCDhp6mZ2RnR+79J9vSeHcSgRuN8V4ztYE4fjjr/ct8M4
         +AyGxiAam0+y5ARTCD+SiVbDjpIz3zYscvRovqoBlrBBjjTRCePsO0FthQYlhOcSEsyh
         RaKg==
X-Gm-Message-State: APjAAAV5fRR3X/wnTsDNe7KqYdggHp6iDe/VUgX590fRE4gn/one7AGI
        3wkucc6o3HcGTVBeD7q78DY=
X-Google-Smtp-Source: APXvYqxc0aYQCEYgR3DuNDyPcZE9MwNo+ikVXZ2wG82sjN9kLmgg3uIC9O+otju89CRi3SVHTuoy6Q==
X-Received: by 2002:a17:902:9a42:: with SMTP id x2mr77422324plv.106.1563819815597;
        Mon, 22 Jul 2019 11:23:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w197sm52606521pfd.41.2019.07.22.11.23.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:23:34 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:23:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcel Bocu <marcel.p.bocu@gmail.com>
Cc:     Vicki Pfau <vi@endrift.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon/k10temp: Add support for AMD family 17h,
 model 70h CPUs
Message-ID: <20190722182333.GA16112@roeck-us.net>
References: <20190718182617.6964-2-marcel.p.bocu@gmail.com>
 <20190722174653.2391-1-marcel.p.bocu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722174653.2391-1-marcel.p.bocu@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 08:46:53PM +0300, Marcel Bocu wrote:
> It would seem like model 70h is behaving in the same way as model 30h,
> so let's just add the new F3 PCI ID to the list of compatible devices.
> 
> Unlike previous Ryzen/Threadripper, Ryzen gen 3 processors do not need
> temperature offsets anymore. This has been reported in the press and
> verified on my Ryzen 3700X by checking that the idle temperature
> reported by k10temp is matching the temperature reported by the
> firmware.
> 
> Vicki Pfau sent an identical patch after I checked that no-one had
> written this patch. I would have been happy about dropping my patch but
> unlike for his patch series, I had already Cc:ed the x86 people and
> they already reviewed the changes. Since Vicki has not answered to
> any email after his initial series, let's assume he is on vacation
> and let's avoid duplication of reviews from the maintainers and merge
> my series. To acknowledge Vicki's anteriority, I added his S-o-b to
> the patch.
> 
> v2, suggested by Guenter Roeck and Brian Woods:
>   - rename from 71h to 70h
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> Signed-off-by: Marcel Bocu <marcel.p.bocu@gmail.com>
> Tested-by: Marcel Bocu <marcel.p.bocu@gmail.com>
> 
Applied to hwmon-next.

Note that I made a small change to the description of each patch:

s/ he / she /
s/his/her/

Guenter
