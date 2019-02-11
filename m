Return-Path: <SRS0=q7Hd=QS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426C2C282CC
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Feb 2019 09:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CF592082F
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Feb 2019 09:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfBKJqU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Feb 2019 04:46:20 -0500
Received: from mga11.intel.com ([192.55.52.93]:34567 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbfBKJqU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Feb 2019 04:46:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2019 01:46:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,358,1544515200"; 
   d="scan'208";a="145831034"
Received: from byang6-mobl1.amr.corp.intel.com ([10.255.29.79])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2019 01:46:17 -0800
Message-ID: <1549878372.2099.36.camel@intel.com>
Subject: coretemp driver change on dual-die/package systems
From:   Zhang Rui <rui.zhang@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org
Date:   Mon, 11 Feb 2019 17:46:12 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi, Jean and Guenter,

Per the Intel Software Developer's Manual, which you can found at www.i
ntel.com/sdm, when CPUID.1F is present, it is preferred over CPUID.B.

New dual-die/package systems will see this difference:    
   CPUID.0B enumerates the CPUs on each die as if they were in
different packages.
   CPUID.1F enumerates the CPUs on each die within the same package.

This will manifest in the sysfs physical_package_id attribute. ie. In
the example above, CPUID.B would cause lscpu to show 2 packages, and
CPUID.1F will cause lscpu to show 1 package.

Also, with CPUID.B the concept of a package-scope MSR and a die-scope
MSR are synonymous.  With CPUID.1F, it is possible for some MSRs to
have die-scope, and other MSRs to have package-scope.

MSR_IA32_PACKAGE_THERM_STATUS is a die-scope MSR, thus we need to
update the coretemp driver to become multi-die-aware when we support
CPUID.1F.

Previously, we create one hwmon device for each package, now we need to
create one hwmon device for each die.
But there is one problem left. For each coretemp hwmon device, the
"temp1_input" attribute represents the temperature got from
MSR_IA32_PACKAGE_THERM_STATUS, and "temp1_label" is "Package id X",
where X is the logical package id.
Now we create one hwmon device for each die, thus temp1_label can not
use logical package id any more, because there are two dies in the same
package.
To me, there are two choices,
1. changing "temp1_label" from "Package id X" to "Package id Y", where
Y is just a unique number instead of logical package id, say, using
ida.
2. changing "temp1_label" from "Package id X" to "Package id X Die id
Y", where Y is the die id.

Question is I'm not sure how temp1_label is used and if this change
will break any userspace, like lm-sensors?

thanks,
rui

