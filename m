Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtprelay0042.hostedemail.com ([216.40.44.42]:41598 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750983AbeCZUi3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Mar 2018 16:38:29 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 022F91803A560
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Mar 2018 20:29:01 +0000 (UTC)
Message-ID: <1522096136.12357.21.camel@perches.com>
Subject: [PATCH script] hwmon: Use octal not symbolic permissions
From: Joe Perches <joe@perches.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com
Date: Mon, 26 Mar 2018 13:28:56 -0700
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

drivers/hwmon is the most frequent user of symbolic permissions
like S_IRUGO in the kernel tree.

$ git grep -w -P "S_[A-Z]{5,5}" | \
  cut -f1 -d: | cut -f1-2 -d"/" | sed -r 's/[A-Za-z0-9_-]+\.[ch]$//' | \
  sort | uniq -c | sort -rn | head
   3862 drivers/hwmon
    814 drivers/scsi
    763 drivers/net
    242 drivers/infiniband
    184 drivers/staging
    181 drivers/usb
    158 fs/proc
    150 fs/xfs
    148 fs/
    142 drivers/misc

But using octal and not symbolic permissions is preferred by many
as it can be more readable.

https://lkml.org/lkml/2016/8/2/1945

Rather than converting these piecemeal, perhaps just do them all
at once via a trivial script like the below:

$ git grep -w -P --name-only "S_[A-Z]{5,5}" drivers/hwmon | \
  xargs ./scripts/checkpatch.pl -f --types=symbolic_perms --fix-inplace
$ git grep -w -P --name-only "S_[A-Z]{5,5}" drivers/hwmon | \
  xargs ./scripts/checkpatch.pl -f --types=symbolic_perms --fix-inplace

It's run twice because checkpatch only does 1 conversion per line
and there are some multiple instance lines.

This currently results in a 669 KB patch which is too large
to post but can be easily generated when appropriate.
