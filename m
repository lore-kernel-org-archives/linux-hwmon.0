Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EBFC4709C
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 May 2021 14:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2314A613AF
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 May 2021 14:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhEaOan (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 May 2021 10:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbhEaO1k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 May 2021 10:27:40 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E743C08E90F
        for <linux-hwmon@vger.kernel.org>; Mon, 31 May 2021 06:47:00 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso10389439pjx.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 May 2021 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vJMi78mWq5HtlB9ulTeayHA8zLqcXh/C4DEKGpxzKBs=;
        b=tOQcg02H2G99bgAhpIXY4UA4Uxk3AvlreiKnqu2WJXRRuaLDQX9qpJ0527Clrakkls
         fw9QrHLm6U0vWl7dK/tbGP477df8dt/y9mGRnsHcTh9jwJJ6E6dEe6KGLGIMZTYWrUtv
         evIsBSNG/SVHFuaQiurGW3Om65552fCExZ/LqZNs2xafD1WNBXLiPyfppOxuYwiamC8j
         P/yIxdtuS11mFA9abzsxwIUtxHCog6xf5tWIUieN/IBbk2Hu0PmNxvSHYLRAUR76gyqf
         AzNZ4foUkt+cmR4Tb/If/WVnTik/e9tZoVoP2QeET+tsrCoE3MkGEmkS4PsHeXwLJ2Sz
         6vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vJMi78mWq5HtlB9ulTeayHA8zLqcXh/C4DEKGpxzKBs=;
        b=VTeNpLrBORt7d2W6/PHmur/cBocSl2+IU+NakkYOtW5hLj6nqFXDQB0aJQ/+9gqko9
         pbbUdMRTCiptT/viQRbGF//hl77ZE+IYZr+DOZY2DmCCaFPjvflQO2nwJnDblSXw+t7t
         ZHajrldFVnrCz+3DZpvBDjd1RPP2NrXpezuQZUrsFBmhgF3HeXzfrTYHo0cYOv7cXBT2
         dW0kdpHrhgssNwFOBDwMOkTMIXVaGAP+aN5SPTnARp5PttxirR7SHI8aRVcpnPs772vH
         bJYcCtOBqy1xbOH6imjgJvI9p5t9t0DmBBGyLJSZaQ/OTe+ip3haOt/qRHt2pnXk/4vv
         Ro9w==
X-Gm-Message-State: AOAM533DZCq/mkLgnHtxBR/FEZ7stbNPHHW/Pz0aze1wPgSUnQkRC9Ij
        QXw9RSLE5z6IStgEAvJl7WKy
X-Google-Smtp-Source: ABdhPJwz7ahaRAzjNH/I54t0SlMWfy5SJoD/YLCA10mESWScv0fwZ5XZbyaLSrXlauiw4+5Qy2xcgA==
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id d14-20020a170902728eb0290101c3b7a47fmr12962198pll.21.1622468819856;
        Mon, 31 May 2021 06:46:59 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
        by smtp.gmail.com with ESMTPSA id t7sm11087433pjr.29.2021.05.31.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:46:59 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] dt-bindings: hwmon: Fix typo in TI ADS7828 bindings
Date:   Mon, 31 May 2021 22:46:55 +0900
Message-Id: <20210531134655.720462-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix typo in example for DT binding, changed from 'comatible'
to 'compatible'.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 Documentation/devicetree/bindings/hwmon/ti,ads7828.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ads7828.yaml b/Documentation/devicetree/bindings/hwmon/ti,ads7828.yaml
index 33ee575bb09da1..926be9a29044b2 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ads7828.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ads7828.yaml
@@ -49,7 +49,7 @@ examples:
         #size-cells = <0>;
 
         adc@48 {
-            comatible = "ti,ads7828";
+            compatible = "ti,ads7828";
             reg = <0x48>;
             vref-supply = <&vref>;
             ti,differential-input;
-- 
2.30.0

