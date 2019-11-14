Return-Path: <SRS0=o4ty=ZG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25833C432C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 15:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECB9D206D5
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Nov 2019 15:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNH1sBRU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfKNPkX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Nov 2019 10:40:23 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:40414 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfKNPkX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Nov 2019 10:40:23 -0500
Received: by mail-pg1-f169.google.com with SMTP id 15so4009421pgt.7
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2019 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gBW+T3fGCC3ZauWE1bP/FEflNLqJJ9otTssyUktVKTU=;
        b=NNH1sBRUCRVOORerPHFQHOlR9e9J+0xIID778YUDlEsiVBTpO0G52T3V/z+niqCe0k
         kpBY3haS+YcDCH4UyxVTHnp2RnJxgZi43SNP1iGChuXsHszki7bV6OByo4QReb138167
         A8Ry0kk8K1zWH4ep0OYVOciJ5MhwqkJ9EQiBCGHqrfSqF16dLRRuSJ03iK8oKqq4JEKQ
         Ycl49nSXnzWvekivKbdO/zWQsMdkTYrkvriixOT6t+wtBVpP0iR+X5IWfpIsRGvUa+WE
         +KbcNqPCmaOFNWti0Y1GIoy7aYVlO4wQ3esO3uNNHawfyzygvvVFixpv8GP8+Zr5A8pR
         PYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gBW+T3fGCC3ZauWE1bP/FEflNLqJJ9otTssyUktVKTU=;
        b=YxKjT6CvfqNaA9CQpi8+T8kb1JeDySbfJZOnkPJY2GPgHjoDAV3QaTWGaDRxZ9g3zj
         eH2rovvay19DG/8s7ihTZgMTs6sVOVeUBlHgz5wSTJe3LynI+QMkPwC/DpM7HrSAXY69
         j6uSTdKhNn/sB37ImE01VllpN9VRlxzt/HuFX7uWpJ1PFeijn50fF9+/LCRt/T2Mk6rs
         bygWL4eE2/04bu3rTJJC7asT8/jB3P0OoVhtgERYQLfsi/eQc771yiFjt7zpXw2CBHnJ
         mOILQnhNJ0oHomyp/g20MNR7Kn/yd9q1HXVDLrjZL9gMn/s5VYgCGM5PHTYw6efG4hh3
         Rz9w==
X-Gm-Message-State: APjAAAUQCB8BD+OefEpMlR8xu6jdF+n5ht6nsmfvIpEa7icdWr2HjLi+
        H8NXW/9URX72iDDRN8kLcRU=
X-Google-Smtp-Source: APXvYqxvfLOY2clWvMfw944A1oYXSLmN9VRf6ZzB5NV9JeI2XR/e2es+VG3yj5p9pgUhOzZ/sTK6zg==
X-Received: by 2002:a62:2902:: with SMTP id p2mr11215436pfp.160.1573746022668;
        Thu, 14 Nov 2019 07:40:22 -0800 (PST)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id 206sm11490858pfu.45.2019.11.14.07.40.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Nov 2019 07:40:20 -0800 (PST)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 0/2] nvme: hwmon: provide temperature threshold features
Date:   Fri, 15 Nov 2019 00:39:59 +0900
Message-Id: <1573746001-20979-1-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

According to the NVMe specification, the over temperature threshold and
under temperature threshold features shall be implemented for Composite
Temperature if a non-zero WCTEMP field value is reported in the Identify
Controller data structure.  The features are also implemented for all
implemented temperature sensors (i.e., all Temperature Sensor fields that
report a non-zero value).

This provides the over temperature threshold and under temperature
threshold for each sensor as temperature min and max values of hwmon
sysfs attributes.

This patch depends on the patch "nvme: Add hardware monitoring support".
(http://lists.infradead.org/pipermail/linux-nvme/2019-November/027883.html)

* v2
- Add helper macros for kelvin from/to milli Celsius conversion
- Remove alarm attributes for each implemented temperature sensor
- Use u32 variable for the last parameter of nvme_get_features()
- Use NULL for the unused last parameter of nvme_set_features()
- Avoid ternary operator
- Adjust temperature value ranges with clamp_val()
- Don't use WCTEMP after initialization
- Avoid accessing negative index when WCTEMP == 0
- Add a new quirk to avoid changing temperature threshold

Akinobu Mita (2):
  nvme: hwmon: provide temperature min and max values for each sensor
  nvme: hwmon: add quirk to avoid changing temperature threshold

 drivers/nvme/host/nvme-hwmon.c | 110 +++++++++++++++++++++++++++++++++++------
 drivers/nvme/host/nvme.h       |   5 ++
 drivers/nvme/host/pci.c        |   3 +-
 include/linux/nvme.h           |   6 +++
 4 files changed, 107 insertions(+), 17 deletions(-)

Cc: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
-- 
2.7.4

