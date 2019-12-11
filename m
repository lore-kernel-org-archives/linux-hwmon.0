Return-Path: <SRS0=nqTs=2B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFA7C2D0C8
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 19:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD995222C4
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Dec 2019 19:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfLKTqb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Dec 2019 14:46:31 -0500
Received: from mga06.intel.com ([134.134.136.31]:17624 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTqb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Dec 2019 14:46:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 11:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; 
   d="scan'208";a="216033805"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com) ([10.7.153.143])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:30 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: [PATCH v11 02/14] Documentation: ioctl: Add ioctl numbers for PECI subsystem
Date:   Wed, 11 Dec 2019 11:46:12 -0800
Message-Id: <20191211194624.2872-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This commit updates ioctl-number.rst to reflect ioctl numbers used
by the PECI subsystem.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Tomohiro Kusumi <kusumi.tomohiro@gmail.com>
Cc: Eric Sandeen <sandeen@redhat.com>
Cc: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Cc: Bryant G. Ly <bryantly@linux.vnet.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: James Feist <james.feist@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v10:
- Moved the change from 'Documentation/ioctl/ioctl-number.txt.

 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 4ef86433bd67..ce99968032f7 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -338,6 +338,8 @@ Code  Seq#    Include File                                           Comments
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
 0xB6  all    linux/fpga-dfl.h
+0xB7  all    uapi/linux/peci-ioctl.h                                 PECI subsystem
+                                                                     <mailto:jae.hyun.yoo@linux.intel.com>
 0xC0  00-0F  linux/usb/iowarrior.h
 0xCA  00-0F  uapi/misc/cxl.h
 0xCA  10-2F  uapi/misc/ocxl.h
-- 
2.17.1

