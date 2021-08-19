Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBDBC4320A
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Aug 2021 18:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 401F160200
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Aug 2021 18:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbhHSS0f (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Aug 2021 14:26:35 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:33878
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234485AbhHSS0b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Aug 2021 14:26:31 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id F00B8411CD
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Aug 2021 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629397553;
        bh=VaNdDMIExHpifgg1f/piu7EYnB4gbMsCpL1KpPnqU+E=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=PQzFN6fLVFcqtgrOUZP/wlM0DXZYNMlvWKBW7rO+ZpGh6b4MXgNvuoPKIpXES8b36
         bhemVPMdteQjg8KAoC5ZTXcWUdljdXTFMAUoXVmnLUal2WJ5dpSJ/vm3R3jYSU7ccf
         3Mq334q+ApqlAAJzmV7+/wxnRxbEe5gj+ek/0FCX5OJW2BSVDe67zHh7SBfmwt9gRY
         kbOc3f/7DgS9ZlSjOwzScFmsWMp390TcBQFbC5k4sdbLC1d5yQoEepqj2O9BIt1rkJ
         XWVl7VJq8XtDLPB24Ot3GYPZbXfoB8z9zaFcmFOAAEI3oVcJH9sQJwSjlP6JfmaqV2
         11pzz05J5CwXw==
Received: by mail-ed1-f72.google.com with SMTP id eg56-20020a05640228b8b02903be79801f9aso3223768edb.21
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Aug 2021 11:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaNdDMIExHpifgg1f/piu7EYnB4gbMsCpL1KpPnqU+E=;
        b=OU8/upEQ0hUS5va5JrzdyEU5NxmxtM69wgWgpjbtpyf+ULzg/qUKTsMY/9ToVCnxDF
         yxFWkkDqmI4HhbSDeGWeCiv8wD9HwsR1ou0P4IuE93eV2FtoQS+pImzZoIxM6hyK4PTJ
         EJaiz7GCWhsChKales0Cv6xJliuhHKygUjst6KnPzTn0EjW2274DP/uUrirCIGJz5RTb
         svDSyVC1jRpjl8c2hjghVClklPaDWfkmyO+55y80gnUgY7RyVoZapvbOEJHUKeQo73dn
         LxfT+OaWf3MXv9h6fnek0MeJY5+jAsZ4KQwalEAG0OS/AvU2gNxDRIFSqUIXcygkQ5Q3
         3HRg==
X-Gm-Message-State: AOAM530AEUGYhpWB1ANAM/DU7al2jD4euod/jMQeAk6QML5bZ7z3UuHV
        k1Lup53fvg/U01zE/UqDwdQnbVH+srncm8o87bM6Ys+bfxW3zWqcWHTlVRz5To7+q2wz+xfpX1N
        CDwxwZ2TyaCwOhgk1mhBJgwUUrwf5F4vmxAEiX2r5
X-Received: by 2002:a17:906:31cf:: with SMTP id f15mr17345651ejf.272.1629397553318;
        Thu, 19 Aug 2021 11:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDCbkHj9coklC1cYVbTAv3iL7SLo9+rGR1X7tS5lUe0qPu3NrXS8RPnZn8fFzFy8dJyBNwHQ==
X-Received: by 2002:a17:906:31cf:: with SMTP id f15mr17345631ejf.272.1629397553110;
        Thu, 19 Aug 2021 11:25:53 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id n2sm2212108edi.32.2021.08.19.11.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:25:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <trivial@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] dt-bindings: hwmon: merge max31785 into trivial devices
Date:   Thu, 19 Aug 2021 20:25:44 +0200
Message-Id: <20210819182544.224121-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819182544.224121-1-krzysztof.kozlowski@canonical.com>
References: <20210819182544.224121-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Ther Maxim max31785 bindings are trivial, so simply merge it into
trivial-devices.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/hwmon/max31785.txt    | 22 -------------------
 .../devicetree/bindings/trivial-devices.yaml  |  4 ++++
 MAINTAINERS                                   |  1 -
 3 files changed, 4 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
deleted file mode 100644
index 106e08c56aaa..000000000000
--- a/Documentation/devicetree/bindings/hwmon/max31785.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Bindings for the Maxim MAX31785 Intelligent Fan Controller
-==========================================================
-
-Reference:
-
-https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
-
-The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
-management with temperature and remote voltage sensing. Various fan control
-features are provided, including PWM frequency control, temperature hysteresis,
-dual tachometer measurements, and fan health monitoring.
-
-Required properties:
-- compatible     : One of "maxim,max31785" or "maxim,max31785a"
-- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
-
-Example:
-
-        fans@52 {
-                compatible = "maxim,max31785";
-                reg = <0x52>;
-        };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 1e4b3464d734..646ab3a82387 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -163,6 +163,10 @@ properties:
           - maxim,max6625
             # 3-Channel Remote Temperature Sensor
           - maxim,max31730
+            # Intelligent Fan Controller with temperature and remote voltage sensing
+            # Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+          - maxim,max31785
+          - maxim,max31785a
             # mCube 3-axis 8-bit digital accelerometer
           - mcube,mc3230
             # Measurement Specialities I2C temperature and humidity sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index fda9f438cc27..c8935b455dd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14869,7 +14869,6 @@ W:	http://www.roeck-us.net/linux/drivers/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
 F:	Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
 F:	Documentation/devicetree/bindings/hwmon/ltc2978.txt
-F:	Documentation/devicetree/bindings/hwmon/max31785.txt
 F:	Documentation/hwmon/adm1275.rst
 F:	Documentation/hwmon/ibm-cffps.rst
 F:	Documentation/hwmon/ir35221.rst
-- 
2.30.2

