Return-Path: <SRS0=/An6=SW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236F7C282E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 02:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D30FA21736
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 02:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6tiBYnN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfDTCoY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Apr 2019 22:44:24 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:40169 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfDTCoY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Apr 2019 22:44:24 -0400
Received: by mail-io1-f44.google.com with SMTP id i21so5121586iol.7
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Apr 2019 19:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Uj2SJ4WYFff73GX1rlxJ0qaFWQ6wjgD+NrHFkaX1d8U=;
        b=T6tiBYnNd3r1174Jxxokah/fH0xpxiyonpuTuNjfjLXS15l+Jb4HZfS6BjsTfZk78t
         e7E44YytZKs9Vs199ybAYj0o1SFTiLAQVE2UCZoJ+q5gtlOwbArr87RR0GLMsOTByaH9
         g4welnpJjsctoR8P4CgBW08l2D0mBvl20S1Wr4SDGaBfx+f7mg/wa0qTT87iUFl/3rld
         GqoY+424tY/4C9l/DPS1b9fDR6DHt/MI7Xr/N2NRlDiK86x/wJk1TYNcTPSAFHQItKe+
         yt3z2cH0EQoKc9w5FjlMKYknFZzGFRX9gggm7Iq7Bn1CpsPl1oMMmTLBfJ65rpyqt/YM
         G2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Uj2SJ4WYFff73GX1rlxJ0qaFWQ6wjgD+NrHFkaX1d8U=;
        b=Vqtu5CtSg706VGA6wwz1+kec/Xw2pOqrilzm9Ef+a5xW1O4QqQNEKKLq44+UG3nYR5
         bfada4G13zbhZovCOKY83wWiC4iBJNWBrWW1eD4dIGtg27grS5uQ+HrhNRdDylwLRNrT
         IYsCwJXfwATgud8uPRSnO4ayTx7YCyjnldB1pWNlJnkm5FnlFLTYJRLlrUDpnML5tb8r
         pwuSYnH0V1BCStL8EAwZRX1HahlgiPG6NpnA6IUFdfzJb/Ee0bJ0L9ZGsziovLm0T1px
         eDpyPEDc5iOw2wIgPF3S9Gc3A8gKXIg78+J3L8hy7+PhKCRJXj5EULpu0ytjpugYW2HN
         kNZA==
X-Gm-Message-State: APjAAAUcrHTpS2g7cy1oeFJC5E82/E64L76B3i//Nc24pniOHikiQZ9A
        xg+HxyKJyWkAMF23SzDpU8kHPX7N3cA=
X-Google-Smtp-Source: APXvYqyjTU2vt4fd6uKRzyxDsFB6axi0Pn9wcV9ZspsNhzldqfS7QPq4aatG+lXO7IYtet4DHWsoEw==
X-Received: by 2002:a5d:88ca:: with SMTP id i10mr4794741iol.261.1555728263164;
        Fri, 19 Apr 2019 19:44:23 -0700 (PDT)
Received: from [10.0.0.19] ([135.0.225.35])
        by smtp.gmail.com with ESMTPSA id h3sm2134454ioh.19.2019.04.19.19.44.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Apr 2019 19:44:22 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v4] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190419134010.GA18697@roeck-us.net>
Date:   Fri, 19 Apr 2019 22:44:20 -0400
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Transfer-Encoding: 7bit
Message-Id: <88FB7777-8789-422F-87BF-4C89D239AF6D@gmail.com>
References: <20190419131520.GA2566@roeck-us.net>
 <20190419134010.GA18697@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> On Apr 19, 2019, at 09:40, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> Can you send me a register dump for the chip (from i2cdump) ? 

Here you go...

~# i2cdump -f -r 0x0-0x16 -y 0 0x1b b
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 00 00 12 12 ff ff ff ff 00 00 00 00 01 01 01 01    ..??........????
10: 01 01 01 01 1f 1f 02                               ???????         

Our board has the max6650 and doesn't have the tach line connected.
