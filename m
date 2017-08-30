Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:34777 "EHLO
        mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdH3Xei (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2017 19:34:38 -0400
Received: by mail-pf0-f171.google.com with SMTP id l87so13551568pfj.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 16:34:38 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v6 0/3] Export 1-wire thermal sensors as hwmon device
Date: Wed, 30 Aug 2017 16:34:32 -0700
Message-Id: <20170830233435.16500-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Greg,
Please pull in this patchset into the tree. Thanks!

Summary of what this patchset does:

Our board has 4 DS18B20 1-wire temperature sensors. Each 1-wire bus and the
sensor under it is already configured against the Linux 1-wire driver
(called w1). They have a sysfs file(e.g.
/sys/bus/w1/devices/w1_bus_master1/28-000007704f4c/w1_slave) which, when read,
runs code to read the temperature. We'd like the temperatures to show up in
hwmon, so that the BMC IPMI sensor plumbing can forward those to host.

This patchset is based on top char-misc-next branch(from Greg KH's char-misc
git tree).

Tested:
Yes; On a board with 4 DS18B20 1-wire temperature sensors:
root@zaius:/sys/class/hwmon# ls
hwmon0  hwmon1  hwmon2  hwmon3  hwmon4  hwmon5
root@zaius:/sys/class/hwmon# cd hwmon0
root@zaius:/sys/class/hwmon/hwmon0# ls
device       name         subsystem    temp1_input  uevent
root@zaius:/sys/class/hwmon/hwmon0# cat temp1_input
24500
root@zaius:/sys/class/hwmon/hwmon0# cd ..
root@zaius:/sys/class/hwmon# cd hwmon1
root@zaius:/sys/class/hwmon/hwmon1# cat temp1_input
26562
root@zaius:/sys/class/hwmon/hwmon1# cd ..
root@zaius:/sys/class/hwmon# cd hwmon2
root@zaius:/sys/class/hwmon/hwmon2# cat temp1_input
27250
root@zaius:/sys/class/hwmon/hwmon2# cd ..
root@zaius:/sys/class/hwmon# cd hwmon3
root@zaius:/sys/class/hwmon/hwmon3# cat temp1_input
22250
root@zaius:/sys/class/hwmon/hwmon3#

Jaghathiswari Rankappagounder Natarajan (3):
  drivers: w1: add hwmon support structures
  drivers: w1: refactor w1_slave_show to make the temp reading
    functionality separate
  drivers: w1: add hwmon temp support for w1_therm

 drivers/w1/slaves/w1_therm.c | 164 +++++++++++++++++++++++++++++++++++--------
 drivers/w1/w1.c              |  18 ++++-
 include/linux/w1.h           |   4 ++
 3 files changed, 156 insertions(+), 30 deletions(-)

--
2.14.1.581.gf28d330327-goog

