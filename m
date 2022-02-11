Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9C6C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 17:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350166AbiBKRRw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Feb 2022 12:17:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351978AbiBKRRw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Feb 2022 12:17:52 -0500
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECD1CD0;
        Fri, 11 Feb 2022 09:17:50 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4JwL0X3NFnz9sTy;
        Fri, 11 Feb 2022 18:17:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1644599866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bXyDWJOi2TMbTegBFxuy90N+VPfjmUO34aZ2XisvdHc=;
        b=I/wIpm1YI+FPmc3SsDwsYzeEZlpTfz6JW+s2uSIybNLKeZwJ/VfogvisfvTjoJQQIj8c1q
        9FmRCGTLH5TPw64ZUBbFKNh6b9GsY1njUkTLr/0VCs9WFre/5XrSuiSXQJVEM/qTFCfrW7
        hS+OgKvvcA1IyuXMHSNdk1igonIl53j4PbuWH65bPZV4lq6wb1wtrJlcmq/eyyNCleNbi4
        tRvme9N0VnimJ6+5bFVdCUbejTH6f1dS88cyCvOjHMeRngxoKQ2UYKT7zl249FXwELXtdM
        IBXvfZvbssN/FgA1BdPoHxRJ3loiTvwiS5Qcw/+RWP1Gqu3VEZFIngTBueAH9w==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings:trivial-devices: Add pli1209bc
Date:   Fri, 11 Feb 2022 18:17:11 +0100
Message-Id: <48fe7d40e6b13631b30403ecc4f70f06eb0a5de2.1644597670.git.sylv@sylv.io>
In-Reply-To: <cover.1644597670.git.sylv@sylv.io>
References: <cover.1644597670.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add trivial device entry for PLI1209BC Digital Supervisor from Vicor
Corporation.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 091792ba993e..d03d90360aa0 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -354,6 +354,8 @@ properties:
           - ti,tps544c25
             # Winbond/Nuvoton H/W Monitor
           - winbond,w83793
+            # Vicor Corporation Digital Supervisor
+          - vicor,pli1209bc
             # i2c trusted platform module (TPM)
           - winbond,wpct301
 
-- 
2.34.1

