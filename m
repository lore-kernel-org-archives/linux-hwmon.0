Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C37C07E94
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Jun 2021 15:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCA9D600EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Jun 2021 15:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhFDPjZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Jun 2021 11:39:25 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48]:43736 "EHLO
        mail-ej1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhFDPjZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Jun 2021 11:39:25 -0400
Received: by mail-ej1-f48.google.com with SMTP id ci15so15121459ejc.10
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Jun 2021 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=18khHUA2AJ3ib5wXxPFFaQIfHWGb1QOUw5+Na90fAf4=;
        b=rdqeHmjXUcQIOHQ/to3kGr2aZHwHzLmp4uZnM7Mq3J89WlI6CCkq0M0UbJrNaS61lD
         p4HwIp1+5cDCIJm6mP0kMoBYg+eQUH+rHUUzJO3RwR5kLtEKiKoBnd3GamDGK1EIe4FT
         TyWJb5f8qBengCA3jkb2xc5HPsA4rm4XgZ3Ytm0Kz6sJOEqAAztIlkmv8/WFlIji7/lt
         qyNp5WGkmM49RpoBMIIZB2Bqf/Rlm/oHL2GX3E5GqnrrBxTmb3JccFneCUs/NKc7O3Hu
         8MraCGqto5hET+0twyYCBnGZ8Z9eZUNyoobQc78pvSF/qkwZigKqJ1dJTC76tYit1Hqe
         aTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18khHUA2AJ3ib5wXxPFFaQIfHWGb1QOUw5+Na90fAf4=;
        b=HBcLhzmRnV0dE4vTAYBAjn7PQOQuQGlSA5i+Ox1BQi0LfLUZk0QRtfDPcN5l7JY7ZA
         wgpACdNsZvWX+QEmuKErXhH73DILoCLngxYu33eLK5HxUJ61Cj+O/y1jZyOAnsMGZsa7
         z2X77bDCl94M/N6uiIdV6ebcOPzpjDcpOBdNSdl3x1daM/oY9ah99rj5gaszZzY7XKUE
         09veyrnJ5W5tzCwMR2JAHlvp35d4W2d28CXozO1enPgtxICKPDG1FVNfOeSBaw65IFDF
         MTNsn/qm+oLz03T+V5t5rhUscwRb/Cf5Cjl+js2RnXDIRIivvNF1CdBJgvEFqgFBXtqV
         6Vhg==
X-Gm-Message-State: AOAM532l7rXH4fzk4eewccBKWgOjD99JZafFMESUaL3dq+qZ5zlIFFZx
        n/f6tME8ARZe/jIuP8qYR9hH0Q==
X-Google-Smtp-Source: ABdhPJzJk5hJcow9IP1RWbN4rBSMsfSX0vDK2NKcesVXQxSYC3clPLa/eYKG6MLuMUviPoyoU5l5VQ==
X-Received: by 2002:a17:906:7e4d:: with SMTP id z13mr4687520ejr.50.1622820982029;
        Fri, 04 Jun 2021 08:36:22 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-250.xnet.hr. [88.207.96.250])
        by smtp.googlemail.com with ESMTPSA id d25sm2909038ejd.59.2021.06.04.08.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:36:21 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, trivial@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 3/3] MAINTAINERS: Add Delta DPS920AB PSU driver
Date:   Fri,  4 Jun 2021 17:36:12 +0200
Message-Id: <20210604153612.2903839-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604153612.2903839-1-robert.marko@sartura.hr>
References: <20210604153612.2903839-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add maintainers entry for the Delta DPS920AB PSU driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop YAML bindings

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82d9c2943c34..0707986e9bb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5105,6 +5105,13 @@ F:	Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
 F:	drivers/gpio/gpio-tn48m.c
 F:	include/dt-bindings/reset/delta,tn48m-reset.h
 
+DELTA DPS920AB PSU DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/dps920ab.rst
+F:	drivers/hwmon/pmbus/dps920ab.c
+
 DENALI NAND DRIVER
 L:	linux-mtd@lists.infradead.org
 S:	Orphan
-- 
2.31.1

