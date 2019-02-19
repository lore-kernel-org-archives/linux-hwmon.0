Return-Path: <SRS0=3Mac=Q2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38351C43381
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Feb 2019 03:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0946A2147C
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Feb 2019 03:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550546606;
	bh=twcOX56e0/4WliLxy1WR5bEhwD8Jk/rippbyemDJcp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:List-ID:
	 From;
	b=UCMnlhaO3nLhP+mMYnKq70C0RBG7dhOtraCGK8crLsbNsU/dk2BRkvc/yFca/hLO2
	 lKzx5OiywyaxYN7KM+6+NA73HYPiVRUvOpIXJisHhYlcvFF88/kMuzMi2AbZ8+dD2n
	 J3CWN1FILmqDytVaTdolWuenV4fTnYc9sC6yVlFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfBSDXZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 22:23:25 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34986 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfBSDXZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 22:23:25 -0500
Received: by mail-qt1-f195.google.com with SMTP id p48so21632424qtk.2;
        Mon, 18 Feb 2019 19:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to:organization;
        bh=4x3YEbY+b8iwgi6V4Vw/GKRAcVXI/s5Wldf/gvM/ryc=;
        b=OqJ9NF9ZAEUOxqM4o5nWZh8RW0Q+lUveBjwdDzwPpVVqPX4wKovI8cTGVODL9dI8x6
         hXXI5SPf9FlrCy/Y6LVayFMQUq0+gEp74DCi36uGIx3IIJnP3Y8gjK0xSMUHaUbHaIYK
         48/wPyziCyfxfgSJzxJgOnQal3RoWa9wDwQhgFJ8mYmUuwbUjXrVTXVCgfo4TR7eFi+L
         GNkKNgLfcBKlP7rZz48cOYuSVT8wUZ6z0mkZyu3IN5FtbIJk/YxjVIw9rF3xxQybLacr
         ix/NUB2VsorgD5yM3/gw/RL2XLJVQhN393ka/lqzY4onlBC29YUd+qoIKBC/Cl7lNMbU
         vRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to:organization;
        bh=4x3YEbY+b8iwgi6V4Vw/GKRAcVXI/s5Wldf/gvM/ryc=;
        b=aRgS03W8dtt2nYDvRk/88hHSIoH/0cESBOwgS1TCRu/vCJDE8pwHRWUIbuDZ3XCPHv
         7e9gFsQOz2t2SZCfWjVHN/t1uvR7rJRUZOsEkBROLepBHdQLXeQ5RdWNPJmyGLLEof4I
         oXDCzeyMkhsgoFFoz09g0mKNxKUUkjUszNYHoQLNTB3lFhiEUBoIC5ftapuyGGpAoQLN
         PyLAKR9G8M4hsgdtUokKzbowTT2aGGR3JiUFfExLwm3m7NkJqE7uL0vJ74qbkkxEEnzu
         Im8aQlFEH8rZtXVPKDVJzKu72w4nPEthH4m0Bd9I4QwXdsJaDM/OlRwPdcNUnOIOjA4b
         9AUQ==
X-Gm-Message-State: AHQUAuZuO6aDekF8LeshkBQEy60l3cFeO/Ar8HTPuBcVTMy4nRNb4Ylc
        ELkkDAS/brW+IW4EGY1z4Nw=
X-Google-Smtp-Source: AHgI3IYrdsaWwtncsz97jnIh54kOJUb2zfz2QdpVSKBKahk8G08eMi1/Hw7cgPTX7GsJhfZhsjYLLg==
X-Received: by 2002:a0c:eac9:: with SMTP id y9mr6209132qvp.82.1550546604317;
        Mon, 18 Feb 2019 19:23:24 -0800 (PST)
Received: from kbl.fios-router.home (pool-96-233-42-17.bstnma.fios.verizon.net. [96.233.42.17])
        by smtp.gmail.com with ESMTPSA id l31sm205282qtb.20.2019.02.18.19.23.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 19:23:23 -0800 (PST)
From:   Len Brown <lenb@kernel.org>
X-Google-Original-From: Len Brown <len.brown@intel.com>
To:     linux-drivers-review@linux.intel.com
Cc:     Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 11/11] hwmon/coretemp: Support multi-die/package
Date:   Mon, 18 Feb 2019 22:22:59 -0500
Message-Id: <8ce75b95ef6105ebe5fb8c9e43b33f06516e3c16.1550545163.git.len.brown@intel.com>
X-Mailer: git-send-email 2.18.0-rc0
In-Reply-To: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
Reply-To: Len Brown <lenb@kernel.org>
Organization: Intel Open Source Technology Center
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Zhang Rui <rui.zhang@intel.com>

This patch introduces coretemp driver support
for new dual-die/package systems.

On the new dual-die/package systems, the package temperature MSRs becomes
die-scope. Thus instead of one hwmon device per physical package, now
there should be one hwmon device for each die on these systems.

On the hardwares that do not have multi-die support,
topology_unique_die_id() equals topology_physical_package_id(), thus the
only difference is that physical package id is used as the coretemp
platform device id, instead of logical package id on these systems.

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
Signed-off-by: Len Brown <len.brown@intel.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Len Brown <len.brown@intel.com>
---
 drivers/hwmon/coretemp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 5d34f7271e67..a0b6b2247c3a 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -435,7 +435,7 @@ static int chk_ucode_version(unsigned int cpu)
 
 static struct platform_device *coretemp_get_pdev(unsigned int cpu)
 {
-	int pkgid = topology_logical_package_id(cpu);
+	int pkgid = topology_unique_die_id(cpu);
 
 	if (pkgid >= 0 && pkgid < max_packages)
 		return pkg_devices[pkgid];
@@ -579,7 +579,7 @@ static struct platform_driver coretemp_driver = {
 
 static struct platform_device *coretemp_device_add(unsigned int cpu)
 {
-	int err, pkgid = topology_logical_package_id(cpu);
+	int err, pkgid = topology_unique_die_id(cpu);
 	struct platform_device *pdev;
 
 	if (pkgid < 0)
@@ -703,7 +703,7 @@ static int coretemp_cpu_offline(unsigned int cpu)
 	 * the rest.
 	 */
 	if (cpumask_empty(&pd->cpumask)) {
-		pkg_devices[topology_logical_package_id(cpu)] = NULL;
+		pkg_devices[topology_unique_die_id(cpu)] = NULL;
 		platform_device_unregister(pdev);
 		return 0;
 	}
@@ -732,6 +732,7 @@ static enum cpuhp_state coretemp_hp_online;
 static int __init coretemp_init(void)
 {
 	int err;
+	struct cpuinfo_x86 *c = &cpu_data(0);
 
 	/*
 	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
@@ -741,7 +742,7 @@ static int __init coretemp_init(void)
 	if (!x86_match_cpu(coretemp_ids))
 		return -ENODEV;
 
-	max_packages = topology_max_packages();
+	max_packages = topology_max_packages() * c->x86_max_dies;
 	pkg_devices = kcalloc(max_packages, sizeof(struct platform_device *),
 			      GFP_KERNEL);
 	if (!pkg_devices)
-- 
2.18.0-rc0

