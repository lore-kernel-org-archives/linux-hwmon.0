Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37282 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751545AbdH3Sz5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2017 14:55:57 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7UIsWeJ141942
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 14:55:56 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2cp2emhw22-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 14:55:56 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <cbostic@linux.vnet.ibm.com>;
        Wed, 30 Aug 2017 14:55:55 -0400
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] hwmon: (ucd9000) Add support for clearing logged faults via sysfs
Date: Wed, 30 Aug 2017 13:55:35 -0500
In-Reply-To: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
References: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
Message-Id: <20170830185536.71307-2-cbostic@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Create an attribute to allow clearing of logged faults.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 Documentation/hwmon/ucd9000 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/hwmon/ucd9000 b/Documentation/hwmon/ucd9000
index 262e713..de7f7f23 100644
--- a/Documentation/hwmon/ucd9000
+++ b/Documentation/hwmon/ucd9000
@@ -116,3 +116,5 @@ fan[1-4]_fault		Fan fault.
 			created only for enabled fans.
 			Note that even though UCD90910 supports up to 10 fans,
 			only up to four fans are currently supported.
+
+clear_logged_faults	Write only.  Echo any value to clear logged faults.
-- 
1.8.2.2

