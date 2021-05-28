Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6802EC4708D
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 10:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D65961157
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 10:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236541AbhE1KkS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 06:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbhE1KkQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 06:40:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DC8C0613ED
        for <linux-hwmon@vger.kernel.org>; Fri, 28 May 2021 03:38:38 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id y7so4320081eda.2
        for <linux-hwmon@vger.kernel.org>; Fri, 28 May 2021 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=IFDNl+bkCPTU9VFjmEQVzJtoOUXxTdGrcvoh4ZkghtyCSSd6QpBWyPP+ipP2ZnE9xY
         ktUISvMojelg3q/Ic/kF8UBhMv1JbcVapoB5ui1m6lwhDARibd5EgbgGpUHoxCW3SN4o
         cfuVmxWTHeW3DV6V+6RZDwj/qG5BuylbVdlqWqR2+iBSMvWB7wxCYJtl6zOq7BcC49gk
         iva+0jYz+pjzZbNlDYY9hLS8AE3gM67czG2w3au4v4y6rllo12JfT3svY9QjRhkpoWI7
         5ak8cISYoF88blAuDmSYQRp8WgbzfvzI4Wd4ZNCAuVTD6/mc8AoPSQ3yCR8/l8fGGctG
         wnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgsncdvLmdHsU/1c1h0SAn08txT9+pvHmgBRKaZGxnU=;
        b=IZ/QRwoYXgvq4vF0BM6obQjOetDDqRf0XF2/gW6Nbm8uZ3V/vaYpBGZIZJQXwYEYIy
         ZYjnIoOCG0oebu0aXT7+RZKNJ2RVLiYmF9XcoVfmQFdG7RVryfTNsBBFVHT2kcTD3mfW
         474gdiz/Va48hZteyoLsWa00YnLb3mHzroH5ZBiqVLSFxcAD3tNPle5G3QkyT4trp1IO
         i5nMyukFq1+nS2/4fHKmhTA23gkqujIiC8M887WTiLBvtovWFDUCf5pODxLRdAUwcPGO
         pyqB9n9Grc0nVVju+YMsWWLkubz+v+e9oiWbVGnqlAgcyDM6NHlcUV4t01DUudUI3ZMj
         RVfA==
X-Gm-Message-State: AOAM533CnarjUQMP4m2P/U7sAYVTrlHujnjVHxx5jENNteP062a7zmKb
        bpH8L3udQA1pkg1eDMTGjBkuWg==
X-Google-Smtp-Source: ABdhPJw7JisvOE2+Yv6lHgO9ljENALdQC7jmU3t9ZedhvXjb4BMsYeLR6+8pU6TKiHCrm/7oFO2P1w==
X-Received: by 2002:aa7:d2d4:: with SMTP id k20mr8943279edr.384.1622198317365;
        Fri, 28 May 2021 03:38:37 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-158.xnet.hr. [88.207.97.158])
        by smtp.googlemail.com with ESMTPSA id jw9sm2192446ejb.77.2021.05.28.03.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 03:38:36 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, Jonathan.Cameron@huawei.com,
        alexandre.belloni@bootlin.com, sst@poczta.fm, krzk@kernel.org,
        alexandru.ardelean@analog.com, devicetree@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add Delta DPS920AB
Date:   Fri, 28 May 2021 12:38:27 +0200
Message-Id: <20210528103828.53320-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528103828.53320-1-robert.marko@sartura.hr>
References: <20210528103828.53320-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add trivial device entry for Delta DPS920AB PSU.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Drop custom bindings file and use trivial-devices

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..1cb6c1fc0903 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -68,6 +68,8 @@ properties:
           - dallas,ds4510
             # Digital Thermometer and Thermostat
           - dallas,ds75
+          # Delta Electronics DPS920AB 920W 54V Power Supply
+          - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
             # Devantech SRF02 ultrasonic ranger in I2C mode
-- 
2.31.1

