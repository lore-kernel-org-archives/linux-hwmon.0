Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36787 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750715AbdEBFqG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 May 2017 01:46:06 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 17FE88446C
        for <linux-hwmon@vger.kernel.org>; Tue,  2 May 2017 17:46:04 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux-hwmon@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RFC PATCH 0/3] hwmon: (adt7475) small enhancements
Date: Tue,  2 May 2017 17:45:33 +1200
Message-Id: <20170502054536.21147-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is a series of small enhancements to the adt7475 driver. We're using an
adt7476 chip in several network switches and generally speaking the
requirement for this type of equipment is to keep the fan moving so that we
know it is working when we need it.

Chris Packham (3):
  hwmon: (adt7475) replace find_nearest() with find_closest()
  hwmon: (adt7475) fan stall prevention
  hwmon: (adt7475) temperature smoothing

 Documentation/hwmon/adt7475 |  10 +++
 drivers/hwmon/adt7475.c     | 205 +++++++++++++++++++++++++++++++++++++-------
 2 files changed, 184 insertions(+), 31 deletions(-)

-- 
2.11.0.24.ge6920cf

