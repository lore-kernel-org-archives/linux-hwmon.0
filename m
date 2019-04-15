Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1840C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:15:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BCC22070D
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7pqDF0m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbfDOUPB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:15:01 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36349 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbfDOUPA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 16:15:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id 85so9127775pgc.3
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oRrj9N4zohRG7UO6MC/aB4tKIEr8628uiQzEcy6woUY=;
        b=W7pqDF0mnwqexeb16o1Y77WlPVHsEPo18b+gFMNmOwxLtClmNQKWJnL8dehLSHS2ov
         OTUBW5NzsprXpAASTklsD2a1gc8ZKotd0JRR6o49inhr8436CsapDyU6com+4frt8vi5
         tuMLR1nsnQ88f1jOAaQ3yRUxOVgnvDNqWBWdwKdzrIPs9GKHEiTu3XAWOUpkX55iL+/J
         NON7NgHWOfPJmVSWJ0a0EZzd47IPSnpi6wmdySX2wobrzMMN49mg2Dq6AdjQDSiS396C
         +dE+KKMYaKqsR6HiLfS1lAg2N6Q8CaXovaIxNerhZ+k/ZcEtDwHc6ncA5MFG17xccGDB
         tUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=oRrj9N4zohRG7UO6MC/aB4tKIEr8628uiQzEcy6woUY=;
        b=p+DiY4Xxo2ZSRHVbhn7V2d1tkI4leQXsZzfU1Q5+ZmgVYUqoyUuGwejXqM8a4J4vn2
         CvAmwL2zX8Ldn4JlbOcP0kAWjuTI/+kF8GSpJjHTXPhNb6aLDK6gSIk+xcZWSWLteJR7
         Ca7++z3Q9LKZP0GWkiyCuYNxr1UOG86U0aryGhdLuwuNI1AznBOSHfw3EEXRqNFoo2bh
         FRmfzFpJZj7QLenrTf/cHEO6OyaDZB4vqT21VOByB/HoZxivyf2nre9rmOXqclDHA6nC
         npHXlUPnwTADL8tj+05P1DMIxgLYo3SCsRkj3KllRIaAzjNdfRcIF2kp1f8EPnAfp4JJ
         JZmQ==
X-Gm-Message-State: APjAAAUKuPIir5dt7MJmdJhWnOabhxhH84xO1tx8533NTh4JtLNXBA7i
        i0DC3rs4vSZLK8CMd6fIQ5k=
X-Google-Smtp-Source: APXvYqzS1vc6rE/534Tet+EkbpeWhYpxeiuPoRO6JcUawNG5VsZonpjhHGHH+tzNM3iT0TWJbOL7nQ==
X-Received: by 2002:aa7:884b:: with SMTP id k11mr77766204pfo.49.1555359300168;
        Mon, 15 Apr 2019 13:15:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l19sm64206462pff.1.2019.04.15.13.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 13:14:59 -0700 (PDT)
Date:   Mon, 15 Apr 2019 13:14:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 2/4] hwmon: Document the samples attributes
Message-ID: <20190415201458.GA25571@roeck-us.net>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <f7f4bebc95087fb491b6fb50dc8e9a0ffca2fd94.1555273192.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f4bebc95087fb491b6fb50dc8e9a0ffca2fd94.1555273192.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 09:58:40PM +0000, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> Document new ABI attributes: {in,power,curr,temp}_samples and samples.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/sysfs-interface | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
> index 2b9e1005d88b..7b91706d01c8 100644
> --- a/Documentation/hwmon/sysfs-interface
> +++ b/Documentation/hwmon/sysfs-interface
> @@ -756,6 +756,24 @@ intrusion[0-*]_beep
>  		1: enable
>  		RW
>  
> +********************************
> +* Average sample configuration *
> +********************************
> +
> +Devices allowing for reading {in,power,curr,temp}_average values may export
> +attributes for controlling number of samples used to compute average.
> +
> +samples		Sets number of average samples for all types of measurements.
> +		RW
> +
> +in_samples
> +power_samples
> +curr_samples
> +temp_samples    Sets number of average samples for specific type of measurements.
> +		Note that on some devices it won't be possible to set all of them
> +		to different values so changing one might also change some others.
> +		RW
> +
>  
>  sysfs attribute writes interpretation
>  -------------------------------------
