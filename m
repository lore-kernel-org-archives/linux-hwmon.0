Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66F8C433B4
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Apr 2021 13:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7614961105
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Apr 2021 13:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbhDBNYg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Apr 2021 09:24:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:17016 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234161AbhDBNYf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 2 Apr 2021 09:24:35 -0400
IronPort-SDR: vTxhJSRiwwwtReUKgg8ZFNS22SdqQBlD/VGaDLeeZb0cPcfG3E+swT4rcJ+dn+CES+TESPabFo
 YZiWEUj7iYyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="190234492"
X-IronPort-AV: E=Sophos;i="5.81,299,1610438400"; 
   d="scan'208";a="190234492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 06:24:33 -0700
IronPort-SDR: SU36bJgtd5Dd2kacH3TfKQi1j++ZpS0QKiw8zmSADBb0DreUVf7BiAP3Z2vDIGvaeP0fUV3QDS
 LERVYhxYJY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,299,1610438400"; 
   d="scan'208";a="439614297"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 02 Apr 2021 06:24:33 -0700
Received: from [10.91.127.224] (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id AD199580808;
        Fri,  2 Apr 2021 06:24:32 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
From:   zlukwins <zbigniew.lukwinski@linux.intel.com>
Subject: Energy counters for PMBUS
Message-ID: <ea24de03-1ef8-fdb8-f4cb-9e06a0090dcf@linux.intel.com>
Date:   Fri, 2 Apr 2021 15:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,


I am OpenBMC FW developer. We have a use cases which require PSU devices 
energy counters reading. Looks like hwmon:pmbus does not support that 
right now.

Hwmon sysfs 
(https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface) already 
supports energy counter (energy[1-*]_input).

PMBus standard (revision 1.3.1) provides API for getting energy - 
READ_EIN/READ_EOUT commands.

So I am wondering whether we could just add this implementation to the 
hwmon/pmbus/pmbus_core.c? Or maybe there are some constraints?


Thanks

Zbigniew


