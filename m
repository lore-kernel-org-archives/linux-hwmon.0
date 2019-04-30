Return-Path: <SRS0=kUOG=TA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAF0C43219
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 14:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8E0B2147A
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Apr 2019 14:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfD3OqT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Apr 2019 10:46:19 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:47782 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfD3OqT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Apr 2019 10:46:19 -0400
Received: from 82-132-219-116.dab.02.net ([82.132.219.116] helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hLU1Q-0002ju-VQ; Tue, 30 Apr 2019 15:46:17 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hLU1K-00055D-1g; Tue, 30 Apr 2019 15:46:10 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Iker Perez del Palomar Sustatxa 
        <iker.perez@codethink.co.uk>
Subject: [PATCH v3 0/2] Version Log
Date:   Tue, 30 Apr 2019 15:46:07 +0100
Message-Id: <20190430144609.19500-1-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Changes from V2:
  - Correct bad style:
    - Bad assigment, missing spaces before and
       after "=".
    - Divide in two lines longer than 80 characters.
  - Separate dt-bindings and driver-documentation into different
    commits.

Changes from V1:
  - Delete empty lines.
  - Restore replaced tabs by spaces.

Iker Perez del Palomar Sustatxa (2):
  hwmon: (lm75) Add support for TMP75B
  dt-bindings: hwmon: Add tmp75b to lm75.txt

 Documentation/devicetree/bindings/hwmon/lm75.txt |  1 +
 Documentation/hwmon/lm75                         |  7 +++++--
 drivers/hwmon/lm75.c                             | 11 +++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.11.0
