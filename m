Return-Path: <SRS0=cvjA=5V=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41A5C2BA80
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Apr 2020 03:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AADE62076E
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Apr 2020 03:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sqzp3tVr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDEDBe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Apr 2020 23:01:34 -0400
Received: from mail-pj1-f73.google.com ([209.85.216.73]:44249 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgDEDBe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Apr 2020 23:01:34 -0400
Received: by mail-pj1-f73.google.com with SMTP id t7so10609749pjb.9
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Apr 2020 20:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fKzqXXNg9xzVu4YyDWxMV1+X7kCrAroDFOfHUGlJ58E=;
        b=Sqzp3tVry5VikJhBtbH8S7i4F6HSXFPxPg6DEQnSre+2NtOuwKjqzVf2IafEjNUj5a
         C+NeeLsqpbOdoq6OArVTZ59Shl26lYDf8U99URzAqd1/lAnJTqHhkFzvl9zaUrBc0+Um
         aZkwhBOzc8dttV849FyKs7dkxhWKMgu6NGpcJjCUnXTu2gMvQTTOIbG/pVeXwhBjYUES
         H2izvR9dW09AslLmDdTthnbsq5Uzjsdej71g4Fsiclb1VKaGef2DU8o78DbMxdNZlqVC
         1aqWRKz5VKg/P2J7t2XPKkPYFJHZk2JlCRe6HSw2x3nALCJcPpoBWcPY/TJYw6hOiaOX
         027Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fKzqXXNg9xzVu4YyDWxMV1+X7kCrAroDFOfHUGlJ58E=;
        b=gDNHGkp9VvvrTuxDn/1EnlNR7TMEcPPafwrVeZtz1MNpwVOSlGxnkTk166Pbkhi6AE
         KOT4QLJW0iVum5FE/yiheFgi83X+9+MAYg42374MQCRpPCAzovPe4gr/koXc/btIQNd/
         QAg/C77i6DA3cWMrtRfgqCGaI0mFdnLD8j5g78I6EWrvnZ3uRxi3YqeX9DTEpE3Bd0tk
         4R9bfrRQYXQikB0oY8VhS2X49eZk56VkwYTyCt/hMmlkXwYOZTpjM/yCxFNYTgUzQvGK
         0Jq6VoHt+aYchvSuGbvghcNlrgs5a1EHKFSY2OKOrep15g6kJAZSig2G8swsszeFpapc
         dklA==
X-Gm-Message-State: AGi0PuY5p3fmAMm5v0BQQpGU1EhZ+J9wK7yqyyxleMI7tCuqMChVO+iz
        9mhhZ3TPA7ZuTDi2xZ/noXfeqW8F0A==
X-Google-Smtp-Source: APiQypJzQ/VynmzGryKqwj/Q41W7uFyHr7iB3BAtTwC2kBApBZa8RfvrjcVzbMMt18OmXIjc52phN4ZmNw==
X-Received: by 2002:a63:9a11:: with SMTP id o17mr3738011pge.234.1586055691194;
 Sat, 04 Apr 2020 20:01:31 -0700 (PDT)
Date:   Sat,  4 Apr 2020 20:01:17 -0700
In-Reply-To: <20200405030118.191950-1-kunyi@google.com>
Message-Id: <20200405030118.191950-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200405030118.191950-1-kunyi@google.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH linux hwmon-next v3 2/3] hwmon: (sbtsi) Add documentation
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
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
index 8ef62fd39787..c17cf38f22c2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -140,6 +140,7 @@ Hardware Monitoring Kernel Drivers
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
2.26.0.292.g33ef6b2f38-goog

