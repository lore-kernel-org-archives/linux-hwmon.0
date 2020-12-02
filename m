Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2E2C83013
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 16:57:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 383732173E
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 16:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730573AbgLBQ5l (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Dec 2020 11:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728226AbgLBQ5k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Dec 2020 11:57:40 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BD2C061A47
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Dec 2020 08:56:23 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id f19so1886377qtx.6
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Dec 2020 08:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=C5cH1+u6QihF0HJXhluYkOAp5Dcp6gIMnhnwCWhDyK8=;
        b=wEjjFZwDRrIcR76cg+sG6O0U6N9QbH2Tn+HAfT7TifoZST/nqkVooTuo+JECaT6v16
         4+9sqSBt20RoKZ0THxx1IGevWBzcwtfWtS6xmrWQCDIywaC4puWSRN76rJCtbfVeBA1J
         1FuMFCW00LG86mj6uQhLdR4MezFXDYu03R2X1ApUsGta4lfb+CPKHKvqhsJeJ4z7uM2Z
         GX61rZXutWDzKP5A9VXTh/+JkpuzZM6Hu+CCPf+/2M44FDQhLUt4tXPBQud/1JFM/qKR
         6eY+E5Bdi280/0aL+StKLKuefHI8dCGwDFBvZrUS8CnDWKHhwQdHc/POQpykhZwPZb/5
         n1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=C5cH1+u6QihF0HJXhluYkOAp5Dcp6gIMnhnwCWhDyK8=;
        b=sTeIG6JfFKnAoJ3Rq7xusE4UuEVaQYiQuOqms/IpaJWaARp6GZ2G6qNwdrAx82sWao
         gvtXLq0pId+CkqEIcggOYFfw0IeMfLxtp7Ez+W8TsMK2tVQToz6VLacEpBQYUAVax6Hi
         5qk0f0IhNvfFmfLyIRVnEl3fk+knYIIRa5bKbSen7ba8tFosFPvWjQQnXnoH3FsfevoW
         QkOfjoukvOKy5PnJQ/CIq1JdSM8DaQFxt8N0LCSpXkpipVJdXxNUAvB+ZcMtFk3HqUQn
         QhSSgpJC+z7chzp8cBbvv/79bq90aBzFtk/r2/ndspGSO/7YyN3bBPCA7Cy0vlFv/Sj6
         5DWA==
X-Gm-Message-State: AOAM5307ZMoy3X1oxwFWzxN4XlwzfZogdTX8FJXG4pbS4f0wOOGAmoBX
        NLmFDdRSsXWmHUFAiyme6aW9SBmISQ==
X-Google-Smtp-Source: ABdhPJxjTellGg62Ft0dtoF7EbHO59fZZvLSVTJo7d/PZdgwmGf/EuFIpKUmJSX7HwwygZQlnP8HnD8pPQ==
Sender: "kunyi via sendgmr" <kunyi@kunyi0.svl.corp.google.com>
X-Received: from kunyi0.svl.corp.google.com ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:ad4:4e47:: with SMTP id eb7mr3692938qvb.39.1606928182920;
 Wed, 02 Dec 2020 08:56:22 -0800 (PST)
Date:   Wed,  2 Dec 2020 08:56:00 -0800
In-Reply-To: <20201202165601.1532213-1-kunyi@google.com>
Message-Id: <20201202165601.1532213-3-kunyi@google.com>
Mime-Version: 1.0
References: <20201202165601.1532213-1-kunyi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH linux hwmon-next v4 2/3] hwmon: (sbtsi) Add documentation
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, supreeth.venkatesh@amd.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/index.rst      |  1 +
 Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fd6fae46b99c..509fb3bcafb2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -151,6 +151,7 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    raspberrypi-hwmon
+   sbtsi_temp
    sch5627
    sch5636
    scpi-hwmon
diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..9f0f197c8aa2
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,40 @@
+Kernel driver sbtsi_temp
+==================
+
+Supported hardware:
+
+  * Sideband interface (SBI) Temperature Sensor Interface (SB-TSI)
+    compliant AMD SoC temperature device.
+
+    Prefix: 'sbtsi_temp'
+
+    Addresses scanned: This driver doesn't support address scanning.
+
+    To instantiate this driver on an AMD CPU with SB-TSI
+    support, the i2c bus number would be the bus connected from the board
+    management controller (BMC) to the CPU. The i2c address is specified in
+    Section 6.3.1 of the SoC register reference: The SB-TSI address is normally
+    98h for socket 0 and 90h for socket 1, but it could vary based on hardware
+    address select pins.
+
+    Datasheet: The SB-TSI interface and protocol is available as part of
+               the open source SoC register reference at:
+
+	       https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+               The Advanced Platform Management Link (APML) Specification is
+               available at:
+
+	       http://developer.amd.com/wordpress/media/2012/10/41918.pdf
+
+Author: Kun Yi <kunyi@google.com>
+
+Description
+-----------
+
+The SBI temperature sensor interface (SB-TSI) is an emulation of the software
+and physical interface of a typical 8-pin remote temperature sensor (RTS) on
+AMD SoCs. It implements one temperature sensor with readings and limit
+registers encode the temperature in increments of 0.125 from 0 to 255.875.
+Limits can be set through the writable thresholds, and if reached will trigger
+corresponding alert signals.
-- 
2.29.2.454.gaff20da3a2-goog

