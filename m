Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833A3C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 14:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3946521738
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 14:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoU3Rp44"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfDWOjC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 10:39:02 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:38976 "EHLO
        mail-qt1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbfDWOjB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 10:39:01 -0400
Received: by mail-qt1-f177.google.com with SMTP id h16so6018018qtk.6
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=o6bEfGOGyayL4NYw/p8rUHzEHRlli2XqCbKb7W5AlhA=;
        b=SoU3Rp44AMEmtWYCdNduna9uJf99RjD5S0s+4W5j3GyIEgdrpFkX8a1ggLDfn/BpMB
         70qwMpBI15fagRF6ke/FVulFYdLqgawtvo3FILrlJ65TIds4uN3C0FA9BSCCXMSHAwaj
         4cnm3dyoPPuN4Fvvi6UjWlnl54SHvFhYQw3JktUJHPAG9tbMUoO0NEd30M0OLWBXcNX8
         NznGjnEyBUhhV8NC19pkaWDZ+kw6KZYaGb5h4OJ1P+ZWLNFKqM/jVWVM0ZXd/7/YvBFO
         TbiUoWrJX92e3LF9fgv7iRXs5+nw7UdvOrxIQnHVX2m8am+0wJ5kMfsM4t8rPgsNljQP
         ffDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=o6bEfGOGyayL4NYw/p8rUHzEHRlli2XqCbKb7W5AlhA=;
        b=Sfy8ZXvseZINmCGDRMvkQDJo++vDyeN4AGFmbdB3iHJ7+BYT6/sTGPL3TxJ+MNT4pk
         tWai62c1MW4lEZ44leo14jyZZkUegzbsqhn1lx+DKbTs+PG0RqKpy6v6EvFaq/KzTaPd
         AUYJKsUWaxYR76fulcJg26HoNF1ly6PT+sRC9Yqb+Dq/qaR+/FceS7RuIirC2Hbx3rQ0
         sS5E+9R05xjm0T8sJKt2UqqLXiNYEn1AsDbq4XXXQyyed4b4UoN/JcVntrTxL9HWIQh0
         rsASLesru2o8IcvTYDcQ8gLqp5QlF98QNnewQ+fvMDlS2vLorBkW7xb1rO+xirUegghM
         b73g==
X-Gm-Message-State: APjAAAVQzIz2F2U1Zzn+ganCzNTTUzY47+7uDwI0Bd5a8qcqFmE5ODnb
        pa7L3aDU0LEKKNnUDFEgwAqgjzyVAyc=
X-Google-Smtp-Source: APXvYqw9J9Wg8LSQAEZ8I5qZQKq8CGdrmY9Yrb18UknUFKn1VvR8so4bs8HcZaxEqulx7Nr/B4Mp/g==
X-Received: by 2002:a0c:a1a3:: with SMTP id e32mr8090137qva.4.1556030340179;
        Tue, 23 Apr 2019 07:39:00 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id n10sm8892104qte.11.2019.04.23.07.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 07:38:59 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH 11/11] hwmon: (max6650) Fix minor formatting issues
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <1556026391-15360-11-git-send-email-linux@roeck-us.net>
Date:   Tue, 23 Apr 2019 10:38:58 -0400
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E24A867-B97D-4379-AFD5-531DD58C9EA3@gmail.com>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
 <1556026391-15360-11-git-send-email-linux@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Wow, you sure had fun over the weekend! ;)

max6650 looked like it needed some love, nice work.

I am keen to try it out. We are in the integration stage of our board so =
it's a
good time to adopt such changes. The value of our testing would be =
limited
though, since we don't use the tach line at all.

I am not properly setup in my workflow to easily work with patches in =
emails. I
could manage, but it might be easier for me if you had this work in a =
branch on
github/gitlab somewhere... Any chance?

(BTW, are you guys fussed over 80 columns emails here?)

Thanks=
