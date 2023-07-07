Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE28C07CA9
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jul 2023 12:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjGGMar (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jul 2023 08:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbjGGMaq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2023 08:30:46 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B860E2684
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Jul 2023 05:30:34 -0700 (PDT)
IronPort-SDR: 64a80565_53gRPnPHAJAqu4WInYhThjacGGLRpkzqIswVkqFfjFkvRR1
 V2v40YWOnQ4PVJiO6x2eZ8mOF9vIJRK2NuFRO0g==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AEAwASBahkjPQc8jxaHQEBAQEJARIBBQUBSYFGgjOCU?=
 =?us-ascii?q?bYfDwEPAQFEBAEBhQaGFyY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gQUAQEBAUBFhWgNhgc2AQ0BATcBKIEVAYMQgl2qFoEBggkBAQaxFoFfCYFCj?=
 =?us-ascii?q?CCBGYM7gTw/gU6ED2+LBo4ghV0FAjKNFIEnb4EeN2d6AgkCEWeBCAhfgW4+A?=
 =?us-ascii?q?g1UCwtjgRyCTgICEToPBVNfGR0DBwOBBRAvBwQyJgYJGC8lBlEHFxYkCRMVQ?=
 =?us-ascii?q?QSDWAqBCz8VDhGCVyICBzY8G02CagkXQ1OBARAxBBQeQAMJAwcFSUADCxgNS?=
 =?us-ascii?q?xEsNRQbSYEHF2OBbgokJKYGgQ6BJ4EYKsRkhBWBXZ8kTYFKqA+YJSCjRoQvA?=
 =?us-ascii?q?goHFoF6gX5NHxmDIk8DGQ+OIBkegXeRUWM7AgcLAQEDCYtIAQE?=
IronPort-PHdr: A9a23:a9B83BLVzqlrvWVJZtmcuVEyDhhOgF28FgQU9oFhgKhHbaqk5ZikM
 UnCo/RhylbUDs3S8fkRje3Qvuj7XHAYp4yMtXcefdlNT0oLhclMzVMpCcLXBRGkfKyzPX4xF
 p0aBlRupy7TDA==
IronPort-Data: A9a23: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
 QvyIZEsFkPZLklVeNsu
IronPort-HdrOrdr: A9a23:X7IbQ6+/xTurdAjPv0Nuk+D2I+orL9Y04lQ7vn2ZKSY+TiVXra
 GTdZMgpHjJYFR4YhwdcLW7VJVoLkmslqKdjbN/AV7AZniDhILLFvAB0WKK+VSJcBEWndQ86U
 4PScZD4FKcNykdsS+D2njcLz85+qj8zEm3v5ak856zd3ASV0mwhz0JcjqmLg==
X-Talos-CUID: 9a23:T8Hl2GCvscjJ7iv6ExtrrEAfG8UASV/Y3UnuBUyJTjo2EZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AJQtiGw37cXPUsaygp3m3AQw/uzUj2oC1Flocvac?=
 =?us-ascii?q?849iYDhAvOmejgwWYa9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 07 Jul 2023 22:00:29 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 367CU7bJ2026771
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 7 Jul 2023 22:30:17 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 367CU7bJ2026771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1688733018; bh=zx9QfcLmTvyoKUNXpEh7rZf8RQdb9136cvPR3C+bnCQ=;
        h=From:To:Cc:Subject:Date:From;
        b=AZ7l7LFm0PGv2RNRTlyH7hGN6q8j0RjVkjjjdcxLLtvOLO8S9s95j4VdF//1roBYA
         tHXPHTXuUH3libkckBXKcssZbgTL0KN+RBZFVRXFPTP/kbEwrBIDEb22mxGFj8QfBF
         pXSbxNe+y/gohyxT6vsTYvQLgcsvc04C5I18lCYATWb4KGHG2VwqIecYWWPJB246Rg
         KnVJOAFyLmacHWn2Cp33RkJsOanqR2YiZqJD0loyGONJKx3nqtXQzraS0wOSOLVxFs
         LMIokyAdVD513F9MG51NUqQ3fAKIv+RAcCO1O6c3ggSg+fmNPvp7OgArDHuMIW+NXv
         Z094bmZ6bRLtw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 0/3] hwmon: (it87) Separate temperature type to separate funtion and detect AMDTSI
Date:   Fri,  7 Jul 2023 22:29:49 +1000
Message-ID: <20230707123005.956415-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 07 Jul 2023 22:30:18 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.1 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The temperature sensor type needs to be used in multiple places, so
split it out into its own function.  It is used both in show_temp_type
attribute and testing if the attribute should be visible (i.e. is
defined).

The sensor type also detects the type AMDTSI on certain chipsets.

---

Changes since v1:
 * Split single patch into multi-patch set following review.

Frank Crawford (3):
  Split temperature sensor detection to separate function
  Improve temperature reporting support
  Add support to detect sensor type AMDTSI

 drivers/hwmon/it87.c | 78 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 13 deletions(-)

-- 
2.41.0

