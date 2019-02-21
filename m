Return-Path: <SRS0=LV6A=Q4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F7CC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 15:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F9D020823
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 15:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUiE5wax"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfBUPrl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Feb 2019 10:47:41 -0500
Received: from mail-io1-f54.google.com ([209.85.166.54]:42619 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfBUPrl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Feb 2019 10:47:41 -0500
Received: by mail-io1-f54.google.com with SMTP id p196so1835193iod.9
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Feb 2019 07:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Whon/XJ0FFT+aeo+mROB2jxxgSE1ZJSMmU+/YCaDep8=;
        b=YUiE5waxPSfXpO3lhaE7SXTfN2/vTRfeeCML7SFsppJ63KxQqMXtNDk+dfLUtp7AVZ
         Ebuhel7nst12U+Qapv9rLqTbCb8NdlpUGXsdO88G/Zzpp+m9HpAHcpROeQEpYKme1J9g
         ak3iM+5uB+nT+6Z2X/NLx4wCczNd3zawVF8bUq0KIQVzrKrzq4jzOUxF8dazBY+Ug/7U
         AeeAAN3LU/YAzLwIbxIaWxhFhaqG2QQxO5YOfrunV72Mfig1CI3N1+UWmq99GYkTq0ux
         xmuoHZaZiAjZnEAA2QOue4dfuANR75FkkgetnukT3C+9oXzExbWfGhTTKUw13xnLgKGl
         JRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Whon/XJ0FFT+aeo+mROB2jxxgSE1ZJSMmU+/YCaDep8=;
        b=i9Mqf2ijPoBAKnSEPRQNS/oJH/Kl9KT5t/Cb6yUft5Og9KrfzChCkurt0oAlhVOP/p
         rBkxdi1QieU36ApuT4SMDwaO9bKujKvK/ZIn8dEEnA48qKEo13BMIWIZL9OtvkWtvhtT
         1m6FBVczKswKa8+DWcQuigt7wNiC7fz+gOfINqhMdLDjwjnswCx3xN/P2699PB8fvQU3
         uhGnwq0CPX5qyfVI39Q4G/N883T8prbUaaSW+Fh2ea0HprZKzxZUcF0KWFjJLZH/rAlE
         oZdxaTHHDx9OMU8Cbka/avzq7rH90sTxHEdsCBdj1F9sS4gkUYt3JWnwYbSkiEtNKzUZ
         ryKQ==
X-Gm-Message-State: AHQUAuZpRIstWPecRPFwmjR6B2KkX18UpjRXmNulYmY4zzuaBb2gTjrr
        W10ZzWTCrIrU8IMMRcpbPGO+WCntUCcR7odQXaZpog==
X-Google-Smtp-Source: AHgI3IaSnPOqhBtD1530aBHtfZfOKynwFG+ZCs1cEQTPvxrXI8dm/xzkAm3f7i/7dKZ9mq1M6h1e4LivfU8LMVnjnqk=
X-Received: by 2002:a5e:9807:: with SMTP id s7mr12324464ioj.90.1550764060190;
 Thu, 21 Feb 2019 07:47:40 -0800 (PST)
MIME-Version: 1.0
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
In-Reply-To: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
From:   Vinay Simha B N <simhavcs@gmail.com>
Date:   Thu, 21 Feb 2019 21:17:28 +0530
Message-ID: <CAGWqDJ6+uOsgNaKsOmjT7J4RoJqxaU_Ce4vz0dRiFQXHELrSmA@mail.gmail.com>
Subject: tmp102 hwmon accessing temp1_input, max, max_hyst
To:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hi,

could you please suggest, how to export_symbol the tmp102 temp1_input,
max and max_hyst values to another kernel driver?

 We can acess the values from
filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
kernel space, but is there better apporach to access the values in the
kernel space.

 --
regards,
vinaysimha



-- 
regards,
vinaysimha
