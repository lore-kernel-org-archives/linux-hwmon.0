Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:32966 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdCQSuY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Mar 2017 14:50:24 -0400
Received: by mail-it0-f42.google.com with SMTP id w124so14652984itb.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Mar 2017 11:49:25 -0700 (PDT)
MIME-Version: 1.0
From: Justin Maggard <jmaggard10@gmail.com>
Date: Fri, 17 Mar 2017 11:42:13 -0700
Message-ID: <CAKgsxVQa-uZb8V2Zgm5P8Gmau9K2a4Z6U4+_W7bjSdS+m6f5ng@mail.gmail.com>
Subject: IT87_REG_PWM[3-5] wrong or obsolete?
To: linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

We've started using an IT8613E chip in some hardware designs, and I
was planning to submit our it87 driver changes to support this new
chip.  IT8613 supports 4 fans, but the fans it supports are fans 2-5.
One of our designs has 3 fans, with the third fan connected to FAN4;
however, I'm unable to control that fan using the current driver.

The reason is, in the current driver, IT87_REG_PWM[3-4] is set to
0x7f, 0xa7. But on IT8613E this should be 0x1e, 0x1f.  I see that
these registers were defined when adding support for IT8620E.  Can
anybody confirm that 0x7f, 0xa7 are correct on that chip?  I'm sure
they weren't just pulled out of thin air, but it seems odd that ITE
would have changed only those register indexes.

Assuming that those registers indexes are important for at least
IT8620E, what would be the desired way to proceed with adding IT8613E
support?

Thanks,
-Justin
