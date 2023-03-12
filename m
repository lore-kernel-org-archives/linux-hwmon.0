Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEACC6FD1F
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 13:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjCLN0M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjCLN0H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2023 09:26:07 -0400
X-Greylist: delayed 1118 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Mar 2023 06:25:40 PDT
Received: from ofcsgdbm.dwd.de (ofcsgdbm.dwd.de [141.38.3.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F231A672
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 06:25:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by ofcsg2dn3.dwd.de (Postfix) with ESMTP id 4PZKnH0v09z2xwq
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dwd.de; h=
        content-type:content-type:mime-version:message-id:subject
        :subject:from:from:date:date:received:received:received:received
        :received:received:received:received; s=dwd-csg20210107; t=
        1678626418; x=1679836019; bh=cccNWn/QJ3t9WoX/GMB9BIQfL8uoPcFBB3B
        r6+o8N00=; b=VnuNx8g2WpFMO/n/CLngSfF0O8vcwH1aVi28NcFyFLfrkEYabZp
        u5Q/JH3Wd2kOoCb79is1VTV00oDgdQaOTgz0rgHm/aMylVszrBvU3yoOlSFTcx0k
        k5CDRP9nLBZt+Iqdhzssf+40o6Mh+Eoxr1XR3Adrp006RfcsRqcxfa3Mr8SKQbkJ
        Bsn496P74dS/V/U947HEFCVUOoWrHqEL4r2BJ3SbWeDcNIeg2ScYK4M1Jlf13n1L
        pxCMtiYCYlB4Io48InG01Ejy2Jbbpjx9nD5y5nhdKmiVvnVcW0So2BbEfnW8Y+mL
        X5/rbVrlUEfn6i+YZ8UEEDxjpFf/WSf8c+Q==
X-Virus-Scanned: by amavisd-new at csg.dwd.de
Received: from ofcsg2cteh1.dwd.de ([172.30.232.65])
 by localhost (ofcsg2dn3.dwd.de [172.30.232.26]) (amavisd-new, port 10024)
 with ESMTP id FT226a4Df67V for <linux-hwmon@vger.kernel.org>;
 Sun, 12 Mar 2023 13:06:58 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
        by DDEI (Postfix) with ESMTP id B375AC901E42
        for <root@ofcsg2dn3.dwd.de>; Sun, 12 Mar 2023 13:06:58 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
        by DDEI (Postfix) with ESMTP id A54DCC901E12
        for <root@ofcsg2dn3.dwd.de>; Sun, 12 Mar 2023 13:06:58 +0000 (UTC)
X-DDEI-TLS-USAGE: Unused
Received: from ofcsgdbm.dwd.de (unknown [172.30.232.26])
        by ofcsg2cteh1.dwd.de (Postfix) with ESMTP
        for <root@ofcsg2dn3.dwd.de>; Sun, 12 Mar 2023 13:06:58 +0000 (UTC)
Received: from ofcsgdbm.dwd.de by localhost (Postfix XFORWARD proxy);
 Sun, 12 Mar 2023 13:06:58 -0000
Received: from ofcsg2dvf1.dwd.de (ofcsg2dvf1.dwd.de [172.30.232.10])
        by ofcsg2dn3.dwd.de (Postfix) with ESMTPS id 4PZKnG4QCPz2xwq
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 13:06:58 +0000 (UTC)
Received: from ofmailhub.dwd.de (ofldap.dwd.de [141.38.39.208])
        by ofcsg2dvf1.dwd.de  with ESMTP id 32CD6wCo001985-32CD6wCp001985;
        Sun, 12 Mar 2023 13:06:58 GMT
Received: from praktifix.dwd.de (praktifix.dwd.de [141.38.44.46])
        by ofmailhub.dwd.de (Postfix) with ESMTP id 70128451B8;
        Sun, 12 Mar 2023 13:06:58 +0000 (UTC)
Date:   Sun, 12 Mar 2023 13:06:58 +0000 (GMT)
From:   Holger Kiehl <Holger.Kiehl@dwd.de>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Sensor for Asus Pro A520M-C II/CSM
Message-ID: <389043e8-b523-cd89-b4da-83acea01521@praktifix.dwd.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="646786604-1605237699-1678626418=:2986037"
X-FE-Attachment-Name: asus_pro_a520M-C_ii.patch
X-FEAS-Client-IP: 141.38.39.208
X-FE-Last-Public-Client-IP: 141.38.39.208
X-FE-Policy-ID: 2:2:1:SYSTEM
X-TMASE-Version: DDEI-5.1-9.0.1002-27498.007
X-TMASE-Result: 10--2.586100-10.000000
X-TMASE-MatchedRID: 3lYOnjwBCa6Hfxuc8sSk8Rqkhv3OdF4DGfZImb3fqASsEoIKSTmDfHVv
        hpfvDf5v+Y9b59WZGAo+HkfhCQwVGO8KS96Bnw4t7+657vFymMO8GGkMifFlQx6crvxcWDihP9s
        +bu07mxSszmttkiSf6WRinB1Mnjd9fgBBxKdXaLV+tbnijoKfDcK21zBg2KlfvG0VHndRxgLn82
        vWjAuB/QtmXJ5BWM8GO2XD1tkphdnpF/szI4mKAtCUbSenHHlNx+mfrtO8p5E4vHOvVeQN6FT00
        5feo77TqvVXAnLtwjX2atko+2OxJ2miVnoUz+3qFWPtyWBD7SPdi+/Y127NnQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-DDEI-PROCESSED-RESULT: Safe
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--646786604-1605237699-1678626418=:2986037
Content-Type: text/plain; format=flowed; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Hello,

with the attached patch some sensor information is shown
with Asus Pro A520M-C II/CSM:

    dmesg |grep nct6775
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

The patch is against 6.2.5.

Thank you very much for all the hwmon work!

Regards,
Holger
--646786604-1605237699-1678626418=:2986037
Content-Type: text/plain; charset=US-ASCII; name=asus_pro_a520M-C_ii.patch
Content-Transfer-Encoding: BASE64
Content-ID: <f9d681-8fb6-44e4-4815-19d5c392da0@praktifix.dwd.de>
Content-Description: 
Content-Disposition: attachment; filename=asus_pro_a520M-C_ii.patch

LS0tIGxpbnV4LTYuMi41L2RyaXZlcnMvaHdtb24vbmN0Njc3NS1wbGF0Zm9y
bS5jLm9yaWcJMjAyMy0wMy0xMSAxMzo1MDo1MC4wMDAwMDAwMDAgKzAxMDAN
CisrKyBsaW51eC02LjIuNS9kcml2ZXJzL2h3bW9uL25jdDY3NzUtcGxhdGZv
cm0uYwkyMDIzLTAzLTExIDIwOjQ2OjAyLjg5ODc2NDMyMCArMDEwMA0KQEAg
LTEwNTIsNiArMTA1Miw3IEBADQogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXZbMl07DQogDQogc3RhdGljIGNvbnN0IGNoYXIgKiBjb25z
dCBhc3VzX3dtaV9ib2FyZHNbXSA9IHsNCisJIlBybyBBNTIwTS1DIElJIiwN
CiAJIlBSTyBINDEwVCIsDQogCSJQcm9BcnQgQjU1MC1DUkVBVE9SIiwNCiAJ
IlByb0FydCBYNTcwLUNSRUFUT1IgV0lGSSIsDQo=

--646786604-1605237699-1678626418=:2986037--

