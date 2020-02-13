Return-Path: <SRS0=YVCu=4B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED7EC2BA83
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:16:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A1FC20656
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581610566;
	bh=72EnKiiuupJi+vlcEfmvVxJATqR6hxMTpbAhlkZoArE=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=x1VZVqvJRVK25RH51rA3NB6h/JPum8zs0DyynHxS2xGgdsX7y/LASE6C0JeFyml46
	 rHjL8HORpZXPGkojHlH4lyJWsmJmSAoDZoP7wvJonjnRkHp+kG30L4il/Jp1gy6yA9
	 5n0xaZKqbzN67P1ZubIM3P61I25Nj3OyqmInEk0I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgBMQQF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Feb 2020 11:16:05 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53732 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgBMQQF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Feb 2020 11:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=5OpWlFq0XWQLcGfctbGBsfXV04YEhwwWftnRqIIble8=; b=od/Q7yPDA8oUiZQSIKIWhP/Edf
        geAWeZ2eGFHRk0BCzRwhTEFXTbk3WwLQrNVPbtz63A7Uw3f52EAHrBlpP2P7xgFHtKSMSlkLzcSId
        iiXsxPNdRR8jGYRuPte0dNlLDuSjPkedKL3qc7HXdNDxH1W/owQ0FEwrM6fqwSxC7UIgKdat1qU45
        xp2g75ELecTr4wOdqJ8do0bb4I0bSk92FGwmQCCeq17gOPFKcxeCDD8s5qp1/B6Iz8H+8tx0XPIaF
        u8n1MPIRz36xNpYWcITW/ySc/xd1+HUuhaWrd3/NM1nP7ofVO3nk8cNyWNkYLuZLnPFYcVZWPPNW7
        JDYTwtJw==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j2H9o-0003RW-Ey; Thu, 13 Feb 2020 16:16:04 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j2H9l-000BcE-Tg; Thu, 13 Feb 2020 17:16:01 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Mike Jones <michael-a1.jones@analog.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH] docs: hmon: ltc2978.rst: fix a broken table
Date:   Thu, 13 Feb 2020 17:15:55 +0100
Message-Id: <9188836b1ec6744d3d936df8fbfe08f25422879e.1581610553.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

/devel/v4l/docs/Documentation/hwmon/ltc2978.rst:320: WARNING: Malformed table.
Text in column margin in table line 80.

Cc: Mike Jones <michael-a1.jones@analog.com>
Fixes: 6d36d475215a ("hwmon: (pmbus/ltc2978) add support for more parts.")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/hwmon/ltc2978.rst | 50 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index 58838d48354c..0db5561b48cd 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -248,12 +248,12 @@ in1_min			Minimum input voltage.
 in1_max			Maximum input voltage.
 
 			LTC2974, LTC2975, LTC2977, LTC2980, LTC2978,
-      LTC2979 and LTM2987 only.
+			LTC2979 and LTM2987 only.
 
 in1_lcrit		Critical minimum input voltage.
 
 			LTC2972, LTC2974, LTC2975, LTC2977, LTC2980, LTC2978,
-      LTC2979 and LTM2987 only.
+			LTC2979 and LTM2987 only.
 
 in1_crit		Critical maximum input voltage.
 
@@ -262,11 +262,11 @@ in1_min_alarm		Input voltage low alarm.
 in1_max_alarm		Input voltage high alarm.
 
 			LTC2972, LTC2974, LTC2975, LTC2977, LTC2980, LTC2978,
-      LTC2979 and LTM2987 only.
+			LTC2979 and LTM2987 only.
 in1_lcrit_alarm		Input voltage critical low alarm.
 
 			LTC2972, LTC2974, LTC2975, LTC2977, LTC2980, LTC2978,
-      LTC2979 and LTM2987 only.
+			LTC2979 and LTM2987 only.
 in1_crit_alarm		Input voltage critical high alarm.
 
 in1_lowest		Lowest input voltage.
@@ -279,13 +279,13 @@ in1_reset_history	Reset input voltage history.
 
 in[N]_label		"vout[1-8]".
 
-      - LTC2972: N=2-3
+			- LTC2972: N=2-3
 			- LTC2974, LTC2975: N=2-5
 			- LTC2977, LTC2979, LTC2980, LTM2987: N=2-9
 			- LTC2978: N=2-9
 			- LTC3880, LTC3882, LTC3884, LTC23886 LTC3887, LTC3889,
-        LTC7880, LTM4644, LTM4675, LTM4676, LTM4677, LTM4678,
-        LTM4680, LTM4700: N=2-3
+			  LTC7880, LTM4644, LTM4675, LTM4676, LTM4677, LTM4678,
+			  LTM4680, LTM4700: N=2-3
 			- LTC3883: N=2
 
 in[N]_input		Measured output voltage.
@@ -317,24 +317,24 @@ in[N]_reset_history	Reset output voltage history.
 
 temp[N]_input		Measured temperature.
 
-      - On LTC2972, temp[1-2] report external temperatures,
-        and temp 3 reports the chip temperature.
+			- On LTC2972, temp[1-2] report external temperatures,
+			  and temp 3 reports the chip temperature.
 			- On LTC2974 and LTC2975, temp[1-4] report external
 			  temperatures, and temp5 reports the chip temperature.
 			- On LTC2977, LTC2979, LTC2980, LTC2978, and LTM2987,
-        only one temperature measurement is supported and
-        reports the chip temperature.
+			  only one temperature measurement is supported and
+			  reports the chip temperature.
 			- On LTC3880, LTC3882, LTC3886, LTC3887, LTC3889,
-        LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
-        and LTM4700, temp1 and temp2 report external
-        temperatures, and temp3 reports the chip temperature.
+			  LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
+			  and LTM4700, temp1 and temp2 report external
+			  temperatures, and temp3 reports the chip temperature.
 			- On LTC3883, temp1 reports an external temperature,
 			  and temp2 reports the chip temperature.
 
 temp[N]_min		Mimimum temperature.
 
 			LTC2972, LTC2974, LCT2977, LTM2980, LTC2978,
-      LTC2979, and LTM2987 only.
+			LTC2979, and LTM2987 only.
 
 temp[N]_max		Maximum temperature.
 
@@ -345,7 +345,7 @@ temp[N]_crit		Critical high temperature.
 temp[N]_min_alarm	Temperature low alarm.
 
 			LTC2972, LTC2974, LTC2975, LTC2977, LTM2980, LTC2978,
-      LTC2979, and LTM2987 only.
+			LTC2979, and LTM2987 only.
 
 temp[N]_max_alarm	Temperature high alarm.
 
@@ -357,7 +357,7 @@ temp[N]_crit_alarm	Temperature critical high alarm.
 temp[N]_lowest		Lowest measured temperature.
 
 			- LTC2972, LTC2974, LTC2975, LTC2977, LTM2980, LTC2978,
-        LTC2979, and LTM2987 only.
+			  LTC2979, and LTM2987 only.
 			- Not supported for chip temperature sensor on LTC2974
 			  and LTC2975.
 
@@ -377,13 +377,13 @@ power1_input		Measured input power.
 
 power[N]_label		"pout[1-4]".
 
-      - LTC2972: N=1-2
+			- LTC2972: N=1-2
 			- LTC2974, LTC2975: N=1-4
 			- LTC2977, LTC2979, LTC2980, LTM2987: Not supported
 			- LTC2978: Not supported
 			- LTC3880, LTC3882, LTC3884, LTC3886, LTC3887, LTC3889,
-        LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
-        LTM4700: N=1-2
+			  LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
+			  LTM4700: N=1-2
 			- LTC3883: N=2
 
 power[N]_input		Measured output power.
@@ -391,8 +391,8 @@ power[N]_input		Measured output power.
 curr1_label		"iin".
 
 			LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
-      LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
-      and LTM4700 only.
+			LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
+			and LTM4700 only.
 
 curr1_input		Measured input current.
 
@@ -410,13 +410,13 @@ curr1_reset_history	Reset input current history.
 
 curr[N]_label		"iout[1-4]".
 
-      - LTC2972: N-1-2
+			- LTC2972: N-1-2
 			- LTC2974, LTC2975: N=1-4
 			- LTC2977, LTC2979, LTC2980, LTM2987: not supported
 			- LTC2978: not supported
 			- LTC3880, LTC3882, LTC3884, LTC3886, LTC3887, LTC3889,
-        LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
-        LTM4700: N=2-3
+			  LTM4664, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
+			  LTM4700: N=2-3
 			- LTC3883: N=2
 
 curr[N]_input		Measured output current.
-- 
2.24.1

