Return-Path: <SRS0=GWx2=ZQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0129C432C3
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Nov 2019 20:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAE982073F
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Nov 2019 20:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RZL2RV35"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfKXUjS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Nov 2019 15:39:18 -0500
Received: from mx.treblig.org ([46.43.15.161]:40782 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbfKXUjS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Nov 2019 15:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kgkP2EduP6n36bJzCbcWE45W3DoCNPlwyuJRQ+/qXnw=; b=RZL2RV3591sODGKsdDXfwupD40
        VNPDcg1dUby0Oudo9wP1ZhZIE5Mnpcgx+jDB7EAG6sZWsawof5JW8vEd+W5HRl2BRdPPFu5ZW1DPX
        piGbRBXSV20RwljYxeUTY+snqaiuMKT4IA9H5/kEnIqO/hS7dU+bEdesOFeVIbEpOzTu9JJYbPoPc
        BuzBldI9go6Q8Vp/o+tC+MLwYu6Uf6rdu0U/jTHdxpfkUQNcU/wfxzQf4hJ0ncHr4JJZW7Pz/KiIG
        H6vTCA/AGLL/gzJ1W8kNq6vJ+2MQBcC0y8Yc63lgCcSJ9yfwgJQxsLxASPupYRTYEzvL539rGW99L
        2c2j8Bcw==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1iYyN5-0000js-UU; Sun, 24 Nov 2019 20:20:40 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/2] hwmon: convert w83627ehf to new interface
Date:   Sun, 24 Nov 2019 20:20:28 +0000
Message-Id: <20191124202030.45360-1-linux@treblig.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Convert w83627ehf to the with_info interface;
while we're here add intrusion%d_ templates since they're used
by a bunch of different devices.

The _visible functions try and follow the same structure as the existing
device_create_file loops and structures.

The in*input,fan*input and temp*input all look sane to me; and I've
tried writing to a bunch of the files; but the pwm ones I don't have too
much of an idea of.

This has been tested on my P55M Pro which has a W83667HG-B;
it would be good to get some testing from people with other devices
supported by the driver.

Dave

Dr. David Alan Gilbert (2):
  hwmon: Add intrusion templates
  hwmon: (w83627ehf) convert to with_info interface

 drivers/hwmon/hwmon.c     |    9 +-
 drivers/hwmon/w83627ehf.c | 1429 ++++++++++++++++---------------------
 include/linux/hwmon.h     |    8 +
 3 files changed, 646 insertions(+), 800 deletions(-)

-- 
2.23.0

