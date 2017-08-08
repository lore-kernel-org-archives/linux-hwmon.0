Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57087 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751834AbdHHDZ4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Aug 2017 23:25:56 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v783Nlc6073039
        for <linux-hwmon@vger.kernel.org>; Mon, 7 Aug 2017 23:25:55 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c72v54y3s-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Aug 2017 23:25:55 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 7 Aug 2017 23:25:55 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        jk@ozlabs.org, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC 0/3] drivers/hwmon/pmbus: Use STATUS_WORD and add status sensors
Date: Mon,  7 Aug 2017 22:25:45 -0500
Message-Id: <1502162748-16372-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

Hi Guenter,

I'm looking for some feedback for some extensions to the pmbus core. We're
looking for some additional functionality, particularly with STATUS_WORD and
obtaining raw status data.

The first two patches enable the use of the STATUS_WORD register in the pmbus
core. This allows the use of more default alarm/fault attributes for default
pmbus sensors by allowing the use of the higher byte status bits.

The third patch adds "status" attributes to each class of hwmon sensor created
by pmbus. For example, in1_status and temp1_status. These will display the
associated raw status register (e.g. STATUS_INPUT and STATUS_TEMPERATURE). I
realize this is not really "normal" for hwmon or pmbus. These are potentially
very useful in hardware diagnostic situations where it might be impossible
to tell the origin of a failure from a simple alarm or fault bit set. We really
want to access the status registers, and for a multi-page pmbus device, this is
pretty tricky from userspace.

Please let me know your thoughts,
Thanks,

Edward A. James (3):
  drivers/hwmon/pmbus: Access word data for STATUS_WORD and use it by
    default
  drivers/hmwon/pmbus: store STATUS_WORD in status registers
  drivers/hwmon/pmbus: Add sensor status to pmbus attributes

 drivers/hwmon/pmbus/pmbus_core.c | 153 +++++++++++++++++++++++++++++++++------
 1 file changed, 130 insertions(+), 23 deletions(-)

-- 
1.8.3.1

