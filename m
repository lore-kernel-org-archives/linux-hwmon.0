Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2A7C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Sep 2021 14:18:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 262A060EFF
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Sep 2021 14:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237777AbhIYOUM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Sep 2021 10:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbhIYOUL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Sep 2021 10:20:11 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5BDC061570
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Sep 2021 07:18:37 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id j195so12404497ybj.8
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Sep 2021 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FELeHWRLzFEBrq4obhX73D1BquHMgJ/7I3UYNELg8LY=;
        b=cWjZ+Vzd7/EsxQwed5/RATsnMW3BFCpx5cIGKSepks+ZN2KjVusxgInYeqqNYx189o
         b4SlQQPZd8XtkV9FL3jllx4IL/0NnNyK6JEaYGgTolMvbqxT8ljxdNy+CWbupE3VcNY4
         wayh5uvlkWvCH6P5Hz5bs4A4NeUhwtf3dXqVzOwlsUAWwEPAPn4gjpHxS2acOrr0Lbfn
         A/bIe/lsm5qDEQYZKq8XKhUk5gpazXCqnEYasWOuB/wiKmvUikys1FFH2pK4/H+kxNIr
         7yHiAjb+FSixgiE3fzqb4NXC5XwP64vYgpMWF+4Co4Qad8tkjuG0sFgCC6BXy5Kc3kTT
         uQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FELeHWRLzFEBrq4obhX73D1BquHMgJ/7I3UYNELg8LY=;
        b=uVICiyhqZ3PhggS2WQo33g7wIWNUq4VemBUmHIoqWpCu9brVfrydQHL8ECH54tg1l1
         6WNoNdnht9zWhUJu6A2IuQobnGrwFzznoZ9e5PFFasaXBPoDOGulG2yxPM7lpWuhReJw
         GEAsDBc+JtWmhtekOssOpX1Pi+mc8Rl+xFsXC/jugHc9VlK4CPN4SJnNEmRW30D47aaF
         ZEfeQHlJ+v6rklo+lfDOYV4ZDRFyBsImumoN5oRmbqF0CUY9AaG+ZIH0TfPmZ0edmEm3
         baGXh1gKWTbDa1Xg3JTqaBuPWKukd+Kbj8OO5hNaVeK5ADH+SCAJ+OE3oEZmz7PCzQ4d
         JPjw==
X-Gm-Message-State: AOAM532s22X9FMwP3rCPEH2zLSxjHiAsuYqklC8ttbJoyGDxyVANEO6s
        QQeXWDi+P8m88x8hlq/gUJd+LTd3f+fUmrRBw/Vwp9q5GAw=
X-Google-Smtp-Source: ABdhPJyQCjQ1mjQK6is1W9ruuCO/GsHZRFKXbNTqESLUeqSo0C+HvtjacdMqvPlKKZ3eJcvtX8448I7XJXuN6iXMmx0=
X-Received: by 2002:a25:7449:: with SMTP id p70mr18110062ybc.89.1632579516179;
 Sat, 25 Sep 2021 07:18:36 -0700 (PDT)
MIME-Version: 1.0
From:   Turritopsis Dohrnii Teo En Ming <ceo.teo.en.ming@gmail.com>
Date:   Sat, 25 Sep 2021 22:18:25 +0800
Message-ID: <CAMEJMGGp2gQaiFXhnZ_oMxcnRrWt7WwN8-Mb7u1Xh0iH=2i29A@mail.gmail.com>
Subject: Introduction: I am a Linux and open source software enthusiast
To:     linux-hwmon@vger.kernel.org
Cc:     ceo@teo-en-ming-corp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Subject: Introduction: I am a Linux and open source software enthusiast

Greetings from Singapore,

My name is Mr. Turritopsis Dohrnii Teo En Ming, 43 years old as of 25
September 2021. My country is Singapore. Presently I am an IT
Consultant with a System Integrator (SI)/computer firm in Singapore. I
am also a Linux and open source software and information technology
enthusiast.

You can read my autobiography on my redundant blogs. The title of my
autobiography is:

"Autobiography of Singaporean Targeted Individual Mr. Turritopsis
Dohrnii Teo En Ming (Very First Draft, Lots More to Add in Future)"

Links to my redundant blogs (Blogger and Wordpress) can be found in my
email signature below. These are my main blogs.

I have three other redundant blogs, namely:

https://teo-en-ming.tumblr.com/

https://teo-en-ming.medium.com/

https://teo-en-ming.livejournal.com/

Future/subsequent versions of my autobiography will be published on my
redundant blogs.

My Blog Books (in PDF format) are also available for download on my
redundant blogs.

I have also published many guides, howtos, tutorials, and information
technology articles on my redundant blogs.

Thank you very much.






-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:
https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Targeted Individual Mr. Turritopsis Dohrnii Teo En Ming's
Academic Qualifications as at 14 Feb 2019 and refugee seeking attempts
at the United Nations Refugee Agency Bangkok (21 Mar 2017), in Taiwan
(5 Aug 2019) and Australia (25 Dec 2019 to 9 Jan 2020):

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----
