Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33300 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751889AbeEGKZr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 May 2018 06:25:47 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w47AO27R007420
        for <linux-hwmon@vger.kernel.org>; Mon, 7 May 2018 06:25:47 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2htm3fjbu8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 May 2018 06:25:47 -0400
Received: from localhost
        by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <shilpa.bhat@linux.vnet.ibm.com>;
        Mon, 7 May 2018 11:25:45 +0100
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: linux@roeck-us.net, mpe@ellerman.id.au
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, benh@kernel.crashing.org,
        paulus@samba.org, jdelvare@suse.com, stewart@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH 0/3] Add support for energy sensors
Date: Mon,  7 May 2018 15:55:35 +0530
Message-Id: <1525688738-9185-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch series provides support for adding energy sensors to
ibmpowernv-hwmon driver. This patch adds support to read 64bit
sensor values.

Shilpasri G Bhat (3):
  powernv: opal-sensor: Add support to read 64bit sensor values
  hwmon: (ibmpowernv): Add support to read 64 bit sensors
  hwmon: (ibmpowernv) Add energy sensors

 arch/powerpc/include/asm/opal-api.h            |  1 +
 arch/powerpc/include/asm/opal.h                |  2 +
 arch/powerpc/platforms/powernv/opal-sensor.c   | 53 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-wrappers.S |  1 +
 drivers/hwmon/ibmpowernv.c                     |  9 +++--
 5 files changed, 63 insertions(+), 3 deletions(-)

-- 
1.8.3.1

