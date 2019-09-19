Return-Path: <SRS0=d12o=XO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B3EC3A5A6
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Sep 2019 09:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 783FE21924
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Sep 2019 09:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8g1ZVvx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388569AbfISJZY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Sep 2019 05:25:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24676 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387637AbfISJZY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Sep 2019 05:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568885122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=fMRCNlG4fHQ6srApEX1ynJpzQyPhLql6/7HXNniPNy0=;
        b=H8g1ZVvxHlqGPMfRqURju/sWVE4Kk9/Vp8ah0ZBI3nRmCRyQZ67lleO7qEwemE+px8GhMa
        oG4b3lt11mUPTmjjVpndLLxt0721wNvxVabGJoR+BxKE9/eezx6rgBh6Y/W1kTcj47SoWO
        Uu9D9Q4JelQzVVMc0QZXEYrA3mvwWmU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-TSTLjj5nNkqQEsoq1tzpfw-1; Thu, 19 Sep 2019 05:25:21 -0400
Received: by mail-pf1-f198.google.com with SMTP id w16so1853282pfj.9
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Sep 2019 02:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XLesU40Hdgd7PzoKuluSVn23wOzzqt01Vg23PoBHteo=;
        b=RMVspH9Qo+haeMZWtjwBNsPq4uc0PFcSNOe6kT3UWu/wPWvQSVmnT87OdkBsCOy6s7
         gOhPCJOEbVXhxAd0ylfYvh0Qs6di4ExRXqNCSjNhLUxogSeA7pmljmdbftiRtLCyL8mI
         8m2NkksHuwAJ17KPUKBh6UYLmvmFdFsRQJLI21KPH87VmquJ7nGD6rBhCdfiPH40qBJR
         82C0QGZbK1+LX7STd1Pokd8UMwNOJ+gkg4ntGnGluUWyv82KHNDQxrYYowZlEcaQDLQf
         A0suWOCI5VT4WObX/nnmwa1RsEXTfR4MOU0O38iwaixE/jI6YJUHwKvLSL3jc9BdFCrw
         RiIA==
X-Gm-Message-State: APjAAAXtd/ckxGG+Wc8t22sFrnieJBZerLAcu/MFR5kkZuvafup1CJyu
        hSRgGF1reWg08AcKJn2H1bCUimd/bHqG05L8vcnSM/7fo575q1WtLB28YtX0eRoI1pseEpIjyGo
        DwpSJcnN+ms8l+v0HhfO9z9sw+VKImk4tXcEGpTs=
X-Received: by 2002:a17:902:d201:: with SMTP id t1mr8608986ply.337.1568885119762;
        Thu, 19 Sep 2019 02:25:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxebg/eFmvg9TSWxTkXz2wakbtt36/63ziH8aDxfeXIpvSWlwa/HdF+TsW6Vtom1fFad2V2zw7pONDoTjCDXY=
X-Received: by 2002:a17:902:d201:: with SMTP id t1mr8608970ply.337.1568885119507;
 Thu, 19 Sep 2019 02:25:19 -0700 (PDT)
MIME-Version: 1.0
From:   Lukas Zapletal <lzap@redhat.com>
Date:   Thu, 19 Sep 2019 11:25:03 +0200
Message-ID: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
Subject: [PATCH] k10temp: update documentation
To:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-MC-Unique: TSTLjj5nNkqQEsoq1tzpfw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It's been a while since the k10temp documentation has been updated.
There are new CPU families supported as well as Tdie temp was added.
This patch adds all missing families which I was able to find from git
history and provides more info about Tctl vs Tdie exported temps.

Signed-off-by: Lukas Zapletal <lzap+git@redhat.com>
---
 Documentation/hwmon/k10temp.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.=
rst
index 12a86ba17de9..bb2d0a02dc45 100644
--- a/Documentation/hwmon/k10temp.rst
+++ b/Documentation/hwmon/k10temp.rst
@@ -1,7 +1,7 @@
 Kernel driver k10temp
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-Supported chips:
+Although the driver is named k10temp, it supports wide range of AMD CPUs:

 * AMD Family 10h processors:

@@ -21,10 +21,16 @@ Supported chips:

 * AMD Family 14h processors: "Brazos" (C/E/G/Z-Series)

-* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity",
"Kaveri", "Carrizo"
+* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity",
"Kaveri", "Carrizo", "Stoney Ridge", "Bristol Ridge"

 * AMD Family 16h processors: "Kabini", "Mullins"

+* AMD Family 17h processors: "Zen", "Zen 2"
+
+* AMD Family 18h processors: "Hygon Dhyana"
+
+* AMD Family 19h processors: "Zen 3"
+
   Prefix: 'k10temp'

   Addresses scanned: PCI space
@@ -110,3 +116,12 @@ The maximum value for Tctl is available in the
file temp1_max.
 If the BIOS has enabled hardware temperature control, the threshold at
 which the processor will throttle itself to avoid damage is available in
 temp1_crit and temp1_crit_hyst.
+
+On some AMD CPUs, there is a difference between the die temperature (Tdie)=
 and
+the reported temperature (Tctl). Tdie is the real measured temperature, an=
d
+Tctl is used for fan control. While Tctl is always available as temp1_inpu=
t,
+the driver exports Tdie temperature as temp2_input for those CPUs which su=
pport
+it.
+
+Models from 17h family report relative temperature, the driver aims to
+compensate and report the real temperature.
--=20
2.21.0


--=20
Later,
  Lukas @lzap Zapletal

