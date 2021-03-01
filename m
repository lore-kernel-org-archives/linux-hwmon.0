Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C8CC43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Mar 2021 04:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54FAC60235
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Mar 2021 04:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhCAEAw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 28 Feb 2021 23:00:52 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36040 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhCAEAq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Feb 2021 23:00:46 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 43B0A891AF;
        Mon,  1 Mar 2021 17:00:00 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1614571200;
        bh=3iqu4i+0F5Xxhcc2Ga9I95uLneeEovMUx3QEp5LgNnw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XtsI/fPmAFN1os0uBM4EkW8eIY5nl7zsrhFR5IOhPW94K4lwuxmQJTpjY5+CSaDxv
         LN4PgSofmzMqIGX0cb+JcOE8OoQl19jql20ufXwXZajr4eB8PFiL+tvmc9O1LsSgWb
         NTIgOm3Wtt44XloaA9FHCG44r37Sy6uxKqtwlvPhdmFl6cuy86J1cTAzdBq4HNFnwj
         ciJbsJZwLa0cXxROIfnzFwla6bLlko1xuZtC6Vg5WP0CipxcR7nJdZtUePNX4rrANg
         4m8oogZBrlBY1JD25j5hVXYeU4luEsHM1XcbO6qwVOBkYUDa3lZErVh1jGknJ0PdRN
         fSyxyVk09s8PA==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B603c66c00002>; Mon, 01 Mar 2021 17:00:00 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 927B613EF08;
        Mon,  1 Mar 2021 17:00:10 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1D101283985; Mon,  1 Mar 2021 17:00:00 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Jiri Kosina <trivial@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add infineon,ir36021
Date:   Mon,  1 Mar 2021 16:59:53 +1300
Message-Id: <20210301035954.16713-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210301035954.16713-1-chris.packham@alliedtelesis.co.nz>
References: <20210301035954.16713-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=jfe4B9wozX6hrU8P5YcA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add infineon,ir36021 to trivial-devices.yaml.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
index a327130d1faa..19bc4c301f5b 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -102,6 +102,8 @@ properties:
           - mps,mp2975
             # G751: Digital Temperature Sensor and Thermal Watchdog with=
 Two-Wire Interface
           - gmt,g751
+            # Infineon IR36021 digital POL buck controller
+          - infineon,ir36021
             # Infineon IR38064 Voltage Regulator
           - infineon,ir38064
             # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz=
)
--=20
2.30.0

