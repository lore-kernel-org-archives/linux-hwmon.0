Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213015;
	b=ZDyPtLItHICfAccdRJsLQpvtOdkxfpkV2ghx1S6Jze5IF658QpT1yZMkrq/n25CRvHdn
	 V+nHxKMBGzl45At/HQ7A5/Q4tHUdzLtVQHXXwB+mrfaK8PkV3P4HX/C5AHP+Em5IX0mKm
	 hAApBL/EWDLHmMYFtGgUV8Z0V64AsJYN587AbUBwj18a5AKHFdhxwqR9goiINjdrAyQ5C
	 TPH7TcFQFeSnqSi8wNki3ACsn8H/0NUW4v86lcQCDEyxgBrcWWt2ZpcNOtcBZxYuF/J0D
	 Be/6Yki6JDKsjacKCiAJfmQV5IfnsgPkNWMIC9ktyOn13f3nhIJXA4X59LUMpDYocGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213015;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=gYmNWV1rm3ygUd91UJdw9gR5xquyUcoWzSp9DB3N2c8=;
	b=kwVqQ/3JxCQpjBTO5eALgDmhXQ81hYFCs8uDTXvDHjfvk/zbNchIiB1yglGY3WGKBy35
	 +yN/ArOmHyhMeUOaObZDxRbFBcJIVvWywxigVJTmsvLW6ce9Ktb+Et1nvJkalKH1mlK2z
	 4TMkyQ0PXIoTUkccK2KPdRwyBss6UyswMgyPaI7Lr2roJgP7uZsZF91QmX+N7HALZNky9
	 EejEWIUtDQhbL9TsmlEkUoRkExG2Ey6ssMlpZoyqUPqAL1kt1aAuKUjX+vCftZy8VNiwl
	 pu8NM7DjpaAc4nxcyPOht9UixEwhL0gQUsi8YNzoLeJ/al8XAy/iJmADaFLWBX3lpfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=gK7AJAf6;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B76606A31C;
	Mon,  9 Nov 2026 08:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=gK7AJAf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794212954;
	bh=gYmNWV1rm3ygUd91UJdw9gR5xquyUcoWzSp9DB3N2c8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gK7AJAf6L02ZSqdVZzOn1Oi7QidEAY7F8LZdeLl+zGsR0uk1O79DO3YYLH+g7fACj
	 ObuGY2HTX5FjaEeiIgxZVXwKWBTHgM1GMJoZLdDoDnN2g20n+oHDtVMyYLt5/72PXd
	 oNZAaa0DKceWJ5Jg3php2u4rFd3NLLcB9nnKq/zQ=
X-QQ-mid: zesmtpsz3t1794212937tf574f476
X-QQ-Originating-IP: 1GzHOlaNovGB9WvowQCBhTYzUK8z7c7NFtzph5Ftq74=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 16:28:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5203412662589610849
EX-QQ-RecipientCnt: 9
From: raoxu <raoxu@uniontech.com>
To: sudeep.holla@kernel.org
Cc: linux@roeck-us.net,
	cristian.marussi@arm.com,
	marek.vasut@mailbox.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] hwmon: (scmi) Enable temperature sensors using their sensor IDs
Date: Mon,  9 Nov 2026 16:28:54 +0800
Message-ID: <AED18609B941BCFD+20261109082854.3739085-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MfJtHqZtrd+O0mh5CtnHDBrZln1M1rSMnBJxvN43PbBUF8zTEvEnhB74
	JSdC7+NEzdDqEW6W59d8IA6XrG6f4PltrbyHuz0DcAy4otOpSS1PY3qMGJILLT441bsVRD+
	Jq8fKE9dJuqqzHvbY0zT+vpvmzC0oKo+eHAbYkn/Q1CYABlTij1UCOeZv03KbSRHIXeGqcp
	oklCqm9LuR8AVMSL9Irv807UwG2wIfF4tX9EB/y9wPY7mJguVa7OKvx/jhHER52snijz/DL
	eDFKdkzfYh/B0lc7Zul9zQYiULbJS1HE8LgW9gKZ8TWvDfFVCl124eHWVCBQ0a16BFeZpZR
	qnFiadhmVtLfyKs0f1rl8jK9EbzNkB4ywx1ye4eJcg6Ec7pNUCj0tSkH8Yg0y6i+UPGQHs0
	W+07rJWijtQaIaVf9ZZunzclE3iJAA5YbruVESLJCGZ/P9ISids3o4VCSgaDT8ZAmtRqA+N
	6UziD2/Su2gj6y4ZQT/xqx2Z21kirmP1CKzUjSYk8GmeiR6AJ5vIbar3heUMULrNc0AzOcv
	1IGQFAGYpsGMbY28i47LDFiLNAKN7lJ2eBb16/1F+gItrzgSVgioXyROiXK94PqeMC6s57/
	CNiI0R8KdT1a6xxkBPEEXGPxOVb5qxg3cK9Elrjm4PcZBqV+RxpZ4Qda6iNWxGwfJtxbWvJ
	bCqTl49Arn3kaG8WT+seRzfGAlqAZn2+rKdExrmYH6EWN2IgjKz/8G/qn9/m3ngDFpI8b1r
	Gvdw2d23QTSoy9LtGChPPsEjOccsSGbEaAmgUsavTSvfDVqLYNY35Ki7DKfWpKsk4sJltrJ
	uU07UepS+vj997hpvl9s61zJcXX0d/ToZUgJDVchUkoULDz97o05eF4vQvFz3LzwvMht541
	4Gv+kuEwYfnY5cqAntTwffyHHYgidfVN6XFui3qb9uH5RFbOnUHsL0jzD+g4dK9zrSQKY93
	wWM19Nz0oeslZMilkgs4VFigABUiBLq1Qg0/ityWzu92y2MA33rdyt530Y5/JWInW+CuZbM
	tcRHTW+ShNCU96cmdmHFC2BEiKWmUNx57iT4IzqA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

scmi_hwmon_probe() groups sensors by hwmon type, so the index in
scmi_sensors->info[hwmon_temp] is not necessarily the SCMI sensor ID.
Passing that index to config_set() targets a different sensor if the
platform exposes non-temperature sensors ahead of temperature sensors.
The intended temperature sensor can remain disabled, causing subsequent
readings to fail. If configuring the wrong sensor fails, thermal
registration of the intended sensor is also skipped.

Use the firmware sensor ID, as the read and thermal registration paths
already do, so temperature sensors are enabled correctly.

The patch was reviewed and the commit message expanded with OpenCode
AI assistance.

Fixes: 72804d1631b3 ("hwmon: (scmi) Enable sensors to assure they can be read")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/hwmon/scmi-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 9ae8f774297e..6a9895697f3c 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -342,7 +342,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		if (!sensor)
 			continue;
 
-		ret = sensor_ops->config_set(ph, i, sensor_config);
+		ret = sensor_ops->config_set(ph, sensor->id, sensor_config);
 		if (ret) {
 			dev_err(dev, "Error enabling sensor %s. err=%d\n",
 				sensor->name, ret);
-- 
2.50.1

