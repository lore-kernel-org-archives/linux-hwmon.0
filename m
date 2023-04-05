Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91ABC77B6C
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Apr 2023 07:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237022AbjDEHbY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Apr 2023 03:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbjDEHbN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Apr 2023 03:31:13 -0400
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0044C1F
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Apr 2023 00:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equiv.tech;
        h=from:subject:mime-version:cc:content-transfer-encoding:content-type:
        cc:content-type:from:subject:to;
        s=org; bh=uivjS8jrA2Nza+lihUS5aRmECc7pI9/pu/fSMJa8r4Y=;
        b=iTZ6E22ki/z/ijr4CXqwLhycGu2o1xJBfGyZozhxnMMgzhn083frmpisPt6+kWrKVmXM
        fE8QQDS3H01xVFTtcGuF3I9QFmDJfjDMMSMnnU9VinzvQynZFIJl2UK/pqzhF+co3hkJ4t
        T3nzYQJZP/ST7rqCNvOW6INjk3lwdO4IM=
Received: by filterdrecv-6c845fd887-4kkfd with SMTP id filterdrecv-6c845fd887-4kkfd-1-642D23B8-D
        2023-04-05 07:31:04.216279555 +0000 UTC m=+3657572.236797995
Received: from localhost (unknown)
        by geopod-ismtpd-1 (SG) with ESMTP
        id OgjLvidtRTKnsABbC3Uuvw
        Wed, 05 Apr 2023 07:31:04.001 +0000 (UTC)
From:   James Seo <james@equiv.tech>
Subject: [PATCH 0/2] hwmon: trivial patches to build files
Date:   Wed, 05 Apr 2023 07:31:04 +0000 (UTC)
Message-Id: <20230405073056.53466-1-james@equiv.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?1X41iaRO4wVP+tFXGLuxpQ0yxxMDhGIesR5UcsYKVengQKgidLJSXwOMZlPQwP?=
 =?us-ascii?Q?WsL6ct5PcAvyJrpbZyofTEfTQ0IA3OFTFydeyl7?=
 =?us-ascii?Q?3kM5BDfxV79+5D4BgKJkq=2FGlXij1rUvnQkSrfE3?=
 =?us-ascii?Q?QSL5g8Q0yCZrsixGnQyViTtfuu3Btv=2FTypl0za=2F?=
 =?us-ascii?Q?b=2FoCeOSDw1zTP6DfTsDZjr13h61V099hZrj7vUU?=
 =?us-ascii?Q?opTRQTQoCXuoq6xWyHAW0ziB91yAMs7BgeKxGa?=
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Seo <james@equiv.tech>
X-Entity-ID: Y+qgTyM7KJvXcwsg19bS4g==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches address two trivial issues noticed in passing.

James Seo (2):
  hwmon: remove trailing whitespace in Kconfig
  hwmon: fix typo in Makefile

 drivers/hwmon/Kconfig  | 2 +-
 drivers/hwmon/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
-- 
2.34.1

