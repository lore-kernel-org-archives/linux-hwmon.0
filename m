Return-Path: <SRS0=RpVR=EC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D571C55179
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DAA62071A
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792961;
	bh=61NJdUXvXA8bBUCLfymdDzSMs6SOOMfrxefki5XHE1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gX4WoGuGX6Y4hAyr1IonMzWN1irfiNn6RoPBNlYd29z1XDofWv4pKLTUi2+a5J50+
	 3Td8/lxOVwm4NnhnBXEk+bawFgFHz26tNniAArvPQkRmNLnTW0naatykN8yQhPG00T
	 pelIkkYMYKax9VoMNs3Ma8IdXaEZ0TlOqU3r8tp0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896931AbgJ0KCf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:02:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896023AbgJ0Jvm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:42 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A98422284;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792301;
        bh=61NJdUXvXA8bBUCLfymdDzSMs6SOOMfrxefki5XHE1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VOO/UBun8AjmhL0t8cvOXHBFJZgsAteqzA5+nR2jfw1VD8A/Pz2RDn77L61HaE1ZM
         2fHBP1Hai7stLXLn3NCXcV8oi6otGcfDEUCKT9k3WNQ5ZQjsx6H/nlYU2nh3/6fxvO
         ijZl3H7ZqsfqHDZM0mQP5mIg48i0QFVnFz/w5ftw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdi-003FEZ-W9; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/32] docs: hwmon: adm1266.rst: fix a broken reference
Date:   Tue, 27 Oct 2020 10:51:07 +0100
Message-Id: <3d64372dabcdcea144cdc9972c245812ea2a84cb.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The reference was missing the extension, causing the
check script to complain.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/hwmon/adm1266.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/adm1266.rst b/Documentation/hwmon/adm1266.rst
index 9257f8a48650..2b877011cfdf 100644
--- a/Documentation/hwmon/adm1266.rst
+++ b/Documentation/hwmon/adm1266.rst
@@ -20,7 +20,7 @@ ADM1266 is a sequencer that features voltage readback from 17 channels via an
 integrated 12 bit SAR ADC, accessed using a PMBus interface.
 
 The driver is a client driver to the core PMBus driver. Please see
-Documentation/hwmon/pmbus for details on PMBus client drivers.
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
 
 
 Sysfs entries
-- 
2.26.2

