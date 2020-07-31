Return-Path: <SRS0=3GeG=BK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2CEC433E1
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jul 2020 19:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7907722D00
	for <linux-hwmon@archiver.kernel.org>; Fri, 31 Jul 2020 19:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgGaTrO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 31 Jul 2020 15:47:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:37015 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgGaTrO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Jul 2020 15:47:14 -0400
IronPort-SDR: nb4A1JMWTS64Mj3/fLcUQkrF7hu1J4F0wUgXkHEceikMha9kiZZjRG/Ktg9petLeS3KBy0/AEh
 Y1cpFu7136sA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="151828899"
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="151828899"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 12:47:13 -0700
IronPort-SDR: m2W2WFF3XEpeGVxij4+T5yYBoFPYG55FM/Cvj3cP4fEQI3GSWZ6RUBCj7HSqPJ1c/R12NFCv+3
 QWKxYsbauQhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="291308150"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP; 31 Jul 2020 12:47:13 -0700
Received: from zlukwins-pc.igk.intel.com (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 23D865806A0;
        Fri, 31 Jul 2020 12:47:11 -0700 (PDT)
From:   Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH 1/3] docs: hwmon: Add attributes to report rated values
Date:   Fri, 31 Jul 2020 21:37:15 +0200
Message-Id: <1596224237-32280-2-git-send-email-zbigniew.lukwinski@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
References: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

New attributes (rated_min/rated_max) are being added the hwmon ABI.
They are needed to cover rated values documented by PMBus
specification:
PMBus Power System Mgt Protocol Specification - Part II – Revision 1.3.1,
chapters: 22.3.1 - 22.3.10, 22.3.15

Signed-off-by: Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
---
 Documentation/hwmon/sysfs-interface.rst | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index fd59063..678c9c6 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -241,6 +241,20 @@ Voltages
 		Affects the way the driver calculates the CPU core reference
 		voltage from the vid pins.
 
+`in[0-*]_rated_min`
+		Minimum rated voltage.
+
+		Unit: millivolt
+
+		RO
+
+`in[0-*]_rated_max`
+		Maximum rated voltage.
+
+		Unit: millivolt
+
+		RO
+
 Also see the Alarms section for status flags associated with voltages.
 
 
@@ -574,6 +588,20 @@ Temperatures
 
 		RW
 
+`temp[1-*]_rated_min`
+		Minimum rated temperature.
+
+		Unit: millidegree Celsius
+
+		RO
+
+`temp[1-*]_rated_max`
+		Maximum rated temperature.
+
+		Unit: millidegree Celsius
+
+		RO
+
 Some chips measure temperature using external thermistors and an ADC, and
 report the temperature measurement as a voltage. Converting this voltage
 back to a temperature (or the other way around for limits) requires
@@ -664,6 +692,20 @@ Currents
 
 		RW
 
+`curr[1-*]_rated_min`
+		Minimum rated current.
+
+		Unit: milliampere
+
+		RO
+
+`curr[1-*]_rated_max`
+		Maximum rated current.
+
+		Unit: milliampere
+
+		RO
+
 Also see the Alarms section for status flags associated with currents.
 
 *****
@@ -830,6 +872,20 @@ Power
 
 				RW
 
+`power[1-*]_rated_min`
+				Minimum rated power.
+
+				Unit: microWatt
+
+				RO
+
+`power[1-*]_rated_max`
+				Maximum rated power.
+
+				Unit: microWatt
+
+				RO
+
 Also see the Alarms section for status flags associated with power readings.
 
 ******
@@ -877,6 +933,20 @@ Humidity
 
 				RW
 
+`humidity[1-*]_rated_min`
+				Minimum rated humidity.
+
+				Unit: milli-percent (per cent mille, pcm)
+
+				RO
+
+`humidity[1-*]_rated_max`
+				Maximum rated humidity.
+
+				Unit: milli-percent (per cent mille, pcm)
+
+				RO
+
 ******
 Alarms
 ******
-- 
2.7.4

