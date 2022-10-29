Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430BAC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 13:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiJ2NAS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 09:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJ2NAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 09:00:17 -0400
X-Greylist: delayed 1591 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 29 Oct 2022 06:00:16 PDT
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A016476DB
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 06:00:14 -0700 (PDT)
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
        id 667C7124AE72; Sat, 29 Oct 2022 14:33:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
        t=1667046822; bh=kplED39BPMPOKR9ZCncJmwFekXx0gyBf5mb/sVGyUtg=;
        h=Date:From:To:Subject:From;
        b=IXl21wWm9qmVNsdMcfwHatv6wytKWlcz2jIeIZ+3LM6KoBAfbJ+RZ4TnO4DE1P3Z2
         PnDXGbAfxs1jNNKj08cgt3sthOGuz8TJYJbuQUMgIp1OEZ3RXfFNXRhXK1r4HcO43/
         8OG2uNRj0NW8gIEbvWBttQ5vXHUbAfRQO9kzczGJ6nIgdfVD87erVmpKUAS5+6imuZ
         LKk34/PIaSOy8SJGCjZSdRFqDtM7NyDFIVBZ+C1mkIojifKyXgh21hpRul58kkjtAt
         IoUkZhlqPQSAekdOFgd8Sci38/zuJSndttxeREdZYl0LcEpVtESlXK7JiQAC8SMi5Q
         roPqQZ9jDKUyQ==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
        by shakotay.alphanet.ch (Postfix) with ESMTP id 31EE61245C97
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 14:33:38 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
        id 2815217FA95; Sat, 29 Oct 2022 14:33:38 +0200 (CEST)
Date:   Sat, 29 Oct 2022 14:33:38 +0200
From:   Marc SCHAEFER <schaefer@alphanet.ch>
To:     linux-hwmon@vger.kernel.org
Subject: Power measurement wrong when idle
Message-ID: <20221029123338.GA11915@alphanet.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

I am using the apu2 embedded platform, which uses an amd64 AMD GX-412TC SOC,
stepping        : 1
microcode       : 0x7030105

With Debian bullseye, the power measurement when idle is very big, and wrong (>
80 .. 100 W). We have observed this behaviour on multiple systems.

The problem did not occur with Debian buster, does not occur with the
temperature sensor, and the power measurement goes back to apparently correct
values when the system is no longer idle.

It does not seem to be linked to amd64 specific firmwares.

The problem lies in the /sys/class/hwmon/hwmon0/power1_average not in the
lm-sensors package (direct reading the /sys files gives the same isue).

So it appears to be within the kernel: 4.19.0-22-amd64 seems ok and
5.10.0-18-amd64 is not.

Funnily, there does not seem to be relevant changes in the specific kernel
driver (fam15h_power).

Any idea what could lead to this strange behaviour?

Thank you for any ideas or pointers.

Examples:

When bullseye is idle, it's completely wrong (' are from me):

cat /sys/class/hwmon/hwmon0/power1_average
94'019'396

When bullseye has 100% CPU used (one core):
cat /sys/class/hwmon/hwmon0/power1_average
10'917'309

The only visible change is that hwmon1 and hwmon0 are interchanged:

bullseye:
   fam15h_power-pci-00c4
   Adapter: PCI adapter
   power1:       88.61 W  (interval =   0.01 s, crit =   6.00 W)
   
   k10temp-pci-00c3
   Adapter: PCI adapter
   temp1:        +54.5 C  (high = +70.0 C)
                          (crit = +105.0 C, hyst = +104.0 C)
   
buster:
   k10temp-pci-00c3
   Adapter: PCI adapter
   temp1:        +59.6°C  (high = +70.0°C)
                          (crit = +105.0°C, hyst = +104.0°C)
   
   fam15h_power-pci-00c4
   Adapter: PCI adapter
   power1:        8.00 W  (interval =   0.01 s, crit =   6.00 W)
   
