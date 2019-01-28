Return-Path: <SRS0=CT/L=QE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF7FC282CA
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 00:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B65DC2147A
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jan 2019 00:21:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzHmfq4Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfA1AVy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Jan 2019 19:21:54 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34130 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfA1AVx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Jan 2019 19:21:53 -0500
Received: by mail-pl1-f194.google.com with SMTP id w4so6966877plz.1
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Jan 2019 16:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cQDwBD3ETjMTMBg08mKtyF0Kk5tQuymyH5ooWvASiVg=;
        b=EzHmfq4ZI+8zE1cqSQbWDp9V57GckPffIOKp9dAhzKlKXXsZow5idUuFtseABfKwcF
         JCxPk5hIblUzX7+9TQgZFs8YeGn7KTBt2C77oXJCqOVIBce79Ovh0pgmonjUBXivc4hb
         qG8IbY7HzkTAT5xkqaLBJ4d1urbxMGmyttYR678JxR29EisGXQWz3GQw7urfobyoCvyr
         Yp6MOaUSKQHyzYsq2f1x1JsxXsz2RQbhn9WCaogs5akG+uQjOqSb0x6Fu04vtAhvggUO
         E5yVMPdAWYxfJIdj6Pze5m1GuQS8+jeh98/ZFLCVe8lupcaghF6vX6I9IiCPZEt+QPi/
         K6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cQDwBD3ETjMTMBg08mKtyF0Kk5tQuymyH5ooWvASiVg=;
        b=h4CPEHdgvSHK5XpmAifb5pg81nthKZIV76XbUkXrtIHoCEBDK7QSdI2DHOqWfIlHbv
         NUVs+WRB+WvOVkp7axccix2tWUb3mdBcaJCSzaTIC5Kt7o2IqNdD19wgnUFlet1YcoEO
         iEet2WNQk7Dk/gJQx0zS2yuxRQcd8yj7Ixv1IlaOPCWHGg/kN9ys3AEH2IN14E1oDz4K
         uVlCOpQdIELqnUt3Jt3b4sAnIn6THMKi2AfwI5Vl5+gKWSFb0R4dpSx6Y39K0wBpmYvB
         e4U04hJiCPuZMxv+/RfWUSuOPn74qg/uNv+GO5oJcAA3bQHn+tyaId9hY/ZoY8HuUgBv
         WpPA==
X-Gm-Message-State: AJcUukcA3pUhx1H5hDJKy5ihhUjHflldz05To/+DXpqYo62MaZiCHqXw
        pvEDeStf+YWzRh7PvPzU4ubWFt/K
X-Google-Smtp-Source: ALg8bN6hCESSZ0p3lvxkEjmNDJPu4b8H41jkZaLDwGd0ANo6PyTUomh6UjkJ8+E3awEjOZjQBegAqg==
X-Received: by 2002:a17:902:76cb:: with SMTP id j11mr20210919plt.179.1548634912865;
        Sun, 27 Jan 2019 16:21:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h64sm51445405pfc.142.2019.01.27.16.21.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jan 2019 16:21:51 -0800 (PST)
Subject: Re: nct6775: current code detects too few fan sensors for some
 NCT6793D chips
To:     Chris Siebenmann <cks@cs.toronto.edu>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20190127215959.4431B320112@apps1.cs.toronto.edu>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1ca6ee86-755a-0821-c6d9-26ba160ef0df@roeck-us.net>
Date:   Sun, 27 Jan 2019 16:21:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190127215959.4431B320112@apps1.cs.toronto.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/27/19 1:59 PM, Chris Siebenmann wrote:
>   I have an Asus PRIME Z370-A motherboard, on which I run Fedora. In
> Fedora's 4.19.15 kernel, the nct6775 driver detected all six fan sensors
> on my motherboard.  In their recently released 4.20.3 kernel, it only
> detects five, dropping the sixth fan sensor (which happens to be the
> second chassis fan on this motherboard).
> 
>   I filed a Fedora bug report, and after discussions with the Fedora
> maintainer for this area we think we have narrowed the likely issue down
> to this change:
> 
> hwmon: (nct6775) Separate fan/pwm configuration detection for NCT6793D
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2d99925a15b639026b67bd96419df6f9d760b212
> 
> If I'm reading the before and after code right, the code before the change
> did:
>      fan6pin = !dsw_en && (cr2d & BIT(1));
>      fan6pin |= creb & BIT(3);
> 
> And the code after dropped the '!dsw_en' part and became just:
>      fan6pin = creb & BIT(3);
> 

Sigh. Too much complexity in those chips. Yes, the first line got lost,
but it applies for NCT6793D. Sorry for that. I'll write a patch.

> (I don't know if it's possible for me to probe things in some way to
> see if dsw_en would be set, or even dump the full raw state of these
> registers.)
> 
>   The full Fedora bug report is here, with various things like dmesg
> output and so on from the two kernels on my hardware:
> 
> 	https://bugzilla.redhat.com/show_bug.cgi?id=1669564
> 
> (Hopefully emailing you directly instead of the linux-hwmon mailing
> list is the right choice. I looked at the mailing list archive and
> it seemed to be for development, with lots of patches, instead of
> issue reports.)
> 

e-mailing me, or any other maintainer, directly without copying the
respective mailing list is never the correct choice. It is ok
to copy me, but it is never ok to not let the rest of the community
know that there may be a problem.

Guenter
