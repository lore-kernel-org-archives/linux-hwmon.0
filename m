Return-Path: <SRS0=3aKW=S2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B09C10F03
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Apr 2019 02:05:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18881218D2
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Apr 2019 02:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfDXCFT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 22:05:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:51339 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbfDXCFT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 22:05:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Apr 2019 19:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; 
   d="scan'208";a="145171324"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.107])
  by orsmga003.jf.intel.com with ESMTP; 23 Apr 2019 19:05:16 -0700
From:   Chen Rong <rong.a.chen@intel.com>
To:     LKP Developer <lkp-developer@eclists.intel.com>,
        Philip Li <philip.li@intel.com>
Cc:     Chen Rong <rong.a.chen@intel.com>,
        Julia Lawall <julia.lawall@lip6.fr>, kbuild-all@01.org,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 0day-kernel-tests] lib/kbuild.sh: fix no reported-by for volunteers
Date:   Wed, 24 Apr 2019 10:05:42 +0800
Message-Id: <20190424020542.30921-1-rong.a.chen@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-------------
Date: Wed, 24 Apr 2019 03:38:39 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [hwmon:hwmon-playground 130/134] drivers/hwmon/max6650.c:632:4-10: preceding lock on line 616

CC: kbuild-all@01.org
CC: linux-hwmon@vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>

tree: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
head:   05d763050bbaa40daa4b60a3912c9311ca5791a5
commit: 77d270a1d4db919db0b02fec1d85ad5a57d556d7 [130/134] hwmon: (max6650) Convert to use devm_hwmon_device_register_with_info
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

>> drivers/hwmon/max6650.c:632:4-10: preceding lock on line 616
-------------

Signed-off-by: Chen Rong <rong.a.chen@intel.com>
---
 lib/kbuild.sh | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/lib/kbuild.sh b/lib/kbuild.sh
index e48fa079..4cb89104 100755
--- a/lib/kbuild.sh
+++ b/lib/kbuild.sh
@@ -6324,7 +6324,14 @@ add_cc_volunteer()
 	local mail_address=$1
 	echo "CC: $mail_address"
 
-	REPORTED_BY+="Reported-by: $mail_address\n"
+	REPORTED_BY+="Reported-by: $mail_address"$'\n'
+}
+
+email_reported_by_suggestion()
+{
+	echo "If you fix the issue, kindly add following tag"
+	echo "Reported-by: kbuild test robot <lkp@intel.com>"
+	echo "$REPORTED_BY"
 }
 
 email_header()
@@ -7782,14 +7789,13 @@ send_email()
 	cat > $email_file <<EOF
 Message-ID: $message_id
 $(email_subject)
-$(email_header)
-
-$(email_commit_info)
-
-If you fix the issue, kindly add following tag
-Reported-by: kbuild test robot <lkp@intel.com>
-$(echo -e $REPORTED_BY)
-
+$(
+email_header;
+echo "";
+email_commit_info;
+echo "";
+email_reported_by_suggestion
+)
 $(email_errors)
 
 $(email_signature)
@@ -9284,13 +9290,13 @@ email_checkpatch()
 
 	LANG=en_US.UTF8 mailx -S sendmail=$C_ROOT/sendmail -t <<EOF
 $(email_subject)
-$(email_header)
-
-$(email_commit_info)
-
-If you fix the issue, kindly add following tag
-Reported-by: kbuild test robot <lkp@intel.com>
-
+$(
+email_header;
+echo "";
+email_commit_info;
+echo "";
+email_reported_by_suggestion
+)
 scripts/checkpatch.pl $(basename $patch)
 # many are suggestions rather than must-fix
 
-- 
2.17.1

