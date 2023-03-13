Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136FAC6FD19
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Mar 2023 13:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjCMNKg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Mar 2023 09:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCMNKf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Mar 2023 09:10:35 -0400
Received: from ofcsgdbm.dwd.de (ofcsgdbm.dwd.de [141.38.3.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B603346C
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 06:10:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by ofcsg2dn3.dwd.de (Postfix) with ESMTP id 4PZxpv6nLTz2wQK
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dwd.de; h=
        content-type:content-type:mime-version:message-id:subject
        :subject:from:from:date:date:received:received:received:received
        :received:received:received:received; s=dwd-csg20210107; t=
        1678713031; x=1679922632; bh=a6zq0ZHbn8Ul6+P0t6VHiaGX0lfQuULZXFp
        9OAVqJ5w=; b=+TupD31hSdzTAMhcrrlA7mORkLFBzKInnAMD6UvOOrPfpDaPy53
        JugEI9lnT895T9Gd2aNvoorGOZsWxNlE3ddT3uqp934vp5wVjTtBmCZuWBs5qSam
        uGW5Q56agMtNUv5O/BQNFRo7+KWXZM4ahZqm1U8opZPwrNeThXZ4HPNaXZWl7sZQ
        By+La2W02yLJNNYIVtakul9MQnAii6VMDIStqlDC7ZrxUZw+V00+pYeq1hLHvg5F
        meamSbrs5BQS+c5gpGa5rajvpO7QqlXipy5f+3/o3BBWiG33nDYexyn+armdCdV0
        G+YEz4tfo2mKE7nhztmA39C3uq8mXaN+qfA==
X-Virus-Scanned: by amavisd-new at csg.dwd.de
Received: from ofcsg2cteh1.dwd.de ([172.30.232.65])
 by localhost (ofcsg2dn3.dwd.de [172.30.232.26]) (amavisd-new, port 10024)
 with ESMTP id mh2Ldez-eUeE for <linux-hwmon@vger.kernel.org>;
 Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
        by DDEI (Postfix) with ESMTP id B48EDC902C4C
        for <root@ofcsg2dn3.dwd.de>; Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
        by DDEI (Postfix) with ESMTP id A87AEC902C33
        for <root@ofcsg2dn3.dwd.de>; Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
X-DDEI-TLS-USAGE: Unused
Received: from ofcsgdbm.dwd.de (unknown [172.30.232.26])
        by ofcsg2cteh1.dwd.de (Postfix) with ESMTP
        for <root@ofcsg2dn3.dwd.de>; Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
Received: from ofcsgdbm.dwd.de by localhost (Postfix XFORWARD proxy);
 Mon, 13 Mar 2023 13:10:31 -0000
Received: from ofcsg2dvf2.dwd.de (ofcsg2dvf2.dwd.de [172.30.232.11])
        by ofcsg2dn3.dwd.de (Postfix) with ESMTPS id 4PZxpv4Shrz2wML;
        Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
Received: from ofmailhub.dwd.de (ofmailhub.dwd.de [141.38.39.196])
        by ofcsg2dvf2.dwd.de  with ESMTP id 32DDAVE4021349-32DDAVE5021349;
        Mon, 13 Mar 2023 13:10:31 GMT
Received: from praktifix.dwd.de (praktifix.dwd.de [141.38.44.46])
        by ofmailhub.dwd.de (Postfix) with ESMTP id 730E3E26D2;
        Mon, 13 Mar 2023 13:10:31 +0000 (UTC)
Date:   Mon, 13 Mar 2023 13:10:31 +0000 (GMT)
From:   Holger Kiehl <Holger.Kiehl@dwd.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] hwmon: (nct6775) add Asus Pro A520M-C II/CSM
Message-ID: <868bdc4f-9d45-475c-963e-f5232a8b95@praktifix.dwd.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="646786604-2096725857-1678713031=:1647830"
X-FEAS-Client-IP: 141.38.39.196
X-FE-Last-Public-Client-IP: 141.38.39.196
X-FE-Policy-ID: 2:2:1:SYSTEM
X-TMASE-Version: DDEI-5.1-9.0.1002-27500.007
X-TMASE-Result: 10--0.544100-10.000000
X-TMASE-MatchedRID: 54gb2yeIOXQKcsqwFvHPpZGzIhDiMWXrm+DHlE+ssdDbwrIdcV7mW9mw
        Qde3CIwayPWKi2J7rbTlgULyZ+0QfaZTCp7W/He3ASoGV8JrJg31+9bO3CCbk8C5DTEMxpeQ38b
        Hk6Pl8X1/XjpbSJS7a0NziVKCujClwG9P01lFxWXi8zVgXoAltnS4vQrt84k3wrbXMGDYqV+8bR
        Ued1HGApLRodsDsRTAAcTRAXiI1anWW2YoKwhdnUUjywkdcMMgQbQop27i6wwZGC3E/epWpm49R
        pMKzOm5ottZkIYeDOGDhTuQFwWOoYUozDgi4nhXekI2ow+xm4Ub2xdIiL0Uv161uUBD8bm1
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-DDEI-PROCESSED-RESULT: Safe
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--646786604-2096725857-1678713031=:1647830
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

An NCT6798D chip is now detected:

   dmesg|grep nct6775
   [   23.765392] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

And sensors now shows:

   nct6798-isa-0290
   Adapter: ISA adapter
   in0:                      312.00 mV (min =  +0.00 V, max =  +1.74 V)
   in1:                        1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in2:                        3.42 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in3:                        3.38 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in4:                        1.03 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in5:                        1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in6:                      200.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
   in7:                        3.42 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in8:                        3.28 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in9:                      920.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
   in10:                     512.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
   in11:                     504.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
   in12:                       1.03 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   in13:                     256.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
   in14:                       1.47 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
   fan1:                        0 RPM  (min =    0 RPM)
   fan2:                        0 RPM  (min =    0 RPM)
   fan3:                      355 RPM  (min =    0 RPM)
   fan7:                        0 RPM  (min =    0 RPM)
   SYSTIN:                    +25.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
   CPUTIN:                    +26.5°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
   AUXTIN0:                   +97.0°C    sensor = thermistor
   AUXTIN1:                   +25.0°C    sensor = thermistor
   AUXTIN2:                   +25.0°C    sensor = thermistor
   AUXTIN3:                    +1.0°C    sensor = thermistor
   PECI Agent 0 Calibration:  +26.0°C
   PCH_CHIP_CPU_MAX_TEMP:      +0.0°C
   PCH_CHIP_TEMP:              +0.0°C
   PCH_CPU_TEMP:               +0.0°C
   TSI0_TEMP:                 +27.9°C
   intrusion0:               ALARM
   intrusion1:               OK
   beep_enable:              disabled

Signed-off-by: Holger Kiehl <holger.kiehl@dwd.de>
Tested-by: Holger Kiehl <holger.kiehl@dwd.de>
---

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 76c6b564d7fc..1e6abfc7974d 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1052,6 +1052,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 static struct platform_device *pdev[2];
 
 static const char * const asus_wmi_boards[] = {
+	"Pro A520M-C II",
 	"PRO H410T",
 	"ProArt B550-CREATOR",
 	"ProArt X570-CREATOR WIFI",
--646786604-2096725857-1678713031=:1647830--

