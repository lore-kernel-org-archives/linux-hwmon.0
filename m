Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44206 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbeLJWIw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Dec 2018 17:08:52 -0500
Received: by mail-pg1-f196.google.com with SMTP id t13so5604932pgr.11
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Dec 2018 14:08:52 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/30] hwmon: Use permission specific SENSOR[_DEVICE]_ATTR variants
Date: Mon, 10 Dec 2018 14:08:18 -0800
Message-Id: <1544479728-30077-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the drivers with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch series does not introduce functional changes. It was verified
by compiling the old and new files and comparing text and data sizes.

This series includes about one third of the auto-converted drivers.
The remaining patches will be submitted after the next commit window.
